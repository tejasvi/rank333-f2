module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S319_C0
public import L5.t.E284S319_C1
public import L5.t.E284S319_C2
public import L5.t.E284S319_C3
public import L5.t.E284S319_C4
public import L5.t.E284S319_C5
public import L5.t.E284S319_C6
public import L5.t.E284S319_C7
public import L5.t.E284S319_C8
public import L5.t.E284S319_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S319
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 502 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 502 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 107 m0 = true :=
    chunkT_join _ _ _ 0 51 56 m0 502 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 171 m0 = true :=
    chunkT_join _ _ _ 0 107 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 235 m0 = true :=
    chunkT_join _ _ _ 0 171 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 299 m0 = true :=
    chunkT_join _ _ _ 0 235 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 363 m0 = true :=
    chunkT_join _ _ _ 0 299 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 427 m0 = true :=
    chunkT_join _ _ _ 0 363 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 491 m0 = true :=
    chunkT_join _ _ _ 0 427 64 m0 502 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 502 m0 = true :=
    chunkT_join _ _ _ 0 491 11 m0 502 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  exact h8
/-- **the leaf has no decomposition** (nested split leaf: main record and 502 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S319
#print axioms E284S319.leaf
