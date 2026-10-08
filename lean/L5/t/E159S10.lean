module
public import R22Port.U_d41d8cd98f00
public import L5.t.E159S10_C0
public import L5.t.E159S10_C1
public import L5.t.E159S10_C2
public import L5.t.E159S10_C3
public import L5.t.E159S10_C4
public import L5.t.E159S10_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E159S10
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 54 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 54 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 6 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 17 = true := nestChk_join _ _ _ 0 6 11 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 28 = true := nestChk_join _ _ _ 0 17 11 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 44 = true := nestChk_join _ _ _ 0 28 16 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 54 = true := nestChk_join _ _ _ 0 44 10 (by rw [lenR]; decide) h3 ok4
  exact h4
/-- **the leaf has no decomposition** (nested split leaf: main record and 54 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E159S10
#print axioms E159S10.leaf
