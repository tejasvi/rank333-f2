module
public import R22Port.U_d41d8cd98f00
public import L5.t.E159S26_C0
public import L5.t.E159S26_C1
public import L5.t.E159S26_C2
public import L5.t.E159S26_C3
public import L5.t.E159S26_C4
public import L5.t.E159S26_C5
public import L5.t.E159S26_C6
public import L5.t.E159S26_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E159S26
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 117 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 117 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 8 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 29 = true := nestChk_join _ _ _ 0 8 21 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 41 = true := nestChk_join _ _ _ 0 29 12 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 57 = true := nestChk_join _ _ _ 0 41 16 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 83 = true := nestChk_join _ _ _ 0 57 26 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 114 = true := nestChk_join _ _ _ 0 83 31 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 117 = true := nestChk_join _ _ _ 0 114 3 (by rw [lenR]; decide) h5 ok6
  exact h6
/-- **the leaf has no decomposition** (nested split leaf: main record and 117 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E159S26
#print axioms E159S26.leaf
