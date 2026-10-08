module
public import R22Port.U_d41d8cd98f00
public import L5.t.E390S4_C0
public import L5.t.E390S4_C1
public import L5.t.E390S4_C2
public import L5.t.E390S4_C3
public import L5.t.E390S4_C4
public import L5.t.E390S4_C5
public import L5.t.E390S4_C6
public import L5.t.E390S4_C7
public import L5.t.E390S4_C8
public import L5.t.E390S4_C9
public import L5.t.E390S4_C10
public import L5.t.E390S4_C11
public import L5.t.E390S4_C12
public import L5.t.E390S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E390S4
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 642 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 642 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 45 19 m0 642 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 64 9 m0 642 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 112 m0 = true :=
    chunkT_join _ _ _ 0 73 39 m0 642 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 112 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 240 m0 = true :=
    chunkT_join _ _ _ 0 176 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 304 m0 = true :=
    chunkT_join _ _ _ 0 240 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 368 m0 = true :=
    chunkT_join _ _ _ 0 304 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 432 m0 = true :=
    chunkT_join _ _ _ 0 368 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 496 m0 = true :=
    chunkT_join _ _ _ 0 432 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 560 m0 = true :=
    chunkT_join _ _ _ 0 496 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 624 m0 = true :=
    chunkT_join _ _ _ 0 560 64 m0 642 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 642 m0 = true :=
    chunkT_join _ _ _ 0 624 18 m0 642 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  exact h12
/-- **the leaf has no decomposition** (nested split leaf: main record and 642 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E390S4
#print axioms E390S4.leaf
