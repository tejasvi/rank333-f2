module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S13_C0
public import L5.t.E203S13_C1
public import L5.t.E203S13_C2
public import L5.t.E203S13_C3
public import L5.t.E203S13_C4
public import L5.t.E203S13_C5
public import L5.t.E203S13_C6
public import L5.t.E203S13_C7
public import L5.t.E203S13_C8
public import L5.t.E203S13_C9
public import L5.t.E203S13_C10
public import L5.t.E203S13_C11
public import L5.t.E203S13_C12
public import L5.t.E203S13_C13
public import L5.t.E203S13_C14
public import L5.t.E203S13_C15
public import L5.t.E203S13_C16
public import L5.t.E203S13_C17
public import L5.t.E203S13_C18
public import L5.t.E203S13_C19
public import L5.t.E203S13_C20
public import L5.t.E203S13_C21
public import L5.t.E203S13_C22
public import L5.t.E203S13_C23
public import L5.t.E203S13_C24
public import L5.t.E203S13_C25
public import L5.t.E203S13_C26
public import L5.t.E203S13_C27
public import L5.t.E203S13_C28
public import L5.t.E203S13_C29
public import L5.t.E203S13_C30
public import L5.t.E203S13_C31
public import L5.t.E203S13_C32
public import L5.t.E203S13_C33
public import L5.t.E203S13_C34
public import L5.t.E203S13_C35
public import L5.t.E203S13_C36
public import L5.t.E203S13_C37
public import L5.t.E203S13_C38
public import L5.t.E203S13_C39
public import L5.t.E203S13_C40
public import L5.t.E203S13_C41
public import L5.t.E203S13_C42
public import L5.t.E203S13_C43
public import L5.t.E203S13_C44
public import L5.t.E203S13_C45
public import L5.t.E203S13_C46
public import L5.t.E203S13_C47
public import L5.t.E203S13_C48
public import L5.t.E203S13_C49
public import L5.t.E203S13_C50
public import L5.t.E203S13_C51
public import L5.t.E203S13_C52
public import L5.t.E203S13_C53
public import L5.t.E203S13_C54
public import L5.t.E203S13_C55
public import L5.t.E203S13_C56
public import L5.t.E203S13_C57
public import L5.t.E203S13_C58
public import L5.t.E203S13_C59
public import L5.t.E203S13_C60
public import L5.t.E203S13_C61
public import L5.t.E203S13_C62
public import L5.t.E203S13_C63
public import L5.t.E203S13_C64
public import L5.t.E203S13_C65
public import L5.t.E203S13_C66
public import L5.t.E203S13_C67
public import L5.t.E203S13_C68
public import L5.t.E203S13_C69
public import L5.t.E203S13_C70
public import L5.t.E203S13_C71
public import L5.t.E203S13_C72
public import L5.t.E203S13_C73
public import L5.t.E203S13_C74
public import L5.t.E203S13_C75
public import L5.t.E203S13_C76
public import L5.t.E203S13_C77
public import L5.t.E203S13_C78
public import L5.t.E203S13_C79
public import L5.t.E203S13_C80
public import L5.t.E203S13_C81
public import L5.t.E203S13_C82
public import L5.t.E203S13_C83
public import L5.t.E203S13_C84
public import L5.t.E203S13_C85
public import L5.t.E203S13_C86
public import L5.t.E203S13_C87
public import L5.t.E203S13_C88
public import L5.t.E203S13_C89
public import L5.t.E203S13_C90
public import L5.t.E203S13_C91
public import L5.t.E203S13_C92
public import L5.t.E203S13_C93
public import L5.t.E203S13_C94
public import L5.t.E203S13_C95
public import L5.t.E203S13_C96
public import L5.t.E203S13_C97
public import L5.t.E203S13_C98
public import L5.t.E203S13_C99
public import L5.t.E203S13_C100
public import L5.t.E203S13_C101
public import L5.t.E203S13_C102
public import L5.t.E203S13_C103
public import L5.t.E203S13_C104
public import L5.t.E203S13_C105
public import L5.t.E203S13_C106
public import L5.t.E203S13_C107
public import L5.t.E203S13_C108
public import L5.t.E203S13_C109
public import L5.t.E203S13_C110
public import L5.t.E203S13_C111
public import L5.t.E203S13_C112
public import L5.t.E203S13_C113
public import L5.t.E203S13_C114
public import L5.t.E203S13_C115
public import L5.t.E203S13_C116
public import L5.t.E203S13_C117
public import L5.t.E203S13_C118
public import L5.t.E203S13_C119
public import L5.t.E203S13_C120
public import L5.t.E203S13_C121
public import L5.t.E203S13_C122
public import L5.t.E203S13_C123
public import L5.t.E203S13_C124
public import L5.t.E203S13_C125
public import L5.t.E203S13_C126
public import L5.t.E203S13_C127
public import L5.t.E203S13_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S13
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 11258 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 11258 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 26 1 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 35 m0 = true :=
    chunkT_join _ _ _ 0 27 8 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 35 10 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 55 m0 = true :=
    chunkT_join _ _ _ 0 45 10 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 55 19 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 74 2 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 77 m0 = true :=
    chunkT_join _ _ _ 0 76 1 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 77 1 m0 4380 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 79 m0 = true :=
    chunkT_join _ _ _ 0 78 1 m0 4380 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 79 8 m0 4843 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 89 m0 = true :=
    chunkT_join _ _ _ 0 87 2 m0 4843 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 90 m0 = true :=
    chunkT_join _ _ _ 0 89 1 m0 4843 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 90 2 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 98 m0 = true :=
    chunkT_join _ _ _ 0 92 6 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 100 m0 = true :=
    chunkT_join _ _ _ 0 98 2 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 104 m0 = true :=
    chunkT_join _ _ _ 0 100 4 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 112 m0 = true :=
    chunkT_join _ _ _ 0 104 8 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 118 m0 = true :=
    chunkT_join _ _ _ 0 112 6 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 141 m0 = true :=
    chunkT_join _ _ _ 0 118 23 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 141 38 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 209 m0 = true :=
    chunkT_join _ _ _ 0 179 30 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 209 1 m0 5182 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 211 m0 = true :=
    chunkT_join _ _ _ 0 210 1 m0 5645 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 211 1 m0 5645 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 213 m0 = true :=
    chunkT_join _ _ _ 0 212 1 m0 5652 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 220 m0 = true :=
    chunkT_join _ _ _ 0 213 7 m0 6186 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 220 6 m0 6186 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 229 m0 = true :=
    chunkT_join _ _ _ 0 226 3 m0 6186 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 230 m0 = true :=
    chunkT_join _ _ _ 0 229 1 m0 6186 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 231 m0 = true :=
    chunkT_join _ _ _ 0 230 1 m0 6238 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 236 m0 = true :=
    chunkT_join _ _ _ 0 231 5 m0 6238 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 238 m0 = true :=
    chunkT_join _ _ _ 0 236 2 m0 6238 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 239 m0 = true :=
    chunkT_join _ _ _ 0 238 1 m0 6238 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 245 m0 = true :=
    chunkT_join _ _ _ 0 239 6 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 253 m0 = true :=
    chunkT_join _ _ _ 0 245 8 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 259 m0 = true :=
    chunkT_join _ _ _ 0 253 6 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 261 m0 = true :=
    chunkT_join _ _ _ 0 259 2 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 277 m0 = true :=
    chunkT_join _ _ _ 0 261 16 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 288 m0 = true :=
    chunkT_join _ _ _ 0 277 11 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 321 m0 = true :=
    chunkT_join _ _ _ 0 288 33 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 362 m0 = true :=
    chunkT_join _ _ _ 0 321 41 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 379 m0 = true :=
    chunkT_join _ _ _ 0 362 17 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 380 m0 = true :=
    chunkT_join _ _ _ 0 379 1 m0 6466 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 381 m0 = true :=
    chunkT_join _ _ _ 0 380 1 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 383 m0 = true :=
    chunkT_join _ _ _ 0 381 2 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 383 2 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 392 m0 = true :=
    chunkT_join _ _ _ 0 385 7 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 397 m0 = true :=
    chunkT_join _ _ _ 0 392 5 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 398 m0 = true :=
    chunkT_join _ _ _ 0 397 1 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 400 m0 = true :=
    chunkT_join _ _ _ 0 398 2 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 400 2 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 402 2 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 405 m0 = true :=
    chunkT_join _ _ _ 0 404 1 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 406 m0 = true :=
    chunkT_join _ _ _ 0 405 1 m0 9460 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 411 m0 = true :=
    chunkT_join _ _ _ 0 406 5 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 415 m0 = true :=
    chunkT_join _ _ _ 0 411 4 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 415 8 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 428 m0 = true :=
    chunkT_join _ _ _ 0 423 5 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 431 m0 = true :=
    chunkT_join _ _ _ 0 428 3 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 432 m0 = true :=
    chunkT_join _ _ _ 0 431 1 m0 10046 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 455 m0 = true :=
    chunkT_join _ _ _ 0 432 23 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 476 m0 = true :=
    chunkT_join _ _ _ 0 455 21 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 504 m0 = true :=
    chunkT_join _ _ _ 0 476 28 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 555 m0 = true :=
    chunkT_join _ _ _ 0 504 51 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 557 m0 = true :=
    chunkT_join _ _ _ 0 555 2 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 576 m0 = true :=
    chunkT_join _ _ _ 0 557 19 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 579 m0 = true :=
    chunkT_join _ _ _ 0 576 3 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 580 m0 = true :=
    chunkT_join _ _ _ 0 579 1 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true :=
    chunkT_join _ _ _ 0 580 8 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 600 m0 = true :=
    chunkT_join _ _ _ 0 588 12 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 615 m0 = true :=
    chunkT_join _ _ _ 0 600 15 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 664 m0 = true :=
    chunkT_join _ _ _ 0 615 49 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 687 m0 = true :=
    chunkT_join _ _ _ 0 664 23 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 690 m0 = true :=
    chunkT_join _ _ _ 0 687 3 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 697 m0 = true :=
    chunkT_join _ _ _ 0 690 7 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 715 m0 = true :=
    chunkT_join _ _ _ 0 697 18 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 729 m0 = true :=
    chunkT_join _ _ _ 0 715 14 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 751 m0 = true :=
    chunkT_join _ _ _ 0 729 22 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 804 m0 = true :=
    chunkT_join _ _ _ 0 751 53 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 830 m0 = true :=
    chunkT_join _ _ _ 0 804 26 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 841 m0 = true :=
    chunkT_join _ _ _ 0 830 11 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 856 m0 = true :=
    chunkT_join _ _ _ 0 841 15 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 868 m0 = true :=
    chunkT_join _ _ _ 0 856 12 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 872 m0 = true :=
    chunkT_join _ _ _ 0 868 4 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 873 m0 = true :=
    chunkT_join _ _ _ 0 872 1 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 878 m0 = true :=
    chunkT_join _ _ _ 0 873 5 m0 10620 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 879 m0 = true :=
    chunkT_join _ _ _ 0 878 1 m0 10620 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 943 m0 = true :=
    chunkT_join _ _ _ 0 879 64 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 965 m0 = true :=
    chunkT_join _ _ _ 0 943 22 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 987 m0 = true :=
    chunkT_join _ _ _ 0 965 22 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 1001 m0 = true :=
    chunkT_join _ _ _ 0 987 14 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 1003 m0 = true :=
    chunkT_join _ _ _ 0 1001 2 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 1005 m0 = true :=
    chunkT_join _ _ _ 0 1003 2 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 1021 m0 = true :=
    chunkT_join _ _ _ 0 1005 16 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 1031 m0 = true :=
    chunkT_join _ _ _ 0 1021 10 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 1032 m0 = true :=
    chunkT_join _ _ _ 0 1031 1 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 1035 m0 = true :=
    chunkT_join _ _ _ 0 1032 3 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 1040 m0 = true :=
    chunkT_join _ _ _ 0 1035 5 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 1062 m0 = true :=
    chunkT_join _ _ _ 0 1040 22 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 1113 m0 = true :=
    chunkT_join _ _ _ 0 1062 51 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 1139 m0 = true :=
    chunkT_join _ _ _ 0 1113 26 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 1148 m0 = true :=
    chunkT_join _ _ _ 0 1139 9 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 1176 m0 = true :=
    chunkT_join _ _ _ 0 1148 28 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 1201 m0 = true :=
    chunkT_join _ _ _ 0 1176 25 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 1260 m0 = true :=
    chunkT_join _ _ _ 0 1201 59 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 1298 m0 = true :=
    chunkT_join _ _ _ 0 1260 38 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 1342 m0 = true :=
    chunkT_join _ _ _ 0 1298 44 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 1854 m0 = true :=
    chunkT_join _ _ _ 0 1342 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 2366 m0 = true :=
    chunkT_join _ _ _ 0 1854 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 2878 m0 = true :=
    chunkT_join _ _ _ 0 2366 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 3390 m0 = true :=
    chunkT_join _ _ _ 0 2878 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 3902 m0 = true :=
    chunkT_join _ _ _ 0 3390 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 4414 m0 = true :=
    chunkT_join _ _ _ 0 3902 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 4926 m0 = true :=
    chunkT_join _ _ _ 0 4414 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 5438 m0 = true :=
    chunkT_join _ _ _ 0 4926 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 5924 m0 = true :=
    chunkT_join _ _ _ 0 5438 486 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 6436 m0 = true :=
    chunkT_join _ _ _ 0 5924 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  have h118 : chunkT (lits.getD 0 0) paths recs 0 6948 m0 = true :=
    chunkT_join _ _ _ 0 6436 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h117 ok118
  have h119 : chunkT (lits.getD 0 0) paths recs 0 7460 m0 = true :=
    chunkT_join _ _ _ 0 6948 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h118 ok119
  have h120 : chunkT (lits.getD 0 0) paths recs 0 7972 m0 = true :=
    chunkT_join _ _ _ 0 7460 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h119 ok120
  have h121 : chunkT (lits.getD 0 0) paths recs 0 8484 m0 = true :=
    chunkT_join _ _ _ 0 7972 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h120 ok121
  have h122 : chunkT (lits.getD 0 0) paths recs 0 8996 m0 = true :=
    chunkT_join _ _ _ 0 8484 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h121 ok122
  have h123 : chunkT (lits.getD 0 0) paths recs 0 9508 m0 = true :=
    chunkT_join _ _ _ 0 8996 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h122 ok123
  have h124 : chunkT (lits.getD 0 0) paths recs 0 10020 m0 = true :=
    chunkT_join _ _ _ 0 9508 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h123 ok124
  have h125 : chunkT (lits.getD 0 0) paths recs 0 10532 m0 = true :=
    chunkT_join _ _ _ 0 10020 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h124 ok125
  have h126 : chunkT (lits.getD 0 0) paths recs 0 11044 m0 = true :=
    chunkT_join _ _ _ 0 10532 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h125 ok126
  have h127 : chunkT (lits.getD 0 0) paths recs 0 11258 m0 = true :=
    chunkT_join _ _ _ 0 11044 214 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h126 ok127
  exact h127
/-- **the leaf has no decomposition** (nested split leaf: main record and 11258 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S13
#print axioms E203S13.leaf
