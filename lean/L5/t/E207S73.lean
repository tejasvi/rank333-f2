module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S73_C0
public import L5.t.E207S73_C1
public import L5.t.E207S73_C2
public import L5.t.E207S73_C3
public import L5.t.E207S73_C4
public import L5.t.E207S73_C5
public import L5.t.E207S73_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S73
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 121 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 6 14 m0 121 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 20 23 m0 121 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 43 18 m0 121 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 61 30 m0 121 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 91 30 m0 121 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  exact h5
/-- **the leaf has no decomposition** (nested split leaf: main record and 121 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S73
#print axioms E207S73.leaf
