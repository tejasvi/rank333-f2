module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S115_C0
public import L5.t.E213S115_C1
public import L5.t.E213S115_C2
public import L5.t.E213S115_C3
public import L5.t.E213S115_C4
public import L5.t.E213S115_C5
public import L5.t.E213S115_C6
public import L5.t.E213S115_C7
public import L5.t.E213S115_C8
public import L5.t.E213S115_C9
public import L5.t.E213S115_C10
public import L5.t.E213S115_C11
public import L5.t.E213S115_C12
public import L5.t.E213S115_C13
public import L5.t.E213S115_C14
public import L5.t.E213S115_C15
public import L5.t.E213S115_C16
public import L5.t.E213S115_C17
public import L5.t.E213S115_C18
public import L5.t.E213S115_C19
public import L5.t.E213S115_C20
public import L5.t.E213S115_C21
public import L5.t.E213S115_C22
public import L5.t.E213S115_C23
public import L5.t.E213S115_C24
public import L5.t.E213S115_C25
public import L5.t.E213S115_C26
public import L5.t.E213S115_C27
public import L5.t.E213S115_C28
public import L5.t.E213S115_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E213S115
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1034 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1034 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 48 3 m0 961 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 51 1 m0 961 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 52 11 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 63 3 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 66 9 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 75 17 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 115 m0 = true :=
    chunkT_join _ _ _ 0 92 23 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 115 46 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 161 55 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 280 m0 = true :=
    chunkT_join _ _ _ 0 216 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 322 m0 = true :=
    chunkT_join _ _ _ 0 280 42 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 334 m0 = true :=
    chunkT_join _ _ _ 0 322 12 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 367 m0 = true :=
    chunkT_join _ _ _ 0 334 33 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 367 14 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 445 m0 = true :=
    chunkT_join _ _ _ 0 381 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 463 m0 = true :=
    chunkT_join _ _ _ 0 445 18 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 464 m0 = true :=
    chunkT_join _ _ _ 0 463 1 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 482 m0 = true :=
    chunkT_join _ _ _ 0 464 18 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 546 m0 = true :=
    chunkT_join _ _ _ 0 482 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 589 m0 = true :=
    chunkT_join _ _ _ 0 546 43 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 604 m0 = true :=
    chunkT_join _ _ _ 0 589 15 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 662 m0 = true :=
    chunkT_join _ _ _ 0 604 58 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 726 m0 = true :=
    chunkT_join _ _ _ 0 662 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 790 m0 = true :=
    chunkT_join _ _ _ 0 726 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 854 m0 = true :=
    chunkT_join _ _ _ 0 790 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 918 m0 = true :=
    chunkT_join _ _ _ 0 854 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 982 m0 = true :=
    chunkT_join _ _ _ 0 918 64 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1034 m0 = true :=
    chunkT_join _ _ _ 0 982 52 m0 1034 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  exact h28
/-- **the leaf has no decomposition** (nested split leaf: main record and 1034 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E213S115
#print axioms E213S115.leaf
