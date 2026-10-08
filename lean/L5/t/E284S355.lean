module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S355_C0
public import L5.t.E284S355_C1
public import L5.t.E284S355_C2
public import L5.t.E284S355_C3
public import L5.t.E284S355_C4
public import L5.t.E284S355_C5
public import L5.t.E284S355_C6
public import L5.t.E284S355_C7
public import L5.t.E284S355_C8
public import L5.t.E284S355_C9
public import L5.t.E284S355_C10
public import L5.t.E284S355_C11
public import L5.t.E284S355_C12
public import L5.t.E284S355_C13
public import L5.t.E284S355_C14
public import L5.t.E284S355_C15
public import L5.t.E284S355_C16
public import L5.t.E284S355_C17
public import L5.t.E284S355_C18
public import L5.t.E284S355_C19
public import L5.t.E284S355_C20
public import L5.t.E284S355_C21
public import L5.t.E284S355_C22
public import L5.t.E284S355_C23
public import L5.t.E284S355_C24
public import L5.t.E284S355_C25
public import L5.t.E284S355_C26
public import L5.t.E284S355_C27
public import L5.t.E284S355_C28
public import L5.t.E284S355_C29
public import L5.t.E284S355_C30
public import L5.t.E284S355_C31
public import L5.t.E284S355_C32
public import L5.t.E284S355_C33
public import L5.t.E284S355_C34
public import L5.t.E284S355_C35
public import L5.t.E284S355_C36
public import L5.t.E284S355_C37
public import L5.t.E284S355_C38
public import L5.t.E284S355_C39
public import L5.t.E284S355_C40
public import L5.t.E284S355_C41
public import L5.t.E284S355_C42
public import L5.t.E284S355_C43
public import L5.t.E284S355_C44
public import L5.t.E284S355_C45
public import L5.t.E284S355_C46
public import L5.t.E284S355_C47
public import L5.t.E284S355_C48
public import L5.t.E284S355_C49
public import L5.t.E284S355_C50
public import L5.t.E284S355_C51
public import L5.t.E284S355_C52
public import L5.t.E284S355_C53
public import L5.t.E284S355_C54
public import L5.t.E284S355_C55
public import L5.t.E284S355_C56
public import L5.t.E284S355_C57
public import L5.t.E284S355_C58
public import L5.t.E284S355_C59
public import L5.t.E284S355_C60
public import L5.t.E284S355_C61
public import L5.t.E284S355_C62
public import L5.t.E284S355_C63
public import L5.t.E284S355_C64
public import L5.t.E284S355_C65
public import L5.t.E284S355_C66
public import L5.t.E284S355_C67
public import L5.t.E284S355_C68
public import L5.t.E284S355_C69
public import L5.t.E284S355_C70
public import L5.t.E284S355_C71
public import L5.t.E284S355_C72
public import L5.t.E284S355_C73
public import L5.t.E284S355_C74
public import L5.t.E284S355_C75
public import L5.t.E284S355_C76
public import L5.t.E284S355_C77
public import L5.t.E284S355_C78
public import L5.t.E284S355_C79
public import L5.t.E284S355_C80
public import L5.t.E284S355_C81
public import L5.t.E284S355_C82
public import L5.t.E284S355_C83
public import L5.t.E284S355_C84
public import L5.t.E284S355_C85
public import L5.t.E284S355_C86
public import L5.t.E284S355_C87
public import L5.t.E284S355_C88
public import L5.t.E284S355_C89
public import L5.t.E284S355_C90
public import L5.t.E284S355_C91
public import L5.t.E284S355_C92
public import L5.t.E284S355_C93
public import L5.t.E284S355_C94
public import L5.t.E284S355_C95
public import L5.t.E284S355_C96
public import L5.t.E284S355_C97
public import L5.t.E284S355_C98
public import L5.t.E284S355_C99
public import L5.t.E284S355_C100
public import L5.t.E284S355_C101
public import L5.t.E284S355_C102
public import L5.t.E284S355_C103
public import L5.t.E284S355_C104
public import L5.t.E284S355_C105
public import L5.t.E284S355_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S355
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 5941 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 5941 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 14 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 54 m0 = true :=
    chunkT_join _ _ _ 0 14 40 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 118 m0 = true :=
    chunkT_join _ _ _ 0 54 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 182 m0 = true :=
    chunkT_join _ _ _ 0 118 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 182 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 303 m0 = true :=
    chunkT_join _ _ _ 0 246 57 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 367 m0 = true :=
    chunkT_join _ _ _ 0 303 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 400 m0 = true :=
    chunkT_join _ _ _ 0 367 33 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 434 m0 = true :=
    chunkT_join _ _ _ 0 400 34 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 435 m0 = true :=
    chunkT_join _ _ _ 0 434 1 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 441 m0 = true :=
    chunkT_join _ _ _ 0 435 6 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 447 m0 = true :=
    chunkT_join _ _ _ 0 441 6 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 454 m0 = true :=
    chunkT_join _ _ _ 0 447 7 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 461 m0 = true :=
    chunkT_join _ _ _ 0 454 7 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 471 m0 = true :=
    chunkT_join _ _ _ 0 461 10 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 483 m0 = true :=
    chunkT_join _ _ _ 0 471 12 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 497 m0 = true :=
    chunkT_join _ _ _ 0 483 14 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 499 m0 = true :=
    chunkT_join _ _ _ 0 497 2 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 510 m0 = true :=
    chunkT_join _ _ _ 0 499 11 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 547 m0 = true :=
    chunkT_join _ _ _ 0 510 37 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 586 m0 = true :=
    chunkT_join _ _ _ 0 547 39 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 618 m0 = true :=
    chunkT_join _ _ _ 0 586 32 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 663 m0 = true :=
    chunkT_join _ _ _ 0 618 45 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 727 m0 = true :=
    chunkT_join _ _ _ 0 663 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 791 m0 = true :=
    chunkT_join _ _ _ 0 727 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 841 m0 = true :=
    chunkT_join _ _ _ 0 791 50 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 905 m0 = true :=
    chunkT_join _ _ _ 0 841 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 969 m0 = true :=
    chunkT_join _ _ _ 0 905 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1033 m0 = true :=
    chunkT_join _ _ _ 0 969 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1097 m0 = true :=
    chunkT_join _ _ _ 0 1033 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1161 m0 = true :=
    chunkT_join _ _ _ 0 1097 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1225 m0 = true :=
    chunkT_join _ _ _ 0 1161 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1289 m0 = true :=
    chunkT_join _ _ _ 0 1225 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1353 m0 = true :=
    chunkT_join _ _ _ 0 1289 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1417 m0 = true :=
    chunkT_join _ _ _ 0 1353 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1481 m0 = true :=
    chunkT_join _ _ _ 0 1417 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1545 m0 = true :=
    chunkT_join _ _ _ 0 1481 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1609 m0 = true :=
    chunkT_join _ _ _ 0 1545 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1673 m0 = true :=
    chunkT_join _ _ _ 0 1609 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1737 m0 = true :=
    chunkT_join _ _ _ 0 1673 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1801 m0 = true :=
    chunkT_join _ _ _ 0 1737 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1865 m0 = true :=
    chunkT_join _ _ _ 0 1801 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1929 m0 = true :=
    chunkT_join _ _ _ 0 1865 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 1993 m0 = true :=
    chunkT_join _ _ _ 0 1929 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 2057 m0 = true :=
    chunkT_join _ _ _ 0 1993 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2121 m0 = true :=
    chunkT_join _ _ _ 0 2057 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2185 m0 = true :=
    chunkT_join _ _ _ 0 2121 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2249 m0 = true :=
    chunkT_join _ _ _ 0 2185 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2313 m0 = true :=
    chunkT_join _ _ _ 0 2249 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 2377 m0 = true :=
    chunkT_join _ _ _ 0 2313 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 2441 m0 = true :=
    chunkT_join _ _ _ 0 2377 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 2505 m0 = true :=
    chunkT_join _ _ _ 0 2441 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 2569 m0 = true :=
    chunkT_join _ _ _ 0 2505 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 2633 m0 = true :=
    chunkT_join _ _ _ 0 2569 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 2697 m0 = true :=
    chunkT_join _ _ _ 0 2633 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 2761 m0 = true :=
    chunkT_join _ _ _ 0 2697 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 2825 m0 = true :=
    chunkT_join _ _ _ 0 2761 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 2889 m0 = true :=
    chunkT_join _ _ _ 0 2825 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 2953 m0 = true :=
    chunkT_join _ _ _ 0 2889 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 3017 m0 = true :=
    chunkT_join _ _ _ 0 2953 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 3081 m0 = true :=
    chunkT_join _ _ _ 0 3017 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 3145 m0 = true :=
    chunkT_join _ _ _ 0 3081 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 3209 m0 = true :=
    chunkT_join _ _ _ 0 3145 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 3273 m0 = true :=
    chunkT_join _ _ _ 0 3209 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 3337 m0 = true :=
    chunkT_join _ _ _ 0 3273 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 3401 m0 = true :=
    chunkT_join _ _ _ 0 3337 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 3465 m0 = true :=
    chunkT_join _ _ _ 0 3401 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 3529 m0 = true :=
    chunkT_join _ _ _ 0 3465 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 3593 m0 = true :=
    chunkT_join _ _ _ 0 3529 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 3657 m0 = true :=
    chunkT_join _ _ _ 0 3593 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 3721 m0 = true :=
    chunkT_join _ _ _ 0 3657 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 3785 m0 = true :=
    chunkT_join _ _ _ 0 3721 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 3849 m0 = true :=
    chunkT_join _ _ _ 0 3785 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 3913 m0 = true :=
    chunkT_join _ _ _ 0 3849 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 3977 m0 = true :=
    chunkT_join _ _ _ 0 3913 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 4041 m0 = true :=
    chunkT_join _ _ _ 0 3977 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 4105 m0 = true :=
    chunkT_join _ _ _ 0 4041 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 4169 m0 = true :=
    chunkT_join _ _ _ 0 4105 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 4233 m0 = true :=
    chunkT_join _ _ _ 0 4169 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 4297 m0 = true :=
    chunkT_join _ _ _ 0 4233 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 4361 m0 = true :=
    chunkT_join _ _ _ 0 4297 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 4425 m0 = true :=
    chunkT_join _ _ _ 0 4361 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 4489 m0 = true :=
    chunkT_join _ _ _ 0 4425 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 4553 m0 = true :=
    chunkT_join _ _ _ 0 4489 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 4617 m0 = true :=
    chunkT_join _ _ _ 0 4553 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 4681 m0 = true :=
    chunkT_join _ _ _ 0 4617 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 4745 m0 = true :=
    chunkT_join _ _ _ 0 4681 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 4809 m0 = true :=
    chunkT_join _ _ _ 0 4745 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 4873 m0 = true :=
    chunkT_join _ _ _ 0 4809 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 4937 m0 = true :=
    chunkT_join _ _ _ 0 4873 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 5001 m0 = true :=
    chunkT_join _ _ _ 0 4937 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 5065 m0 = true :=
    chunkT_join _ _ _ 0 5001 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 5129 m0 = true :=
    chunkT_join _ _ _ 0 5065 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 5193 m0 = true :=
    chunkT_join _ _ _ 0 5129 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 5257 m0 = true :=
    chunkT_join _ _ _ 0 5193 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 5321 m0 = true :=
    chunkT_join _ _ _ 0 5257 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 5385 m0 = true :=
    chunkT_join _ _ _ 0 5321 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 5449 m0 = true :=
    chunkT_join _ _ _ 0 5385 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 5513 m0 = true :=
    chunkT_join _ _ _ 0 5449 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 5577 m0 = true :=
    chunkT_join _ _ _ 0 5513 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 5641 m0 = true :=
    chunkT_join _ _ _ 0 5577 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 5705 m0 = true :=
    chunkT_join _ _ _ 0 5641 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 5769 m0 = true :=
    chunkT_join _ _ _ 0 5705 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 5833 m0 = true :=
    chunkT_join _ _ _ 0 5769 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 5897 m0 = true :=
    chunkT_join _ _ _ 0 5833 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 5941 m0 = true :=
    chunkT_join _ _ _ 0 5897 44 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  exact h105
/-- **the leaf has no decomposition** (nested split leaf: main record and 5941 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S355
#print axioms E284S355.leaf
