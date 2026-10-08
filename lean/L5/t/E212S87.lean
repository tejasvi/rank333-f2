module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S87_C0
public import L5.t.E212S87_C1
public import L5.t.E212S87_C2
public import L5.t.E212S87_C3
public import L5.t.E212S87_C4
public import L5.t.E212S87_C5
public import L5.t.E212S87_C6
public import L5.t.E212S87_C7
public import L5.t.E212S87_C8
public import L5.t.E212S87_C9
public import L5.t.E212S87_C10
public import L5.t.E212S87_C11
public import L5.t.E212S87_C12
public import L5.t.E212S87_C13
public import L5.t.E212S87_C14
public import L5.t.E212S87_C15
public import L5.t.E212S87_C16
public import L5.t.E212S87_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S87
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 194 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 10 5 m0 194 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 15 5 m0 194 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true :=
    chunkT_join _ _ _ 0 20 1 m0 194 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 21 3 m0 194 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 24 2 m0 194 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 26 8 m0 194 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 34 6 m0 194 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 40 17 m0 194 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 57 21 m0 194 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 78 9 m0 194 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 87 6 m0 194 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 109 m0 = true :=
    chunkT_join _ _ _ 0 93 16 m0 194 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 109 13 m0 194 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 145 m0 = true :=
    chunkT_join _ _ _ 0 122 23 m0 194 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 173 m0 = true :=
    chunkT_join _ _ _ 0 145 28 m0 194 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 194 m0 = true :=
    chunkT_join _ _ _ 0 173 21 m0 194 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  exact h16
/-- **the leaf has no decomposition** (nested split leaf: main record and 194 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S87
#print axioms E212S87.leaf
