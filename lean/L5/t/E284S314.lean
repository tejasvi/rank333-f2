module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S314_C0
public import L5.t.E284S314_C1
public import L5.t.E284S314_C2
public import L5.t.E284S314_C3
public import L5.t.E284S314_C4
public import L5.t.E284S314_C5
public import L5.t.E284S314_C6
public import L5.t.E284S314_C7
public import L5.t.E284S314_C8
public import L5.t.E284S314_C9
public import L5.t.E284S314_C10
public import L5.t.E284S314_C11
public import L5.t.E284S314_C12
public import L5.t.E284S314_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S314
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 483 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 483 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 28 1 m0 459 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 29 1 m0 471 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 30 1 m0 471 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 31 26 m0 483 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 57 38 m0 483 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 149 m0 = true :=
    chunkT_join _ _ _ 0 95 54 m0 483 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 149 51 m0 483 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 243 m0 = true :=
    chunkT_join _ _ _ 0 200 43 m0 483 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 307 m0 = true :=
    chunkT_join _ _ _ 0 243 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 307 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 371 64 m0 483 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 483 m0 = true :=
    chunkT_join _ _ _ 0 435 48 m0 483 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  exact h12
/-- **the leaf has no decomposition** (nested split leaf: main record and 483 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S314
#print axioms E284S314.leaf
