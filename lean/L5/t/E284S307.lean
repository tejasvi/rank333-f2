module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S307_C0
public import L5.t.E284S307_C1
public import L5.t.E284S307_C2
public import L5.t.E284S307_C3
public import L5.t.E284S307_C4
public import L5.t.E284S307_C5
public import L5.t.E284S307_C6
public import L5.t.E284S307_C7
public import L5.t.E284S307_C8
public import L5.t.E284S307_C9
public import L5.t.E284S307_C10
public import L5.t.E284S307_C11
public import L5.t.E284S307_C12
public import L5.t.E284S307_C13
public import L5.t.E284S307_C14
public import L5.t.E284S307_C15
public import L5.t.E284S307_C16
public import L5.t.E284S307_C17
public import L5.t.E284S307_C18
public import L5.t.E284S307_C19
public import L5.t.E284S307_C20
public import L5.t.E284S307_C21
public import L5.t.E284S307_C22
public import L5.t.E284S307_C23
public import L5.t.E284S307_C24
public import L5.t.E284S307_C25
public import L5.t.E284S307_C26
public import L5.t.E284S307_C27
public import L5.t.E284S307_C28
public import L5.t.E284S307_C29
public import L5.t.E284S307_C30
public import L5.t.E284S307_C31
public import L5.t.E284S307_C32
public import L5.t.E284S307_C33
public import L5.t.E284S307_C34
public import L5.t.E284S307_C35
public import L5.t.E284S307_C36
public import L5.t.E284S307_C37
public import L5.t.E284S307_C38
public import L5.t.E284S307_C39
public import L5.t.E284S307_C40
public import L5.t.E284S307_C41
public import L5.t.E284S307_C42
public import L5.t.E284S307_C43
public import L5.t.E284S307_C44
public import L5.t.E284S307_C45
public import L5.t.E284S307_C46
public import L5.t.E284S307_C47
public import L5.t.E284S307_C48
public import L5.t.E284S307_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S307
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2120 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2120 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 1 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 2 m0 = true :=
    chunkT_join _ _ _ 0 1 1 m0 1162 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true :=
    chunkT_join _ _ _ 0 2 12 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 29 m0 = true :=
    chunkT_join _ _ _ 0 14 15 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 29 22 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 62 m0 = true :=
    chunkT_join _ _ _ 0 51 11 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 62 19 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 81 22 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 167 m0 = true :=
    chunkT_join _ _ _ 0 103 64 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 231 m0 = true :=
    chunkT_join _ _ _ 0 167 64 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 295 m0 = true :=
    chunkT_join _ _ _ 0 231 64 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 359 m0 = true :=
    chunkT_join _ _ _ 0 295 64 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 371 m0 = true :=
    chunkT_join _ _ _ 0 359 12 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 399 m0 = true :=
    chunkT_join _ _ _ 0 371 28 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 407 m0 = true :=
    chunkT_join _ _ _ 0 399 8 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 408 m0 = true :=
    chunkT_join _ _ _ 0 407 1 m0 1641 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 420 m0 = true :=
    chunkT_join _ _ _ 0 408 12 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 420 15 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 456 m0 = true :=
    chunkT_join _ _ _ 0 435 21 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 470 m0 = true :=
    chunkT_join _ _ _ 0 456 14 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 472 m0 = true :=
    chunkT_join _ _ _ 0 470 2 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 480 m0 = true :=
    chunkT_join _ _ _ 0 472 8 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 543 m0 = true :=
    chunkT_join _ _ _ 0 480 63 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 583 m0 = true :=
    chunkT_join _ _ _ 0 543 40 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 647 m0 = true :=
    chunkT_join _ _ _ 0 583 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 711 m0 = true :=
    chunkT_join _ _ _ 0 647 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 775 m0 = true :=
    chunkT_join _ _ _ 0 711 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 839 m0 = true :=
    chunkT_join _ _ _ 0 775 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 903 m0 = true :=
    chunkT_join _ _ _ 0 839 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 967 m0 = true :=
    chunkT_join _ _ _ 0 903 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1031 m0 = true :=
    chunkT_join _ _ _ 0 967 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1095 m0 = true :=
    chunkT_join _ _ _ 0 1031 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1159 m0 = true :=
    chunkT_join _ _ _ 0 1095 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1223 m0 = true :=
    chunkT_join _ _ _ 0 1159 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1287 m0 = true :=
    chunkT_join _ _ _ 0 1223 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1351 m0 = true :=
    chunkT_join _ _ _ 0 1287 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1415 m0 = true :=
    chunkT_join _ _ _ 0 1351 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1479 m0 = true :=
    chunkT_join _ _ _ 0 1415 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1543 m0 = true :=
    chunkT_join _ _ _ 0 1479 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1607 m0 = true :=
    chunkT_join _ _ _ 0 1543 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1671 m0 = true :=
    chunkT_join _ _ _ 0 1607 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1735 m0 = true :=
    chunkT_join _ _ _ 0 1671 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1799 m0 = true :=
    chunkT_join _ _ _ 0 1735 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 1863 m0 = true :=
    chunkT_join _ _ _ 0 1799 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1927 m0 = true :=
    chunkT_join _ _ _ 0 1863 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 1991 m0 = true :=
    chunkT_join _ _ _ 0 1927 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2055 m0 = true :=
    chunkT_join _ _ _ 0 1991 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2119 m0 = true :=
    chunkT_join _ _ _ 0 2055 64 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2120 m0 = true :=
    chunkT_join _ _ _ 0 2119 1 m0 2120 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  exact h48
/-- **the leaf has no decomposition** (nested split leaf: main record and 2120 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S307
#print axioms E284S307.leaf
