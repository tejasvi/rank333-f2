module
public import R22Port.U_d41d8cd98f00
public import L5.t.E279S3_C0
public import L5.t.E279S3_C1
public import L5.t.E279S3_C2
public import L5.t.E279S3_C3
public import L5.t.E279S3_C4
public import L5.t.E279S3_C5
public import L5.t.E279S3_C6
public import L5.t.E279S3_C7
public import L5.t.E279S3_C8
public import L5.t.E279S3_C9
public import L5.t.E279S3_C10
public import L5.t.E279S3_C11
public import L5.t.E279S3_C12
public import L5.t.E279S3_C13
public import L5.t.E279S3_C14
public import L5.t.E279S3_C15
public import L5.t.E279S3_C16
public import L5.t.E279S3_C17
public import L5.t.E279S3_C18
public import L5.t.E279S3_C19
public import L5.t.E279S3_C20
public import L5.t.E279S3_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E279S3
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 923 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 923 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 3 3 m0 923 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 6 7 m0 923 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 13 12 m0 923 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 25 13 m0 923 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 38 24 m0 923 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 62 41 m0 923 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 103 29 m0 923 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 182 m0 = true :=
    chunkT_join _ _ _ 0 132 50 m0 923 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 182 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 310 m0 = true :=
    chunkT_join _ _ _ 0 246 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 351 m0 = true :=
    chunkT_join _ _ _ 0 310 41 m0 923 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 351 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 479 m0 = true :=
    chunkT_join _ _ _ 0 415 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 543 m0 = true :=
    chunkT_join _ _ _ 0 479 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 607 m0 = true :=
    chunkT_join _ _ _ 0 543 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 671 m0 = true :=
    chunkT_join _ _ _ 0 607 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 735 m0 = true :=
    chunkT_join _ _ _ 0 671 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 799 m0 = true :=
    chunkT_join _ _ _ 0 735 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 863 m0 = true :=
    chunkT_join _ _ _ 0 799 64 m0 923 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 923 m0 = true :=
    chunkT_join _ _ _ 0 863 60 m0 923 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  exact h20
/-- **the leaf has no decomposition** (nested split leaf: main record and 923 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E279S3
#print axioms E279S3.leaf
