module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S7_C0
public import L5.t.E203S7_C1
public import L5.t.E203S7_C2
public import L5.t.E203S7_C3
public import L5.t.E203S7_C4
public import L5.t.E203S7_C5
public import L5.t.E203S7_C6
public import L5.t.E203S7_C7
public import L5.t.E203S7_C8
public import L5.t.E203S7_C9
public import L5.t.E203S7_C10
public import L5.t.E203S7_C11
public import L5.t.E203S7_C12
public import L5.t.E203S7_C13
public import L5.t.E203S7_C14
public import L5.t.E203S7_C15
public import L5.t.E203S7_C16
public import L5.t.E203S7_C17
public import L5.t.E203S7_C18
public import L5.t.E203S7_C19
public import L5.t.E203S7_C20
public import L5.t.E203S7_C21
public import L5.t.E203S7_C22
public import L5.t.E203S7_C23
public import L5.t.E203S7_C24
public import L5.t.E203S7_C25
public import L5.t.E203S7_C26
public import L5.t.E203S7_C27
public import L5.t.E203S7_C28
public import L5.t.E203S7_C29
public import L5.t.E203S7_C30
public import L5.t.E203S7_C31
public import L5.t.E203S7_C32
public import L5.t.E203S7_C33
public import L5.t.E203S7_C34
public import L5.t.E203S7_C35
public import L5.t.E203S7_C36
public import L5.t.E203S7_C37
public import L5.t.E203S7_C38
public import L5.t.E203S7_C39
public import L5.t.E203S7_C40
public import L5.t.E203S7_C41
public import L5.t.E203S7_C42
public import L5.t.E203S7_C43
public import L5.t.E203S7_C44
public import L5.t.E203S7_C45
public import L5.t.E203S7_C46
public import L5.t.E203S7_C47
public import L5.t.E203S7_C48
public import L5.t.E203S7_C49
public import L5.t.E203S7_C50
public import L5.t.E203S7_C51
public import L5.t.E203S7_C52
public import L5.t.E203S7_C53
public import L5.t.E203S7_C54
public import L5.t.E203S7_C55
public import L5.t.E203S7_C56
public import L5.t.E203S7_C57
public import L5.t.E203S7_C58
public import L5.t.E203S7_C59
public import L5.t.E203S7_C60
public import L5.t.E203S7_C61
public import L5.t.E203S7_C62
public import L5.t.E203S7_C63
public import L5.t.E203S7_C64
public import L5.t.E203S7_C65
public import L5.t.E203S7_C66
public import L5.t.E203S7_C67
public import L5.t.E203S7_C68
public import L5.t.E203S7_C69
public import L5.t.E203S7_C70
public import L5.t.E203S7_C71
public import L5.t.E203S7_C72
public import L5.t.E203S7_C73
public import L5.t.E203S7_C74
public import L5.t.E203S7_C75
public import L5.t.E203S7_C76
public import L5.t.E203S7_C77
public import L5.t.E203S7_C78
public import L5.t.E203S7_C79
public import L5.t.E203S7_C80
public import L5.t.E203S7_C81
public import L5.t.E203S7_C82
public import L5.t.E203S7_C83
public import L5.t.E203S7_C84
public import L5.t.E203S7_C85
public import L5.t.E203S7_C86
public import L5.t.E203S7_C87
public import L5.t.E203S7_C88
public import L5.t.E203S7_C89
public import L5.t.E203S7_C90
public import L5.t.E203S7_C91
public import L5.t.E203S7_C92
public import L5.t.E203S7_C93
public import L5.t.E203S7_C94
public import L5.t.E203S7_C95
public import L5.t.E203S7_C96
public import L5.t.E203S7_C97
public import L5.t.E203S7_C98
public import L5.t.E203S7_C99
public import L5.t.E203S7_C100
public import L5.t.E203S7_C101
public import L5.t.E203S7_C102
public import L5.t.E203S7_C103
public import L5.t.E203S7_C104
public import L5.t.E203S7_C105
public import L5.t.E203S7_C106
public import L5.t.E203S7_C107
public import L5.t.E203S7_C108
public import L5.t.E203S7_C109
public import L5.t.E203S7_C110
public import L5.t.E203S7_C111
public import L5.t.E203S7_C112
public import L5.t.E203S7_C113
public import L5.t.E203S7_C114
public import L5.t.E203S7_C115
public import L5.t.E203S7_C116
public import L5.t.E203S7_C117
public import L5.t.E203S7_C118
public import L5.t.E203S7_C119
public import L5.t.E203S7_C120
public import L5.t.E203S7_C121
public import L5.t.E203S7_C122
public import L5.t.E203S7_C123
public import L5.t.E203S7_C124
public import L5.t.E203S7_C125
public import L5.t.E203S7_C126
public import L5.t.E203S7_C127
public import L5.t.E203S7_C128
public import L5.t.E203S7_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E203S7
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 11258 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 11258 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 26 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 27 m0 = true :=
    chunkT_join _ _ _ 0 26 1 m0 1386 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 28 m0 = true :=
    chunkT_join _ _ _ 0 27 1 m0 1393 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 30 m0 = true :=
    chunkT_join _ _ _ 0 28 2 m0 1927 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true :=
    chunkT_join _ _ _ 0 30 1 m0 1927 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 39 m0 = true :=
    chunkT_join _ _ _ 0 31 8 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 44 m0 = true :=
    chunkT_join _ _ _ 0 39 5 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 44 1 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 45 2 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 47 1 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 48 1 m0 2390 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true :=
    chunkT_join _ _ _ 0 49 3 m0 2618 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 52 1 m0 2618 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 53 7 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 68 m0 = true :=
    chunkT_join _ _ _ 0 60 8 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 68 6 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 74 2 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 87 m0 = true :=
    chunkT_join _ _ _ 0 76 11 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 92 m0 = true :=
    chunkT_join _ _ _ 0 87 5 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 122 m0 = true :=
    chunkT_join _ _ _ 0 92 30 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 148 m0 = true :=
    chunkT_join _ _ _ 0 122 26 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 197 m0 = true :=
    chunkT_join _ _ _ 0 148 49 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 197 1 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 198 2 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 200 1 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 202 m0 = true :=
    chunkT_join _ _ _ 0 201 1 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 203 m0 = true :=
    chunkT_join _ _ _ 0 202 1 m0 2670 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 203 7 m0 5664 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 213 m0 = true :=
    chunkT_join _ _ _ 0 210 3 m0 5664 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 213 1 m0 5664 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 215 m0 = true :=
    chunkT_join _ _ _ 0 214 1 m0 5664 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 215 1 m0 5664 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 224 m0 = true :=
    chunkT_join _ _ _ 0 216 8 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 224 2 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 226 2 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 234 m0 = true :=
    chunkT_join _ _ _ 0 228 6 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 241 m0 = true :=
    chunkT_join _ _ _ 0 234 7 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 241 5 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 248 m0 = true :=
    chunkT_join _ _ _ 0 246 2 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 249 m0 = true :=
    chunkT_join _ _ _ 0 248 1 m0 6250 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 266 m0 = true :=
    chunkT_join _ _ _ 0 249 17 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 277 m0 = true :=
    chunkT_join _ _ _ 0 266 11 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 304 m0 = true :=
    chunkT_join _ _ _ 0 277 27 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 359 m0 = true :=
    chunkT_join _ _ _ 0 304 55 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 375 m0 = true :=
    chunkT_join _ _ _ 0 359 16 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 375 3 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 387 m0 = true :=
    chunkT_join _ _ _ 0 378 9 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 401 m0 = true :=
    chunkT_join _ _ _ 0 387 14 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 410 m0 = true :=
    chunkT_join _ _ _ 0 401 9 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 422 m0 = true :=
    chunkT_join _ _ _ 0 410 12 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 423 m0 = true :=
    chunkT_join _ _ _ 0 422 1 m0 6257 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 424 m0 = true :=
    chunkT_join _ _ _ 0 423 1 m0 9251 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 425 m0 = true :=
    chunkT_join _ _ _ 0 424 1 m0 9251 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 428 m0 = true :=
    chunkT_join _ _ _ 0 425 3 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 428 7 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 437 m0 = true :=
    chunkT_join _ _ _ 0 435 2 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 439 m0 = true :=
    chunkT_join _ _ _ 0 437 2 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 443 m0 = true :=
    chunkT_join _ _ _ 0 439 4 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 448 m0 = true :=
    chunkT_join _ _ _ 0 443 5 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 449 m0 = true :=
    chunkT_join _ _ _ 0 448 1 m0 9714 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 453 m0 = true :=
    chunkT_join _ _ _ 0 449 4 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 459 m0 = true :=
    chunkT_join _ _ _ 0 453 6 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 465 m0 = true :=
    chunkT_join _ _ _ 0 459 6 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 470 m0 = true :=
    chunkT_join _ _ _ 0 465 5 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 489 m0 = true :=
    chunkT_join _ _ _ 0 470 19 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 546 m0 = true :=
    chunkT_join _ _ _ 0 489 57 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 559 m0 = true :=
    chunkT_join _ _ _ 0 546 13 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 560 m0 = true :=
    chunkT_join _ _ _ 0 559 1 m0 10053 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 576 m0 = true :=
    chunkT_join _ _ _ 0 560 16 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 588 m0 = true :=
    chunkT_join _ _ _ 0 576 12 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 604 m0 = true :=
    chunkT_join _ _ _ 0 588 16 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 609 m0 = true :=
    chunkT_join _ _ _ 0 604 5 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 615 m0 = true :=
    chunkT_join _ _ _ 0 609 6 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 627 m0 = true :=
    chunkT_join _ _ _ 0 615 12 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 664 m0 = true :=
    chunkT_join _ _ _ 0 627 37 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 686 m0 = true :=
    chunkT_join _ _ _ 0 664 22 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 699 m0 = true :=
    chunkT_join _ _ _ 0 686 13 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 717 m0 = true :=
    chunkT_join _ _ _ 0 699 18 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 727 m0 = true :=
    chunkT_join _ _ _ 0 717 10 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 731 m0 = true :=
    chunkT_join _ _ _ 0 727 4 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 732 m0 = true :=
    chunkT_join _ _ _ 0 731 1 m0 10392 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 749 m0 = true :=
    chunkT_join _ _ _ 0 732 17 m0 10444 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 759 m0 = true :=
    chunkT_join _ _ _ 0 749 10 m0 10444 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 763 m0 = true :=
    chunkT_join _ _ _ 0 759 4 m0 10444 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 764 m0 = true :=
    chunkT_join _ _ _ 0 763 1 m0 10444 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 786 m0 = true :=
    chunkT_join _ _ _ 0 764 22 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 838 m0 = true :=
    chunkT_join _ _ _ 0 786 52 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 863 m0 = true :=
    chunkT_join _ _ _ 0 838 25 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 875 m0 = true :=
    chunkT_join _ _ _ 0 863 12 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 885 m0 = true :=
    chunkT_join _ _ _ 0 875 10 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 904 m0 = true :=
    chunkT_join _ _ _ 0 885 19 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 908 m0 = true :=
    chunkT_join _ _ _ 0 904 4 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 918 m0 = true :=
    chunkT_join _ _ _ 0 908 10 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 920 m0 = true :=
    chunkT_join _ _ _ 0 918 2 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 921 m0 = true :=
    chunkT_join _ _ _ 0 920 1 m0 10672 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 938 m0 = true :=
    chunkT_join _ _ _ 0 921 17 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 954 m0 = true :=
    chunkT_join _ _ _ 0 938 16 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 999 m0 = true :=
    chunkT_join _ _ _ 0 954 45 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 1013 m0 = true :=
    chunkT_join _ _ _ 0 999 14 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 1031 m0 = true :=
    chunkT_join _ _ _ 0 1013 18 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 1060 m0 = true :=
    chunkT_join _ _ _ 0 1031 29 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 1080 m0 = true :=
    chunkT_join _ _ _ 0 1060 20 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 1100 m0 = true :=
    chunkT_join _ _ _ 0 1080 20 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 1162 m0 = true :=
    chunkT_join _ _ _ 0 1100 62 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 1191 m0 = true :=
    chunkT_join _ _ _ 0 1162 29 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 1224 m0 = true :=
    chunkT_join _ _ _ 0 1191 33 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  have h106 : chunkT (lits.getD 0 0) paths recs 0 1267 m0 = true :=
    chunkT_join _ _ _ 0 1224 43 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h105 ok106
  have h107 : chunkT (lits.getD 0 0) paths recs 0 1297 m0 = true :=
    chunkT_join _ _ _ 0 1267 30 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h106 ok107
  have h108 : chunkT (lits.getD 0 0) paths recs 0 1383 m0 = true :=
    chunkT_join _ _ _ 0 1297 86 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h107 ok108
  have h109 : chunkT (lits.getD 0 0) paths recs 0 1763 m0 = true :=
    chunkT_join _ _ _ 0 1383 380 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h108 ok109
  have h110 : chunkT (lits.getD 0 0) paths recs 0 2275 m0 = true :=
    chunkT_join _ _ _ 0 1763 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h109 ok110
  have h111 : chunkT (lits.getD 0 0) paths recs 0 2787 m0 = true :=
    chunkT_join _ _ _ 0 2275 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h110 ok111
  have h112 : chunkT (lits.getD 0 0) paths recs 0 3299 m0 = true :=
    chunkT_join _ _ _ 0 2787 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h111 ok112
  have h113 : chunkT (lits.getD 0 0) paths recs 0 3811 m0 = true :=
    chunkT_join _ _ _ 0 3299 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h112 ok113
  have h114 : chunkT (lits.getD 0 0) paths recs 0 4323 m0 = true :=
    chunkT_join _ _ _ 0 3811 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h113 ok114
  have h115 : chunkT (lits.getD 0 0) paths recs 0 4835 m0 = true :=
    chunkT_join _ _ _ 0 4323 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h114 ok115
  have h116 : chunkT (lits.getD 0 0) paths recs 0 5347 m0 = true :=
    chunkT_join _ _ _ 0 4835 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h115 ok116
  have h117 : chunkT (lits.getD 0 0) paths recs 0 5859 m0 = true :=
    chunkT_join _ _ _ 0 5347 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h116 ok117
  have h118 : chunkT (lits.getD 0 0) paths recs 0 6371 m0 = true :=
    chunkT_join _ _ _ 0 5859 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h117 ok118
  have h119 : chunkT (lits.getD 0 0) paths recs 0 6883 m0 = true :=
    chunkT_join _ _ _ 0 6371 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h118 ok119
  have h120 : chunkT (lits.getD 0 0) paths recs 0 7395 m0 = true :=
    chunkT_join _ _ _ 0 6883 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h119 ok120
  have h121 : chunkT (lits.getD 0 0) paths recs 0 7907 m0 = true :=
    chunkT_join _ _ _ 0 7395 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h120 ok121
  have h122 : chunkT (lits.getD 0 0) paths recs 0 8419 m0 = true :=
    chunkT_join _ _ _ 0 7907 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h121 ok122
  have h123 : chunkT (lits.getD 0 0) paths recs 0 8931 m0 = true :=
    chunkT_join _ _ _ 0 8419 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h122 ok123
  have h124 : chunkT (lits.getD 0 0) paths recs 0 9443 m0 = true :=
    chunkT_join _ _ _ 0 8931 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h123 ok124
  have h125 : chunkT (lits.getD 0 0) paths recs 0 9955 m0 = true :=
    chunkT_join _ _ _ 0 9443 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h124 ok125
  have h126 : chunkT (lits.getD 0 0) paths recs 0 10467 m0 = true :=
    chunkT_join _ _ _ 0 9955 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h125 ok126
  have h127 : chunkT (lits.getD 0 0) paths recs 0 10979 m0 = true :=
    chunkT_join _ _ _ 0 10467 512 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h126 ok127
  have h128 : chunkT (lits.getD 0 0) paths recs 0 11258 m0 = true :=
    chunkT_join _ _ _ 0 10979 279 m0 11258 (by rw [lenR]; decide) (by decide +kernel) h127 ok128
  exact h128
/-- **the leaf has no decomposition** (nested split leaf: main record and 11258 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E203S7
#print axioms E203S7.leaf
