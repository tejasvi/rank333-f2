module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S159_C0
public import L5.t.E213S159_C1
public import L5.t.E213S159_C2
public import L5.t.E213S159_C3
public import L5.t.E213S159_C4
public import L5.t.E213S159_C5
public import L5.t.E213S159_C6
public import L5.t.E213S159_C7
public import L5.t.E213S159_C8
public import L5.t.E213S159_C9
public import L5.t.E213S159_C10
public import L5.t.E213S159_C11
public import L5.t.E213S159_C12
public import L5.t.E213S159_C13
public import L5.t.E213S159_C14
public import L5.t.E213S159_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S159
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 188 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 13 13 m0 145 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 26 12 m0 145 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 38 11 m0 145 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 58 m0 = true :=
    chunkT_join _ _ _ 0 49 9 m0 145 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 58 2 m0 145 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 60 1 m0 145 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 61 14 m0 188 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 75 15 m0 188 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 90 2 m0 188 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 92 3 m0 188 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 95 13 m0 188 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 114 m0 = true :=
    chunkT_join _ _ _ 0 108 6 m0 188 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 137 m0 = true :=
    chunkT_join _ _ _ 0 114 23 m0 188 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 137 51 m0 188 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  exact h14
/-- **the leaf has no decomposition** (nested split leaf: main record and 188 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S159
#print axioms E213S159.leaf
