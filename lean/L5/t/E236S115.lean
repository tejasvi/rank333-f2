module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S115_C0
public import L5.t.E236S115_C1
public import L5.t.E236S115_C2
public import L5.t.E236S115_C3
public import L5.t.E236S115_C4
public import L5.t.E236S115_C5
public import L5.t.E236S115_C6
public import L5.t.E236S115_C7
public import L5.t.E236S115_C8
public import L5.t.E236S115_C9
public import L5.t.E236S115_C10
public import L5.t.E236S115_C11
public import L5.t.E236S115_C12
public import L5.t.E236S115_C13
public import L5.t.E236S115_C14
public import L5.t.E236S115_C15
public import L5.t.E236S115_C16
public import L5.t.E236S115_C17
public import L5.t.E236S115_C18
public import L5.t.E236S115_C19
public import L5.t.E236S115_C20
public import L5.t.E236S115_C21
public import L5.t.E236S115_C22
public import L5.t.E236S115_C23
public import L5.t.E236S115_C24
public import L5.t.E236S115_C25
public import L5.t.E236S115_C26
public import L5.t.E236S115_C27
public import L5.t.E236S115_C28
public import L5.t.E236S115_C29
public import L5.t.E236S115_C30
public import L5.t.E236S115_C31
public import L5.t.E236S115_C32
public import L5.t.E236S115_C33
public import L5.t.E236S115_C34
public import L5.t.E236S115_C35
public import L5.t.E236S115_C36
public import L5.t.E236S115_C37
public import L5.t.E236S115_C38
public import L5.t.E236S115_C39
public import L5.t.E236S115_C40
public import L5.t.E236S115_C41
public import L5.t.E236S115_C42
public import L5.t.E236S115_C43
public import L5.t.E236S115_C44
public import L5.t.E236S115_C45
public import L5.t.E236S115_C46
public import L5.t.E236S115_C47
public import L5.t.E236S115_C48
public import L5.t.E236S115_C49
public import L5.t.E236S115_C50
public import L5.t.E236S115_C51
public import L5.t.E236S115_C52
public import L5.t.E236S115_C53
public import L5.t.E236S115_C54
public import L5.t.E236S115_C55
public import L5.t.E236S115_C56
public import L5.t.E236S115_C57
public import L5.t.E236S115_C58
public import L5.t.E236S115_C59
public import L5.t.E236S115_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S115
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 1953 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 1953 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 36 m0 = true :=
    chunkT_join _ _ _ 0 35 1 m0 1129 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 37 m0 = true :=
    chunkT_join _ _ _ 0 36 1 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 38 m0 = true :=
    chunkT_join _ _ _ 0 37 1 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 42 m0 = true :=
    chunkT_join _ _ _ 0 38 4 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 42 7 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 49 3 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 57 m0 = true :=
    chunkT_join _ _ _ 0 52 5 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 57 4 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 66 m0 = true :=
    chunkT_join _ _ _ 0 61 5 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 66 12 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 130 m0 = true :=
    chunkT_join _ _ _ 0 78 52 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 158 m0 = true :=
    chunkT_join _ _ _ 0 130 28 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 160 m0 = true :=
    chunkT_join _ _ _ 0 158 2 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 161 m0 = true :=
    chunkT_join _ _ _ 0 160 1 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 162 m0 = true :=
    chunkT_join _ _ _ 0 161 1 m0 1873 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 174 m0 = true :=
    chunkT_join _ _ _ 0 162 12 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 178 m0 = true :=
    chunkT_join _ _ _ 0 174 4 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 178 1 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 185 m0 = true :=
    chunkT_join _ _ _ 0 179 6 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 187 m0 = true :=
    chunkT_join _ _ _ 0 185 2 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 187 3 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 190 15 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 208 m0 = true :=
    chunkT_join _ _ _ 0 205 3 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 208 4 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 225 m0 = true :=
    chunkT_join _ _ _ 0 212 13 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 225 33 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 295 m0 = true :=
    chunkT_join _ _ _ 0 258 37 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 359 m0 = true :=
    chunkT_join _ _ _ 0 295 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 359 56 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 433 m0 = true :=
    chunkT_join _ _ _ 0 415 18 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 464 m0 = true :=
    chunkT_join _ _ _ 0 433 31 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 528 m0 = true :=
    chunkT_join _ _ _ 0 464 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 560 m0 = true :=
    chunkT_join _ _ _ 0 528 32 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 581 m0 = true :=
    chunkT_join _ _ _ 0 560 21 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 599 m0 = true :=
    chunkT_join _ _ _ 0 581 18 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 605 m0 = true :=
    chunkT_join _ _ _ 0 599 6 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 647 m0 = true :=
    chunkT_join _ _ _ 0 605 42 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 692 m0 = true :=
    chunkT_join _ _ _ 0 647 45 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 718 m0 = true :=
    chunkT_join _ _ _ 0 692 26 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 738 m0 = true :=
    chunkT_join _ _ _ 0 718 20 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 802 m0 = true :=
    chunkT_join _ _ _ 0 738 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 866 m0 = true :=
    chunkT_join _ _ _ 0 802 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 930 m0 = true :=
    chunkT_join _ _ _ 0 866 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 994 m0 = true :=
    chunkT_join _ _ _ 0 930 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 1058 m0 = true :=
    chunkT_join _ _ _ 0 994 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 1122 m0 = true :=
    chunkT_join _ _ _ 0 1058 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 1186 m0 = true :=
    chunkT_join _ _ _ 0 1122 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 1250 m0 = true :=
    chunkT_join _ _ _ 0 1186 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 1314 m0 = true :=
    chunkT_join _ _ _ 0 1250 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 1378 m0 = true :=
    chunkT_join _ _ _ 0 1314 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 1442 m0 = true :=
    chunkT_join _ _ _ 0 1378 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1506 m0 = true :=
    chunkT_join _ _ _ 0 1442 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1570 m0 = true :=
    chunkT_join _ _ _ 0 1506 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 1634 m0 = true :=
    chunkT_join _ _ _ 0 1570 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1698 m0 = true :=
    chunkT_join _ _ _ 0 1634 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1762 m0 = true :=
    chunkT_join _ _ _ 0 1698 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1826 m0 = true :=
    chunkT_join _ _ _ 0 1762 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1890 m0 = true :=
    chunkT_join _ _ _ 0 1826 64 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1953 m0 = true :=
    chunkT_join _ _ _ 0 1890 63 m0 1953 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  exact h59
/-- **the leaf has no decomposition** (nested split leaf: main record and 1953 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S115
#print axioms E236S115.leaf
