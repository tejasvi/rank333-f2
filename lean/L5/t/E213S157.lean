module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S157_C0
public import L5.t.E213S157_C1
public import L5.t.E213S157_C2
public import L5.t.E213S157_C3
public import L5.t.E213S157_C4
public import L5.t.E213S157_C5
public import L5.t.E213S157_C6
public import L5.t.E213S157_C7
public import L5.t.E213S157_C8
public import L5.t.E213S157_C9
public import L5.t.E213S157_C10
public import L5.t.E213S157_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S157
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 452 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 452 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 8 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 397 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 397 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 4 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 68 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 132 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 260 m0 = true :=
    chunkT_join _ _ _ 0 196 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 324 m0 = true :=
    chunkT_join _ _ _ 0 260 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 388 m0 = true :=
    chunkT_join _ _ _ 0 324 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 452 m0 = true :=
    chunkT_join _ _ _ 0 388 64 m0 452 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  exact h10
/-- **the leaf has no decomposition** (nested split leaf: main record and 452 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S157
#print axioms E213S157.leaf
