module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S15_C0
public import L5.t.E237S15_C1
public import L5.t.E237S15_C2
public import L5.t.E237S15_C3
public import L5.t.E237S15_C4
public import L5.t.E237S15_C5
public import L5.t.E237S15_C6
public import L5.t.E237S15_C7
public import L5.t.E237S15_C8
public import L5.t.E237S15_C9
public import L5.t.E237S15_C10
public import L5.t.E237S15_C11
public import L5.t.E237S15_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E237S15
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 411 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 17 7 m0 411 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 24 21 m0 411 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 96 m0 = true :=
    chunkT_join _ _ _ 0 45 51 m0 411 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 160 m0 = true :=
    chunkT_join _ _ _ 0 96 64 m0 411 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 165 m0 = true :=
    chunkT_join _ _ _ 0 160 5 m0 411 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 165 11 m0 411 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 176 20 m0 411 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 260 m0 = true :=
    chunkT_join _ _ _ 0 196 64 m0 411 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 322 m0 = true :=
    chunkT_join _ _ _ 0 260 62 m0 411 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 322 64 m0 411 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true :=
    chunkT_join _ _ _ 0 386 25 m0 411 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  exact h11
/-- **the leaf has no decomposition** (nested split leaf: main record and 411 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E237S15
#print axioms E237S15.leaf
