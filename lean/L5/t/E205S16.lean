module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S16_C0
public import L5.t.E205S16_C1
public import L5.t.E205S16_C2
public import L5.t.E205S16_C3
public import L5.t.E205S16_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E205S16
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 48 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 11 13 m0 48 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 24 19 m0 48 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 43 5 m0 48 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  exact h3
/-- **the leaf has no decomposition** (nested split leaf: main record and 48 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E205S16
#print axioms E205S16.leaf
