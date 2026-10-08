module
public import R22Port.U_d41d8cd98f00
public import L5.t.E378S3_C0
public import L5.t.E378S3_C1
public import L5.t.E378S3_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E378S3
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 16 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 8 8 m0 16 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  exact h1
/-- **the leaf has no decomposition** (nested split leaf: main record and 16 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E378S3
#print axioms E378S3.leaf
