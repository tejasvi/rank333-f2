module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S188_C0
public import L5.t.E236S188_C1
public import L5.t.E236S188_C2
public import L5.t.E236S188_C3
public import L5.t.E236S188_C4
public import L5.t.E236S188_C5
public import L5.t.E236S188_C6
public import L5.t.E236S188_C7
public import L5.t.E236S188_C8
public import L5.t.E236S188_C9
public import L5.t.E236S188_C10
public import L5.t.E236S188_C11
public import L5.t.E236S188_C12
public import L5.t.E236S188_C13
public import L5.t.E236S188_C14
public import L5.t.E236S188_C15
public import L5.t.E236S188_C16
public import L5.t.E236S188_C17
public import L5.t.E236S188_C18
public import L5.t.E236S188_C19
public import L5.t.E236S188_C20
public import L5.t.E236S188_C21
public import L5.t.E236S188_C22
public import L5.t.E236S188_C23
public import L5.t.E236S188_C24
public import L5.t.E236S188_C25
public import L5.t.E236S188_C26
public import L5.t.E236S188_C27
public import L5.t.E236S188_C28
public import L5.t.E236S188_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S188
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1008 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1008 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 933 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true :=
    chunkT_join _ _ _ 0 2 1 m0 933 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true :=
    chunkT_join _ _ _ 0 3 6 m0 999 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 9 4 m0 999 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 15 m0 = true :=
    chunkT_join _ _ _ 0 13 2 m0 999 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true :=
    chunkT_join _ _ _ 0 15 7 m0 999 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 22 15 m0 999 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 37 10 m0 999 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 47 2 m0 999 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 49 1 m0 999 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 50 11 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 61 15 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 76 19 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true :=
    chunkT_join _ _ _ 0 95 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 223 m0 = true :=
    chunkT_join _ _ _ 0 159 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 287 m0 = true :=
    chunkT_join _ _ _ 0 223 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 351 m0 = true :=
    chunkT_join _ _ _ 0 287 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 351 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 479 m0 = true :=
    chunkT_join _ _ _ 0 415 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 543 m0 = true :=
    chunkT_join _ _ _ 0 479 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 607 m0 = true :=
    chunkT_join _ _ _ 0 543 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 671 m0 = true :=
    chunkT_join _ _ _ 0 607 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 735 m0 = true :=
    chunkT_join _ _ _ 0 671 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 799 m0 = true :=
    chunkT_join _ _ _ 0 735 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 863 m0 = true :=
    chunkT_join _ _ _ 0 799 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 927 m0 = true :=
    chunkT_join _ _ _ 0 863 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 991 m0 = true :=
    chunkT_join _ _ _ 0 927 64 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1008 m0 = true :=
    chunkT_join _ _ _ 0 991 17 m0 1008 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  exact h28
/-- **the leaf has no decomposition** (nested split leaf: main record and 1008 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S188
#print axioms E236S188.leaf
