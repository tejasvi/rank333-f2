module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S41_C0
public import L5.t.E207S41_C1
public import L5.t.E207S41_C2
public import L5.t.E207S41_C3
public import L5.t.E207S41_C4
public import L5.t.E207S41_C5
public import L5.t.E207S41_C6
public import L5.t.E207S41_C7
public import L5.t.E207S41_C8
public import L5.t.E207S41_C9
public import L5.t.E207S41_C10
public import L5.t.E207S41_C11
public import L5.t.E207S41_C12
public import L5.t.E207S41_C13
public import L5.t.E207S41_C14
public import L5.t.E207S41_C15
public import L5.t.E207S41_C16
public import L5.t.E207S41_C17
public import L5.t.E207S41_C18
public import L5.t.E207S41_C19
public import L5.t.E207S41_C20
public import L5.t.E207S41_C21
public import L5.t.E207S41_C22
public import L5.t.E207S41_C23
public import L5.t.E207S41_C24
public import L5.t.E207S41_C25
public import L5.t.E207S41_C26
public import L5.t.E207S41_C27
public import L5.t.E207S41_C28
public import L5.t.E207S41_C29
public import L5.t.E207S41_C30
public import L5.t.E207S41_C31
public import L5.t.E207S41_C32
public import L5.t.E207S41_C33
public import L5.t.E207S41_C34
public import L5.t.E207S41_C35
public import L5.t.E207S41_C36
public import L5.t.E207S41_C37
public import L5.t.E207S41_C38
public import L5.t.E207S41_C39
public import L5.t.E207S41_C40
public import L5.t.E207S41_C41
public import L5.t.E207S41_C42
public import L5.t.E207S41_C43
public import L5.t.E207S41_C44
public import L5.t.E207S41_C45
public import L5.t.E207S41_C46
public import L5.t.E207S41_C47
public import L5.t.E207S41_C48
public import L5.t.E207S41_C49
public import L5.t.E207S41_C50
public import L5.t.E207S41_C51
public import L5.t.E207S41_C52
public import L5.t.E207S41_C53
public import L5.t.E207S41_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S41
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1995 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1995 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 1040 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 11 m0 = true :=
    chunkT_join _ _ _ 0 2 9 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 11 19 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 30 23 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 53 22 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 135 m0 = true :=
    chunkT_join _ _ _ 0 75 60 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 148 m0 = true :=
    chunkT_join _ _ _ 0 135 13 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 151 m0 = true :=
    chunkT_join _ _ _ 0 148 3 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 152 m0 = true :=
    chunkT_join _ _ _ 0 151 1 m0 1041 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 152 9 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 166 m0 = true :=
    chunkT_join _ _ _ 0 161 5 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 166 9 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 183 m0 = true :=
    chunkT_join _ _ _ 0 175 8 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 183 17 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 200 46 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 259 m0 = true :=
    chunkT_join _ _ _ 0 246 13 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 282 m0 = true :=
    chunkT_join _ _ _ 0 259 23 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 346 m0 = true :=
    chunkT_join _ _ _ 0 282 64 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 406 m0 = true :=
    chunkT_join _ _ _ 0 346 60 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 409 m0 = true :=
    chunkT_join _ _ _ 0 406 3 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 409 1 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true :=
    chunkT_join _ _ _ 0 410 1 m0 1666 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 417 m0 = true :=
    chunkT_join _ _ _ 0 411 6 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 425 m0 = true :=
    chunkT_join _ _ _ 0 417 8 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 425 10 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 452 m0 = true :=
    chunkT_join _ _ _ 0 435 17 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 495 m0 = true :=
    chunkT_join _ _ _ 0 452 43 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 555 m0 = true :=
    chunkT_join _ _ _ 0 495 60 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 619 m0 = true :=
    chunkT_join _ _ _ 0 555 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 654 m0 = true :=
    chunkT_join _ _ _ 0 619 35 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 677 m0 = true :=
    chunkT_join _ _ _ 0 654 23 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 694 m0 = true :=
    chunkT_join _ _ _ 0 677 17 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 758 m0 = true :=
    chunkT_join _ _ _ 0 694 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 811 m0 = true :=
    chunkT_join _ _ _ 0 758 53 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 875 m0 = true :=
    chunkT_join _ _ _ 0 811 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 939 m0 = true :=
    chunkT_join _ _ _ 0 875 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1003 m0 = true :=
    chunkT_join _ _ _ 0 939 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1067 m0 = true :=
    chunkT_join _ _ _ 0 1003 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1131 m0 = true :=
    chunkT_join _ _ _ 0 1067 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1195 m0 = true :=
    chunkT_join _ _ _ 0 1131 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1259 m0 = true :=
    chunkT_join _ _ _ 0 1195 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1323 m0 = true :=
    chunkT_join _ _ _ 0 1259 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 1387 m0 = true :=
    chunkT_join _ _ _ 0 1323 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1451 m0 = true :=
    chunkT_join _ _ _ 0 1387 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 1515 m0 = true :=
    chunkT_join _ _ _ 0 1451 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 1579 m0 = true :=
    chunkT_join _ _ _ 0 1515 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 1643 m0 = true :=
    chunkT_join _ _ _ 0 1579 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 1707 m0 = true :=
    chunkT_join _ _ _ 0 1643 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 1771 m0 = true :=
    chunkT_join _ _ _ 0 1707 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 1835 m0 = true :=
    chunkT_join _ _ _ 0 1771 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 1899 m0 = true :=
    chunkT_join _ _ _ 0 1835 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1963 m0 = true :=
    chunkT_join _ _ _ 0 1899 64 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1995 m0 = true :=
    chunkT_join _ _ _ 0 1963 32 m0 1995 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  exact h53
/-- **the leaf has no decomposition** (nested split leaf: main record and 1995 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S41
#print axioms E207S41.leaf
