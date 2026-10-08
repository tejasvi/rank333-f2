module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S115_C0
public import L5.t.E218S115_C1
public import L5.t.E218S115_C2
public import L5.t.E218S115_C3
public import L5.t.E218S115_C4
public import L5.t.E218S115_C5
public import L5.t.E218S115_C6
public import L5.t.E218S115_C7
public import L5.t.E218S115_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S115
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 74 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 12 3 m0 74 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 15 2 m0 74 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 17 8 m0 74 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 25 4 m0 74 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 29 20 m0 74 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 49 17 m0 74 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 66 8 m0 74 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  exact h7
/-- **the leaf has no decomposition** (nested split leaf: main record and 74 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S115
#print axioms E218S115.leaf
