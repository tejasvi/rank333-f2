module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S208_C0
public import L5.t.E236S208_C1
public import L5.t.E236S208_C2
public import L5.t.E236S208_C3
public import L5.t.E236S208_C4
public import L5.t.E236S208_C5
public import L5.t.E236S208_C6
public import L5.t.E236S208_C7
public import L5.t.E236S208_C8
public import L5.t.E236S208_C9
public import L5.t.E236S208_C10
public import L5.t.E236S208_C11
public import L5.t.E236S208_C12
public import L5.t.E236S208_C13
public import L5.t.E236S208_C14
public import L5.t.E236S208_C15
public import L5.t.E236S208_C16
public import L5.t.E236S208_C17
public import L5.t.E236S208_C18
public import L5.t.E236S208_C19
public import L5.t.E236S208_C20
public import L5.t.E236S208_C21
public import L5.t.E236S208_C22
public import L5.t.E236S208_C23
public import L5.t.E236S208_C24
public import L5.t.E236S208_C25
public import L5.t.E236S208_C26
public import L5.t.E236S208_C27
public import L5.t.E236S208_C28
public import L5.t.E236S208_C29
public import L5.t.E236S208_C30
public import L5.t.E236S208_C31
public import L5.t.E236S208_C32
public import L5.t.E236S208_C33
public import L5.t.E236S208_C34
public import L5.t.E236S208_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S208
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 544 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 544 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 5 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 6 m0 = true :=
    chunkT_join _ _ _ 0 5 1 m0 87 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 6 1 m0 304 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 8 m0 = true :=
    chunkT_join _ _ _ 0 7 1 m0 304 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 8 4 m0 304 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 18 m0 = true :=
    chunkT_join _ _ _ 0 12 6 m0 304 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 23 m0 = true :=
    chunkT_join _ _ _ 0 18 5 m0 304 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 23 1 m0 304 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 24 1 m0 304 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 25 1 m0 544 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 26 1 m0 544 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 27 4 m0 544 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 31 5 m0 544 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 36 2 m0 544 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 38 2 m0 544 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 40 5 m0 544 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 50 m0 = true :=
    chunkT_join _ _ _ 0 45 5 m0 544 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 56 m0 = true :=
    chunkT_join _ _ _ 0 50 6 m0 544 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 56 6 m0 544 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 62 1 m0 544 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 63 1 m0 544 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 65 m0 = true :=
    chunkT_join _ _ _ 0 64 1 m0 544 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 65 3 m0 544 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 68 3 m0 544 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 71 3 m0 544 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 74 4 m0 544 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 83 m0 = true :=
    chunkT_join _ _ _ 0 78 5 m0 544 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 147 m0 = true :=
    chunkT_join _ _ _ 0 83 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 147 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 275 m0 = true :=
    chunkT_join _ _ _ 0 211 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 339 m0 = true :=
    chunkT_join _ _ _ 0 275 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 339 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 467 m0 = true :=
    chunkT_join _ _ _ 0 403 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 531 m0 = true :=
    chunkT_join _ _ _ 0 467 64 m0 544 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 544 m0 = true :=
    chunkT_join _ _ _ 0 531 13 m0 544 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  exact h34
/-- **the leaf has no decomposition** (nested split leaf: main record and 544 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S208
#print axioms E236S208.leaf
