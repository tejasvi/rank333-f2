module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S1_C0
public import L5.t.E207S1_C1
public import L5.t.E207S1_C2
public import L5.t.E207S1_C3
public import L5.t.E207S1_C4
public import L5.t.E207S1_C5
public import L5.t.E207S1_C6
public import L5.t.E207S1_C7
public import L5.t.E207S1_C8
public import L5.t.E207S1_C9
public import L5.t.E207S1_C10
public import L5.t.E207S1_C11
public import L5.t.E207S1_C12
public import L5.t.E207S1_C13
public import L5.t.E207S1_C14
public import L5.t.E207S1_C15
public import L5.t.E207S1_C16
public import L5.t.E207S1_C17
public import L5.t.E207S1_C18
public import L5.t.E207S1_C19
public import L5.t.E207S1_C20
public import L5.t.E207S1_C21
public import L5.t.E207S1_C22
public import L5.t.E207S1_C23
public import L5.t.E207S1_C24
public import L5.t.E207S1_C25
public import L5.t.E207S1_C26
public import L5.t.E207S1_C27
public import L5.t.E207S1_C28
public import L5.t.E207S1_C29
public import L5.t.E207S1_C30
public import L5.t.E207S1_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S1
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1180 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1180 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 44 2 m0 804 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 46 1 m0 804 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 47 17 m0 992 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 109 m0 = true :=
    chunkT_join _ _ _ 0 64 45 m0 992 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 131 m0 = true :=
    chunkT_join _ _ _ 0 109 22 m0 992 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 131 11 m0 992 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 142 13 m0 992 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 155 15 m0 992 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 170 58 m0 992 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 229 m0 = true :=
    chunkT_join _ _ _ 0 228 1 m0 992 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 247 m0 = true :=
    chunkT_join _ _ _ 0 229 18 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 254 m0 = true :=
    chunkT_join _ _ _ 0 247 7 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 268 m0 = true :=
    chunkT_join _ _ _ 0 254 14 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 268 62 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 330 23 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 353 50 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 467 m0 = true :=
    chunkT_join _ _ _ 0 403 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 516 m0 = true :=
    chunkT_join _ _ _ 0 467 49 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 562 m0 = true :=
    chunkT_join _ _ _ 0 516 46 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 619 m0 = true :=
    chunkT_join _ _ _ 0 562 57 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 657 m0 = true :=
    chunkT_join _ _ _ 0 619 38 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 721 m0 = true :=
    chunkT_join _ _ _ 0 657 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 785 m0 = true :=
    chunkT_join _ _ _ 0 721 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 849 m0 = true :=
    chunkT_join _ _ _ 0 785 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 913 m0 = true :=
    chunkT_join _ _ _ 0 849 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 977 m0 = true :=
    chunkT_join _ _ _ 0 913 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 1041 m0 = true :=
    chunkT_join _ _ _ 0 977 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1105 m0 = true :=
    chunkT_join _ _ _ 0 1041 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1169 m0 = true :=
    chunkT_join _ _ _ 0 1105 64 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1180 m0 = true :=
    chunkT_join _ _ _ 0 1169 11 m0 1180 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  exact h30
/-- **the leaf has no decomposition** (nested split leaf: main record and 1180 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S1
#print axioms E207S1.leaf
