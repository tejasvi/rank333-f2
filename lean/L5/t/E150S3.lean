module
public import R22Port.U_d41d8cd98f00
public import L5.t.E150S3_C0
public import L5.t.E150S3_C1
public import L5.t.E150S3_C2
public import L5.t.E150S3_C3
public import L5.t.E150S3_C4
public import L5.t.E150S3_C5
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace E150S3
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) paths = true := by decide +kernel
theorem subsAll : subsChk (lits.getD 0 0) paths lits.tail 0 528 = true := by
  have h0 : subsChk (lits.getD 0 0) paths lits.tail 0 89 = true := ok0
  have h1 : subsChk (lits.getD 0 0) paths lits.tail 0 101 = true := subsChk_join _ _ _ 0 89 12 h0 ok1
  have h2 : subsChk (lits.getD 0 0) paths lits.tail 0 163 = true := subsChk_join _ _ _ 0 101 62 h1 ok2
  have h3 : subsChk (lits.getD 0 0) paths lits.tail 0 312 = true := subsChk_join _ _ _ 0 163 149 h2 ok3
  have h4 : subsChk (lits.getD 0 0) paths lits.tail 0 408 = true := subsChk_join _ _ _ 0 312 96 h3 ok4
  have h5 : subsChk (lits.getD 0 0) paths lits.tail 0 528 = true := subsChk_join _ _ _ 0 408 120 h4 ok5
  exact h5
theorem lenP : paths.length = 528 := by decide
theorem lenC : lits.tail.length = 528 := by decide
/-- **the leaf has no decomposition** (split leaf: main record and 528 sub-records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  leafSplit_sound' _ paths lits.tail (by rw [lenP, lenC]) main (by rw [lenP]; exact subsAll)
end E150S3
#print axioms E150S3.leaf
