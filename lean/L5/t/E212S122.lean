module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S122_C0
public import L5.t.E212S122_C1
public import L5.t.E212S122_C2
public import L5.t.E212S122_C3
public import L5.t.E212S122_C4
public import L5.t.E212S122_C5
public import L5.t.E212S122_C6
public import L5.t.E212S122_C7
public import L5.t.E212S122_C8
public import L5.t.E212S122_C9
public import L5.t.E212S122_C10
public import L5.t.E212S122_C11
public import L5.t.E212S122_C12
public import L5.t.E212S122_C13
public import L5.t.E212S122_C14
public import L5.t.E212S122_C15
public import L5.t.E212S122_C16
public import L5.t.E212S122_C17
public import L5.t.E212S122_C18
public import L5.t.E212S122_C19
public import L5.t.E212S122_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S122
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 243 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 243 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 15 2 m0 243 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 17 3 m0 243 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 20 13 m0 243 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 33 11 m0 243 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 44 28 m0 243 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 72 1 m0 243 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 73 2 m0 243 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 75 3 m0 243 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 78 3 m0 243 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 91 m0 = true :=
    chunkT_join _ _ _ 0 81 10 m0 243 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 102 m0 = true :=
    chunkT_join _ _ _ 0 91 11 m0 243 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 119 m0 = true :=
    chunkT_join _ _ _ 0 102 17 m0 243 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 148 m0 = true :=
    chunkT_join _ _ _ 0 119 29 m0 243 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true :=
    chunkT_join _ _ _ 0 148 11 m0 243 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 159 15 m0 243 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 174 14 m0 243 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 213 m0 = true :=
    chunkT_join _ _ _ 0 188 25 m0 243 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 242 m0 = true :=
    chunkT_join _ _ _ 0 213 29 m0 243 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 243 m0 = true :=
    chunkT_join _ _ _ 0 242 1 m0 243 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  exact h19
/-- **the leaf has no decomposition** (nested split leaf: main record and 243 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S122
#print axioms E212S122.leaf
