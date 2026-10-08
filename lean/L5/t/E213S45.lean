module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S45_C0
public import L5.t.E213S45_C1
public import L5.t.E213S45_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S45
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 33 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 20 13 m0 33 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  exact h1
/-- **the leaf has no decomposition** (nested split leaf: main record and 33 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S45
#print axioms E213S45.leaf
