module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S81_C0
public import L5.t.E212S81_C1
public import L5.t.E212S81_C2
public import L5.t.E212S81_C3
public import L5.t.E212S81_C4
public import L5.t.E212S81_C5
public import L5.t.E212S81_C6
public import L5.t.E212S81_C7
public import L5.t.E212S81_C8
public import L5.t.E212S81_C9
public import L5.t.E212S81_C10
public import L5.t.E212S81_C11
public import L5.t.E212S81_C12
public import L5.t.E212S81_C13
public import L5.t.E212S81_C14
public import L5.t.E212S81_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S81
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 839 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 839 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 27 22 m0 839 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 49 28 m0 839 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 77 27 m0 839 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 156 m0 = true :=
    chunkT_join _ _ _ 0 104 52 m0 839 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 191 m0 = true :=
    chunkT_join _ _ _ 0 156 35 m0 839 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 191 25 m0 839 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 262 m0 = true :=
    chunkT_join _ _ _ 0 216 46 m0 839 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 356 m0 = true :=
    chunkT_join _ _ _ 0 262 94 m0 839 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 369 m0 = true :=
    chunkT_join _ _ _ 0 356 13 m0 839 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 409 m0 = true :=
    chunkT_join _ _ _ 0 369 40 m0 839 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 506 m0 = true :=
    chunkT_join _ _ _ 0 409 97 m0 839 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 578 m0 = true :=
    chunkT_join _ _ _ 0 506 72 m0 839 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 690 m0 = true :=
    chunkT_join _ _ _ 0 578 112 m0 839 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 839 m0 = true :=
    chunkT_join _ _ _ 0 690 149 m0 839 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  exact h14
/-- **the leaf has no decomposition** (nested split leaf: main record and 839 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S81
#print axioms E212S81.leaf
