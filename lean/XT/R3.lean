module
public import XT.W8
public import XT.Lits
public import XT.Rec
public import XT.Check
/-! # XT.R3: the X part of a node from R3's batch-11 `--xpvar` blobs (core only, unverified)

R3's stream (r22/lean/rerun/r3/prof7R3_b11.cc, `#xpvar 1`) writes the bulk-peel blobs as LEB128 varint item lists, the same items
as the `[u64 len][LE bytes]` lists before (r3/exp/xpvarchk.py):
* XPN (node record): `nQ, Q*, nd, (row id, residual)*, nn, nodeIdx*, nB, (x, k, idx*k)*`; dictionary indices are XPN-local;
* X choice 5 (a child): `kind, bb, u, t, Fu, ncr, crIdx*, tree`; tree in preorder: leaf `0, ns, (X, d)*, finX, finD`,
  node `1, ns, (X, d)*, v, left, right`, cut `2, 0` (steps name functionals `X`).
`parseR3` maps XPN-local indices through the node agent's position map `pos`, names each in-branch's aggregate (the first with the
pick as label), builds the deficit table (`XL` = the node's functionals in first-occurrence order, `HP` = `M511` / `nperpL X`,
`DEF` = `22 - du` / `3 rk X - U[X]`) and rewrites the steps to `(j, d)`: the record `XT.check` and the views (`XTP`) work on, in
aggregate layout 2.  Unverified: the refinement theorem is stated on the record.  All recursion is structural (fuel); no
allocation per varint (sentinel offsets as in `XT.parse`). -/
@[expose] public section

namespace XT
namespace R3

/-! Varints are read in the parser's sentinel style (no per-item allocation): `vEnd b o` is the offset after the varint at `o`
(at most 10 bytes) or `b.size + 1` if it does not end inside `b`, and `vVal b o` its value. -/

def vEndF (b : ByteArray) : Nat → Nat → Nat
  | 0, _ => b.size + 1
  | fuel + 1, o => if h : o < b.size then (if b[o] < 128 then o + 1 else vEndF b fuel (o + 1)) else b.size + 1

@[inline] def vEnd (b : ByteArray) (o : Nat) : Nat :=
  if h : o + 1 < b.size then
    (if b[o] < 128 then o + 1 else if b[o + 1] < 128 then o + 2 else vEndF b 8 (o + 2))
  else if h : o < b.size then (if b[o] < 128 then o + 1 else b.size + 1) else b.size + 1

def vValF (b : ByteArray) : Nat → Nat → Nat → Nat → Nat
  | 0, _, _, acc => acc
  | fuel + 1, o, sh, acc =>
    if h : o < b.size then
      if b[o] < 128 then acc + (b[o].toNat <<< sh) else vValF b fuel (o + 1) (sh + 7) (acc + ((b[o].toNat - 128) <<< sh))
    else acc

@[inline] def vVal (b : ByteArray) (o : Nat) : Nat :=
  if h : o + 1 < b.size then
    (if b[o] < 128 then b[o].toNat else if b[o + 1] < 128 then b[o].toNat - 128 + (b[o + 1].toNat <<< 7) else vValF b 10 o 0 0)
  else if h : o < b.size then b[o].toNat else 0

/-- the mask of limbs `ls` (at most 8) and the partial limb `cur` -/
@[inline] def finish (ls : Array UInt64) (cur : UInt64) : W8 :=
  let a := if ls.size < 8 then ls.push cur else ls
  ⟨a.getD 0 0, a.getD 1 0, a.getD 2 0, a.getD 3 0, a.getD 4 0, a.getD 5 0, a.getD 6 0, a.getD 7 0⟩

/-- a varint mask of at most 512 bits: the 7-bit group at bit `p`; `ls` the completed limbs (`ls.size = p / 64`), `cur` the limb
being filled; bits at 512 and above must be zero -/
def varMaskF (b : ByteArray) : Nat → Nat → Nat → UInt64 → Array UInt64 → Option (W8 × Nat)
  | 0, _, _, _, _ => none
  | fuel + 1, o, p, cur, ls =>
    if h : o < b.size then
      let c := b[o]
      let v := (c &&& 127).toUInt64
      if ls.size ≥ 8 then
        if cur != 0 || v != 0 then none
        else if c < 128 then some (finish ls 0, o + 1) else varMaskF b fuel (o + 1) (p + 7) 0 ls
      else
        let r := (p % 64).toUInt64
        let cur1 := cur ||| (v <<< r)
        if r ≥ 57 then
          let cur2 := v >>> (64 - r)
          let ls1 := ls.push cur1
          if c < 128 then (if ls1.size ≥ 8 && cur2 != 0 then none else some (finish ls1 cur2, o + 1))
          else varMaskF b fuel (o + 1) (p + 7) cur2 ls1
        else if c < 128 then some (finish ls cur1, o + 1) else varMaskF b fuel (o + 1) (p + 7) cur1 ls
    else none

@[inline] def varMask (b : ByteArray) (o : Nat) : Option (W8 × Nat) := varMaskF b 80 o 0 0 (Array.mkEmpty 8)

/-- `k` varints mapped through `pos` (XPN-local index ↦ dictionary position) -/
def posList (b : ByteArray) (pos : Array Nat) : Nat → Nat → Array Nat → Option (Array Nat × Nat)
  | 0, o, acc => some (acc, o)
  | k + 1, o, acc =>
    let o' := vEnd b o
    if o' > b.size then none else
    let j := vVal b o
    if h : j < pos.size then posList b pos k o' (acc.push pos[j]) else none

/-- `k` varints skipped (`b.size + 1` on failure) -/
def skipN (b : ByteArray) : Nat → Nat → Nat
  | 0, o => o
  | k + 1, o => let o' := vEnd b o; if o' > b.size then o' else skipN b k o'

/-! The deficit table under construction is one array `st`: `st[X] = j + 1` for a functional `X < 512` at table index `j` (0 if
absent), and the table's functionals in first-occurrence order from index 512 on (a functional at or above 512, which the check
rejects, gets one entry per occurrence). -/

/-- `ns` steps `(X, d)` rewritten to `(j, d)` -/
def stepsR (b : ByteArray) : Nat → Nat → Array Nat → Array Nat → Option (Array Nat × Array Nat × Nat)
  | 0, o, st, acc => some (acc, st, o)
  | k + 1, o, st, acc =>
    let o1 := vEnd b o
    if o1 > b.size then none else
    let o2 := vEnd b o1
    if o2 > b.size then none else
    let X := vVal b o
    let d := vVal b o1
    let n := st.size - 512
    if X < 512 then
      let e := st[X]!
      if e > 0 then stepsR b k o2 st ((acc.push (e - 1)).push d)
      else stepsR b k o2 ((st.set! X (n + 1)).push X) ((acc.push n).push d)
    else stepsR b k o2 (st.push X) ((acc.push n).push d)

/-- the table index of functional `X` (added if new) -/
@[inline] def dtGet (st : Array Nat) (X : Nat) : Nat × Array Nat :=
  let n := st.size - 512
  if X < 512 then
    let e := st[X]!
    if e > 0 then (e - 1, st) else (n, (st.set! X (n + 1)).push X)
  else (n, st.push X)

/-- a tree (fuel: an upper bound on the items left); `aggOf v` = the aggregate index of the pick `v` -/
def treeR (b : ByteArray) (aggOf : Nat → Nat) : Nat → Nat → Array Nat → Option (XTN × Array Nat × Nat)
  | 0, _, _ => none
  | fuel + 1, o, st =>
    let o1 := vEnd b o
    if o1 > b.size then none else
    let o2 := vEnd b o1
    if o2 > b.size then none else
    let tag := vVal b o
    let ns := vVal b o1
    if tag = 2 then (if ns = 0 then some (.cut, st, o2) else none)
    else if ns > b.size then none
    else match stepsR b ns o2 st (Array.mkEmpty (2 * ns)) with
      | none => none
      | some (sts, st1, o3) =>
        let o4 := vEnd b o3
        if o4 > b.size then none else
        if tag = 0 then
          let o5 := vEnd b o4
          if o5 > b.size then none else
          let (fj, st2) := dtGet st1 (vVal b o3)
          some (.leaf sts fj (vVal b o4), st2, o5)
        else if tag = 1 then
          let v := vVal b o3
          match treeR b aggOf fuel o4 st1 with
          | none => none
          | some (l, st2, o5) =>
            match treeR b aggOf fuel o5 st2 with
            | none => none
            | some (r, st3, o6) => some (.node sts v (aggOf v) l r, st3, o6)
        else none

/-- the aggregates of the XPN record: `nB` times `(x, k, idx*k)` -/
def aggsR (b : ByteArray) (pos : Array Nat) : Nat → Nat → Array XAgg → Option (Array XAgg × Nat)
  | 0, o, acc => some (acc, o)
  | n + 1, o, acc =>
    let o1 := vEnd b o
    if o1 > b.size then none else
    let o2 := vEnd b o1
    if o2 > b.size then none else
    let k := vVal b o1
    if k > b.size then none else
    match posList b pos k o2 (Array.mkEmpty k) with
    | none => none
    | some (ps, o3) => aggsR b pos n o3 (acc.push { x := vVal b o, ps, B := #[], ms := #[] })

/-- `atab[x]` = the first aggregate with label `x < 512` (`aggs.size` if none) -/
def aggTab (aggs : Array XAgg) : Array Nat :=
  (List.range aggs.size).foldr (fun k t => let x := aggs[k]!.x; if x < 512 then t.set! x k else t)
    (Array.replicate 512 aggs.size)

/-- one child from its X blob -/
def kidR (pos : Array Nat) (aggs : Array XAgg) (atab : Array Nat) (u0 : Nat) (blob : ByteArray) (st : Array Nat) :
    Option (XKid × Array Nat) :=
  let o1 := vEnd blob 0
  let o2 := vEnd blob o1
  let o3 := vEnd blob o2
  let o4 := vEnd blob o3
  if o4 > blob.size then none else
  let u := vVal blob o2
  if u ≠ u0 then none else
  match varMask blob o4 with
  | none => none
  | some (Fu, o5) =>
    let o6 := vEnd blob o5
    if o6 > blob.size then none else
    let ncr := vVal blob o5
    if ncr > blob.size then none else
    match posList blob pos ncr o6 (Array.mkEmpty ncr) with
    | none => none
    | some (cr, o7) =>
      -- the aggregate of the pick u + 1 + v: the first with that label
      let aggOf (v : Nat) : Nat :=
        let x := u + 1 + v
        if x < 512 then atab[x]! else (aggs.findIdx? fun a => a.x == x).getD aggs.size
      match treeR blob aggOf (blob.size + 1) o7 st with
      | none => none
      | some (tr, st', o8) =>
        if o8 = blob.size then some ({ kind := vVal blob 0, bb := vVal blob o1, u, Fu, cr, t := tr }, st') else none

/-- the children -/
def kidsR (pos : Array Nat) (aggs : Array XAgg) (atab : Array Nat) (xs : Array (Nat × Nat × Nat × ByteArray)) :
    Nat → Array Nat → Array XKid → Option (Array XKid × Array Nat)
  | 0, st, acc => some (acc, st)
  | n + 1, st, acc =>
    let (u0, _, _, blob) := xs[xs.size - (n + 1)]!
    match kidR pos aggs atab u0 blob st with
    | none => none
    | some (k, st') => kidsR pos aggs atab xs n st' (acc.push k)

end R3

/-- **the X part of a node from R3's batch-11 blobs**: the XPN record, the X records `(u, kind, bb, blob)` in stream order, the map
`pos` from XPN-local dictionary indices to dictionary positions, the order's hyperplane masks `npW`, and the frame's counters `U`
and prefix size `du` (deficit table) -/
def parseR3 (npW : Array W8) (xpn : ByteArray) (xs : Array (Nat × Nat × Nat × ByteArray)) (pos : Array Nat) (U : ByteArray)
    (du : Nat) : Option XRec :=
  let o1 := R3.vEnd xpn 0
  if o1 > xpn.size then none else
  let o2 := R3.skipN xpn (R3.vVal xpn 0) o1
  if o2 > xpn.size then none else
  let o3 := R3.vEnd xpn o2
  if o3 > xpn.size then none else
  let o4 := R3.skipN xpn (2 * R3.vVal xpn o2) o3
  if o4 > xpn.size then none else
  let o5 := R3.vEnd xpn o4
  if o5 > xpn.size then none else
  let nn := R3.vVal xpn o4
  if nn > xpn.size then none else
  match R3.posList xpn pos nn o5 (Array.mkEmpty nn) with
  | none => none
  | some (nrows, o6) =>
    let o7 := R3.vEnd xpn o6
    if o7 > xpn.size then none else
    let nB := R3.vVal xpn o6
    if nB > xpn.size then none else
    match R3.aggsR xpn pos nB o7 (Array.mkEmpty nB) with
    | none => none
    | some (aggs, o8) =>
      if o8 ≠ xpn.size then none else
      match R3.kidsR pos aggs (R3.aggTab aggs) xs xs.size (Array.replicate 512 0) (Array.mkEmpty xs.size) with
      | none => none
      | some (kids, st) =>
        let XL := st.extract 512 st.size
        let HP := XL.map fun X => if X = 0 then W8.all511 else if X < 512 then npW[X]! else W8.zero
        let DEF := XL.map fun X => if X = 0 then 22 - du else if X < 512 then 3 * rkTab[X]! - (U.get! X).toNat else 0
        some { lay := 2, nrows, aggs, XL, HP, DEF, kids }

end XT

namespace XT

/-- **the X part of a node from R3's blobs, decided**: `parseR3`, then `checkT` (`XTP.checkR3_sound`).  The children's labels are
compared with the X records' (`parseR3` already enforces it), so the theorem can state the coverage without a parser lemma. -/
def checkR3 (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (xpn : ByteArray) (xs : Array (Nat × Nat × Nat × ByteArray)) (pos : Array Nat) : Bool :=
  match parseR3 npW xpn xs pos U du with
  | some x => x.lay != 1 && kidLabels x == xs.map (·.1) && checkT S D N U du last b1 m e1 dict c2W npW x
  | none => false

/-- **the X part of a node from batch-file items, decided**: `parse lay`, then `checkT` (`XTP.checkItems_sound`) -/
def checkItems (S D N : Array UInt64) (U : ByteArray) (du last b1 m e1 : Nat) (dict : Array UInt64) (c2W : Array (Array W8))
    (npW : Array W8) (lay : Nat) (b : ByteArray) (o : Nat) : Bool :=
  match parse lay b o with
  | some (x, _) => x.lay != 1 && checkT S D N U du last b1 m e1 dict c2W npW x
  | none => false

end XT
