module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S56_C0
public import L5.t.E218S56_C1
public import L5.t.E218S56_C2
public import L5.t.E218S56_C3
public import L5.t.E218S56_C4
public import L5.t.E218S56_C5
public import L5.t.E218S56_C6
public import L5.t.E218S56_C7
public import L5.t.E218S56_C8
public import L5.t.E218S56_C9
public import L5.t.E218S56_C10
public import L5.t.E218S56_C11
public import L5.t.E218S56_C12
public import L5.t.E218S56_C13
public import L5.t.E218S56_C14
public import L5.t.E218S56_C15
public import L5.t.E218S56_C16
public import L5.t.E218S56_C17
public import L5.t.E218S56_C18
public import L5.t.E218S56_C19
public import L5.t.E218S56_C20
public import L5.t.E218S56_C21
public import L5.t.E218S56_C22
public import L5.t.E218S56_C23
public import L5.t.E218S56_C24
public import L5.t.E218S56_C25
public import L5.t.E218S56_C26
public import L5.t.E218S56_C27
public import L5.t.E218S56_C28
public import L5.t.E218S56_C29
public import L5.t.E218S56_C30
public import L5.t.E218S56_C31
public import L5.t.E218S56_C32
public import L5.t.E218S56_C33
public import L5.t.E218S56_C34
public import L5.t.E218S56_C35
public import L5.t.E218S56_C36
public import L5.t.E218S56_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E218S56
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1470 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1470 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 7 m0 = true :=
    chunkT_join _ _ _ 0 1 6 m0 1464 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true :=
    chunkT_join _ _ _ 0 7 15 m0 1464 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 22 25 m0 1464 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 47 5 m0 1464 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 52 1 m0 1464 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 64 m0 = true :=
    chunkT_join _ _ _ 0 53 11 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 67 m0 = true :=
    chunkT_join _ _ _ 0 64 3 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 67 9 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 76 16 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 142 m0 = true :=
    chunkT_join _ _ _ 0 92 50 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 176 m0 = true :=
    chunkT_join _ _ _ 0 142 34 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 240 m0 = true :=
    chunkT_join _ _ _ 0 176 64 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 304 m0 = true :=
    chunkT_join _ _ _ 0 240 64 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 313 m0 = true :=
    chunkT_join _ _ _ 0 304 9 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 314 m0 = true :=
    chunkT_join _ _ _ 0 313 1 m0 1467 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 339 m0 = true :=
    chunkT_join _ _ _ 0 314 25 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 395 m0 = true :=
    chunkT_join _ _ _ 0 339 56 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 447 m0 = true :=
    chunkT_join _ _ _ 0 395 52 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 470 m0 = true :=
    chunkT_join _ _ _ 0 447 23 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 534 m0 = true :=
    chunkT_join _ _ _ 0 470 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 567 m0 = true :=
    chunkT_join _ _ _ 0 534 33 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 581 m0 = true :=
    chunkT_join _ _ _ 0 567 14 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 639 m0 = true :=
    chunkT_join _ _ _ 0 581 58 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 703 m0 = true :=
    chunkT_join _ _ _ 0 639 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 767 m0 = true :=
    chunkT_join _ _ _ 0 703 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 831 m0 = true :=
    chunkT_join _ _ _ 0 767 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 895 m0 = true :=
    chunkT_join _ _ _ 0 831 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 959 m0 = true :=
    chunkT_join _ _ _ 0 895 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1023 m0 = true :=
    chunkT_join _ _ _ 0 959 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1087 m0 = true :=
    chunkT_join _ _ _ 0 1023 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1151 m0 = true :=
    chunkT_join _ _ _ 0 1087 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1215 m0 = true :=
    chunkT_join _ _ _ 0 1151 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1279 m0 = true :=
    chunkT_join _ _ _ 0 1215 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1343 m0 = true :=
    chunkT_join _ _ _ 0 1279 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1407 m0 = true :=
    chunkT_join _ _ _ 0 1343 64 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1470 m0 = true :=
    chunkT_join _ _ _ 0 1407 63 m0 1470 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  exact h36
/-- **the leaf has no decomposition** (nested split leaf: main record and 1470 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E218S56
#print axioms E218S56.leaf
