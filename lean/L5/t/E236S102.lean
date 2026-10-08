module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S102_C0
public import L5.t.E236S102_C1
public import L5.t.E236S102_C2
public import L5.t.E236S102_C3
public import L5.t.E236S102_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S102
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 32 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 12 2 m0 32 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 14 16 m0 32 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 30 2 m0 32 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  exact h3
/-- **the leaf has no decomposition** (nested split leaf: main record and 32 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S102
#print axioms E236S102.leaf
