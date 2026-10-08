module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S206_C0
public import L5.t.E213S206_C1
public import L5.t.E213S206_C2
public import L5.t.E213S206_C3
public import L5.t.E213S206_C4
public import L5.t.E213S206_C5
public import L5.t.E213S206_C6
public import L5.t.E213S206_C7
public import L5.t.E213S206_C8
public import L5.t.E213S206_C9
public import L5.t.E213S206_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S206
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 159 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 95 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 11 3 m0 157 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 14 14 m0 157 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 28 16 m0 157 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 44 1 m0 157 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 58 m0 = true :=
    chunkT_join _ _ _ 0 45 13 m0 159 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 58 18 m0 159 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true :=
    chunkT_join _ _ _ 0 76 49 m0 159 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true :=
    chunkT_join _ _ _ 0 125 34 m0 159 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  exact h9
/-- **the leaf has no decomposition** (nested split leaf: main record and 159 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S206
#print axioms E213S206.leaf
