module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S237_C0
public import L5.t.E236S237_C1
public import L5.t.E236S237_C2
public import L5.t.E236S237_C3
public import L5.t.E236S237_C4
public import L5.t.E236S237_C5
public import L5.t.E236S237_C6
public import L5.t.E236S237_C7
public import L5.t.E236S237_C8
public import L5.t.E236S237_C9
public import L5.t.E236S237_C10
public import L5.t.E236S237_C11
public import L5.t.E236S237_C12
public import L5.t.E236S237_C13
public import L5.t.E236S237_C14
public import L5.t.E236S237_C15
public import L5.t.E236S237_C16
public import L5.t.E236S237_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S237
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 529 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 529 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 4 1 m0 86 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 5 3 m0 410 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 8 1 m0 410 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 9 20 m0 529 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 29 21 m0 529 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 50 10 m0 529 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 60 1 m0 529 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 61 16 m0 529 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 77 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 141 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 269 m0 = true :=
    chunkT_join _ _ _ 0 205 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 333 m0 = true :=
    chunkT_join _ _ _ 0 269 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 397 m0 = true :=
    chunkT_join _ _ _ 0 333 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 461 m0 = true :=
    chunkT_join _ _ _ 0 397 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 525 m0 = true :=
    chunkT_join _ _ _ 0 461 64 m0 529 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 529 m0 = true :=
    chunkT_join _ _ _ 0 525 4 m0 529 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  exact h16
/-- **the leaf has no decomposition** (nested split leaf: main record and 529 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S237
#print axioms E236S237.leaf
