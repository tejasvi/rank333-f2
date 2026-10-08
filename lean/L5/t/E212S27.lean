module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S27_C0
public import L5.t.E212S27_C1
public import L5.t.E212S27_C2
public import L5.t.E212S27_C3
public import L5.t.E212S27_C4
public import L5.t.E212S27_C5
public import L5.t.E212S27_C6
public import L5.t.E212S27_C7
public import L5.t.E212S27_C8
public import L5.t.E212S27_C9
public import L5.t.E212S27_C10
public import L5.t.E212S27_C11
public import L5.t.E212S27_C12
public import L5.t.E212S27_C13
public import L5.t.E212S27_C14
public import L5.t.E212S27_C15
public import L5.t.E212S27_C16
public import L5.t.E212S27_C17
public import L5.t.E212S27_C18
public import L5.t.E212S27_C19
public import L5.t.E212S27_C20
public import L5.t.E212S27_C21
public import L5.t.E212S27_C22
public import L5.t.E212S27_C23
public import L5.t.E212S27_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S27
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 919 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 919 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 41 m0 = true :=
    chunkT_join _ _ _ 0 39 2 m0 917 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 41 2 m0 917 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 43 1 m0 917 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 44 10 m0 918 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 54 8 m0 918 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 62 18 m0 918 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 80 18 m0 918 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 98 52 m0 918 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 188 m0 = true :=
    chunkT_join _ _ _ 0 150 38 m0 918 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 188 109 m0 918 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 305 m0 = true :=
    chunkT_join _ _ _ 0 297 8 m0 918 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 338 m0 = true :=
    chunkT_join _ _ _ 0 305 33 m0 918 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 422 m0 = true :=
    chunkT_join _ _ _ 0 338 84 m0 918 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 422 1 m0 918 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 423 1 m0 918 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 436 m0 = true :=
    chunkT_join _ _ _ 0 424 12 m0 919 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 476 m0 = true :=
    chunkT_join _ _ _ 0 436 40 m0 919 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 535 m0 = true :=
    chunkT_join _ _ _ 0 476 59 m0 919 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 553 m0 = true :=
    chunkT_join _ _ _ 0 535 18 m0 919 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 618 m0 = true :=
    chunkT_join _ _ _ 0 553 65 m0 919 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 682 m0 = true :=
    chunkT_join _ _ _ 0 618 64 m0 919 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 800 m0 = true :=
    chunkT_join _ _ _ 0 682 118 m0 919 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 919 m0 = true :=
    chunkT_join _ _ _ 0 800 119 m0 919 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  exact h23
/-- **the leaf has no decomposition** (nested split leaf: main record and 919 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S27
#print axioms E212S27.leaf
