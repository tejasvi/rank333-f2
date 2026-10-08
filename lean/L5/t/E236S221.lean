module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S221_C0
public import L5.t.E236S221_C1
public import L5.t.E236S221_C2
public import L5.t.E236S221_C3
public import L5.t.E236S221_C4
public import L5.t.E236S221_C5
public import L5.t.E236S221_C6
public import L5.t.E236S221_C7
public import L5.t.E236S221_C8
public import L5.t.E236S221_C9
public import L5.t.E236S221_C10
public import L5.t.E236S221_C11
public import L5.t.E236S221_C12
public import L5.t.E236S221_C13
public import L5.t.E236S221_C14
public import L5.t.E236S221_C15
public import L5.t.E236S221_C16
public import L5.t.E236S221_C17
public import L5.t.E236S221_C18
public import L5.t.E236S221_C19
public import L5.t.E236S221_C20
public import L5.t.E236S221_C21
public import L5.t.E236S221_C22
public import L5.t.E236S221_C23
public import L5.t.E236S221_C24
public import L5.t.E236S221_C25
public import L5.t.E236S221_C26
public import L5.t.E236S221_C27
public import L5.t.E236S221_C28
public import L5.t.E236S221_C29
public import L5.t.E236S221_C30
public import L5.t.E236S221_C31
public import L5.t.E236S221_C32
public import L5.t.E236S221_C33
public import L5.t.E236S221_C34
public import L5.t.E236S221_C35
public import L5.t.E236S221_C36
public import L5.t.E236S221_C37
public import L5.t.E236S221_C38
public import L5.t.E236S221_C39
public import L5.t.E236S221_C40
public import L5.t.E236S221_C41
public import L5.t.E236S221_C42
public import L5.t.E236S221_C43
public import L5.t.E236S221_C44
public import L5.t.E236S221_C45
public import L5.t.E236S221_C46
public import L5.t.E236S221_C47
public import L5.t.E236S221_C48
public import L5.t.E236S221_C49
public import L5.t.E236S221_C50
public import L5.t.E236S221_C51
public import L5.t.E236S221_C52
public import L5.t.E236S221_C53
public import L5.t.E236S221_C54
public import L5.t.E236S221_C55
public import L5.t.E236S221_C56
public import L5.t.E236S221_C57
public import L5.t.E236S221_C58
public import L5.t.E236S221_C59
public import L5.t.E236S221_C60
public import L5.t.E236S221_C61
public import L5.t.E236S221_C62
public import L5.t.E236S221_C63
public import L5.t.E236S221_C64
public import L5.t.E236S221_C65
public import L5.t.E236S221_C66
public import L5.t.E236S221_C67
public import L5.t.E236S221_C68
public import L5.t.E236S221_C69
public import L5.t.E236S221_C70
public import L5.t.E236S221_C71
public import L5.t.E236S221_C72
public import L5.t.E236S221_C73
public import L5.t.E236S221_C74
public import L5.t.E236S221_C75
public import L5.t.E236S221_C76
public import L5.t.E236S221_C77
public import L5.t.E236S221_C78
public import L5.t.E236S221_C79
public import L5.t.E236S221_C80
public import L5.t.E236S221_C81
public import L5.t.E236S221_C82
public import L5.t.E236S221_C83
public import L5.t.E236S221_C84
public import L5.t.E236S221_C85
public import L5.t.E236S221_C86
public import L5.t.E236S221_C87
public import L5.t.E236S221_C88
public import L5.t.E236S221_C89
public import L5.t.E236S221_C90
public import L5.t.E236S221_C91
public import L5.t.E236S221_C92
public import L5.t.E236S221_C93
public import L5.t.E236S221_C94
public import L5.t.E236S221_C95
public import L5.t.E236S221_C96
public import L5.t.E236S221_C97
public import L5.t.E236S221_C98
public import L5.t.E236S221_C99
public import L5.t.E236S221_C100
public import L5.t.E236S221_C101
public import L5.t.E236S221_C102
public import L5.t.E236S221_C103
public import L5.t.E236S221_C104
public import L5.t.E236S221_C105
public import L5.t.E236S221_C106
public import L5.t.E236S221_C107
public import L5.t.E236S221_C108
public import L5.t.E236S221_C109
public import L5.t.E236S221_C110
public import L5.t.E236S221_C111
public import L5.t.E236S221_C112
public import L5.t.E236S221_C113
public import L5.t.E236S221_C114
public import L5.t.E236S221_C115
public import L5.t.E236S221_C116
public import L5.t.E236S221_C117
public import L5.t.E236S221_C118
public import L5.t.E236S221_C119
public import L5.t.E236S221_C120
public import L5.t.E236S221_C121
public import L5.t.E236S221_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S221
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 5353 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 5353 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 34 m0 = true :=
    chunkT_join _ _ _ 0 4 30 m0 1631 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 34 11 m0 1631 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 45 1 m0 1631 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 46 17 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 63 11 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 113 m0 = true :=
    chunkT_join _ _ _ 0 74 39 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 177 m0 = true :=
    chunkT_join _ _ _ 0 113 64 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 241 m0 = true :=
    chunkT_join _ _ _ 0 177 64 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 269 m0 = true :=
    chunkT_join _ _ _ 0 241 28 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 270 m0 = true :=
    chunkT_join _ _ _ 0 269 1 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 282 m0 = true :=
    chunkT_join _ _ _ 0 270 12 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 291 m0 = true :=
    chunkT_join _ _ _ 0 282 9 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 294 m0 = true :=
    chunkT_join _ _ _ 0 291 3 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 318 m0 = true :=
    chunkT_join _ _ _ 0 294 24 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 344 m0 = true :=
    chunkT_join _ _ _ 0 318 26 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true :=
    chunkT_join _ _ _ 0 344 54 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 462 m0 = true :=
    chunkT_join _ _ _ 0 398 64 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 526 m0 = true :=
    chunkT_join _ _ _ 0 462 64 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 527 m0 = true :=
    chunkT_join _ _ _ 0 526 1 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 528 m0 = true :=
    chunkT_join _ _ _ 0 527 1 m0 1726 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 529 m0 = true :=
    chunkT_join _ _ _ 0 528 1 m0 2656 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 530 m0 = true :=
    chunkT_join _ _ _ 0 529 1 m0 2656 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 532 m0 = true :=
    chunkT_join _ _ _ 0 530 2 m0 4386 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 538 m0 = true :=
    chunkT_join _ _ _ 0 532 6 m0 4386 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 541 m0 = true :=
    chunkT_join _ _ _ 0 538 3 m0 4386 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 542 m0 = true :=
    chunkT_join _ _ _ 0 541 1 m0 4386 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 543 m0 = true :=
    chunkT_join _ _ _ 0 542 1 m0 4386 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 545 m0 = true :=
    chunkT_join _ _ _ 0 543 2 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 551 m0 = true :=
    chunkT_join _ _ _ 0 545 6 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 553 m0 = true :=
    chunkT_join _ _ _ 0 551 2 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 554 m0 = true :=
    chunkT_join _ _ _ 0 553 1 m0 5186 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 558 m0 = true :=
    chunkT_join _ _ _ 0 554 4 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 561 m0 = true :=
    chunkT_join _ _ _ 0 558 3 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 568 m0 = true :=
    chunkT_join _ _ _ 0 561 7 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 571 m0 = true :=
    chunkT_join _ _ _ 0 568 3 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 591 m0 = true :=
    chunkT_join _ _ _ 0 571 20 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 626 m0 = true :=
    chunkT_join _ _ _ 0 591 35 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 655 m0 = true :=
    chunkT_join _ _ _ 0 626 29 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 719 m0 = true :=
    chunkT_join _ _ _ 0 655 64 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 761 m0 = true :=
    chunkT_join _ _ _ 0 719 42 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 762 m0 = true :=
    chunkT_join _ _ _ 0 761 1 m0 5275 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 779 m0 = true :=
    chunkT_join _ _ _ 0 762 17 m0 5314 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 784 m0 = true :=
    chunkT_join _ _ _ 0 779 5 m0 5314 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 785 m0 = true :=
    chunkT_join _ _ _ 0 784 1 m0 5314 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 788 m0 = true :=
    chunkT_join _ _ _ 0 785 3 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 790 m0 = true :=
    chunkT_join _ _ _ 0 788 2 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 828 m0 = true :=
    chunkT_join _ _ _ 0 790 38 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 855 m0 = true :=
    chunkT_join _ _ _ 0 828 27 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 862 m0 = true :=
    chunkT_join _ _ _ 0 855 7 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 903 m0 = true :=
    chunkT_join _ _ _ 0 862 41 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 967 m0 = true :=
    chunkT_join _ _ _ 0 903 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1031 m0 = true :=
    chunkT_join _ _ _ 0 967 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1095 m0 = true :=
    chunkT_join _ _ _ 0 1031 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 1153 m0 = true :=
    chunkT_join _ _ _ 0 1095 58 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1188 m0 = true :=
    chunkT_join _ _ _ 0 1153 35 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1252 m0 = true :=
    chunkT_join _ _ _ 0 1188 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1316 m0 = true :=
    chunkT_join _ _ _ 0 1252 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1380 m0 = true :=
    chunkT_join _ _ _ 0 1316 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1444 m0 = true :=
    chunkT_join _ _ _ 0 1380 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 1508 m0 = true :=
    chunkT_join _ _ _ 0 1444 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 1572 m0 = true :=
    chunkT_join _ _ _ 0 1508 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 1636 m0 = true :=
    chunkT_join _ _ _ 0 1572 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 1700 m0 = true :=
    chunkT_join _ _ _ 0 1636 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 1764 m0 = true :=
    chunkT_join _ _ _ 0 1700 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 1828 m0 = true :=
    chunkT_join _ _ _ 0 1764 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 1892 m0 = true :=
    chunkT_join _ _ _ 0 1828 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 1956 m0 = true :=
    chunkT_join _ _ _ 0 1892 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 2020 m0 = true :=
    chunkT_join _ _ _ 0 1956 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 2084 m0 = true :=
    chunkT_join _ _ _ 0 2020 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 2148 m0 = true :=
    chunkT_join _ _ _ 0 2084 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2212 m0 = true :=
    chunkT_join _ _ _ 0 2148 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2276 m0 = true :=
    chunkT_join _ _ _ 0 2212 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2340 m0 = true :=
    chunkT_join _ _ _ 0 2276 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2404 m0 = true :=
    chunkT_join _ _ _ 0 2340 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 2468 m0 = true :=
    chunkT_join _ _ _ 0 2404 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 2532 m0 = true :=
    chunkT_join _ _ _ 0 2468 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 2596 m0 = true :=
    chunkT_join _ _ _ 0 2532 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2660 m0 = true :=
    chunkT_join _ _ _ 0 2596 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 2724 m0 = true :=
    chunkT_join _ _ _ 0 2660 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 2788 m0 = true :=
    chunkT_join _ _ _ 0 2724 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 2852 m0 = true :=
    chunkT_join _ _ _ 0 2788 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 2916 m0 = true :=
    chunkT_join _ _ _ 0 2852 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 2980 m0 = true :=
    chunkT_join _ _ _ 0 2916 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 3044 m0 = true :=
    chunkT_join _ _ _ 0 2980 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 3108 m0 = true :=
    chunkT_join _ _ _ 0 3044 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 3172 m0 = true :=
    chunkT_join _ _ _ 0 3108 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 3236 m0 = true :=
    chunkT_join _ _ _ 0 3172 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 3300 m0 = true :=
    chunkT_join _ _ _ 0 3236 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 3364 m0 = true :=
    chunkT_join _ _ _ 0 3300 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 3428 m0 = true :=
    chunkT_join _ _ _ 0 3364 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 3492 m0 = true :=
    chunkT_join _ _ _ 0 3428 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 3556 m0 = true :=
    chunkT_join _ _ _ 0 3492 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 3620 m0 = true :=
    chunkT_join _ _ _ 0 3556 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 3684 m0 = true :=
    chunkT_join _ _ _ 0 3620 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 3748 m0 = true :=
    chunkT_join _ _ _ 0 3684 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 3812 m0 = true :=
    chunkT_join _ _ _ 0 3748 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 3876 m0 = true :=
    chunkT_join _ _ _ 0 3812 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 3940 m0 = true :=
    chunkT_join _ _ _ 0 3876 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 4004 m0 = true :=
    chunkT_join _ _ _ 0 3940 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 4068 m0 = true :=
    chunkT_join _ _ _ 0 4004 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 4132 m0 = true :=
    chunkT_join _ _ _ 0 4068 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 4196 m0 = true :=
    chunkT_join _ _ _ 0 4132 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 4260 m0 = true :=
    chunkT_join _ _ _ 0 4196 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 4324 m0 = true :=
    chunkT_join _ _ _ 0 4260 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 4388 m0 = true :=
    chunkT_join _ _ _ 0 4324 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 4452 m0 = true :=
    chunkT_join _ _ _ 0 4388 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 4516 m0 = true :=
    chunkT_join _ _ _ 0 4452 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 4580 m0 = true :=
    chunkT_join _ _ _ 0 4516 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 4644 m0 = true :=
    chunkT_join _ _ _ 0 4580 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 4708 m0 = true :=
    chunkT_join _ _ _ 0 4644 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 4772 m0 = true :=
    chunkT_join _ _ _ 0 4708 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 4836 m0 = true :=
    chunkT_join _ _ _ 0 4772 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 4900 m0 = true :=
    chunkT_join _ _ _ 0 4836 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 4964 m0 = true :=
    chunkT_join _ _ _ 0 4900 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 5028 m0 = true :=
    chunkT_join _ _ _ 0 4964 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 5092 m0 = true :=
    chunkT_join _ _ _ 0 5028 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 5156 m0 = true :=
    chunkT_join _ _ _ 0 5092 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  have h118 : chunkT (lits.getD 0 0) paths recs 0 5220 m0 = true :=
    chunkT_join _ _ _ 0 5156 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h117 ok118
  have h119 : chunkT (lits.getD 0 0) paths recs 0 5284 m0 = true :=
    chunkT_join _ _ _ 0 5220 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h118 ok119
  have h120 : chunkT (lits.getD 0 0) paths recs 0 5348 m0 = true :=
    chunkT_join _ _ _ 0 5284 64 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h119 ok120
  have h121 : chunkT (lits.getD 0 0) paths recs 0 5353 m0 = true :=
    chunkT_join _ _ _ 0 5348 5 m0 5353 (by rw [lenR]; decide) (by decide +kernel) h120 ok121
  exact h121
/-- **the leaf has no decomposition** (nested split leaf: main record and 5353 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S221
#print axioms E236S221.leaf
