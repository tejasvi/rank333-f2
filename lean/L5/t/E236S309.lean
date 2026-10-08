module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S309_C0
public import L5.t.E236S309_C1
public import L5.t.E236S309_C2
public import L5.t.E236S309_C3
public import L5.t.E236S309_C4
public import L5.t.E236S309_C5
public import L5.t.E236S309_C6
public import L5.t.E236S309_C7
public import L5.t.E236S309_C8
public import L5.t.E236S309_C9
public import L5.t.E236S309_C10
public import L5.t.E236S309_C11
public import L5.t.E236S309_C12
public import L5.t.E236S309_C13
public import L5.t.E236S309_C14
public import L5.t.E236S309_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S309
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 162 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true :=
    chunkT_join _ _ _ 0 1 4 m0 99 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 99 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 6 6 m0 162 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 162 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 13 5 m0 162 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 18 9 m0 162 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 27 9 m0 162 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 36 14 m0 162 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 50 7 m0 162 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 57 10 m0 162 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 67 12 m0 162 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 79 5 m0 162 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 148 m0 = true :=
    chunkT_join _ _ _ 0 84 64 m0 162 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 148 14 m0 162 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  exact h14
/-- **the leaf has no decomposition** (nested split leaf: main record and 162 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S309
#print axioms E236S309.leaf
