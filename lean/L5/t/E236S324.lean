module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S324_C0
public import L5.t.E236S324_C1
public import L5.t.E236S324_C2
public import L5.t.E236S324_C3
public import L5.t.E236S324_C4
public import L5.t.E236S324_C5
public import L5.t.E236S324_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S324
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 105 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 31 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 6 5 m0 105 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true :=
    chunkT_join _ _ _ 0 11 10 m0 105 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 21 64 m0 105 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 85 20 m0 105 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  exact h5
/-- **the leaf has no decomposition** (nested split leaf: main record and 105 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S324
#print axioms E236S324.leaf
