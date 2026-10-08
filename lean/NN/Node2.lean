module
public import NN.Node
/-! # NN.Node2: the native node step with explicit fields (the r3 path)

`nodeStep2` is `nodeStep` without the kx2 packing: the node record carries its label, depth, the five dictionary lists (item-local
table indices, in dictionary order V, R1, R2, X1, X2) and its T/C kills as `(u, exclusion positions in R1, cover positions in
R1 ∪ R2)`. The checks and the child frame are those of `nodeStep` (`NNP.Node2` proves the same conclusions). -/
@[expose] public section

namespace NN

/-- a T/C kill: child `u`, exclusion rows (positions in R1), cover rows (positions in R1 ∪ R2) -/
structure Kill where
  u : Nat
  ex : Array Nat
  cv : Array Nat
  deriving Inhabited

/-- a node record of the r3 path -/
structure NodeRec2 where
  lab : Nat
  d : Nat
  r0 : Array Nat
  r1 : Array Nat
  r2 : Array Nat
  x1 : Array Nat
  x2 : Array Nat
  kills : Array Kill
  deriving Inhabited

/-- the dictionary ids: V, R1, R2, X1, X2 -/
def dictIds2 (nd : NodeRec2) : Array Nat := nd.r0 ++ nd.r1 ++ nd.r2 ++ nd.x1 ++ nd.x2

/-- one kill at the node: window start `w0`, child dead mask `D'`, child conflict table `N'`, counts `nV`, `n1`, `m`,
`nu = 21 - d` -/
def killOK2 (tab : Tab) (ids : Array Nat) (D' N' : Array UInt64) (w0 nV n1 m nu : Nat) (k : Kill) : Bool :=
  let u := k.u
  let uq := u / 64
  let us := (u % 64).toUInt64
  let exOK := allN (fun i => let e := k.ex.getD i 0; e < n1 && (dW tab ids m (nV + e) uq >>> us) &&& 1 == 1) k.ex.size
  let cvOK := allN (fun i => let c := k.cv.getD i 0;
    (dW tab ids m (nV + c) uq >>> us) &&& 1 == (if c < n1 then 0 else 1)) k.cv.size
  let yW := fun (q : Nat) =>
    let x1 := aboveW (u + 1) q &&& ~~~(D'.getD q 0) &&& ~~~(N'.getD (8 * u + q) 0)
    let z := orN (fun i => let e := k.ex.getD i 0; if e < n1 then dW tab ids m (nV + e) q else 0) k.ex.size |||
      orN (fun i => dW tab ids m (nV + k.cv.getD i 0) q) k.cv.size
    x1 &&& ~~~z
  w0 ≤ u && u < 511 && exOK && cvOK && sumFrom (fun q => pop64 (yW q)) ((u + 1) / 64) 8 + k.cv.size < nu

/-- the header and shape checks -/
def headOK2 (fr : Frame) (nd : NodeRec2) : Bool :=
  nd.lab < 511 && nd.d == fr.d + 1 && nd.d ≤ 21 && noBitsFrom fr.S nd.lab && fr.S.size == 8 && fr.D.size == 8 &&
    fr.N.size == 4096 && fr.U.size == 512

/-- **one node** (L1 part, r3 path) on the frame `fr` -/
def nodeStep2 (st : Statics) (tab : Tab) (fr : Frame) (nd : NodeRec2) : Option StepOut :=
  let last := nd.lab
  let d := nd.d
  let nV := nd.r0.size
  let n1 := nd.r1.size
  let m := nV + n1 + nd.r2.size
  if !(headOK2 fr nd) then none else
  let S' := setBit8 fr.S last
  if !(rowsOK tab S' 0 nd.r0 && rowsOK tab S' 1 nd.r1 && rowsOK tab S' 2 nd.r2 && rowsOK tab S' 1 nd.x1 &&
      rowsOK tab S' 2 nd.x2) then none else
  let ids := dictIds2 nd
  let D' := (Array.range 8).map fun k => (fr.D.getD k 0) ||| (fr.N.getD (8 * last + k) 0) ||| orN (fun p => dW tab ids nV p k) nV
  let c2 := st.c2t.getD last #[]
  let N' := (Array.range 4096).map fun k => (fr.N.getD k 0) ||| (c2.getD k 0)
  let h := st.h.getD last ByteArray.empty
  if !(addUOK fr.U h) then none else
  let U' := addU fr.U h
  if !(guardsOK U' (st.suf.getD last ByteArray.empty) st.rk3 d) then none else
  if !(nd.kills.all (killOK2 tab ids D' N' (last + 1) nV n1 m (21 - d))) then none else
  some { fr := { S := S', D := D', N := N', U := U', d := d }, ids := ids, b1 := nV + n1, m := m, e1 := m + nd.x1.size }

/-- the children a node step accounts for by itself: dead labels of `D'` and the T/C kills (8 limbs) -/
def accL1 (D' : Array UInt64) (kills : Array Kill) : Array UInt64 :=
  kills.foldl (fun a k => setBit8 a k.u) ((Array.range 8).map fun q => D'.getD q 0)

end NN
