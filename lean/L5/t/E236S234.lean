module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S234_C0
public import L5.t.E236S234_C1
public import L5.t.E236S234_C2
public import L5.t.E236S234_C3
public import L5.t.E236S234_C4
public import L5.t.E236S234_C5
public import L5.t.E236S234_C6
public import L5.t.E236S234_C7
public import L5.t.E236S234_C8
public import L5.t.E236S234_C9
public import L5.t.E236S234_C10
public import L5.t.E236S234_C11
public import L5.t.E236S234_C12
public import L5.t.E236S234_C13
public import L5.t.E236S234_C14
public import L5.t.E236S234_C15
public import L5.t.E236S234_C16
public import L5.t.E236S234_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S234
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 745 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 745 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 66 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 11 6 m0 745 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 17 17 m0 745 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 34 5 m0 745 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 58 m0 = true :=
    chunkT_join _ _ _ 0 39 19 m0 745 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 58 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 186 m0 = true :=
    chunkT_join _ _ _ 0 122 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 250 m0 = true :=
    chunkT_join _ _ _ 0 186 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 314 m0 = true :=
    chunkT_join _ _ _ 0 250 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 314 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 442 m0 = true :=
    chunkT_join _ _ _ 0 378 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 506 m0 = true :=
    chunkT_join _ _ _ 0 442 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 570 m0 = true :=
    chunkT_join _ _ _ 0 506 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 634 m0 = true :=
    chunkT_join _ _ _ 0 570 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 698 m0 = true :=
    chunkT_join _ _ _ 0 634 64 m0 745 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 745 m0 = true :=
    chunkT_join _ _ _ 0 698 47 m0 745 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  exact h16
/-- **the leaf has no decomposition** (nested split leaf: main record and 745 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S234
#print axioms E236S234.leaf
