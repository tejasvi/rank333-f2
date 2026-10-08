module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S128_C0
public import L5.t.E213S128_C1
public import L5.t.E213S128_C2
public import L5.t.E213S128_C3
public import L5.t.E213S128_C4
public import L5.t.E213S128_C5
public import L5.t.E213S128_C6
public import L5.t.E213S128_C7
public import L5.t.E213S128_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S128
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 444 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 444 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 1 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 129 m0 = true :=
    chunkT_join _ _ _ 0 65 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 193 m0 = true :=
    chunkT_join _ _ _ 0 129 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 257 m0 = true :=
    chunkT_join _ _ _ 0 193 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 321 m0 = true :=
    chunkT_join _ _ _ 0 257 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 321 64 m0 444 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 444 m0 = true :=
    chunkT_join _ _ _ 0 385 59 m0 444 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  exact h7
/-- **the leaf has no decomposition** (nested split leaf: main record and 444 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S128
#print axioms E213S128.leaf
