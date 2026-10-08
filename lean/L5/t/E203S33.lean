module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S33_C0
public import L5.t.E203S33_C1
public import L5.t.E203S33_C2
public import L5.t.E203S33_C3
public import L5.t.E203S33_C4
public import L5.t.E203S33_C5
public import L5.t.E203S33_C6
public import L5.t.E203S33_C7
public import L5.t.E203S33_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S33
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 42 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 2 5 m0 42 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 7 2 m0 42 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 9 5 m0 42 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 14 3 m0 42 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 17 9 m0 42 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 32 m0 = true :=
    chunkT_join _ _ _ 0 26 6 m0 42 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 32 10 m0 42 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  exact h7
/-- **the leaf has no decomposition** (nested split leaf: main record and 42 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S33
#print axioms E203S33.leaf
