module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S298_C0
public import L5.t.E236S298_C1
public import L5.t.E236S298_C2
public import L5.t.E236S298_C3
public import L5.t.E236S298_C4
public import L5.t.E236S298_C5
public import L5.t.E236S298_C6
public import L5.t.E236S298_C7
public import L5.t.E236S298_C8
public import L5.t.E236S298_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S298
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 69 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 53 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 2 3 m0 69 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 5 2 m0 69 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 7 5 m0 69 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 12 13 m0 69 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 25 11 m0 69 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 36 14 m0 69 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 50 19 m0 69 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  exact h8
/-- **the leaf has no decomposition** (nested split leaf: main record and 69 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S298
#print axioms E236S298.leaf
