module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S108_C0
public import L5.t.E284S108_C1
public import L5.t.E284S108_C2
public import L5.t.E284S108_C3
public import L5.t.E284S108_C4
public import L5.t.E284S108_C5
public import L5.t.E284S108_C6
public import L5.t.E284S108_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S108
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 173 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 1 28 m0 173 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 29 8 m0 173 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 37 7 m0 173 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 108 m0 = true :=
    chunkT_join _ _ _ 0 44 64 m0 173 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 172 m0 = true :=
    chunkT_join _ _ _ 0 108 64 m0 173 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 172 1 m0 173 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  exact h6
/-- **the leaf has no decomposition** (nested split leaf: main record and 173 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S108
#print axioms E284S108.leaf
