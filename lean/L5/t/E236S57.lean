module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S57_C0
public import L5.t.E236S57_C1
public import L5.t.E236S57_C2
public import L5.t.E236S57_C3
public import L5.t.E236S57_C4
public import L5.t.E236S57_C5
public import L5.t.E236S57_C6
public import L5.t.E236S57_C7
public import L5.t.E236S57_C8
public import L5.t.E236S57_C9
public import L5.t.E236S57_C10
public import L5.t.E236S57_C11
public import L5.t.E236S57_C12
public import L5.t.E236S57_C13
public import L5.t.E236S57_C14
public import L5.t.E236S57_C15
public import L5.t.E236S57_C16
public import L5.t.E236S57_C17
public import L5.t.E236S57_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S57
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 828 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 828 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 53 16 m0 828 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 133 m0 = true :=
    chunkT_join _ _ _ 0 69 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 157 m0 = true :=
    chunkT_join _ _ _ 0 133 24 m0 828 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 157 54 m0 828 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 252 m0 = true :=
    chunkT_join _ _ _ 0 211 41 m0 828 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 274 m0 = true :=
    chunkT_join _ _ _ 0 252 22 m0 828 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 274 23 m0 828 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 310 m0 = true :=
    chunkT_join _ _ _ 0 297 13 m0 828 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 357 m0 = true :=
    chunkT_join _ _ _ 0 310 47 m0 828 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 421 m0 = true :=
    chunkT_join _ _ _ 0 357 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 485 m0 = true :=
    chunkT_join _ _ _ 0 421 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 549 m0 = true :=
    chunkT_join _ _ _ 0 485 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 613 m0 = true :=
    chunkT_join _ _ _ 0 549 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 677 m0 = true :=
    chunkT_join _ _ _ 0 613 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 741 m0 = true :=
    chunkT_join _ _ _ 0 677 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 805 m0 = true :=
    chunkT_join _ _ _ 0 741 64 m0 828 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 828 m0 = true :=
    chunkT_join _ _ _ 0 805 23 m0 828 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 828 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S57
#print axioms E236S57.leaf
