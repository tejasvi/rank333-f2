module
public import R22Port.U_d41d8cd98f00
public import L5.t.E245S0_C0
public import L5.t.E245S0_C1
public import L5.t.E245S0_C2
public import L5.t.E245S0_C3
public import L5.t.E245S0_C4
public import L5.t.E245S0_C5
public import L5.t.E245S0_C6
public import L5.t.E245S0_C7
public import L5.t.E245S0_C8
public import L5.t.E245S0_C9
public import L5.t.E245S0_C10
public import L5.t.E245S0_C11
public import L5.t.E245S0_C12
public import L5.t.E245S0_C13
public import L5.t.E245S0_C14
public import L5.t.E245S0_C15
public import L5.t.E245S0_C16
public import L5.t.E245S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E245S0
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 768 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 768 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 28 17 m0 768 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 107 m0 = true :=
    chunkT_join _ _ _ 0 45 62 m0 768 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 146 m0 = true :=
    chunkT_join _ _ _ 0 107 39 m0 768 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 146 32 m0 768 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 206 m0 = true :=
    chunkT_join _ _ _ 0 178 28 m0 768 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 206 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 292 m0 = true :=
    chunkT_join _ _ _ 0 270 22 m0 768 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 323 m0 = true :=
    chunkT_join _ _ _ 0 292 31 m0 768 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 374 m0 = true :=
    chunkT_join _ _ _ 0 323 51 m0 768 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 374 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 502 m0 = true :=
    chunkT_join _ _ _ 0 438 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 566 m0 = true :=
    chunkT_join _ _ _ 0 502 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 630 m0 = true :=
    chunkT_join _ _ _ 0 566 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 694 m0 = true :=
    chunkT_join _ _ _ 0 630 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 758 m0 = true :=
    chunkT_join _ _ _ 0 694 64 m0 768 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 768 m0 = true :=
    chunkT_join _ _ _ 0 758 10 m0 768 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  exact h16
/-- **the leaf has no decomposition** (nested split leaf: main record and 768 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E245S0
#print axioms E245S0.leaf
