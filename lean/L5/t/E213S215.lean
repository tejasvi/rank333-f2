module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S215_C0
public import L5.t.E213S215_C1
public import L5.t.E213S215_C2
public import L5.t.E213S215_C3
public import L5.t.E213S215_C4
public import L5.t.E213S215_C5
public import L5.t.E213S215_C6
public import L5.t.E213S215_C7
public import L5.t.E213S215_C8
public import L5.t.E213S215_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S215
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 155 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 21 2 m0 155 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 23 9 m0 155 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 32 9 m0 155 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 41 16 m0 155 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 86 m0 = true :=
    chunkT_join _ _ _ 0 57 29 m0 155 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 86 9 m0 155 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 117 m0 = true :=
    chunkT_join _ _ _ 0 95 22 m0 155 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 155 m0 = true :=
    chunkT_join _ _ _ 0 117 38 m0 155 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  exact h8
/-- **the leaf has no decomposition** (nested split leaf: main record and 155 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S215
#print axioms E213S215.leaf
