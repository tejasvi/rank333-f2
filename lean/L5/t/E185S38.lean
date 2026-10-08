module
public import R22Port.U_d41d8cd98f00
public import L5.t.E185S38_C0
public import L5.t.E185S38_C1
public import L5.t.E185S38_C2
public import L5.t.E185S38_C3
public import L5.t.E185S38_C4
public import L5.t.E185S38_C5
public import L5.t.E185S38_C6
public import L5.t.E185S38_C7
public import L5.t.E185S38_C8
public import L5.t.E185S38_C9
public import L5.t.E185S38_C10
public import L5.t.E185S38_C11
public import L5.t.E185S38_C12
public import L5.t.E185S38_C13
public import L5.t.E185S38_C14
public import L5.t.E185S38_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E185S38
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 980 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 980 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 38 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 54 = true := nestChk_join _ _ _ 0 38 16 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 56 = true := nestChk_join _ _ _ 0 54 2 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 74 = true := nestChk_join _ _ _ 0 56 18 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 88 = true := nestChk_join _ _ _ 0 74 14 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 182 = true := nestChk_join _ _ _ 0 88 94 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 290 = true := nestChk_join _ _ _ 0 182 108 (by rw [lenR]; decide) h5 ok6
  have h7 : nestChkR (lits.getD 0 0) paths recs 0 303 = true := nestChk_join _ _ _ 0 290 13 (by rw [lenR]; decide) h6 ok7
  have h8 : nestChkR (lits.getD 0 0) paths recs 0 325 = true := nestChk_join _ _ _ 0 303 22 (by rw [lenR]; decide) h7 ok8
  have h9 : nestChkR (lits.getD 0 0) paths recs 0 371 = true := nestChk_join _ _ _ 0 325 46 (by rw [lenR]; decide) h8 ok9
  have h10 : nestChkR (lits.getD 0 0) paths recs 0 448 = true := nestChk_join _ _ _ 0 371 77 (by rw [lenR]; decide) h9 ok10
  have h11 : nestChkR (lits.getD 0 0) paths recs 0 577 = true := nestChk_join _ _ _ 0 448 129 (by rw [lenR]; decide) h10 ok11
  have h12 : nestChkR (lits.getD 0 0) paths recs 0 699 = true := nestChk_join _ _ _ 0 577 122 (by rw [lenR]; decide) h11 ok12
  have h13 : nestChkR (lits.getD 0 0) paths recs 0 854 = true := nestChk_join _ _ _ 0 699 155 (by rw [lenR]; decide) h12 ok13
  have h14 : nestChkR (lits.getD 0 0) paths recs 0 980 = true := nestChk_join _ _ _ 0 854 126 (by rw [lenR]; decide) h13 ok14
  exact h14
/-- **the leaf has no decomposition** (nested split leaf: main record and 980 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E185S38
#print axioms E185S38.leaf
