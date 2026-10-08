module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S226_C0
public import L5.t.E236S226_C1
public import L5.t.E236S226_C2
public import L5.t.E236S226_C3
public import L5.t.E236S226_C4
public import L5.t.E236S226_C5
public import L5.t.E236S226_C6
public import L5.t.E236S226_C7
public import L5.t.E236S226_C8
public import L5.t.E236S226_C9
public import L5.t.E236S226_C10
public import L5.t.E236S226_C11
public import L5.t.E236S226_C12
public import L5.t.E236S226_C13
public import L5.t.E236S226_C14
public import L5.t.E236S226_C15
public import L5.t.E236S226_C16
public import L5.t.E236S226_C17
public import L5.t.E236S226_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S226
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 545 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 545 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 87 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 2 2 m0 414 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 4 1 m0 414 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 5 15 m0 543 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 20 8 m0 543 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 543 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 29 7 m0 545 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 36 12 m0 545 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 70 m0 = true :=
    chunkT_join _ _ _ 0 48 22 m0 545 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 134 m0 = true :=
    chunkT_join _ _ _ 0 70 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 134 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 262 m0 = true :=
    chunkT_join _ _ _ 0 198 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 326 m0 = true :=
    chunkT_join _ _ _ 0 262 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 390 m0 = true :=
    chunkT_join _ _ _ 0 326 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 454 m0 = true :=
    chunkT_join _ _ _ 0 390 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 518 m0 = true :=
    chunkT_join _ _ _ 0 454 64 m0 545 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 545 m0 = true :=
    chunkT_join _ _ _ 0 518 27 m0 545 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 545 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S226
#print axioms E236S226.leaf
