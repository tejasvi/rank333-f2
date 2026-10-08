module
public import NN.Kinds
public import NN.RC
/-! # NN.Flook: the look-ahead cut (node cut 3) and leaf code 4, natively (core only)

At a dead node's own frame `(S, D, U, d)` (top label `last`): for a prefix term `lt` (a label of `S`) and the functionals `X`
through its code `a = vec lt` (`RC.hitsOne X a`), the final hits of `X` are at most `h + add` with `h = U[X]`,
`need = 22 - d`, `F` = available labels above `last`, `add = min(need, |F ∩ H_X|, need - max_Y (d_Y - |F ∩ H_Y ∩ H_X|))` over the
deficit hyperplanes `Y`.  `X` is tight if `h + add ≤ 3 rk X`, slack-1 if `= 3 rk X + 1` and `rk X < 3`.  The cut holds if
RootSound's matrix-form walk refutes the term with these lists (`RC.walk`, hint `h2` from the tree search `buildT`, a port of
`kinds/py/rootgen.py`).

`flookChk` re-checks a record against the frame (each bound by `fbN`, the walk) and is what the soundness theorem
(`NNP.Flook`) is about; `flookGen` (the record from the frame) needs no proof.  The tight list may be empty (prof7's cut 3 also
refutes terms whose functionals are all slack-1): the walk then splits on slack functionals only, and the soundness uses that
the term's `b`, `c` factors are nonzero (the case theorems' `hnz`).  The slack order is free (each listed functional is checked by
`fbN`); when the listed order gives a hint too long for the walk's 12-bit left-length fields, `flookGen` uses a greedy order. -/
@[expose] public section

namespace NN

/-- a look-ahead record: dead term label, tight list (with deficit hyperplanes), slack-1 list (with theirs), walk hint -/
structure FlookRec where
  lt : Nat
  TL : List Nat
  TY : List Nat
  SL : List Nat
  SY : List Nat
  h2 : Nat
  deriving Inhabited

/-- popcount of `a ∩ b` (8 limbs) -/
def pop2 (a b : Array UInt64) : Nat := sumN (fun k => pop64 (a.getD k 0 &&& b.getD k 0)) 8

/-- popcount of `a ∩ b ∩ c` (8 limbs) -/
def pop3 (a b c : Array UInt64) : Nat := sumN (fun k => pop64 (a.getD k 0 &&& b.getD k 0 &&& c.getD k 0)) 8

/-- the available labels above `last` (8 limbs) -/
def availAbove (D : Array UInt64) (last : Nat) : Array UInt64 :=
  (Array.range 8).map fun k => availW D k &&& aboveW (last + 1) k

/-- one functional's bound: final hits of `X` at most `3 rk X + c` (the deficit hyperplane `Y`, or 0) -/
def fbN (ks : KStatics) (U : ByteArray) (d : Nat) (F : Array UInt64) (X c Y : Nat) : Bool :=
  let h := (U.get! X).toNat
  let r := (ks.rk3.get! X).toNat + c
  let need := 22 - d
  let npX := ks.np.getD X #[]
  decide (h ≤ r) &&
    (decide (h + need ≤ r) || decide (pop2 F npX + h ≤ r) ||
     (decide (0 < Y) && decide (Y < 512) && decide ((U.get! Y).toNat < (ks.rk3.get! Y).toNat) &&
       decide (need ≤ (r - h) + ((ks.rk3.get! Y).toNat - (U.get! Y).toNat)) &&
       decide (pop3 F npX (ks.np.getD Y #[]) + need ≤ (r - h) + ((ks.rk3.get! Y).toNat - (U.get! Y).toNat))))

/-- every functional of the list is through `a` and bounded -/
def fbAllN (ks : KStatics) (U : ByteArray) (d : Nat) (F : Array UInt64) (a c : Nat) : List Nat → List Nat → Bool
  | [], [] => true
  | X :: Xs, Y :: Ys => decide (0 < X) && decide (X < 512) && RC.hitsOne X a && fbN ks U d F X c Y &&
      fbAllN ks U d F a c Xs Ys
  | _, _ => false

/-- **the look-ahead record check** at a dead node's frame (prefix `S`, dead mask `D`, counters `U`, `d` labels, top `last`) -/
def flookChk (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last : Nat) (fr : FlookRec) : Bool :=
  let F := availAbove D last
  let a := ks.vec.getD fr.lt 0
  decide (fr.lt < 511) && bit8 S fr.lt && decide (fr.lt ≤ last) && decide (d ≤ 22) &&
    fbAllN ks U d F a 0 fr.TL fr.TY && fbAllN ks U d F a 1 fr.SL fr.SY &&
    RC.walk fr.TL.length fr.TL fr.SL 64 fr.h2 (RC.q0 fr.TL) (RC.p0 fr.TL) 0

/-! ## The record from the frame (rootgen's search) -/

/-- an odd subset of the tight list whose `Z`-sum vanishes on `Q × P` (Gaussian elimination over GF(2); 64-bit vectors) -/
def oddset (tight : List Nat) (Qm Pm : Nat) : Option Nat := Id.run do
  let o := RC.outer Pm Qm
  let mut piv : Array (Nat × Nat × Bool) := Array.replicate 64 (0, 0, false)
  let mut has : Array Bool := Array.replicate 64 false
  let mut j := 0
  for X in tight do
    let mut v := Nat.land (RC.fz X) o
    let mut s := 1 <<< j
    let mut par := true
    let mut found := false
    for _ in [0:65] do
      if v == 0 || found then break
      let h := Nat.log2 v
      if has.getD h false then
        let (pv, ps, pp) := piv.getD h (0, 0, false)
        v := v ^^^ pv; s := s ^^^ ps; par := xor par pp
      else
        piv := piv.set! h (v, s, par); has := has.set! h true; found := true
    if v == 0 && !found && par then return some s
    j := j + 1
  return none

/-- a walk tree -/
inductive RTree where
  | zero
  | odd (s : Nat)
  | split (l r : RTree)
  deriving Inhabited

/-- rootgen's `build` (fuel = slack functionals left) -/
def buildT (tight : List Nat) : List Nat → Nat → Nat → Option RTree
  | slack, Qm, Pm =>
    if Qm == 1 || Pm == 1 then some .zero else
    match oddset tight Qm Pm with
    | some s => some (.odd s)
    | none =>
      match slack with
      | [] => none
      | X :: rest =>
        match buildT tight rest (Nat.land Qm (RC.qx X)) Pm with
        | none => none
        | some l =>
          match buildT tight rest Qm (Nat.land Pm (RC.px X)) with
          | none => none
          | some r => some (.split l r)

/-- rootgen's `enc_tree`: (bits, length); `none` if a left code is too long -/
def encT (nT : Nat) : RTree → Option (Nat × Nat)
  | .zero => some (0, 2)
  | .odd s => some (2 ||| (s <<< 2), 2 + nT)
  | .split l r => do
    let (lv, ll) ← encT nT l
    let (rv, rl) ← encT nT r
    if ll ≥ 4096 then none else
    some (1 ||| (ll <<< 1) ||| (lv <<< 13) ||| (rv <<< (13 + ll)), 13 + ll + rl)

/-- the `t`-th label of the prefix `S` (in increasing order; 511 if none) -/
def nthLab (S : Array UInt64) (t : Nat) : Nat := Id.run do
  let mut c := 0
  for l in [0:511] do
    if bit8 S l then
      if c == t then return l
      c := c + 1
  return 511

/-- the look-ahead lists of term `lt` at the frame: tight `(X, Y)` and slack-1 `(X, Y)` -/
def flookLists (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last lt : Nat) :
    List Nat × List Nat × List Nat × List Nat := Id.run do
  let F := availAbove D last
  let a := ks.vec.getD lt 0
  let need := 22 - d
  let mut TL : Array Nat := #[]
  let mut TY : Array Nat := #[]
  let mut SL : Array Nat := #[]
  let mut SY : Array Nat := #[]
  -- the deficit hyperplanes
  let mut dys : Array (Nat × Nat) := #[]
  for Y in [1:512] do
    let hY := (U.get! Y).toNat
    let rY := (ks.rk3.get! Y).toNat
    if hY < rY then dys := dys.push (Y, rY - hY)
  for X in [1:512] do
    if RC.hitsOne X a then
      let h := (U.get! X).toNat
      let r := (ks.rk3.get! X).toNat
      let npX := ks.np.getD X #[]
      let cF := pop2 F npX
      let add0 := min need cF
      -- the best deficit hyperplane
      let mut m := 0
      let mut bestY := 0
      if h + add0 < r + 2 then
        for (Y, dY) in dys do
          let c3 := pop3 F npX (ks.np.getD Y #[])
          if dY > c3 && dY - c3 > m then m := dY - c3; bestY := Y
      let add := min add0 (need - m)
      let useY := if add < add0 then bestY else 0
      if h + add ≤ r then
        TL := TL.push X; TY := TY.push useY
      else if h + add == r + 1 && r < 9 then
        SL := SL.push X; SY := SY.push useY
  return (TL.toList, TY.toList, SL.toList, SY.toList)

/-- a slack order for the levelled walk tree, chosen greedily: at each depth the functional that leaves the fewest open branches
(counted with multiplicity over the frontier of `(Q, P)` states; a state is closed when `Q = 1`, `P = 1` or the tight list has an
odd set on it) -/
def greedyOrder (TL SL : List Nat) (Q0 P0 : Nat) : List Nat := Id.run do
  let term := fun (Q P : Nat) => Q == 1 || P == 1 || (oddset TL Q P).isSome
  let mut front : Array (Nat × Nat × Nat) := if term Q0 P0 then #[] else #[(Q0, P0, 1)]
  let mut rest := SL
  let mut ord : Array Nat := #[]
  for _ in [0:SL.length] do
    if front.isEmpty then break
    let mut best := 0
    let mut bestScore := 1000000000000
    for X in rest do
      let mut score := 0
      for (Q, P, m) in front do
        if !term (Q &&& RC.qx X) P then score := score + m
        if !term Q (P &&& RC.px X) then score := score + m
      if score < bestScore then bestScore := score; best := X
    ord := ord.push best
    rest := rest.filter (· != best)
    let mut nf : Array (Nat × Nat × Nat) := #[]
    for (Q, P, m) in front do
      let Ql := Q &&& RC.qx best
      let Pr := P &&& RC.px best
      if !term Ql P then nf := nf.push (Ql, P, m)
      if !term Q Pr then nf := nf.push (Q, Pr, m)
    let sorted := nf.qsort (fun a b => a.1 < b.1 || (a.1 == b.1 && a.2.1 < b.2.1))
    let mut merged : Array (Nat × Nat × Nat) := #[]
    for e in sorted do
      if merged.size > 0 && merged.back!.1 == e.1 && merged.back!.2.1 == e.2.1 then
        merged := merged.pop.push (e.1, e.2.1, merged.back!.2.2 + e.2.2)
      else merged := merged.push e
    front := merged
  return ord.toList ++ rest

/-- the walk hint of a slack order (`none`: no levelled tree, or a left code of 4096 bits or more) -/
def hintOf (TL SL : List Nat) : Option Nat := do
  let tr ← buildT TL SL (RC.q0 TL) (RC.p0 TL)
  let (h2, _) ← encT TL.length tr
  return h2

/-- **the record from the frame**: term `lt`, its lists and the walk hint; the slack list in the listed order, or, if that gives
no tree or a hint that does not fit the walk's 12-bit left-length fields, in the greedy order (`none` if neither works) -/
def flookGen (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last lt : Nat) : Option FlookRec :=
  let (TL, TY, SL, SY) := flookLists ks S D U d last lt
  match hintOf TL SL with
  | some h2 => some { lt, TL, TY, SL, SY, h2 }
  | none =>
    let SL2 := greedyOrder TL SL (RC.q0 TL) (RC.p0 TL)
    let SY2 := SL2.map fun X => ((SL.zip SY).lookup X).getD 0
    match hintOf TL SL2 with
    | some h2 => some { lt, TL, TY, SL := SL2, SY := SY2, h2 }
    | none => none

/-- the cut at term position `t` (node cut 3) -/
def flookAt (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last t : Nat) : Bool :=
  match flookGen ks S D U d last (nthLab S t) with
  | some r => flookChk ks S D U d last r
  | none => false

/-- the cut at some prefix term (leaf code 4): the terms in label order -/
def flookAny (ks : KStatics) (S D : Array UInt64) (U : ByteArray) (d last : Nat) : Bool :=
  (List.range 511).any fun l =>
    bit8 S l && match flookGen ks S D U d last l with
      | some r => flookChk ks S D U d last r
      | none => false

end NN
