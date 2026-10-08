module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S113_C0
public import L5.t.E212S113_C1
public import L5.t.E212S113_C2
public import L5.t.E212S113_C3
public import L5.t.E212S113_C4
public import L5.t.E212S113_C5
public import L5.t.E212S113_C6
public import L5.t.E212S113_C7
public import L5.t.E212S113_C8
public import L5.t.E212S113_C9
public import L5.t.E212S113_C10
public import L5.t.E212S113_C11
public import L5.t.E212S113_C12
public import L5.t.E212S113_C13
public import L5.t.E212S113_C14
public import L5.t.E212S113_C15
public import L5.t.E212S113_C16
public import L5.t.E212S113_C17
public import L5.t.E212S113_C18
public import L5.t.E212S113_C19
public import L5.t.E212S113_C20
public import L5.t.E212S113_C21
public import L5.t.E212S113_C22
public import L5.t.E212S113_C23
public import L5.t.E212S113_C24
public import L5.t.E212S113_C25
public import L5.t.E212S113_C26
public import L5.t.E212S113_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S113
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2531 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2531 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 21 3 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 24 28 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 52 20 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 96 m0 = true :=
    chunkT_join _ _ _ 0 72 24 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 171 m0 = true :=
    chunkT_join _ _ _ 0 96 75 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 171 19 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 218 m0 = true :=
    chunkT_join _ _ _ 0 190 28 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 240 m0 = true :=
    chunkT_join _ _ _ 0 218 22 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 298 m0 = true :=
    chunkT_join _ _ _ 0 240 58 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 326 m0 = true :=
    chunkT_join _ _ _ 0 298 28 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 346 m0 = true :=
    chunkT_join _ _ _ 0 326 20 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 347 m0 = true :=
    chunkT_join _ _ _ 0 346 1 m0 1001 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 347 24 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 441 m0 = true :=
    chunkT_join _ _ _ 0 371 70 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 504 m0 = true :=
    chunkT_join _ _ _ 0 441 63 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 535 m0 = true :=
    chunkT_join _ _ _ 0 504 31 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 539 m0 = true :=
    chunkT_join _ _ _ 0 535 4 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 591 m0 = true :=
    chunkT_join _ _ _ 0 539 52 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 677 m0 = true :=
    chunkT_join _ _ _ 0 591 86 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 713 m0 = true :=
    chunkT_join _ _ _ 0 677 36 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 829 m0 = true :=
    chunkT_join _ _ _ 0 713 116 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 905 m0 = true :=
    chunkT_join _ _ _ 0 829 76 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 1073 m0 = true :=
    chunkT_join _ _ _ 0 905 168 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 1585 m0 = true :=
    chunkT_join _ _ _ 0 1073 512 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 2097 m0 = true :=
    chunkT_join _ _ _ 0 1585 512 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 2531 m0 = true :=
    chunkT_join _ _ _ 0 2097 434 m0 2531 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  exact h26
/-- **the leaf has no decomposition** (nested split leaf: main record and 2531 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S113
#print axioms E212S113.leaf
