module
public import R22Port.U_d41d8cd98f00
public import L5.t.E232S0_C0
public import L5.t.E232S0_C1
public import L5.t.E232S0_C2
public import L5.t.E232S0_C3
public import L5.t.E232S0_C4
public import L5.t.E232S0_C5
public import L5.t.E232S0_C6
public import L5.t.E232S0_C7
public import L5.t.E232S0_C8
public import L5.t.E232S0_C9
public import L5.t.E232S0_C10
public import L5.t.E232S0_C11
public import L5.t.E232S0_C12
public import L5.t.E232S0_C13
public import L5.t.E232S0_C14
public import L5.t.E232S0_C15
public import L5.t.E232S0_C16
public import L5.t.E232S0_C17
public import L5.t.E232S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E232S0
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 952 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 952 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 128 44 m0 952 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 172 34 m0 952 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 232 m0 = true :=
    chunkT_join _ _ _ 0 206 26 m0 952 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 296 m0 = true :=
    chunkT_join _ _ _ 0 232 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 360 m0 = true :=
    chunkT_join _ _ _ 0 296 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 360 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 424 10 m0 952 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 464 m0 = true :=
    chunkT_join _ _ _ 0 434 30 m0 952 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 528 m0 = true :=
    chunkT_join _ _ _ 0 464 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 592 m0 = true :=
    chunkT_join _ _ _ 0 528 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 656 m0 = true :=
    chunkT_join _ _ _ 0 592 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 720 m0 = true :=
    chunkT_join _ _ _ 0 656 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 784 m0 = true :=
    chunkT_join _ _ _ 0 720 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 848 m0 = true :=
    chunkT_join _ _ _ 0 784 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 912 m0 = true :=
    chunkT_join _ _ _ 0 848 64 m0 952 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 952 m0 = true :=
    chunkT_join _ _ _ 0 912 40 m0 952 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 952 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E232S0
#print axioms E232S0.leaf
