module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S18_C0
public import L5.t.E204S18_C1
public import L5.t.E204S18_C2
public import L5.t.E204S18_C3
public import L5.t.E204S18_C4
public import L5.t.E204S18_C5
public import L5.t.E204S18_C6
public import L5.t.E204S18_C7
public import L5.t.E204S18_C8
public import L5.t.E204S18_C9
public import L5.t.E204S18_C10
public import L5.t.E204S18_C11
public import L5.t.E204S18_C12
public import L5.t.E204S18_C13
public import L5.t.E204S18_C14
public import L5.t.E204S18_C15
public import L5.t.E204S18_C16
public import L5.t.E204S18_C17
public import L5.t.E204S18_C18
public import L5.t.E204S18_C19
public import L5.t.E204S18_C20
public import L5.t.E204S18_C21
public import L5.t.E204S18_C22
public import L5.t.E204S18_C23
public import L5.t.E204S18_C24
public import L5.t.E204S18_C25
public import L5.t.E204S18_C26
public import L5.t.E204S18_C27
public import L5.t.E204S18_C28
public import L5.t.E204S18_C29
public import L5.t.E204S18_C30
public import L5.t.E204S18_C31
public import L5.t.E204S18_C32
public import L5.t.E204S18_C33
public import L5.t.E204S18_C34
public import L5.t.E204S18_C35
public import L5.t.E204S18_C36
public import L5.t.E204S18_C37
public import L5.t.E204S18_C38
public import L5.t.E204S18_C39
public import L5.t.E204S18_C40
public import L5.t.E204S18_C41
public import L5.t.E204S18_C42
public import L5.t.E204S18_C43
public import L5.t.E204S18_C44
public import L5.t.E204S18_C45
public import L5.t.E204S18_C46
public import L5.t.E204S18_C47
public import L5.t.E204S18_C48
public import L5.t.E204S18_C49
public import L5.t.E204S18_C50
public import L5.t.E204S18_C51
public import L5.t.E204S18_C52
public import L5.t.E204S18_C53
public import L5.t.E204S18_C54
public import L5.t.E204S18_C55
public import L5.t.E204S18_C56
public import L5.t.E204S18_C57
public import L5.t.E204S18_C58
public import L5.t.E204S18_C59
public import L5.t.E204S18_C60
public import L5.t.E204S18_C61
public import L5.t.E204S18_C62
public import L5.t.E204S18_C63
public import L5.t.E204S18_C64
public import L5.t.E204S18_C65
public import L5.t.E204S18_C66
public import L5.t.E204S18_C67
public import L5.t.E204S18_C68
public import L5.t.E204S18_C69
public import L5.t.E204S18_C70
public import L5.t.E204S18_C71
public import L5.t.E204S18_C72
public import L5.t.E204S18_C73
public import L5.t.E204S18_C74
public import L5.t.E204S18_C75
public import L5.t.E204S18_C76
public import L5.t.E204S18_C77
public import L5.t.E204S18_C78
public import L5.t.E204S18_C79
public import L5.t.E204S18_C80
public import L5.t.E204S18_C81
public import L5.t.E204S18_C82
public import L5.t.E204S18_C83
public import L5.t.E204S18_C84
public import L5.t.E204S18_C85
public import L5.t.E204S18_C86
public import L5.t.E204S18_C87
public import L5.t.E204S18_C88
public import L5.t.E204S18_C89
public import L5.t.E204S18_C90
public import L5.t.E204S18_C91
public import L5.t.E204S18_C92
public import L5.t.E204S18_C93
public import L5.t.E204S18_C94
public import L5.t.E204S18_C95
public import L5.t.E204S18_C96
public import L5.t.E204S18_C97
public import L5.t.E204S18_C98
public import L5.t.E204S18_C99
public import L5.t.E204S18_C100
public import L5.t.E204S18_C101
public import L5.t.E204S18_C102
public import L5.t.E204S18_C103
public import L5.t.E204S18_C104
public import L5.t.E204S18_C105
public import L5.t.E204S18_C106
public import L5.t.E204S18_C107
public import L5.t.E204S18_C108
public import L5.t.E204S18_C109
public import L5.t.E204S18_C110
public import L5.t.E204S18_C111
public import L5.t.E204S18_C112
public import L5.t.E204S18_C113
public import L5.t.E204S18_C114
public import L5.t.E204S18_C115
public import L5.t.E204S18_C116
public import L5.t.E204S18_C117
public import L5.t.E204S18_C118
public import L5.t.E204S18_C119
public import L5.t.E204S18_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E204S18
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 6746 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 6746 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 3 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 4 m0 = true :=
    chunkT_join _ _ _ 0 3 1 m0 1438 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 4 21 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 25 19 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 51 m0 = true :=
    chunkT_join _ _ _ 0 44 7 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 51 1 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 52 17 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 69 4 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 99 m0 = true :=
    chunkT_join _ _ _ 0 73 26 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 103 m0 = true :=
    chunkT_join _ _ _ 0 99 4 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 121 m0 = true :=
    chunkT_join _ _ _ 0 103 18 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 121 20 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 167 m0 = true :=
    chunkT_join _ _ _ 0 141 26 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 231 m0 = true :=
    chunkT_join _ _ _ 0 167 64 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 235 m0 = true :=
    chunkT_join _ _ _ 0 231 4 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 236 m0 = true :=
    chunkT_join _ _ _ 0 235 1 m0 1452 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 238 m0 = true :=
    chunkT_join _ _ _ 0 236 2 m0 2277 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 239 m0 = true :=
    chunkT_join _ _ _ 0 238 1 m0 2277 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 248 m0 = true :=
    chunkT_join _ _ _ 0 239 9 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 248 5 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 255 m0 = true :=
    chunkT_join _ _ _ 0 253 2 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 256 m0 = true :=
    chunkT_join _ _ _ 0 255 1 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 256 2 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 262 m0 = true :=
    chunkT_join _ _ _ 0 258 4 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 264 m0 = true :=
    chunkT_join _ _ _ 0 262 2 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 265 m0 = true :=
    chunkT_join _ _ _ 0 264 1 m0 2653 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 271 m0 = true :=
    chunkT_join _ _ _ 0 265 6 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 280 m0 = true :=
    chunkT_join _ _ _ 0 271 9 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 296 m0 = true :=
    chunkT_join _ _ _ 0 280 16 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 330 m0 = true :=
    chunkT_join _ _ _ 0 296 34 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 382 m0 = true :=
    chunkT_join _ _ _ 0 330 52 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 382 2 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 384 1 m0 3015 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 385 1 m0 3739 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 388 m0 = true :=
    chunkT_join _ _ _ 0 386 2 m0 3739 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 388 1 m0 3739 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 397 m0 = true :=
    chunkT_join _ _ _ 0 389 8 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 397 5 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 402 1 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 403 1 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 406 m0 = true :=
    chunkT_join _ _ _ 0 404 2 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 407 m0 = true :=
    chunkT_join _ _ _ 0 406 1 m0 3753 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 407 3 m0 3763 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true :=
    chunkT_join _ _ _ 0 410 1 m0 3763 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 416 m0 = true :=
    chunkT_join _ _ _ 0 411 5 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 420 m0 = true :=
    chunkT_join _ _ _ 0 416 4 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 429 m0 = true :=
    chunkT_join _ _ _ 0 420 9 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 432 m0 = true :=
    chunkT_join _ _ _ 0 429 3 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 433 m0 = true :=
    chunkT_join _ _ _ 0 432 1 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 433 1 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 434 1 m0 4068 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 436 m0 = true :=
    chunkT_join _ _ _ 0 435 1 m0 4792 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 437 m0 = true :=
    chunkT_join _ _ _ 0 436 1 m0 4792 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 445 m0 = true :=
    chunkT_join _ _ _ 0 437 8 m0 5617 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 447 m0 = true :=
    chunkT_join _ _ _ 0 445 2 m0 5617 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 448 m0 = true :=
    chunkT_join _ _ _ 0 447 1 m0 5617 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 449 m0 = true :=
    chunkT_join _ _ _ 0 448 1 m0 5824 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 450 m0 = true :=
    chunkT_join _ _ _ 0 449 1 m0 5824 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 456 m0 = true :=
    chunkT_join _ _ _ 0 450 6 m0 5835 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 458 m0 = true :=
    chunkT_join _ _ _ 0 456 2 m0 5835 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 459 m0 = true :=
    chunkT_join _ _ _ 0 458 1 m0 5835 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 466 m0 = true :=
    chunkT_join _ _ _ 0 459 7 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 475 m0 = true :=
    chunkT_join _ _ _ 0 466 9 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 482 m0 = true :=
    chunkT_join _ _ _ 0 475 7 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 484 m0 = true :=
    chunkT_join _ _ _ 0 482 2 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 508 m0 = true :=
    chunkT_join _ _ _ 0 484 24 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 511 m0 = true :=
    chunkT_join _ _ _ 0 508 3 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 512 m0 = true :=
    chunkT_join _ _ _ 0 511 1 m0 5843 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 515 m0 = true :=
    chunkT_join _ _ _ 0 512 3 m0 5853 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 516 m0 = true :=
    chunkT_join _ _ _ 0 515 1 m0 5853 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 533 m0 = true :=
    chunkT_join _ _ _ 0 516 17 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 569 m0 = true :=
    chunkT_join _ _ _ 0 533 36 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 606 m0 = true :=
    chunkT_join _ _ _ 0 569 37 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 627 m0 = true :=
    chunkT_join _ _ _ 0 606 21 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 637 m0 = true :=
    chunkT_join _ _ _ 0 627 10 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 656 m0 = true :=
    chunkT_join _ _ _ 0 637 19 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 657 m0 = true :=
    chunkT_join _ _ _ 0 656 1 m0 6158 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 677 m0 = true :=
    chunkT_join _ _ _ 0 657 20 m0 6169 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 678 m0 = true :=
    chunkT_join _ _ _ 0 677 1 m0 6169 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 680 m0 = true :=
    chunkT_join _ _ _ 0 678 2 m0 6177 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 681 m0 = true :=
    chunkT_join _ _ _ 0 680 1 m0 6177 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 689 m0 = true :=
    chunkT_join _ _ _ 0 681 8 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 701 m0 = true :=
    chunkT_join _ _ _ 0 689 12 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 716 m0 = true :=
    chunkT_join _ _ _ 0 701 15 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 760 m0 = true :=
    chunkT_join _ _ _ 0 716 44 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 788 m0 = true :=
    chunkT_join _ _ _ 0 760 28 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 792 m0 = true :=
    chunkT_join _ _ _ 0 788 4 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 800 m0 = true :=
    chunkT_join _ _ _ 0 792 8 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 819 m0 = true :=
    chunkT_join _ _ _ 0 800 19 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 837 m0 = true :=
    chunkT_join _ _ _ 0 819 18 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 870 m0 = true :=
    chunkT_join _ _ _ 0 837 33 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 934 m0 = true :=
    chunkT_join _ _ _ 0 870 64 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 945 m0 = true :=
    chunkT_join _ _ _ 0 934 11 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 961 m0 = true :=
    chunkT_join _ _ _ 0 945 16 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 974 m0 = true :=
    chunkT_join _ _ _ 0 961 13 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 980 m0 = true :=
    chunkT_join _ _ _ 0 974 6 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 983 m0 = true :=
    chunkT_join _ _ _ 0 980 3 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 984 m0 = true :=
    chunkT_join _ _ _ 0 983 1 m0 6384 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 1047 m0 = true :=
    chunkT_join _ _ _ 0 984 63 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 1070 m0 = true :=
    chunkT_join _ _ _ 0 1047 23 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 1094 m0 = true :=
    chunkT_join _ _ _ 0 1070 24 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 1106 m0 = true :=
    chunkT_join _ _ _ 0 1094 12 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 1131 m0 = true :=
    chunkT_join _ _ _ 0 1106 25 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 1180 m0 = true :=
    chunkT_join _ _ _ 0 1131 49 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 1208 m0 = true :=
    chunkT_join _ _ _ 0 1180 28 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 1290 m0 = true :=
    chunkT_join _ _ _ 0 1208 82 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 1337 m0 = true :=
    chunkT_join _ _ _ 0 1290 47 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 1393 m0 = true :=
    chunkT_join _ _ _ 0 1337 56 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 1509 m0 = true :=
    chunkT_join _ _ _ 0 1393 116 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 2021 m0 = true :=
    chunkT_join _ _ _ 0 1509 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 2494 m0 = true :=
    chunkT_join _ _ _ 0 2021 473 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 3006 m0 = true :=
    chunkT_join _ _ _ 0 2494 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 3518 m0 = true :=
    chunkT_join _ _ _ 0 3006 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 4030 m0 = true :=
    chunkT_join _ _ _ 0 3518 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 4542 m0 = true :=
    chunkT_join _ _ _ 0 4030 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 5054 m0 = true :=
    chunkT_join _ _ _ 0 4542 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 5566 m0 = true :=
    chunkT_join _ _ _ 0 5054 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 6078 m0 = true :=
    chunkT_join _ _ _ 0 5566 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  have h118 : chunkT (lits.getD 0 0) paths recs 0 6590 m0 = true :=
    chunkT_join _ _ _ 0 6078 512 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h117 ok118
  have h119 : chunkT (lits.getD 0 0) paths recs 0 6746 m0 = true :=
    chunkT_join _ _ _ 0 6590 156 m0 6746 (by rw [lenR]; decide) (by decide +kernel) h118 ok119
  exact h119
/-- **the leaf has no decomposition** (nested split leaf: main record and 6746 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E204S18
#print axioms E204S18.leaf
