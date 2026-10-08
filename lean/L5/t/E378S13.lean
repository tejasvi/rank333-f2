module
public import R22Port.U_d41d8cd98f00
public import L5.t.E378S13_C0
public import L5.t.E378S13_C1
public import L5.t.E378S13_C2
public import L5.t.E378S13_C3
public import L5.t.E378S13_C4
public import L5.t.E378S13_C5
public import L5.t.E378S13_C6
public import L5.t.E378S13_C7
public import L5.t.E378S13_C8
public import L5.t.E378S13_C9
public import L5.t.E378S13_C10
public import L5.t.E378S13_C11
public import L5.t.E378S13_C12
public import L5.t.E378S13_C13
public import L5.t.E378S13_C14
public import L5.t.E378S13_C15
public import L5.t.E378S13_C16
public import L5.t.E378S13_C17
public import L5.t.E378S13_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E378S13
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 955 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 955 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 128 52 m0 955 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 180 26 m0 955 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 206 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 299 m0 = true :=
    chunkT_join _ _ _ 0 270 29 m0 955 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 328 m0 = true :=
    chunkT_join _ _ _ 0 299 29 m0 955 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 369 m0 = true :=
    chunkT_join _ _ _ 0 328 41 m0 955 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 428 m0 = true :=
    chunkT_join _ _ _ 0 369 59 m0 955 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 492 m0 = true :=
    chunkT_join _ _ _ 0 428 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 556 m0 = true :=
    chunkT_join _ _ _ 0 492 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 620 m0 = true :=
    chunkT_join _ _ _ 0 556 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 684 m0 = true :=
    chunkT_join _ _ _ 0 620 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 748 m0 = true :=
    chunkT_join _ _ _ 0 684 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 812 m0 = true :=
    chunkT_join _ _ _ 0 748 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 876 m0 = true :=
    chunkT_join _ _ _ 0 812 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 940 m0 = true :=
    chunkT_join _ _ _ 0 876 64 m0 955 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 955 m0 = true :=
    chunkT_join _ _ _ 0 940 15 m0 955 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 955 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E378S13
#print axioms E378S13.leaf
