module
public import R22Port.U_d41d8cd98f00
public import L5.t.E202S16_C0
public import L5.t.E202S16_C1
public import L5.t.E202S16_C2
public import L5.t.E202S16_C3
public import L5.t.E202S16_C4
public import L5.t.E202S16_C5
public import L5.t.E202S16_C6
public import L5.t.E202S16_C7
public import L5.t.E202S16_C8
public import L5.t.E202S16_C9
public import L5.t.E202S16_C10
public import L5.t.E202S16_C11
public import L5.t.E202S16_C12
public import L5.t.E202S16_C13
public import L5.t.E202S16_C14
public import L5.t.E202S16_C15
public import L5.t.E202S16_C16
public import L5.t.E202S16_C17
public import L5.t.E202S16_C18
public import L5.t.E202S16_C19
public import L5.t.E202S16_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E202S16
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 767 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 767 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 14 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 49 = true := nestChk_join _ _ _ 0 14 35 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 70 = true := nestChk_join _ _ _ 0 49 21 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 101 = true := nestChk_join _ _ _ 0 70 31 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 109 = true := nestChk_join _ _ _ 0 101 8 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 153 = true := nestChk_join _ _ _ 0 109 44 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 178 = true := nestChk_join _ _ _ 0 153 25 (by rw [lenR]; decide) h5 ok6
  have h7 : nestChkR (lits.getD 0 0) paths recs 0 267 = true := nestChk_join _ _ _ 0 178 89 (by rw [lenR]; decide) h6 ok7
  have h8 : nestChkR (lits.getD 0 0) paths recs 0 307 = true := nestChk_join _ _ _ 0 267 40 (by rw [lenR]; decide) h7 ok8
  have h9 : nestChkR (lits.getD 0 0) paths recs 0 308 = true := nestChk_join _ _ _ 0 307 1 (by rw [lenR]; decide) h8 ok9
  have h10 : nestChkR (lits.getD 0 0) paths recs 0 313 = true := nestChk_join _ _ _ 0 308 5 (by rw [lenR]; decide) h9 ok10
  have h11 : nestChkR (lits.getD 0 0) paths recs 0 318 = true := nestChk_join _ _ _ 0 313 5 (by rw [lenR]; decide) h10 ok11
  have h12 : nestChkR (lits.getD 0 0) paths recs 0 326 = true := nestChk_join _ _ _ 0 318 8 (by rw [lenR]; decide) h11 ok12
  have h13 : nestChkR (lits.getD 0 0) paths recs 0 341 = true := nestChk_join _ _ _ 0 326 15 (by rw [lenR]; decide) h12 ok13
  have h14 : nestChkR (lits.getD 0 0) paths recs 0 374 = true := nestChk_join _ _ _ 0 341 33 (by rw [lenR]; decide) h13 ok14
  have h15 : nestChkR (lits.getD 0 0) paths recs 0 447 = true := nestChk_join _ _ _ 0 374 73 (by rw [lenR]; decide) h14 ok15
  have h16 : nestChkR (lits.getD 0 0) paths recs 0 521 = true := nestChk_join _ _ _ 0 447 74 (by rw [lenR]; decide) h15 ok16
  have h17 : nestChkR (lits.getD 0 0) paths recs 0 611 = true := nestChk_join _ _ _ 0 521 90 (by rw [lenR]; decide) h16 ok17
  have h18 : nestChkR (lits.getD 0 0) paths recs 0 690 = true := nestChk_join _ _ _ 0 611 79 (by rw [lenR]; decide) h17 ok18
  have h19 : nestChkR (lits.getD 0 0) paths recs 0 767 = true := nestChk_join _ _ _ 0 690 77 (by rw [lenR]; decide) h18 ok19
  exact h19
/-- **the leaf has no decomposition** (nested split leaf: main record and 767 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E202S16
#print axioms E202S16.leaf
