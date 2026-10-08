module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S10_C0
public import L5.t.E213S10_C1
public import L5.t.E213S10_C2
public import L5.t.E213S10_C3
public import L5.t.E213S10_C4
public import L5.t.E213S10_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S10
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 68 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 31 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true :=
    chunkT_join _ _ _ 0 2 20 m0 68 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 22 7 m0 68 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 29 39 m0 68 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  exact h4
/-- **the leaf has no decomposition** (nested split leaf: main record and 68 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S10
#print axioms E213S10.leaf
