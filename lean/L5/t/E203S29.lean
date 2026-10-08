module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S29_C0
public import L5.t.E203S29_C1
public import L5.t.E203S29_C2
public import L5.t.E203S29_C3
public import L5.t.E203S29_C4
public import L5.t.E203S29_C5
public import L5.t.E203S29_C6
public import L5.t.E203S29_C7
public import L5.t.E203S29_C8
public import L5.t.E203S29_C9
public import L5.t.E203S29_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S29
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 170 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 5 6 m0 170 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true :=
    chunkT_join _ _ _ 0 11 11 m0 170 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 22 5 m0 170 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 27 12 m0 170 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 39 13 m0 170 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 52 26 m0 170 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 109 m0 = true :=
    chunkT_join _ _ _ 0 78 31 m0 170 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 132 m0 = true :=
    chunkT_join _ _ _ 0 109 23 m0 170 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 170 m0 = true :=
    chunkT_join _ _ _ 0 132 38 m0 170 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  exact h9
/-- **the leaf has no decomposition** (nested split leaf: main record and 170 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S29
#print axioms E203S29.leaf
