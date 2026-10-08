module
public import R22Port.U_d41d8cd98f00
public import L5.t.E378S5_C0
public import L5.t.E378S5_C1
public import L5.t.E378S5_C2
public import L5.t.E378S5_C3
public import L5.t.E378S5_C4
public import L5.t.E378S5_C5
public import L5.t.E378S5_C6
public import L5.t.E378S5_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E378S5
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 431 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 431 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 431 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 128 64 m0 431 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 192 64 m0 431 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 320 m0 = true :=
    chunkT_join _ _ _ 0 256 64 m0 431 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 320 64 m0 431 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 431 m0 = true :=
    chunkT_join _ _ _ 0 384 47 m0 431 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  exact h6
/-- **the leaf has no decomposition** (nested split leaf: main record and 431 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E378S5
#print axioms E378S5.leaf
