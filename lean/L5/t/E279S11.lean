module
public import R22Port.U_d41d8cd98f00
public import L5.t.E279S11_C0
public import L5.t.E279S11_C1
public import L5.t.E279S11_C2
public import L5.t.E279S11_C3
public import L5.t.E279S11_C4
public import L5.t.E279S11_C5
public import L5.t.E279S11_C6
public import L5.t.E279S11_C7
public import L5.t.E279S11_C8
public import L5.t.E279S11_C9
public import L5.t.E279S11_C10
public import L5.t.E279S11_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E279S11
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 588 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 28 44 m0 588 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 126 m0 = true :=
    chunkT_join _ _ _ 0 72 54 m0 588 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 126 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 254 m0 = true :=
    chunkT_join _ _ _ 0 190 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 318 m0 = true :=
    chunkT_join _ _ _ 0 254 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 382 m0 = true :=
    chunkT_join _ _ _ 0 318 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 446 m0 = true :=
    chunkT_join _ _ _ 0 382 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 510 m0 = true :=
    chunkT_join _ _ _ 0 446 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 574 m0 = true :=
    chunkT_join _ _ _ 0 510 64 m0 588 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true :=
    chunkT_join _ _ _ 0 574 14 m0 588 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  exact h10
/-- **the leaf has no decomposition** (nested split leaf: main record and 588 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E279S11
#print axioms E279S11.leaf
