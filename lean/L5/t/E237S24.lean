module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S24_C0
public import L5.t.E237S24_C1
public import L5.t.E237S24_C2
public import L5.t.E237S24_C3
public import L5.t.E237S24_C4
public import L5.t.E237S24_C5
public import L5.t.E237S24_C6
public import L5.t.E237S24_C7
public import L5.t.E237S24_C8
public import L5.t.E237S24_C9
public import L5.t.E237S24_C10
public import L5.t.E237S24_C11
public import L5.t.E237S24_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E237S24
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 365 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 365 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 72 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 365 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 365 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 13 14 m0 365 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 27 11 m0 365 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 38 19 m0 365 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 57 64 m0 365 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 185 m0 = true :=
    chunkT_join _ _ _ 0 121 64 m0 365 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 249 m0 = true :=
    chunkT_join _ _ _ 0 185 64 m0 365 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 313 m0 = true :=
    chunkT_join _ _ _ 0 249 64 m0 365 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 365 m0 = true :=
    chunkT_join _ _ _ 0 313 52 m0 365 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  exact h11
/-- **the leaf has no decomposition** (nested split leaf: main record and 365 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E237S24
#print axioms E237S24.leaf
