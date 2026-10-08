module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S129_C0
public import L5.t.E212S129_C1
public import L5.t.E212S129_C2
public import L5.t.E212S129_C3
public import L5.t.E212S129_C4
public import L5.t.E212S129_C5
public import L5.t.E212S129_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S129
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 480 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 480 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 8 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 476 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 476 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 334 m0 = true :=
    chunkT_join _ _ _ 0 4 330 m0 480 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 480 m0 = true :=
    chunkT_join _ _ _ 0 334 146 m0 480 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  exact h5
/-- **the leaf has no decomposition** (nested split leaf: main record and 480 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S129
#print axioms E212S129.leaf
