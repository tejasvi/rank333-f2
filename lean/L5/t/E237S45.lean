module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S45_C0
public import L5.t.E237S45_C1
public import L5.t.E237S45_C2
public import L5.t.E237S45_C3
public import L5.t.E237S45_C4
public import L5.t.E237S45_C5
public import L5.t.E237S45_C6
public import L5.t.E237S45_C7
public import L5.t.E237S45_C8
public import L5.t.E237S45_C9
public import L5.t.E237S45_C10
public import L5.t.E237S45_C11
public import L5.t.E237S45_C12
public import L5.t.E237S45_C13
public import L5.t.E237S45_C14
public import L5.t.E237S45_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E237S45
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 773 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 773 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 56 m0 = true :=
    chunkT_join _ _ _ 0 29 27 m0 773 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 56 21 m0 773 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 77 38 m0 773 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 115 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 179 20 m0 773 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 263 m0 = true :=
    chunkT_join _ _ _ 0 199 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 327 m0 = true :=
    chunkT_join _ _ _ 0 263 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 391 m0 = true :=
    chunkT_join _ _ _ 0 327 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 455 m0 = true :=
    chunkT_join _ _ _ 0 391 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 519 m0 = true :=
    chunkT_join _ _ _ 0 455 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 583 m0 = true :=
    chunkT_join _ _ _ 0 519 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 647 m0 = true :=
    chunkT_join _ _ _ 0 583 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 711 m0 = true :=
    chunkT_join _ _ _ 0 647 64 m0 773 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 773 m0 = true :=
    chunkT_join _ _ _ 0 711 62 m0 773 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  exact h14
/-- **the leaf has no decomposition** (nested split leaf: main record and 773 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E237S45
#print axioms E237S45.leaf
