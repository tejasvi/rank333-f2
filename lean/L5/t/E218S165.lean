module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S165_C0
public import L5.t.E218S165_C1
public import L5.t.E218S165_C2
public import L5.t.E218S165_C3
public import L5.t.E218S165_C4
public import L5.t.E218S165_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S165
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 37 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 8 5 m0 37 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 13 10 m0 37 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 23 8 m0 37 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 31 6 m0 37 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  exact h4
/-- **the leaf has no decomposition** (nested split leaf: main record and 37 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S165
#print axioms E218S165.leaf
