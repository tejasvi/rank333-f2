module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S100_C0
public import L5.t.E218S100_C1
public import L5.t.E218S100_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S100
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 68 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 39 29 m0 68 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  exact h1
/-- **the leaf has no decomposition** (nested split leaf: main record and 68 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S100
#print axioms E218S100.leaf
