module
public import R22Port.U_d41d8cd98f00
public import L5.t.E392S1_C0
public import L5.t.E392S1_C1
public import L5.t.E392S1_C2
public import L5.t.E392S1_C3
public import L5.t.E392S1_C4
public import L5.t.E392S1_C5
public import L5.t.E392S1_C6
public import L5.t.E392S1_C7
public import L5.t.E392S1_C8
public import L5.t.E392S1_C9
public import L5.t.E392S1_C10
public import L5.t.E392S1_C11
public import L5.t.E392S1_C12
public import L5.t.E392S1_C13
public import L5.t.E392S1_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E392S1
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 804 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 804 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 128 m0 = true :=
    chunkT_join _ _ _ 0 64 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 192 m0 = true :=
    chunkT_join _ _ _ 0 128 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 192 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 320 m0 = true :=
    chunkT_join _ _ _ 0 256 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 346 m0 = true :=
    chunkT_join _ _ _ 0 320 26 m0 804 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 346 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 474 m0 = true :=
    chunkT_join _ _ _ 0 410 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 538 m0 = true :=
    chunkT_join _ _ _ 0 474 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 602 m0 = true :=
    chunkT_join _ _ _ 0 538 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 666 m0 = true :=
    chunkT_join _ _ _ 0 602 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 730 m0 = true :=
    chunkT_join _ _ _ 0 666 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 794 m0 = true :=
    chunkT_join _ _ _ 0 730 64 m0 804 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 804 m0 = true :=
    chunkT_join _ _ _ 0 794 10 m0 804 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  exact h13
/-- **the leaf has no decomposition** (nested split leaf: main record and 804 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E392S1
#print axioms E392S1.leaf
