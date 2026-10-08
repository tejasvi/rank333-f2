module
public import NN.Node
/-! # NN.Batch: decoding a kx2 batch and the batch loop of `KD.batchX` (core only)

* `parseFrame`, `parseNode`, `parseBatch`: the item layout of `kinds/py/kx2.py` (`KD.LoadXB.batchCmd`'s reader). The X part of each
  node is read by the X tier's parser, passed in as `xp`. Decoding needs no proof: the theorems are about the decoded values.
  Oversized items are rejected, so a decoded value is the item's Nat exactly.
* `checkNodes st tab xc stk nodes`: per node, pop `hdr % 256` frames, `nodeStep`, then the X tier's check `xc` on the child frame
  and the dictionary, then push the child frame above the parent (as `KD.batchX'`). -/
@[expose] public section

namespace NN

/-- the unpacked 7-bit fields `0 ..< 512` of the little-endian bytes `[p, p+n)` -/
def unpack7 (b : ByteArray) (p n : Nat) : ByteArray :=
  ByteArray.mk ((Array.range 512).map fun X =>
    let j := (7 * X) / 8
    let s := (7 * X) % 8
    let lo := if j < n then (b.get! (p + j)).toNat else 0
    let hi := if j + 1 < n then (b.get! (p + j + 1)).toNat else 0
    (((lo + 256 * hi) >>> s) % 128).toUInt8)

/-- a big item as exactly `w` limbs (`none` if longer than `8 w` bytes) and the next offset -/
def itemW (b : ByteArray) (o w : Nat) : Option (Array UInt64 × Nat) :=
  match item b o with
  | some (p, n, o') => if n ≤ 8 * w then some (limbsBW b p n w, o') else none
  | none => none

/-- an item as limbs (any length) and the next offset -/
def itemL (b : ByteArray) (o : Nat) : Option (Array UInt64 × Nat) :=
  match item b o with
  | some (p, n, o') => some (limbsB b p n, o')
  | none => none

/-- a frame `(S, D, N, U, d)` -/
def parseFrame (b : ByteArray) (o : Nat) : Option (Frame × Nat) := do
  let (S, o) ← itemW b o 8
  let (D, o) ← itemW b o 8
  let (N, o) ← itemW b o 4096
  let (p, n, o) ← item b o
  if n > 448 then none
  let U := unpack7 b p n
  let (d, o) ← itemN b o
  return ({ S := S, D := D, N := N, U := U, d := d }, o)

def parseFrames (b : ByteArray) : Nat → Nat → List Frame → Option (List Frame × Nat)
  | 0, o, acc => some (acc.reverse, o)
  | k + 1, o, acc => do
    let (f, o) ← parseFrame b o
    parseFrames b k o (f :: acc)

/-- `k` kill records -/
def parseKills (b : ByteArray) : Nat → Nat → Array (Array UInt64) → Option (Array (Array UInt64) × Nat)
  | 0, o, acc => some (acc, o)
  | k + 1, o, acc => do
    let (x, o) ← itemL b o
    parseKills b k o (acc.push x)

/-- the L1 part of a node record: `l, hdr, R2, R1, V, X2, X1, kills` -/
def parseNode (b : ByteArray) (o : Nat) : Option (NodeRec × Nat) := do
  let (l, o) ← itemN b o
  let (hdr, o) ← itemN b o
  let (r2, o) ← itemList b o
  let (r1, o) ← itemList b o
  let (r0, o) ← itemList b o
  let (x2, o) ← itemList b o
  let (x1, o) ← itemList b o
  let (nk, o) ← itemN b o
  let (ks, o) ← parseKills b nk o (Array.mkEmpty nk)
  return ({ lab := l, hdr := hdr, r2 := r2, r1 := r1, r0 := r0, x2 := x2, x1 := x1, ks := ks }, o)

def parseNodes {α : Type} (xp : ByteArray → Nat → Option (α × Nat)) (b : ByteArray) :
    Nat → Nat → List (NodeRec × α) → Option (List (NodeRec × α) × Nat)
  | 0, o, acc => some (acc.reverse, o)
  | k + 1, o, acc => do
    let (nd, o) ← parseNode b o
    let (x, o) ← xp b o
    parseNodes xp b k o ((nd, x) :: acc)

/-- a whole batch: the stack, then the nodes; every byte must be used -/
def parseBatch {α : Type} (xp : ByteArray → Nat → Option (α × Nat)) (b : ByteArray) :
    Option (List Frame × List (NodeRec × α)) := do
  let (s, o) ← itemN b 0
  let (stk, o) ← parseFrames b s o []
  let (n, o) ← itemN b o
  let (nodes, o) ← parseNodes xp b n o []
  if o == b.size then some (stk, nodes) else none

/-- **the batch loop** -/
def checkNodes {α : Type} (st : Statics) (tab : Tab) (xc : Nat → StepOut → α → Bool) :
    List Frame → List (NodeRec × α) → Bool
  | _, [] => true
  | stk, (nd, x) :: rest =>
    match stk.drop (nd.hdr % 256) with
    | [] => false
    | fr :: stk' =>
      match nodeStep st tab fr nd with
      | none => false
      | some out => xc (hLast nd.hdr) out x && checkNodes st tab xc (out.fr :: fr :: stk') rest

/-- parse and check a batch -/
def runBatch {α : Type} (st : Statics) (tab : Tab) (xp : ByteArray → Nat → Option (α × Nat)) (xc : Nat → StepOut → α → Bool)
    (b : ByteArray) : Bool :=
  match parseBatch xp b with
  | some (stk, nodes) => checkNodes st tab xc stk nodes
  | none => false

/-! ## The per-job table (`kx2.py`'s `table_<c>.bin`: 69-byte entries `mask | cap << 511 | id << 520`) -/

def parseTab (b : ByteArray) : Tab :=
  let n := b.size / 69
  let rows := (Array.range (8 * n)).map fun j =>
    let i := j / 8
    let k := j % 8
    let w := rdU64 b (69 * i + 8 * k)
    if k = 7 then w &&& 0x7FFFFFFFFFFFFFFF else w
  let caps := (Array.range n).map fun i =>
    ((rdU64 b (69 * i + 56) >>> 63).toNat + 2 * (b.get! (69 * i + 64)).toNat) % 512
  let ids := (Array.range n).map fun i =>
    ((lowBytes (rdU64 b (69 * i + 64)) 5) >>> 8).toNat
  { rows := rows, caps := caps, ids := ids }

/-! ## A skipper for the X part (layout 0, kx2), for tests of this component alone -/

def skipItems (b : ByteArray) : Nat → Nat → Option Nat
  | 0, o => some o
  | k + 1, o => match item b o with
    | some (_, _, o') => skipItems b k o'
    | none => none

def skipList (b : ByteArray) (o : Nat) : Option Nat := do
  let (k, o) ← itemN b o
  skipItems b k o

/-- a hybrid tree (`KD.XC`): tag, steps, then leaf `(j, d)` or node `v, k, left, right`; `fuel` bounds the depth -/
def skipTree (b : ByteArray) : Nat → Nat → Option Nat
  | 0, _ => none
  | fuel + 1, o => do
    let (tag, o) ← itemN b o
    if tag == 2 then do let (_, o) ← itemN b o; return o
    let (ns, o) ← itemN b o
    let o ← skipItems b (2 * ns) o
    if tag == 0 then skipItems b 2 o
    else do
      let o ← skipItems b 2 o
      let o ← skipTree b fuel o
      skipTree b fuel o

def skipKids (b : ByteArray) : Nat → Nat → Option Nat
  | 0, o => some o
  | k + 1, o => do
    let o ← skipItems b 4 o
    let o ← skipList b o
    let o ← skipTree b 1024 o
    skipKids b k o

def skipAggs (b : ByteArray) : Nat → Nat → Option Nat
  | 0, o => some o
  | k + 1, o => do
    let o ← skipItems b 2 o
    let o ← skipList b o
    skipAggs b k o

/-- skip the X part (layout 0); returns `(number of children, next offset)` -/
def skipX (b : ByteArray) (o : Nat) : Option (Nat × Nat) := do
  let o ← skipList b o
  let (na, o) ← itemN b o
  let o ← skipAggs b na o
  let o ← skipList b o
  let o ← skipItems b 2 o
  let (nk, o) ← itemN b o
  let o ← skipKids b nk o
  return (nk, o)

end NN

namespace NN

/-- **the per-job table check** (once per job): shape facts, and every entry equals the row interface's `rowE id`
(`R3RT.tabOKQ`'s test: label mask | cap << 511 against `rowE (entry >>> 520)`) -/
def tabCheck (tab : Tab) (rowE : Nat → Nat) : Bool :=
  let n := tab.caps.size
  tab.rows.size == 8 * n && tab.ids.size == n &&
  allN (fun i =>
    (tab.rows.getD (8 * i + 7) 0).toNat < 2 ^ 63 && tab.caps.getD i 0 < 256 && tab.ids.getD i 0 < 2 ^ 32 &&
    rowE (tab.ids.getD i 0) == natL tab.rows (8 * i) 8 + tab.caps.getD i 0 * 2 ^ 511) n

end NN
