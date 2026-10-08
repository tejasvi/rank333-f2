module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S141_C0
public import L5.t.E213S141_C1
public import L5.t.E213S141_C2
public import L5.t.E213S141_C3
public import L5.t.E213S141_C4
public import L5.t.E213S141_C5
public import L5.t.E213S141_C6
public import L5.t.E213S141_C7
public import L5.t.E213S141_C8
public import L5.t.E213S141_C9
public import L5.t.E213S141_C10
public import L5.t.E213S141_C11
public import L5.t.E213S141_C12
public import L5.t.E213S141_C13
public import L5.t.E213S141_C14
public import L5.t.E213S141_C15
public import L5.t.E213S141_C16
public import L5.t.E213S141_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S141
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 734 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 734 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 4 1 m0 22 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 657 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 6 1 m0 657 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 7 11 m0 734 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 82 m0 = true :=
    chunkT_join _ _ _ 0 18 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 82 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 146 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 274 m0 = true :=
    chunkT_join _ _ _ 0 210 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 338 m0 = true :=
    chunkT_join _ _ _ 0 274 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 338 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 466 m0 = true :=
    chunkT_join _ _ _ 0 402 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 530 m0 = true :=
    chunkT_join _ _ _ 0 466 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 594 m0 = true :=
    chunkT_join _ _ _ 0 530 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 658 m0 = true :=
    chunkT_join _ _ _ 0 594 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 722 m0 = true :=
    chunkT_join _ _ _ 0 658 64 m0 734 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 734 m0 = true :=
    chunkT_join _ _ _ 0 722 12 m0 734 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  exact h16
/-- **the leaf has no decomposition** (nested split leaf: main record and 734 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S141
#print axioms E213S141.leaf
