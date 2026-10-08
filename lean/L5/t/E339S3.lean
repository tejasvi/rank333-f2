module
public import R22Port.U_d41d8cd98f00
public import L5.t.E339S3_C0
public import L5.t.E339S3_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E339S3
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 25 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 25 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 25 = true := ok0
  exact h0
/-- **the leaf has no decomposition** (nested split leaf: main record and 25 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E339S3
#print axioms E339S3.leaf
