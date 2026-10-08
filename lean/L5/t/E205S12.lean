module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S12_C0
public import L5.t.E205S12_C1
public import L5.t.E205S12_C2
public import L5.t.E205S12_C3
public import L5.t.E205S12_C4
public import L5.t.E205S12_C5
public import L5.t.E205S12_C6
public import L5.t.E205S12_C7
public import L5.t.E205S12_C8
public import L5.t.E205S12_C9
public import L5.t.E205S12_C10
public import L5.t.E205S12_C11
public import L5.t.E205S12_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E205S12
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 354 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 354 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 20 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 4 2 m0 352 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 6 1 m0 352 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 7 6 m0 353 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 13 1 m0 353 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 14 64 m0 354 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 78 64 m0 354 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 142 64 m0 354 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 206 64 m0 354 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 334 m0 = true :=
    chunkT_join _ _ _ 0 270 64 m0 354 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 354 m0 = true :=
    chunkT_join _ _ _ 0 334 20 m0 354 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  exact h11
/-- **the leaf has no decomposition** (nested split leaf: main record and 354 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E205S12
#print axioms E205S12.leaf
