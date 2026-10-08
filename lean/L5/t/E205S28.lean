module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S28_C0
public import L5.t.E205S28_C1
public import L5.t.E205S28_C2
public import L5.t.E205S28_C3
public import L5.t.E205S28_C4
public import L5.t.E205S28_C5
public import L5.t.E205S28_C6
public import L5.t.E205S28_C7
public import L5.t.E205S28_C8
public import L5.t.E205S28_C9
public import L5.t.E205S28_C10
public import L5.t.E205S28_C11
public import L5.t.E205S28_C12
public import L5.t.E205S28_C13
public import L5.t.E205S28_C14
public import L5.t.E205S28_C15
public import L5.t.E205S28_C16
public import L5.t.E205S28_C17
public import L5.t.E205S28_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E205S28
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 755 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 755 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 38 60 m0 755 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 147 m0 = true :=
    chunkT_join _ _ _ 0 98 49 m0 755 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 147 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 211 42 m0 755 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 279 m0 = true :=
    chunkT_join _ _ _ 0 253 26 m0 755 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 285 m0 = true :=
    chunkT_join _ _ _ 0 279 6 m0 755 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 294 m0 = true :=
    chunkT_join _ _ _ 0 285 9 m0 755 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 303 m0 = true :=
    chunkT_join _ _ _ 0 294 9 m0 755 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 316 m0 = true :=
    chunkT_join _ _ _ 0 303 13 m0 755 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 360 m0 = true :=
    chunkT_join _ _ _ 0 316 44 m0 755 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 360 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 488 m0 = true :=
    chunkT_join _ _ _ 0 424 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 552 m0 = true :=
    chunkT_join _ _ _ 0 488 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true :=
    chunkT_join _ _ _ 0 552 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 680 m0 = true :=
    chunkT_join _ _ _ 0 616 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 744 m0 = true :=
    chunkT_join _ _ _ 0 680 64 m0 755 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 755 m0 = true :=
    chunkT_join _ _ _ 0 744 11 m0 755 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  exact h17
/-- **the leaf has no decomposition** (nested split leaf: main record and 755 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E205S28
#print axioms E205S28.leaf
