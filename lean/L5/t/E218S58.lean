module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S58_C0
public import L5.t.E218S58_C1
public import L5.t.E218S58_C2
public import L5.t.E218S58_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S58
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 30 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 8 8 m0 30 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 16 14 m0 30 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  exact h2
/-- **the leaf has no decomposition** (nested split leaf: main record and 30 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S58
#print axioms E218S58.leaf
