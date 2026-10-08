module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S332_C0
public import L5.t.E284S332_C1
public import L5.t.E284S332_C2
public import L5.t.E284S332_C3
public import L5.t.E284S332_C4
public import L5.t.E284S332_C5
public import L5.t.E284S332_C6
public import L5.t.E284S332_C7
public import L5.t.E284S332_C8
public import L5.t.E284S332_C9
public import L5.t.E284S332_C10
public import L5.t.E284S332_C11
public import L5.t.E284S332_C12
public import L5.t.E284S332_C13
public import L5.t.E284S332_C14
public import L5.t.E284S332_C15
public import L5.t.E284S332_C16
public import L5.t.E284S332_C17
public import L5.t.E284S332_C18
public import L5.t.E284S332_C19
public import L5.t.E284S332_C20
public import L5.t.E284S332_C21
public import L5.t.E284S332_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S332
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1067 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1067 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 29 20 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 49 24 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 73 7 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 144 m0 = true :=
    chunkT_join _ _ _ 0 80 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 144 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 208 55 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 327 m0 = true :=
    chunkT_join _ _ _ 0 263 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 343 m0 = true :=
    chunkT_join _ _ _ 0 327 16 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 343 59 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 466 m0 = true :=
    chunkT_join _ _ _ 0 402 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 530 m0 = true :=
    chunkT_join _ _ _ 0 466 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 594 m0 = true :=
    chunkT_join _ _ _ 0 530 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 658 m0 = true :=
    chunkT_join _ _ _ 0 594 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 710 m0 = true :=
    chunkT_join _ _ _ 0 658 52 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 728 m0 = true :=
    chunkT_join _ _ _ 0 710 18 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 789 m0 = true :=
    chunkT_join _ _ _ 0 728 61 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 853 m0 = true :=
    chunkT_join _ _ _ 0 789 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 917 m0 = true :=
    chunkT_join _ _ _ 0 853 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 981 m0 = true :=
    chunkT_join _ _ _ 0 917 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 1045 m0 = true :=
    chunkT_join _ _ _ 0 981 64 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 1067 m0 = true :=
    chunkT_join _ _ _ 0 1045 22 m0 1067 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  exact h21
/-- **the leaf has no decomposition** (nested split leaf: main record and 1067 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S332
#print axioms E284S332.leaf
