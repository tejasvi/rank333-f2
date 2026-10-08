module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S101_C0
public import L5.t.E218S101_C1
public import L5.t.E218S101_C2
public import L5.t.E218S101_C3
public import L5.t.E218S101_C4
public import L5.t.E218S101_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S101
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 125 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 26 15 m0 125 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 41 16 m0 125 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 57 42 m0 125 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true :=
    chunkT_join _ _ _ 0 99 26 m0 125 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  exact h4
/-- **the leaf has no decomposition** (nested split leaf: main record and 125 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S101
#print axioms E218S101.leaf
