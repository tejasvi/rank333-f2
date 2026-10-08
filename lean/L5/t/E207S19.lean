module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S19_C0
public import L5.t.E207S19_C1
public import L5.t.E207S19_C2
public import L5.t.E207S19_C3
public import L5.t.E207S19_C4
public import L5.t.E207S19_C5
public import L5.t.E207S19_C6
public import L5.t.E207S19_C7
public import L5.t.E207S19_C8
public import L5.t.E207S19_C9
public import L5.t.E207S19_C10
public import L5.t.E207S19_C11
public import L5.t.E207S19_C12
public import L5.t.E207S19_C13
public import L5.t.E207S19_C14
public import L5.t.E207S19_C15
public import L5.t.E207S19_C16
public import L5.t.E207S19_C17
public import L5.t.E207S19_C18
public import L5.t.E207S19_C19
public import L5.t.E207S19_C20
public import L5.t.E207S19_C21
public import L5.t.E207S19_C22
public import L5.t.E207S19_C23
public import L5.t.E207S19_C24
public import L5.t.E207S19_C25
public import L5.t.E207S19_C26
public import L5.t.E207S19_C27
public import L5.t.E207S19_C28
public import L5.t.E207S19_C29
public import L5.t.E207S19_C30
public import L5.t.E207S19_C31
public import L5.t.E207S19_C32
public import L5.t.E207S19_C33
public import L5.t.E207S19_C34
public import L5.t.E207S19_C35
public import L5.t.E207S19_C36
public import L5.t.E207S19_C37
public import L5.t.E207S19_C38
public import L5.t.E207S19_C39
public import L5.t.E207S19_C40
public import L5.t.E207S19_C41
public import L5.t.E207S19_C42
public import L5.t.E207S19_C43
public import L5.t.E207S19_C44
public import L5.t.E207S19_C45
public import L5.t.E207S19_C46
public import L5.t.E207S19_C47
public import L5.t.E207S19_C48
public import L5.t.E207S19_C49
public import L5.t.E207S19_C50
public import L5.t.E207S19_C51
public import L5.t.E207S19_C52
public import L5.t.E207S19_C53
public import L5.t.E207S19_C54
public import L5.t.E207S19_C55
public import L5.t.E207S19_C56
public import L5.t.E207S19_C57
public import L5.t.E207S19_C58
public import L5.t.E207S19_C59
public import L5.t.E207S19_C60
public import L5.t.E207S19_C61
public import L5.t.E207S19_C62
public import L5.t.E207S19_C63
public import L5.t.E207S19_C64
public import L5.t.E207S19_C65
public import L5.t.E207S19_C66
public import L5.t.E207S19_C67
public import L5.t.E207S19_C68
public import L5.t.E207S19_C69
public import L5.t.E207S19_C70
public import L5.t.E207S19_C71
public import L5.t.E207S19_C72
public import L5.t.E207S19_C73
public import L5.t.E207S19_C74
public import L5.t.E207S19_C75
public import L5.t.E207S19_C76
public import L5.t.E207S19_C77
public import L5.t.E207S19_C78
public import L5.t.E207S19_C79
public import L5.t.E207S19_C80
public import L5.t.E207S19_C81
public import L5.t.E207S19_C82
public import L5.t.E207S19_C83
public import L5.t.E207S19_C84
public import L5.t.E207S19_C85
public import L5.t.E207S19_C86
public import L5.t.E207S19_C87
public import L5.t.E207S19_C88
public import L5.t.E207S19_C89
public import L5.t.E207S19_C90
public import L5.t.E207S19_C91
public import L5.t.E207S19_C92
public import L5.t.E207S19_C93
public import L5.t.E207S19_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E207S19
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 2742 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 2742 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 24 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 25 m0 = true :=
    chunkT_join _ _ _ 0 24 1 m0 1302 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 43 m0 = true :=
    chunkT_join _ _ _ 0 25 18 m0 1330 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 43 28 m0 1330 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 73 m0 = true :=
    chunkT_join _ _ _ 0 71 2 m0 1330 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 74 m0 = true :=
    chunkT_join _ _ _ 0 73 1 m0 1330 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 75 m0 = true :=
    chunkT_join _ _ _ 0 74 1 m0 1562 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 76 m0 = true :=
    chunkT_join _ _ _ 0 75 1 m0 1562 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 76 12 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 93 m0 = true :=
    chunkT_join _ _ _ 0 88 5 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 105 m0 = true :=
    chunkT_join _ _ _ 0 93 12 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 140 m0 = true :=
    chunkT_join _ _ _ 0 105 35 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 195 m0 = true :=
    chunkT_join _ _ _ 0 140 55 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 195 1 m0 1918 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 197 m0 = true :=
    chunkT_join _ _ _ 0 196 1 m0 1946 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 197 2 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 201 m0 = true :=
    chunkT_join _ _ _ 0 199 2 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 201 9 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 210 2 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 212 4 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 219 m0 = true :=
    chunkT_join _ _ _ 0 216 3 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 219 2 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 222 m0 = true :=
    chunkT_join _ _ _ 0 221 1 m0 2178 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 226 m0 = true :=
    chunkT_join _ _ _ 0 222 4 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 236 m0 = true :=
    chunkT_join _ _ _ 0 226 10 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 246 m0 = true :=
    chunkT_join _ _ _ 0 236 10 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 300 m0 = true :=
    chunkT_join _ _ _ 0 246 54 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 352 m0 = true :=
    chunkT_join _ _ _ 0 300 52 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 353 m0 = true :=
    chunkT_join _ _ _ 0 352 1 m0 2282 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 355 m0 = true :=
    chunkT_join _ _ _ 0 353 2 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 356 m0 = true :=
    chunkT_join _ _ _ 0 355 1 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 358 m0 = true :=
    chunkT_join _ _ _ 0 356 2 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 370 m0 = true :=
    chunkT_join _ _ _ 0 358 12 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 374 m0 = true :=
    chunkT_join _ _ _ 0 370 4 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 375 m0 = true :=
    chunkT_join _ _ _ 0 374 1 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 378 m0 = true :=
    chunkT_join _ _ _ 0 375 3 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 384 m0 = true :=
    chunkT_join _ _ _ 0 378 6 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 395 m0 = true :=
    chunkT_join _ _ _ 0 384 11 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 402 m0 = true :=
    chunkT_join _ _ _ 0 395 7 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 404 m0 = true :=
    chunkT_join _ _ _ 0 402 2 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 413 m0 = true :=
    chunkT_join _ _ _ 0 404 9 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 442 m0 = true :=
    chunkT_join _ _ _ 0 413 29 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 498 m0 = true :=
    chunkT_join _ _ _ 0 442 56 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 525 m0 = true :=
    chunkT_join _ _ _ 0 498 27 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 539 m0 = true :=
    chunkT_join _ _ _ 0 525 14 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 553 m0 = true :=
    chunkT_join _ _ _ 0 539 14 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 554 m0 = true :=
    chunkT_join _ _ _ 0 553 1 m0 2638 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 567 m0 = true :=
    chunkT_join _ _ _ 0 554 13 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 575 m0 = true :=
    chunkT_join _ _ _ 0 567 8 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 616 m0 = true :=
    chunkT_join _ _ _ 0 575 41 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 655 m0 = true :=
    chunkT_join _ _ _ 0 616 39 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 666 m0 = true :=
    chunkT_join _ _ _ 0 655 11 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 686 m0 = true :=
    chunkT_join _ _ _ 0 666 20 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 722 m0 = true :=
    chunkT_join _ _ _ 0 686 36 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 765 m0 = true :=
    chunkT_join _ _ _ 0 722 43 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 786 m0 = true :=
    chunkT_join _ _ _ 0 765 21 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 795 m0 = true :=
    chunkT_join _ _ _ 0 786 9 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 807 m0 = true :=
    chunkT_join _ _ _ 0 795 12 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 813 m0 = true :=
    chunkT_join _ _ _ 0 807 6 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 819 m0 = true :=
    chunkT_join _ _ _ 0 813 6 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 883 m0 = true :=
    chunkT_join _ _ _ 0 819 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 917 m0 = true :=
    chunkT_join _ _ _ 0 883 34 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 936 m0 = true :=
    chunkT_join _ _ _ 0 917 19 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 959 m0 = true :=
    chunkT_join _ _ _ 0 936 23 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 975 m0 = true :=
    chunkT_join _ _ _ 0 959 16 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 1039 m0 = true :=
    chunkT_join _ _ _ 0 975 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 1081 m0 = true :=
    chunkT_join _ _ _ 0 1039 42 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 1134 m0 = true :=
    chunkT_join _ _ _ 0 1081 53 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 1198 m0 = true :=
    chunkT_join _ _ _ 0 1134 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 1262 m0 = true :=
    chunkT_join _ _ _ 0 1198 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 1326 m0 = true :=
    chunkT_join _ _ _ 0 1262 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 1390 m0 = true :=
    chunkT_join _ _ _ 0 1326 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 1454 m0 = true :=
    chunkT_join _ _ _ 0 1390 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 1518 m0 = true :=
    chunkT_join _ _ _ 0 1454 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 1582 m0 = true :=
    chunkT_join _ _ _ 0 1518 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 1646 m0 = true :=
    chunkT_join _ _ _ 0 1582 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 1710 m0 = true :=
    chunkT_join _ _ _ 0 1646 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 1774 m0 = true :=
    chunkT_join _ _ _ 0 1710 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 1838 m0 = true :=
    chunkT_join _ _ _ 0 1774 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 1902 m0 = true :=
    chunkT_join _ _ _ 0 1838 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 1966 m0 = true :=
    chunkT_join _ _ _ 0 1902 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 2030 m0 = true :=
    chunkT_join _ _ _ 0 1966 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 2094 m0 = true :=
    chunkT_join _ _ _ 0 2030 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 2158 m0 = true :=
    chunkT_join _ _ _ 0 2094 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 2222 m0 = true :=
    chunkT_join _ _ _ 0 2158 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 2286 m0 = true :=
    chunkT_join _ _ _ 0 2222 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 2350 m0 = true :=
    chunkT_join _ _ _ 0 2286 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 2414 m0 = true :=
    chunkT_join _ _ _ 0 2350 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 2478 m0 = true :=
    chunkT_join _ _ _ 0 2414 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 2542 m0 = true :=
    chunkT_join _ _ _ 0 2478 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 2606 m0 = true :=
    chunkT_join _ _ _ 0 2542 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 2670 m0 = true :=
    chunkT_join _ _ _ 0 2606 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 2734 m0 = true :=
    chunkT_join _ _ _ 0 2670 64 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 2742 m0 = true :=
    chunkT_join _ _ _ 0 2734 8 m0 2742 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  exact h93
/-- **the leaf has no decomposition** (nested split leaf: main record and 2742 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E207S19
#print axioms E207S19.leaf
