module
public import R22Port.U_d41d8cd98f00
public import L5.t.E279S10_C0
public import L5.t.E279S10_C1
public import L5.t.E279S10_C2
public import L5.t.E279S10_C3
public import L5.t.E279S10_C4
public import L5.t.E279S10_C5
public import L5.t.E279S10_C6
public import L5.t.E279S10_C7
public import L5.t.E279S10_C8
public import L5.t.E279S10_C9
public import L5.t.E279S10_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E279S10
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 588 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 51 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 115 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 243 m0 = true :=
    chunkT_join _ _ _ 0 179 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 307 m0 = true :=
    chunkT_join _ _ _ 0 243 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 307 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 371 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 499 m0 = true :=
    chunkT_join _ _ _ 0 435 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 563 m0 = true :=
    chunkT_join _ _ _ 0 499 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true :=
    chunkT_join _ _ _ 0 563 25 m0 588 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  exact h9
/-- **the leaf has no decomposition** (nested split leaf: main record and 588 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E279S10
#print axioms E279S10.leaf
