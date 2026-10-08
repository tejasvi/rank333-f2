module
public import R22Port.U_d41d8cd98f00
public import L5.t.E150S5_C0
public import L5.t.E150S5_C1
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace E150S5
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) paths = true := by decide +kernel
theorem subsAll : subsChk (lits.getD 0 0) paths lits.tail 0 528 = true := by
  have h0 : subsChk (lits.getD 0 0) paths lits.tail 0 253 = true := ok0
  have h1 : subsChk (lits.getD 0 0) paths lits.tail 0 528 = true := subsChk_join _ _ _ 0 253 275 h0 ok1
  exact h1
theorem lenP : paths.length = 528 := by decide
theorem lenC : lits.tail.length = 528 := by decide
/-- **the leaf has no decomposition** (split leaf: main record and 528 sub-records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  leafSplit_sound' _ paths lits.tail (by rw [lenP, lenC]) main (by rw [lenP]; exact subsAll)
end E150S5
#print axioms E150S5.leaf
