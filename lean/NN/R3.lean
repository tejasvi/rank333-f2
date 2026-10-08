module
public import NN.Seg
/-! # NN.R3: decoding R3 certificate segments (prof7R3 `--pcert`, batch 11 `--xpvar`) into item trees (core only)

The grammar is the header comment of `r3/prof7R3_b11.cc` and `r3/r3rec.h`: tag byte, then fields (varint = LEB128), records in DFS
pre-order. A segment's record bytes decode to an `STree RNode RDead`: OPEN nodes with their raw node data and child records,
dead children (LEAF / CUT outcomes), external children (DON), ranges (RNG). Child-record labels are deltas from the previous child
record or child NODE of the node (from the node's own label at OPEN), as in `r3cat`. Decoding needs no proof: the theorems are
about the decoded values. Records the certificate run cannot contain under the recipe (ABORT, WB, BLK, ADDF, SKR, SKP, X choices
0 / 1 / 3) make the decoder fail. -/
@[expose] public section

namespace NN.R3

/-! ## Bytes -/

def u8 (b : ByteArray) (i : Nat) : Option (Nat × Nat) := if i < b.size then some ((b.get! i).toNat, i + 1) else none

def u16 (b : ByteArray) (i : Nat) : Option (Nat × Nat) :=
  if i + 2 ≤ b.size then some ((b.get! i).toNat + 256 * (b.get! (i + 1)).toNat, i + 2) else none

/-- LEB128, at most 10 bytes -/
def var (b : ByteArray) (i : Nat) : Option (Nat × Nat) := go 0 0 i 10
where
  go (acc sh i : Nat) : Nat → Option (Nat × Nat)
    | 0 => none
    | k + 1 =>
      if i < b.size then
        let c := (b.get! i).toNat
        let acc := acc ||| ((c % 128) <<< sh)
        if c < 128 then some (acc, i + 1) else go acc (sh + 7) (i + 1) k
      else none

/-- `n` varints, one pass (64-bit accumulator; varints of the stream are below 2^63); `none` if the bytes end first -/
def vars (b : ByteArray) (n i : Nat) (acc : Array Nat) : Option (Array Nat × Nat) := go n i acc 0 0 (b.size + 1)
where
  go (n i : Nat) (acc : Array Nat) (x sh : UInt64) : Nat → Option (Array Nat × Nat)
    | 0 => none
    | fuel + 1 =>
      if n == 0 then some (acc, i)
      else if i < b.size then
        let c := (b.get! i).toUInt64
        if c < 128 then go (n - 1) (i + 1) (acc.push (x ||| (c <<< sh)).toNat) 0 0 fuel
        else go n (i + 1) acc (x ||| ((c &&& 127) <<< sh)) (sh + 7) fuel
      else none

/-- `n` varint deltas, accumulated from `base` -/
def deltas (b : ByteArray) : Nat → Nat → Nat → Array Nat → Option (Array Nat × Nat)
  | 0, _, i, acc => some (acc, i)
  | k + 1, base, i, acc => do let (x, i) ← var b i; deltas b k (base + x) i (acc.push (base + x))

/-- a length-prefixed blob -/
def blob (b : ByteArray) (i : Nat) : Option (ByteArray × Nat) := do
  let (n, i) ← var b i
  if i + n ≤ b.size then some (b.extract i (i + n), i + n) else none

/-! ## Raw records -/

/-- the raw records of an OPEN node -/
structure RNode where
  depth : Nat
  lab : Nat
  vrows : Array Nat := #[]
  ex : Array Nat := #[]
  c1 : Array Nat := #[]
  c2 : Array Nat := #[]
  r2 : Array Nat := #[]
  /-- T kills: child, exclusion indices (into `ex`) -/
  tk : Array (Nat × Array Nat) := #[]
  /-- C kills: child, exclusion indices, cover references (`2i`: c1 row `i`, `2i+1`: c2 row `i`, as r3cat / kx2 read them) -/
  ck : Array (Nat × Array Nat × Array Nat) := #[]
  /-- bulk-peel kills (X choice 5): child, kind, bb, certificate blob -/
  xk : Array (Nat × Nat × Nat × ByteArray) := #[]
  /-- expanded X children (choice 2): their NODE records follow -/
  xe : Array Nat := #[]
  xpn : Option ByteArray := none
  /-- CANON: child, rejection type, witness `g` -/
  canon : Array (Nat × Nat × Nat) := #[]
  /-- PREFF: child, functional (or 512 + split) -/
  preff : Array (Nat × Nat) := #[]
  typ : Array Nat := #[]
  doom : Array Nat := #[]
  /-- JOB references of a top segment: child, frontier index -/
  job : Array (Nat × Nat) := #[]
  deriving Inhabited

/-- the outcome of a node without a child loop -/
inductive RDead where
  /-- LEAF code (with `#leafx 1`, codes 5 / 6 / 7 carry a row id / a W-list; with `#leafv7 1`, code 0 carries its v7 record `blob`,
  the bit string `R` that `BC7s.leafS` reads) -/
  | leaf (code : Nat) (args : Array Nat) (blob : ByteArray)
  /-- CUT kind and arguments; node cuts 5 / 6 with `#cutx 1` carry ok, exclusion rows, node record and certificate blobs;
  `vrows`: the cut node's VROWS (`--pcvcut`: before the CUT record of node cuts 3-7 and 9) -/
  | cut (kind : Nat) (args : Array Nat) (node cert : ByteArray) (vrows : Array Nat)
  deriving Inhabited

/-- the header flags of a pcert file -/
structure Flags where
  leafx : Bool := true
  cutx : Bool := true
  xpvar : Bool := true
  leafv7 : Bool := true

/-! ## The walk -/

/-- a partial OPEN node on the decoder's stack: its records so far, children so far (reversed), the child-delta base -/
structure PNode where
  r : RNode
  kids : List (STree RNode RDead)
  last : Nat

def toKids : List (STree RNode RDead) → SKids RNode RDead
  | [] => .nil
  | t :: ts => .cons t (toKids ts)

/-- close the top node (range start `rng`) and add it to its parent; `none` if the stack is empty -/
def closeTop (rng : Option Nat) : List PNode → Option (List PNode × Option (STree RNode RDead))
  | [] => none
  | p :: rest =>
    let t := STree.node p.r.lab p.r (toKids p.kids.reverse) rng
    match rest with
    | [] => some ([], some t)
    | q :: rest' => some ({ q with kids := t :: q.kids } :: rest', none)

/-- read a child record's label (delta from the top node's base) and update the base -/
def childLab (b : ByteArray) (i : Nat) (stk : List PNode) : Option (Nat × Nat × List PNode) := do
  let (dl, i) ← var b i
  match stk with
  | [] => none
  | p :: rest => some (p.last + dl, i, { p with last := p.last + dl } :: rest)

/-- update the top node's records -/
def updTop (stk : List PNode) (f : RNode → RNode) : Option (List PNode) :=
  match stk with
  | [] => none
  | p :: rest => some ({ p with r := f p.r } :: rest)

/-- add a finished child to the top node -/
def addKid (stk : List PNode) (t : STree RNode RDead) : Option (List PNode) :=
  match stk with
  | [] => none
  | p :: rest => some ({ p with kids := t :: p.kids } :: rest)

/-- skip a Farkas certificate (X choices 1 / 3) — not expected under the recipe, decoded only to fail cleanly -/
def leafArgs (fl : Flags) (b : ByteArray) (code i : Nat) : Option (Array Nat × Nat) :=
  if fl.leafx && code == 5 then do let (r, i) ← var b i; return (#[r], i)
  else if fl.leafx && (code == 6 || code == 7) then do
    let (n, i) ← u8 b i
    let mut acc : Array Nat := #[]
    let mut j := i
    for _ in [0:n] do
      let (x, j') ← u16 b j
      acc := acc.push x; j := j'
    let (c, j2) ← u8 b j
    return (acc.push c, j2)
  else some (#[], i)

def cutArgs (fl : Flags) (b : ByteArray) (k i : Nat) : Option (Array Nat × ByteArray × ByteArray × Nat) := do
  if k == 1 then let (x, i) ← u16 b i; return (#[x], .empty, .empty, i)
  else if k == 2 || k == 4 || k == 5 || k == 6 || k == 10 then
    let (x, i) ← var b i
    if fl.cutx && (k == 5 || k == 6) then
      let (ok, i) ← u8 b i
      if ok == 0 then return (#[x, 0], .empty, .empty, i)
      let (ne, i) ← var b i
      let (exs, i) ← vars b ne i #[]
      let (nd, i) ← blob b i
      let (ce, i) ← blob b i
      return (#[x, 1] ++ exs, nd, ce, i)
    else return (#[x], .empty, .empty, i)
  else if k == 3 then let (x, i) ← u8 b i; return (#[x], .empty, .empty, i)
  else if k == 7 || k == 8 || k == 9 then return (#[], .empty, .empty, i)
  else none

/-- **the record walk**: `fuel` bounds the number of records; `pend` = a NODE waiting for its outcome -/
def walk (fl : Flags) (b : ByteArray) : Nat → Nat → List PNode → Option (Nat × Nat × Array Nat) → Option (STree RNode RDead)
  | 0, _, _, _ => none
  | fuel + 1, i, stk, pend =>
    if i ≥ b.size then none else
    match u8 b i with
    | none => none
    | some (tag, i) =>
    if tag == 0x01 then do
      let (x, i) ← u16 b i
      let d := x / 512; let l := x % 512
      let stk ← match stk with
        | [] => some []
        | p :: rest => if p.r.depth + 1 == d then some ({ p with last := l } :: rest) else none
      walk fl b fuel i stk (some (d, l, #[]))
    else if tag == 0x02 then do
      let (d, l, _) ← pend
      let (code, i) ← u8 b i
      let (args, i) ← leafArgs fl b code i
      let (lb, i) ← if fl.leafv7 && code == 0 then do
          let (nbits, i) ← var b i
          let nb := (nbits + 7) / 8
          if i + nb ≤ b.size then some (b.extract i (i + nb), i + nb) else none
        else some (ByteArray.empty, i)
      let t := STree.dead l (RDead.leaf code args lb)
      match stk with
      | [] => if i == b.size then some t else none
      | _ => do let stk ← addKid stk t; let _ := d; walk fl b fuel i stk none
    else if tag == 0x03 then do
      let (_, l, vr) ← pend
      let (k, i) ← u8 b i
      let (args, nd, ce, i) ← cutArgs fl b k i
      let t := STree.dead l (RDead.cut k args nd ce vr)
      match stk with
      | [] => if i == b.size then some t else none
      | _ => do let stk ← addKid stk t; walk fl b fuel i stk none
    else if tag == 0x04 then do
      let (d, l, vr) ← pend
      if vr.size > 0 then none else
      walk fl b fuel i ({ r := { depth := d, lab := l }, kids := [], last := l } :: stk) none
    else if tag == 0x05 then do
      let (stk, done) ← closeTop none stk
      match done with
      | some t => if i == b.size then some t else none
      | none => walk fl b fuel i stk none
    else if tag == 0x10 then do
      let (n, i) ← var b i
      let (vs, i) ← deltas b n 0 i #[]
      match pend with
      | some (d, l, _) => walk fl b fuel i stk (some (d, l, vs))
      | none =>
        let stk ← updTop stk fun r => { r with vrows := vs }
        walk fl b fuel i stk none
    else if tag == 0x11 then do
      let (ne, i) ← var b i; let (n1, i) ← var b i; let (n2, i) ← var b i; let (nr, i) ← var b i
      let (ex, i) ← vars b ne i #[]; let (c1, i) ← vars b n1 i #[]; let (c2, i) ← vars b n2 i #[]
      let (r2, i) ← vars b nr i #[]
      let stk ← updTop stk fun r => { r with ex := ex, c1 := c1, c2 := c2, r2 := r2 }
      walk fl b fuel i stk none
    else if tag == 0x20 then do
      let (u, i, stk) ← childLab b i stk
      let (nx, i) ← u8 b i
      let (xs, i) ← vars b nx i #[]
      let stk ← updTop stk fun r => { r with tk := r.tk.push (u, xs) }
      walk fl b fuel i stk none
    else if tag == 0x21 then do
      let (u, i, stk) ← childLab b i stk
      let (nx, i) ← u8 b i; let (nc, i) ← u8 b i
      let (xs, i) ← vars b nx i #[]; let (cs, i) ← vars b nc i #[]
      let stk ← updTop stk fun r => { r with ck := r.ck.push (u, xs, cs) }
      walk fl b fuel i stk none
    else if tag == 0x22 then do
      let (u, i, stk) ← childLab b i stk
      let (kind, i) ← u8 b i; let (bb, i) ← var b i; let (ch, i) ← u8 b i
      if ch == 5 then do
        let (ne, i) ← var b i
        let (_, i) ← vars b ne i #[]
        let (cert, i) ← blob b i
        let stk ← updTop stk fun r => { r with xk := r.xk.push (u, kind, bb, cert) }
        walk fl b fuel i stk none
      else if ch == 2 then do
        let stk ← updTop stk fun r => { r with xe := r.xe.push u }
        walk fl b fuel i stk none
      else none
    else if tag == 0x23 then do
      let (u, i, stk) ← childLab b i stk
      let (ty, i) ← u8 b i; let (g0, i) ← u8 b i; let (g1, i) ← u8 b i; let (g2, i) ← u8 b i
      let stk ← updTop stk fun r => { r with canon := r.canon.push (u, ty, g0 + 256 * g1 + 65536 * g2) }
      walk fl b fuel i stk none
    else if tag == 0x24 then do
      let (u, i, stk) ← childLab b i stk
      let (x, i) ← u16 b i
      let stk ← updTop stk fun r => { r with preff := r.preff.push (u, x) }
      walk fl b fuel i stk none
    else if tag == 0x25 then do
      let (u, i, stk) ← childLab b i stk
      let stk ← updTop stk fun r => { r with typ := r.typ.push u }
      walk fl b fuel i stk none
    else if tag == 0x26 then do
      let (u, i, stk) ← childLab b i stk
      let stk ← updTop stk fun r => { r with doom := r.doom.push u }
      walk fl b fuel i stk none
    else if tag == 0x28 then do
      let (u, i, stk) ← childLab b i stk
      let stk ← addKid stk (STree.ext u)
      walk fl b fuel i stk none
    else if tag == 0x2B then do
      let (x, i) ← blob b i
      let stk ← updTop stk fun r => { r with xpn := some x }
      walk fl b fuel i stk none
    else if tag == 0x2C then do
      let (l, i) ← u16 b i
      let (stk, done) ← closeTop (some l) stk
      match done with
      | some t => if i == b.size then some t else none
      | none => walk fl b fuel i stk none
    else if tag == 0x2D then do
      let (u, i, stk) ← childLab b i stk
      let (ix, i) ← var b i
      let stk ← updTop stk fun r => { r with job := r.job.push (u, ix) }
      let stk ← addKid stk (STree.ext u)
      walk fl b fuel i stk none
    else none

/-- decode a segment's record bytes -/
def decode (fl : Flags) (b : ByteArray) : Option (STree RNode RDead) := walk fl b (b.size + 1) 0 [] none

/-- decode a range segment (kind 3) of node `S` at depth `d0` with top label `lab`: its records are `S`'s node data, its child
records from label `l` on (the first delta-coded from `p`) and `S`'s END -/
def decodeRange (fl : Flags) (b : ByteArray) (d0 lab p : Nat) : Option (STree RNode RDead) :=
  walk fl b (b.size + 1) 0 [{ r := { depth := d0, lab := lab }, kids := [], last := p }] none

/-! ## pcert files (tests): blocks `R3B1`, segments by id -/

/-- a segment: job, kind, prefix labels, inherited dead mask (8 limbs), witness rows (`#pcwit 1`: the VROWS rows behind `D`),
record bytes (`bytes`) -/
structure Seg where
  job : Nat
  kind : Nat
  pre : Array Nat
  D : Array UInt64
  wit : Array Nat
  bytes : ByteArray
  /-- range segments (kind 3): the first child label `l` and the delta base `p` -/
  lo : Nat := 0
  p : Nat := 0

def rd32 (b : ByteArray) (o : Nat) : Nat :=
  (b.get! o).toNat + 256 * (b.get! (o+1)).toNat + 65536 * (b.get! (o+2)).toNat + 16777216 * (b.get! (o+3)).toNat

/-- the blocks of a pcert file after its text header (`start` = offset after `#end\n`): segments in order of first chunk;
`pcwit`: the headers carry the witness rows -/
def segments (b : ByteArray) (start : Nat) (pcwit : Bool := false) : Array (Nat × Seg) := Id.run do
  let mut o := start
  let mut ids : Array Nat := #[]
  let mut segs : Array (Option Seg) := #[]
  let mut fuel := b.size
  while o + 12 ≤ b.size && fuel > 0 do
    fuel := fuel - 1
    let magic := rd32 b o
    let len := rd32 b (o + 4)
    if magic != 0x31423352 then break
    let p := o + 12
    let sid := (rdU64 b p).toNat
    let flags := (b.get! (p + 12)).toNat
    let mut q := p + 13
    let ix := match ids.findIdx? (· == sid) with | some k => k | none => ids.size
    if ix == ids.size then
      ids := ids.push sid
      segs := segs.push none
    if flags % 2 == 1 then
      match var b q with
      | none => break
      | some (job, q1) =>
        let kind := (b.get! q1).toNat
        let d0 := (b.get! (q1 + 1)).toNat
        let pre := (Array.range d0).map fun k => (b.get! (q1 + 2 + 2 * k)).toNat + 256 * (b.get! (q1 + 3 + 2 * k)).toNat
        let q2 := q1 + 2 + 2 * d0
        let D := limbsBW b q2 64 8
        q := q2 + 64
        let mut wit : Array Nat := #[]
        if pcwit then
          match var b q with
          | none => break
          | some (n, q3) =>
            match deltas b n 0 q3 #[] with
            | none => break
            | some (ws, q4) => wit := ws; q := q4
        let mut lo := 0
        let mut pp := 0
        if kind == 3 then
          lo := (b.get! q).toNat + 256 * (b.get! (q + 1)).toNat
          pp := (b.get! (q + 2)).toNat + 256 * (b.get! (q + 3)).toNat
          q := q + 4
        segs := segs.set! ix (some { job := job, kind := kind, pre := pre, D := D, wit := wit, bytes := b.extract q (o + 12 + len),
                                     lo := lo, p := pp })
    else
      match segs[ix]! with
      | some s => segs := segs.set! ix (some { s with bytes := s.bytes ++ b.extract q (o + 12 + len) })
      | none => pure ()
    o := o + 12 + len
  let mut out : Array (Nat × Seg) := #[]
  for k in [0:ids.size] do
    match segs[k]! with
    | some s => out := out.push (ids[k]!, s)
    | none => pure ()
  return out

end NN.R3
