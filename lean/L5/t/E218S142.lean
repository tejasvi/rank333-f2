module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S142_C0
public import L5.t.E218S142_C1
public import L5.t.E218S142_C2
public import L5.t.E218S142_C3
public import L5.t.E218S142_C4
public import L5.t.E218S142_C5
public import L5.t.E218S142_C6
public import L5.t.E218S142_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S142
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 63 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 7 1 m0 33 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 8 7 m0 63 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 15 2 m0 63 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 17 3 m0 63 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 20 5 m0 63 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 25 38 m0 63 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  exact h6
/-- **the leaf has no decomposition** (nested split leaf: main record and 63 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S142
#print axioms E218S142.leaf
