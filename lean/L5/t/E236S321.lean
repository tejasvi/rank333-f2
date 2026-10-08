module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S321_C0
public import L5.t.E236S321_C1
public import L5.t.E236S321_C2
public import L5.t.E236S321_C3
public import L5.t.E236S321_C4
public import L5.t.E236S321_C5
public import L5.t.E236S321_C6
public import L5.t.E236S321_C7
public import L5.t.E236S321_C8
public import L5.t.E236S321_C9
public import L5.t.E236S321_C10
public import L5.t.E236S321_C11
public import L5.t.E236S321_C12
public import L5.t.E236S321_C13
public import L5.t.E236S321_C14
public import L5.t.E236S321_C15
public import L5.t.E236S321_C16
public import L5.t.E236S321_C17
public import L5.t.E236S321_C18
public import L5.t.E236S321_C19
public import L5.t.E236S321_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S321
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1081 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1081 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 28 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 4 11 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 15 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 143 m0 = true :=
    chunkT_join _ _ _ 0 79 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 207 m0 = true :=
    chunkT_join _ _ _ 0 143 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 271 m0 = true :=
    chunkT_join _ _ _ 0 207 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 335 m0 = true :=
    chunkT_join _ _ _ 0 271 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 399 m0 = true :=
    chunkT_join _ _ _ 0 335 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 463 m0 = true :=
    chunkT_join _ _ _ 0 399 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 527 m0 = true :=
    chunkT_join _ _ _ 0 463 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 591 m0 = true :=
    chunkT_join _ _ _ 0 527 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 655 m0 = true :=
    chunkT_join _ _ _ 0 591 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 719 m0 = true :=
    chunkT_join _ _ _ 0 655 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 783 m0 = true :=
    chunkT_join _ _ _ 0 719 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 847 m0 = true :=
    chunkT_join _ _ _ 0 783 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 911 m0 = true :=
    chunkT_join _ _ _ 0 847 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 975 m0 = true :=
    chunkT_join _ _ _ 0 911 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 1039 m0 = true :=
    chunkT_join _ _ _ 0 975 64 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 1081 m0 = true :=
    chunkT_join _ _ _ 0 1039 42 m0 1081 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  exact h19
/-- **the leaf has no decomposition** (nested split leaf: main record and 1081 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S321
#print axioms E236S321.leaf
