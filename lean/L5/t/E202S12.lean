module
public import R22Port.U_d41d8cd98f00
public import L5.t.E202S12_C0
public import L5.t.E202S12_C1
public import L5.t.E202S12_C2
public import L5.t.E202S12_C3
public import L5.t.E202S12_C4
public import L5.t.E202S12_C5
public import L5.t.E202S12_C6
public import L5.t.E202S12_C7
public import L5.t.E202S12_C8
public import L5.t.E202S12_C9
public import L5.t.E202S12_C10
public import L5.t.E202S12_C11
public import L5.t.E202S12_C12
public import L5.t.E202S12_C13
public import L5.t.E202S12_C14
public import L5.t.E202S12_C15
public import L5.t.E202S12_C16
public import L5.t.E202S12_C17
public import L5.t.E202S12_C18
public import L5.t.E202S12_C19
public import L5.t.E202S12_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E202S12
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 778 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 778 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 27 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 64 = true := nestChk_join _ _ _ 0 27 37 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 124 = true := nestChk_join _ _ _ 0 64 60 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 129 = true := nestChk_join _ _ _ 0 124 5 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 136 = true := nestChk_join _ _ _ 0 129 7 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 142 = true := nestChk_join _ _ _ 0 136 6 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 152 = true := nestChk_join _ _ _ 0 142 10 (by rw [lenR]; decide) h5 ok6
  have h7 : nestChkR (lits.getD 0 0) paths recs 0 167 = true := nestChk_join _ _ _ 0 152 15 (by rw [lenR]; decide) h6 ok7
  have h8 : nestChkR (lits.getD 0 0) paths recs 0 175 = true := nestChk_join _ _ _ 0 167 8 (by rw [lenR]; decide) h7 ok8
  have h9 : nestChkR (lits.getD 0 0) paths recs 0 196 = true := nestChk_join _ _ _ 0 175 21 (by rw [lenR]; decide) h8 ok9
  have h10 : nestChkR (lits.getD 0 0) paths recs 0 245 = true := nestChk_join _ _ _ 0 196 49 (by rw [lenR]; decide) h9 ok10
  have h11 : nestChkR (lits.getD 0 0) paths recs 0 306 = true := nestChk_join _ _ _ 0 245 61 (by rw [lenR]; decide) h10 ok11
  have h12 : nestChkR (lits.getD 0 0) paths recs 0 313 = true := nestChk_join _ _ _ 0 306 7 (by rw [lenR]; decide) h11 ok12
  have h13 : nestChkR (lits.getD 0 0) paths recs 0 357 = true := nestChk_join _ _ _ 0 313 44 (by rw [lenR]; decide) h12 ok13
  have h14 : nestChkR (lits.getD 0 0) paths recs 0 443 = true := nestChk_join _ _ _ 0 357 86 (by rw [lenR]; decide) h13 ok14
  have h15 : nestChkR (lits.getD 0 0) paths recs 0 477 = true := nestChk_join _ _ _ 0 443 34 (by rw [lenR]; decide) h14 ok15
  have h16 : nestChkR (lits.getD 0 0) paths recs 0 562 = true := nestChk_join _ _ _ 0 477 85 (by rw [lenR]; decide) h15 ok16
  have h17 : nestChkR (lits.getD 0 0) paths recs 0 632 = true := nestChk_join _ _ _ 0 562 70 (by rw [lenR]; decide) h16 ok17
  have h18 : nestChkR (lits.getD 0 0) paths recs 0 728 = true := nestChk_join _ _ _ 0 632 96 (by rw [lenR]; decide) h17 ok18
  have h19 : nestChkR (lits.getD 0 0) paths recs 0 778 = true := nestChk_join _ _ _ 0 728 50 (by rw [lenR]; decide) h18 ok19
  exact h19
/-- **the leaf has no decomposition** (nested split leaf: main record and 778 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E202S12
#print axioms E202S12.leaf
