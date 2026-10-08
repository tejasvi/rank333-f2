module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S57_C0
public import L5.t.E207S57_C1
public import L5.t.E207S57_C2
public import L5.t.E207S57_C3
public import L5.t.E207S57_C4
public import L5.t.E207S57_C5
public import L5.t.E207S57_C6
public import L5.t.E207S57_C7
public import L5.t.E207S57_C8
public import L5.t.E207S57_C9
public import L5.t.E207S57_C10
public import L5.t.E207S57_C11
public import L5.t.E207S57_C12
public import L5.t.E207S57_C13
public import L5.t.E207S57_C14
public import L5.t.E207S57_C15
public import L5.t.E207S57_C16
public import L5.t.E207S57_C17
public import L5.t.E207S57_C18
public import L5.t.E207S57_C19
public import L5.t.E207S57_C20
public import L5.t.E207S57_C21
public import L5.t.E207S57_C22
public import L5.t.E207S57_C23
public import L5.t.E207S57_C24
public import L5.t.E207S57_C25
public import L5.t.E207S57_C26
public import L5.t.E207S57_C27
public import L5.t.E207S57_C28
public import L5.t.E207S57_C29
public import L5.t.E207S57_C30
public import L5.t.E207S57_C31
public import L5.t.E207S57_C32
public import L5.t.E207S57_C33
public import L5.t.E207S57_C34
public import L5.t.E207S57_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S57
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 669 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 669 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 9 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 10 m0 = true :=
    chunkT_join _ _ _ 0 9 1 m0 242 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 10 1 m0 242 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 12 m0 = true :=
    chunkT_join _ _ _ 0 11 1 m0 447 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 13 m0 = true :=
    chunkT_join _ _ _ 0 12 1 m0 447 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 16 m0 = true :=
    chunkT_join _ _ _ 0 13 3 m0 447 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 17 m0 = true :=
    chunkT_join _ _ _ 0 16 1 m0 447 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 19 m0 = true :=
    chunkT_join _ _ _ 0 17 2 m0 447 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 20 m0 = true :=
    chunkT_join _ _ _ 0 19 1 m0 447 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 21 m0 = true :=
    chunkT_join _ _ _ 0 20 1 m0 447 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true :=
    chunkT_join _ _ _ 0 21 5 m0 652 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 26 5 m0 652 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 33 m0 = true :=
    chunkT_join _ _ _ 0 31 2 m0 652 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 33 1 m0 652 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 34 13 m0 652 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 47 19 m0 652 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 66 7 m0 652 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 652 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 80 m0 = true :=
    chunkT_join _ _ _ 0 74 6 m0 669 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 94 m0 = true :=
    chunkT_join _ _ _ 0 80 14 m0 669 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 125 m0 = true :=
    chunkT_join _ _ _ 0 94 31 m0 669 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 135 m0 = true :=
    chunkT_join _ _ _ 0 125 10 m0 669 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 164 m0 = true :=
    chunkT_join _ _ _ 0 135 29 m0 669 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 177 m0 = true :=
    chunkT_join _ _ _ 0 164 13 m0 669 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 184 m0 = true :=
    chunkT_join _ _ _ 0 177 7 m0 669 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 184 11 m0 669 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 215 m0 = true :=
    chunkT_join _ _ _ 0 195 20 m0 669 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 229 m0 = true :=
    chunkT_join _ _ _ 0 215 14 m0 669 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 293 m0 = true :=
    chunkT_join _ _ _ 0 229 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 357 m0 = true :=
    chunkT_join _ _ _ 0 293 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 421 m0 = true :=
    chunkT_join _ _ _ 0 357 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 485 m0 = true :=
    chunkT_join _ _ _ 0 421 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 549 m0 = true :=
    chunkT_join _ _ _ 0 485 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 613 m0 = true :=
    chunkT_join _ _ _ 0 549 64 m0 669 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 669 m0 = true :=
    chunkT_join _ _ _ 0 613 56 m0 669 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  exact h34
/-- **the leaf has no decomposition** (nested split leaf: main record and 669 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S57
#print axioms E207S57.leaf
