module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S8_C0
public import L5.t.E205S8_C1
public import L5.t.E205S8_C2
public import L5.t.E205S8_C3
public import L5.t.E205S8_C4
public import L5.t.E205S8_C5
public import L5.t.E205S8_C6
public import L5.t.E205S8_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E205S8
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 138 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 11 24 m0 138 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 58 m0 = true :=
    chunkT_join _ _ _ 0 35 23 m0 138 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 58 17 m0 138 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 75 28 m0 138 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 137 m0 = true :=
    chunkT_join _ _ _ 0 103 34 m0 138 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 137 1 m0 138 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  exact h6
/-- **the leaf has no decomposition** (nested split leaf: main record and 138 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E205S8
#print axioms E205S8.leaf
