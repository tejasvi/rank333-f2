module
public import R22Port.U_d41d8cd98f00
public import L5.t.E206S0_C0
public import L5.t.E206S0_C1
public import L5.t.E206S0_C2
public import L5.t.E206S0_C3
public import L5.t.E206S0_C4
public import L5.t.E206S0_C5
public import L5.t.E206S0_C6
public import L5.t.E206S0_C7
public import L5.t.E206S0_C8
public import L5.t.E206S0_C9
public import L5.t.E206S0_C10
public import L5.t.E206S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E206S0
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 616 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 27 47 m0 616 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 138 m0 = true :=
    chunkT_join _ _ _ 0 74 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 138 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 266 m0 = true :=
    chunkT_join _ _ _ 0 202 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 266 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 394 m0 = true :=
    chunkT_join _ _ _ 0 330 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 458 m0 = true :=
    chunkT_join _ _ _ 0 394 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 522 m0 = true :=
    chunkT_join _ _ _ 0 458 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 586 m0 = true :=
    chunkT_join _ _ _ 0 522 64 m0 616 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true :=
    chunkT_join _ _ _ 0 586 30 m0 616 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  exact h10
/-- **the leaf has no decomposition** (nested split leaf: main record and 616 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E206S0
#print axioms E206S0.leaf
