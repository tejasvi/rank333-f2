module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S376_C0
public import L5.t.E236S376_C1
public import L5.t.E236S376_C2
public import L5.t.E236S376_C3
public import L5.t.E236S376_C4
public import L5.t.E236S376_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S376
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 39 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 9 1 m0 39 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 10 3 m0 39 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 13 10 m0 39 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 23 16 m0 39 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  exact h4
/-- **the leaf has no decomposition** (nested split leaf: main record and 39 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S376
#print axioms E236S376.leaf
