module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S354_C0
public import L5.t.E284S354_C1
public import L5.t.E284S354_C2
public import L5.t.E284S354_C3
public import L5.t.E284S354_C4
public import L5.t.E284S354_C5
public import L5.t.E284S354_C6
public import L5.t.E284S354_C7
public import L5.t.E284S354_C8
public import L5.t.E284S354_C9
public import L5.t.E284S354_C10
public import L5.t.E284S354_C11
public import L5.t.E284S354_C12
public import L5.t.E284S354_C13
public import L5.t.E284S354_C14
public import L5.t.E284S354_C15
public import L5.t.E284S354_C16
public import L5.t.E284S354_C17
public import L5.t.E284S354_C18
public import L5.t.E284S354_C19
public import L5.t.E284S354_C20
public import L5.t.E284S354_C21
public import L5.t.E284S354_C22
public import L5.t.E284S354_C23
public import L5.t.E284S354_C24
public import L5.t.E284S354_C25
public import L5.t.E284S354_C26
public import L5.t.E284S354_C27
public import L5.t.E284S354_C28
public import L5.t.E284S354_C29
public import L5.t.E284S354_C30
public import L5.t.E284S354_C31
public import L5.t.E284S354_C32
public import L5.t.E284S354_C33
public import L5.t.E284S354_C34
public import L5.t.E284S354_C35
public import L5.t.E284S354_C36
public import L5.t.E284S354_C37
public import L5.t.E284S354_C38
public import L5.t.E284S354_C39
public import L5.t.E284S354_C40
public import L5.t.E284S354_C41
public import L5.t.E284S354_C42
public import L5.t.E284S354_C43
public import L5.t.E284S354_C44
public import L5.t.E284S354_C45
public import L5.t.E284S354_C46
public import L5.t.E284S354_C47
public import L5.t.E284S354_C48
public import L5.t.E284S354_C49
public import L5.t.E284S354_C50
public import L5.t.E284S354_C51
public import L5.t.E284S354_C52
public import L5.t.E284S354_C53
public import L5.t.E284S354_C54
public import L5.t.E284S354_C55
public import L5.t.E284S354_C56
public import L5.t.E284S354_C57
public import L5.t.E284S354_C58
public import L5.t.E284S354_C59
public import L5.t.E284S354_C60
public import L5.t.E284S354_C61
public import L5.t.E284S354_C62
public import L5.t.E284S354_C63
public import L5.t.E284S354_C64
public import L5.t.E284S354_C65
public import L5.t.E284S354_C66
public import L5.t.E284S354_C67
public import L5.t.E284S354_C68
public import L5.t.E284S354_C69
public import L5.t.E284S354_C70
public import L5.t.E284S354_C71
public import L5.t.E284S354_C72
public import L5.t.E284S354_C73
public import L5.t.E284S354_C74
public import L5.t.E284S354_C75
public import L5.t.E284S354_C76
public import L5.t.E284S354_C77
public import L5.t.E284S354_C78
public import L5.t.E284S354_C79
public import L5.t.E284S354_C80
public import L5.t.E284S354_C81
public import L5.t.E284S354_C82
public import L5.t.E284S354_C83
public import L5.t.E284S354_C84
public import L5.t.E284S354_C85
public import L5.t.E284S354_C86
public import L5.t.E284S354_C87
public import L5.t.E284S354_C88
public import L5.t.E284S354_C89
public import L5.t.E284S354_C90
public import L5.t.E284S354_C91
public import L5.t.E284S354_C92
public import L5.t.E284S354_C93
public import L5.t.E284S354_C94
public import L5.t.E284S354_C95
public import L5.t.E284S354_C96
public import L5.t.E284S354_C97
public import L5.t.E284S354_C98
public import L5.t.E284S354_C99
public import L5.t.E284S354_C100
public import L5.t.E284S354_C101
public import L5.t.E284S354_C102
public import L5.t.E284S354_C103
public import L5.t.E284S354_C104
public import L5.t.E284S354_C105
public import L5.t.E284S354_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E284S354
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 5941 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 5941 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 70 m0 = true :=
    chunkT_join _ _ _ 0 49 21 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 134 m0 = true :=
    chunkT_join _ _ _ 0 70 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 198 m0 = true :=
    chunkT_join _ _ _ 0 134 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 258 m0 = true :=
    chunkT_join _ _ _ 0 198 60 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 258 39 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 361 m0 = true :=
    chunkT_join _ _ _ 0 297 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 425 m0 = true :=
    chunkT_join _ _ _ 0 361 64 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 437 m0 = true :=
    chunkT_join _ _ _ 0 425 12 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 438 m0 = true :=
    chunkT_join _ _ _ 0 437 1 m0 1404 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 445 m0 = true :=
    chunkT_join _ _ _ 0 438 7 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 453 m0 = true :=
    chunkT_join _ _ _ 0 445 8 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 459 m0 = true :=
    chunkT_join _ _ _ 0 453 6 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 465 m0 = true :=
    chunkT_join _ _ _ 0 459 6 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 473 m0 = true :=
    chunkT_join _ _ _ 0 465 8 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 496 m0 = true :=
    chunkT_join _ _ _ 0 473 23 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 530 m0 = true :=
    chunkT_join _ _ _ 0 496 34 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 594 m0 = true :=
    chunkT_join _ _ _ 0 530 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 658 m0 = true :=
    chunkT_join _ _ _ 0 594 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 722 m0 = true :=
    chunkT_join _ _ _ 0 658 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 768 m0 = true :=
    chunkT_join _ _ _ 0 722 46 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 804 m0 = true :=
    chunkT_join _ _ _ 0 768 36 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 810 m0 = true :=
    chunkT_join _ _ _ 0 804 6 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 822 m0 = true :=
    chunkT_join _ _ _ 0 810 12 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 861 m0 = true :=
    chunkT_join _ _ _ 0 822 39 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 899 m0 = true :=
    chunkT_join _ _ _ 0 861 38 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 935 m0 = true :=
    chunkT_join _ _ _ 0 899 36 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 999 m0 = true :=
    chunkT_join _ _ _ 0 935 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 1063 m0 = true :=
    chunkT_join _ _ _ 0 999 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 1127 m0 = true :=
    chunkT_join _ _ _ 0 1063 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 1191 m0 = true :=
    chunkT_join _ _ _ 0 1127 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 1255 m0 = true :=
    chunkT_join _ _ _ 0 1191 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 1319 m0 = true :=
    chunkT_join _ _ _ 0 1255 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 1383 m0 = true :=
    chunkT_join _ _ _ 0 1319 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 1447 m0 = true :=
    chunkT_join _ _ _ 0 1383 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 1511 m0 = true :=
    chunkT_join _ _ _ 0 1447 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 1575 m0 = true :=
    chunkT_join _ _ _ 0 1511 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 1639 m0 = true :=
    chunkT_join _ _ _ 0 1575 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 1703 m0 = true :=
    chunkT_join _ _ _ 0 1639 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 1767 m0 = true :=
    chunkT_join _ _ _ 0 1703 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 1831 m0 = true :=
    chunkT_join _ _ _ 0 1767 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 1895 m0 = true :=
    chunkT_join _ _ _ 0 1831 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 1959 m0 = true :=
    chunkT_join _ _ _ 0 1895 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 2023 m0 = true :=
    chunkT_join _ _ _ 0 1959 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 2087 m0 = true :=
    chunkT_join _ _ _ 0 2023 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 2151 m0 = true :=
    chunkT_join _ _ _ 0 2087 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 2215 m0 = true :=
    chunkT_join _ _ _ 0 2151 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 2279 m0 = true :=
    chunkT_join _ _ _ 0 2215 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 2343 m0 = true :=
    chunkT_join _ _ _ 0 2279 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 2407 m0 = true :=
    chunkT_join _ _ _ 0 2343 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 2471 m0 = true :=
    chunkT_join _ _ _ 0 2407 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 2535 m0 = true :=
    chunkT_join _ _ _ 0 2471 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 2599 m0 = true :=
    chunkT_join _ _ _ 0 2535 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 2663 m0 = true :=
    chunkT_join _ _ _ 0 2599 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 2727 m0 = true :=
    chunkT_join _ _ _ 0 2663 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 2791 m0 = true :=
    chunkT_join _ _ _ 0 2727 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 2855 m0 = true :=
    chunkT_join _ _ _ 0 2791 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 2919 m0 = true :=
    chunkT_join _ _ _ 0 2855 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 2983 m0 = true :=
    chunkT_join _ _ _ 0 2919 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 3047 m0 = true :=
    chunkT_join _ _ _ 0 2983 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 3111 m0 = true :=
    chunkT_join _ _ _ 0 3047 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 3175 m0 = true :=
    chunkT_join _ _ _ 0 3111 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 3239 m0 = true :=
    chunkT_join _ _ _ 0 3175 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 3303 m0 = true :=
    chunkT_join _ _ _ 0 3239 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 3367 m0 = true :=
    chunkT_join _ _ _ 0 3303 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 3431 m0 = true :=
    chunkT_join _ _ _ 0 3367 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 3495 m0 = true :=
    chunkT_join _ _ _ 0 3431 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 3559 m0 = true :=
    chunkT_join _ _ _ 0 3495 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 3623 m0 = true :=
    chunkT_join _ _ _ 0 3559 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 3687 m0 = true :=
    chunkT_join _ _ _ 0 3623 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 3751 m0 = true :=
    chunkT_join _ _ _ 0 3687 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 3815 m0 = true :=
    chunkT_join _ _ _ 0 3751 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 3879 m0 = true :=
    chunkT_join _ _ _ 0 3815 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 3943 m0 = true :=
    chunkT_join _ _ _ 0 3879 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 4007 m0 = true :=
    chunkT_join _ _ _ 0 3943 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 4071 m0 = true :=
    chunkT_join _ _ _ 0 4007 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 4135 m0 = true :=
    chunkT_join _ _ _ 0 4071 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 4199 m0 = true :=
    chunkT_join _ _ _ 0 4135 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 4263 m0 = true :=
    chunkT_join _ _ _ 0 4199 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 4327 m0 = true :=
    chunkT_join _ _ _ 0 4263 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 4391 m0 = true :=
    chunkT_join _ _ _ 0 4327 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 4455 m0 = true :=
    chunkT_join _ _ _ 0 4391 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 4519 m0 = true :=
    chunkT_join _ _ _ 0 4455 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 4583 m0 = true :=
    chunkT_join _ _ _ 0 4519 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 4647 m0 = true :=
    chunkT_join _ _ _ 0 4583 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 4711 m0 = true :=
    chunkT_join _ _ _ 0 4647 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 4775 m0 = true :=
    chunkT_join _ _ _ 0 4711 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 4839 m0 = true :=
    chunkT_join _ _ _ 0 4775 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 4903 m0 = true :=
    chunkT_join _ _ _ 0 4839 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 4967 m0 = true :=
    chunkT_join _ _ _ 0 4903 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 5031 m0 = true :=
    chunkT_join _ _ _ 0 4967 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 5095 m0 = true :=
    chunkT_join _ _ _ 0 5031 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 5159 m0 = true :=
    chunkT_join _ _ _ 0 5095 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 5223 m0 = true :=
    chunkT_join _ _ _ 0 5159 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 5287 m0 = true :=
    chunkT_join _ _ _ 0 5223 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 5351 m0 = true :=
    chunkT_join _ _ _ 0 5287 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 5415 m0 = true :=
    chunkT_join _ _ _ 0 5351 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 5479 m0 = true :=
    chunkT_join _ _ _ 0 5415 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  have h98 : chunkT (lits.getD 0 0) paths recs 0 5543 m0 = true :=
    chunkT_join _ _ _ 0 5479 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h97 ok98
  have h99 : chunkT (lits.getD 0 0) paths recs 0 5607 m0 = true :=
    chunkT_join _ _ _ 0 5543 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h98 ok99
  have h100 : chunkT (lits.getD 0 0) paths recs 0 5671 m0 = true :=
    chunkT_join _ _ _ 0 5607 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h99 ok100
  have h101 : chunkT (lits.getD 0 0) paths recs 0 5735 m0 = true :=
    chunkT_join _ _ _ 0 5671 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h100 ok101
  have h102 : chunkT (lits.getD 0 0) paths recs 0 5799 m0 = true :=
    chunkT_join _ _ _ 0 5735 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h101 ok102
  have h103 : chunkT (lits.getD 0 0) paths recs 0 5863 m0 = true :=
    chunkT_join _ _ _ 0 5799 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h102 ok103
  have h104 : chunkT (lits.getD 0 0) paths recs 0 5927 m0 = true :=
    chunkT_join _ _ _ 0 5863 64 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h103 ok104
  have h105 : chunkT (lits.getD 0 0) paths recs 0 5941 m0 = true :=
    chunkT_join _ _ _ 0 5927 14 m0 5941 (by rw [lenR]; decide) (by decide +kernel) h104 ok105
  exact h105
/-- **the leaf has no decomposition** (nested split leaf: main record and 5941 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E284S354
#print axioms E284S354.leaf
