module
public import R22Port.U_d41d8cd98f00
public import L5.t.E185S21_C0
public import L5.t.E185S21_C1
public import L5.t.E185S21_C2
public import L5.t.E185S21_C3
public import L5.t.E185S21_C4
public import L5.t.E185S21_C5
public import L5.t.E185S21_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E185S21
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 68 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 68 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 4 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 16 = true := nestChk_join _ _ _ 0 4 12 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 25 = true := nestChk_join _ _ _ 0 16 9 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 45 = true := nestChk_join _ _ _ 0 25 20 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 57 = true := nestChk_join _ _ _ 0 45 12 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 68 = true := nestChk_join _ _ _ 0 57 11 (by rw [lenR]; decide) h4 ok5
  exact h5
/-- **the leaf has no decomposition** (nested split leaf: main record and 68 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E185S21
#print axioms E185S21.leaf
