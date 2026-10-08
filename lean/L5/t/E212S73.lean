module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S73_C0
public import L5.t.E212S73_C1
public import L5.t.E212S73_C2
public import L5.t.E212S73_C3
public import L5.t.E212S73_C4
public import L5.t.E212S73_C5
public import L5.t.E212S73_C6
public import L5.t.E212S73_C7
public import L5.t.E212S73_C8
public import L5.t.E212S73_C9
public import L5.t.E212S73_C10
public import L5.t.E212S73_C11
public import L5.t.E212S73_C12
public import L5.t.E212S73_C13
public import L5.t.E212S73_C14
public import L5.t.E212S73_C15
public import L5.t.E212S73_C16
public import L5.t.E212S73_C17
public import L5.t.E212S73_C18
public import L5.t.E212S73_C19
public import L5.t.E212S73_C20
public import L5.t.E212S73_C21
public import L5.t.E212S73_C22
public import L5.t.E212S73_C23
public import L5.t.E212S73_C24
public import L5.t.E212S73_C25
public import L5.t.E212S73_C26
public import L5.t.E212S73_C27
public import L5.t.E212S73_C28
public import L5.t.E212S73_C29
public import L5.t.E212S73_C30
public import L5.t.E212S73_C31
public import L5.t.E212S73_C32
public import L5.t.E212S73_C33
public import L5.t.E212S73_C34
public import L5.t.E212S73_C35
public import L5.t.E212S73_C36
public import L5.t.E212S73_C37
public import L5.t.E212S73_C38
public import L5.t.E212S73_C39
public import L5.t.E212S73_C40
public import L5.t.E212S73_C41
public import L5.t.E212S73_C42
public import L5.t.E212S73_C43
public import L5.t.E212S73_C44
public import L5.t.E212S73_C45
public import L5.t.E212S73_C46
public import L5.t.E212S73_C47
public import L5.t.E212S73_C48
public import L5.t.E212S73_C49
public import L5.t.E212S73_C50
public import L5.t.E212S73_C51
public import L5.t.E212S73_C52
public import L5.t.E212S73_C53
public import L5.t.E212S73_C54
public import L5.t.E212S73_C55
public import L5.t.E212S73_C56
public import L5.t.E212S73_C57
public import L5.t.E212S73_C58
public import L5.t.E212S73_C59
public import L5.t.E212S73_C60
public import L5.t.E212S73_C61
public import L5.t.E212S73_C62
public import L5.t.E212S73_C63
public import L5.t.E212S73_C64
public import L5.t.E212S73_C65
public import L5.t.E212S73_C66
public import L5.t.E212S73_C67
public import L5.t.E212S73_C68
public import L5.t.E212S73_C69
public import L5.t.E212S73_C70
public import L5.t.E212S73_C71
public import L5.t.E212S73_C72
public import L5.t.E212S73_C73
public import L5.t.E212S73_C74
public import L5.t.E212S73_C75
public import L5.t.E212S73_C76
public import L5.t.E212S73_C77
public import L5.t.E212S73_C78
public import L5.t.E212S73_C79
public import L5.t.E212S73_C80
public import L5.t.E212S73_C81
public import L5.t.E212S73_C82
public import L5.t.E212S73_C83
public import L5.t.E212S73_C84
public import L5.t.E212S73_C85
public import L5.t.E212S73_C86
public import L5.t.E212S73_C87
public import L5.t.E212S73_C88
public import L5.t.E212S73_C89
public import L5.t.E212S73_C90
public import L5.t.E212S73_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E212S73
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 8465 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 8465 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 22 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true :=
    chunkT_join _ _ _ 0 22 2 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 40 m0 = true :=
    chunkT_join _ _ _ 0 24 16 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 40 6 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 46 23 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 69 2 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 71 1 m0 1230 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 72 1 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 1231 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 84 m0 = true :=
    chunkT_join _ _ _ 0 74 10 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 84 11 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 101 m0 = true :=
    chunkT_join _ _ _ 0 95 6 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 135 m0 = true :=
    chunkT_join _ _ _ 0 101 34 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 175 m0 = true :=
    chunkT_join _ _ _ 0 135 40 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 179 m0 = true :=
    chunkT_join _ _ _ 0 175 4 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 180 m0 = true :=
    chunkT_join _ _ _ 0 179 1 m0 1283 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 190 m0 = true :=
    chunkT_join _ _ _ 0 180 10 m0 1521 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 205 m0 = true :=
    chunkT_join _ _ _ 0 190 15 m0 1521 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 205 7 m0 1521 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 212 14 m0 1521 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 227 m0 = true :=
    chunkT_join _ _ _ 0 226 1 m0 1521 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 235 m0 = true :=
    chunkT_join _ _ _ 0 227 8 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 244 m0 = true :=
    chunkT_join _ _ _ 0 235 9 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 250 m0 = true :=
    chunkT_join _ _ _ 0 244 6 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 275 m0 = true :=
    chunkT_join _ _ _ 0 250 25 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 297 m0 = true :=
    chunkT_join _ _ _ 0 275 22 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 339 m0 = true :=
    chunkT_join _ _ _ 0 297 42 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 343 m0 = true :=
    chunkT_join _ _ _ 0 339 4 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 361 m0 = true :=
    chunkT_join _ _ _ 0 343 18 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 361 23 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 387 m0 = true :=
    chunkT_join _ _ _ 0 384 3 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 388 m0 = true :=
    chunkT_join _ _ _ 0 387 1 m0 5299 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 389 m0 = true :=
    chunkT_join _ _ _ 0 388 1 m0 5430 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 390 m0 = true :=
    chunkT_join _ _ _ 0 389 1 m0 5430 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 391 m0 = true :=
    chunkT_join _ _ _ 0 390 1 m0 7062 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 392 m0 = true :=
    chunkT_join _ _ _ 0 391 1 m0 7062 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 392 10 m0 7761 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 403 m0 = true :=
    chunkT_join _ _ _ 0 402 1 m0 7761 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 407 m0 = true :=
    chunkT_join _ _ _ 0 403 4 m0 7834 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 413 m0 = true :=
    chunkT_join _ _ _ 0 407 6 m0 7834 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 414 m0 = true :=
    chunkT_join _ _ _ 0 413 1 m0 7834 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 430 m0 = true :=
    chunkT_join _ _ _ 0 414 16 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 451 m0 = true :=
    chunkT_join _ _ _ 0 430 21 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 492 m0 = true :=
    chunkT_join _ _ _ 0 451 41 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 518 m0 = true :=
    chunkT_join _ _ _ 0 492 26 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 544 m0 = true :=
    chunkT_join _ _ _ 0 518 26 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 598 m0 = true :=
    chunkT_join _ _ _ 0 544 54 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 599 m0 = true :=
    chunkT_join _ _ _ 0 598 1 m0 7848 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 621 m0 = true :=
    chunkT_join _ _ _ 0 599 22 m0 8194 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 628 m0 = true :=
    chunkT_join _ _ _ 0 621 7 m0 8194 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 630 m0 = true :=
    chunkT_join _ _ _ 0 628 2 m0 8194 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 631 m0 = true :=
    chunkT_join _ _ _ 0 630 1 m0 8194 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 653 m0 = true :=
    chunkT_join _ _ _ 0 631 22 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 712 m0 = true :=
    chunkT_join _ _ _ 0 653 59 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 738 m0 = true :=
    chunkT_join _ _ _ 0 712 26 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 748 m0 = true :=
    chunkT_join _ _ _ 0 738 10 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 770 m0 = true :=
    chunkT_join _ _ _ 0 748 22 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 771 m0 = true :=
    chunkT_join _ _ _ 0 770 1 m0 8266 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 791 m0 = true :=
    chunkT_join _ _ _ 0 771 20 m0 8299 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 796 m0 = true :=
    chunkT_join _ _ _ 0 791 5 m0 8299 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 803 m0 = true :=
    chunkT_join _ _ _ 0 796 7 m0 8299 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 804 m0 = true :=
    chunkT_join _ _ _ 0 803 1 m0 8299 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 809 m0 = true :=
    chunkT_join _ _ _ 0 804 5 m0 8427 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 810 m0 = true :=
    chunkT_join _ _ _ 0 809 1 m0 8427 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 856 m0 = true :=
    chunkT_join _ _ _ 0 810 46 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 883 m0 = true :=
    chunkT_join _ _ _ 0 856 27 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 896 m0 = true :=
    chunkT_join _ _ _ 0 883 13 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 904 m0 = true :=
    chunkT_join _ _ _ 0 896 8 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 918 m0 = true :=
    chunkT_join _ _ _ 0 904 14 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 949 m0 = true :=
    chunkT_join _ _ _ 0 918 31 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 1004 m0 = true :=
    chunkT_join _ _ _ 0 949 55 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 1068 m0 = true :=
    chunkT_join _ _ _ 0 1004 64 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 1095 m0 = true :=
    chunkT_join _ _ _ 0 1068 27 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 1156 m0 = true :=
    chunkT_join _ _ _ 0 1095 61 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 1188 m0 = true :=
    chunkT_join _ _ _ 0 1156 32 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 1313 m0 = true :=
    chunkT_join _ _ _ 0 1188 125 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 1825 m0 = true :=
    chunkT_join _ _ _ 0 1313 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 2337 m0 = true :=
    chunkT_join _ _ _ 0 1825 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 2849 m0 = true :=
    chunkT_join _ _ _ 0 2337 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 3361 m0 = true :=
    chunkT_join _ _ _ 0 2849 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 3873 m0 = true :=
    chunkT_join _ _ _ 0 3361 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 4385 m0 = true :=
    chunkT_join _ _ _ 0 3873 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 4897 m0 = true :=
    chunkT_join _ _ _ 0 4385 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 5409 m0 = true :=
    chunkT_join _ _ _ 0 4897 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 5921 m0 = true :=
    chunkT_join _ _ _ 0 5409 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 6433 m0 = true :=
    chunkT_join _ _ _ 0 5921 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 6945 m0 = true :=
    chunkT_join _ _ _ 0 6433 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 7457 m0 = true :=
    chunkT_join _ _ _ 0 6945 512 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 7919 m0 = true :=
    chunkT_join _ _ _ 0 7457 462 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 8292 m0 = true :=
    chunkT_join _ _ _ 0 7919 373 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 8465 m0 = true :=
    chunkT_join _ _ _ 0 8292 173 m0 8465 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  exact h90
/-- **the leaf has no decomposition** (nested split leaf: main record and 8465 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E212S73
#print axioms E212S73.leaf
