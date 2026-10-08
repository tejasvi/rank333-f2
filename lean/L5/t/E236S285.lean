module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S285_C0
public import L5.t.E236S285_C1
public import L5.t.E236S285_C2
public import L5.t.E236S285_C3
public import L5.t.E236S285_C4
public import L5.t.E236S285_C5
public import L5.t.E236S285_C6
public import L5.t.E236S285_C7
public import L5.t.E236S285_C8
public import L5.t.E236S285_C9
public import L5.t.E236S285_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S285
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 176 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 10 17 m0 176 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 27 12 m0 176 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 39 1 m0 176 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 40 27 m0 176 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 85 m0 = true :=
    chunkT_join _ _ _ 0 67 18 m0 176 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 85 3 m0 176 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 88 17 m0 176 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 105 56 m0 176 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 161 15 m0 176 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  exact h9
/-- **the leaf has no decomposition** (nested split leaf: main record and 176 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S285
#print axioms E236S285.leaf
