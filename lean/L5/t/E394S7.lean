module
public import R22Port.U_d41d8cd98f00
public import L5.t.E394S7_C0
public import L5.t.E394S7_C1
public import L5.t.E394S7_C2
public import L5.t.E394S7_C3
public import L5.t.E394S7_C4
public import L5.t.E394S7_C5
public import L5.t.E394S7_C6
public import L5.t.E394S7_C7
public import L5.t.E394S7_C8
public import L5.t.E394S7_C9
public import L5.t.E394S7_C10
public import L5.t.E394S7_C11
public import L5.t.E394S7_C12
public import L5.t.E394S7_C13
public import L5.t.E394S7_C14
public import L5.t.E394S7_C15
public import L5.t.E394S7_C16
public import L5.t.E394S7_C17
public import L5.t.E394S7_C18
public import L5.t.E394S7_C19
public import L5.t.E394S7_C20
public import L5.t.E394S7_C21
public import L5.t.E394S7_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E394S7
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1211 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1211 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 109 m0 = true :=
    chunkT_join _ _ _ 0 45 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 109 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 224 m0 = true :=
    chunkT_join _ _ _ 0 173 51 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 238 m0 = true :=
    chunkT_join _ _ _ 0 224 14 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 238 8 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 246 24 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 334 m0 = true :=
    chunkT_join _ _ _ 0 270 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true :=
    chunkT_join _ _ _ 0 334 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 459 m0 = true :=
    chunkT_join _ _ _ 0 398 61 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 523 m0 = true :=
    chunkT_join _ _ _ 0 459 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 587 m0 = true :=
    chunkT_join _ _ _ 0 523 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 651 m0 = true :=
    chunkT_join _ _ _ 0 587 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 715 m0 = true :=
    chunkT_join _ _ _ 0 651 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 779 m0 = true :=
    chunkT_join _ _ _ 0 715 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 843 m0 = true :=
    chunkT_join _ _ _ 0 779 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 907 m0 = true :=
    chunkT_join _ _ _ 0 843 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 971 m0 = true :=
    chunkT_join _ _ _ 0 907 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1035 m0 = true :=
    chunkT_join _ _ _ 0 971 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1099 m0 = true :=
    chunkT_join _ _ _ 0 1035 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1163 m0 = true :=
    chunkT_join _ _ _ 0 1099 64 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1211 m0 = true :=
    chunkT_join _ _ _ 0 1163 48 m0 1211 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  exact h21
/-- **the leaf has no decomposition** (nested split leaf: main record and 1211 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E394S7
#print axioms E394S7.leaf
