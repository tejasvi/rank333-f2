module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S26_C0
public import L5.t.E237S26_C1
public import L5.t.E237S26_C2
public import L5.t.E237S26_C3
public import L5.t.E237S26_C4
public import L5.t.E237S26_C5
public import L5.t.E237S26_C6
public import L5.t.E237S26_C7
public import L5.t.E237S26_C8
public import L5.t.E237S26_C9
public import L5.t.E237S26_C10
public import L5.t.E237S26_C11
public import L5.t.E237S26_C12
public import L5.t.E237S26_C13
public import L5.t.E237S26_C14
public import L5.t.E237S26_C15
public import L5.t.E237S26_C16
public import L5.t.E237S26_C17
public import L5.t.E237S26_C18
public import L5.t.E237S26_C19
public import L5.t.E237S26_C20
public import L5.t.E237S26_C21
public import L5.t.E237S26_C22
public import L5.t.E237S26_C23
public import L5.t.E237S26_C24
public import L5.t.E237S26_C25
public import L5.t.E237S26_C26
public import L5.t.E237S26_C27
public import L5.t.E237S26_C28
public import L5.t.E237S26_C29
public import L5.t.E237S26_C30
public import L5.t.E237S26_C31
public import L5.t.E237S26_C32
public import L5.t.E237S26_C33
public import L5.t.E237S26_C34
public import L5.t.E237S26_C35
public import L5.t.E237S26_C36
public import L5.t.E237S26_C37
public import L5.t.E237S26_C38
public import L5.t.E237S26_C39
public import L5.t.E237S26_C40
public import L5.t.E237S26_C41
public import L5.t.E237S26_C42
public import L5.t.E237S26_C43
public import L5.t.E237S26_C44
public import L5.t.E237S26_C45
public import L5.t.E237S26_C46
public import L5.t.E237S26_C47
public import L5.t.E237S26_C48
public import L5.t.E237S26_C49
public import L5.t.E237S26_C50
public import L5.t.E237S26_C51
public import L5.t.E237S26_C52
public import L5.t.E237S26_C53
public import L5.t.E237S26_C54
public import L5.t.E237S26_C55
public import L5.t.E237S26_C56
public import L5.t.E237S26_C57
public import L5.t.E237S26_C58
public import L5.t.E237S26_C59
public import L5.t.E237S26_C60
public import L5.t.E237S26_C61
public import L5.t.E237S26_C62
public import L5.t.E237S26_C63
public import L5.t.E237S26_C64
public import L5.t.E237S26_C65
public import L5.t.E237S26_C66
public import L5.t.E237S26_C67
public import L5.t.E237S26_C68
public import L5.t.E237S26_C69
public import L5.t.E237S26_C70
public import L5.t.E237S26_C71
public import L5.t.E237S26_C72
public import L5.t.E237S26_C73
public import L5.t.E237S26_C74
public import L5.t.E237S26_C75
public import L5.t.E237S26_C76
public import L5.t.E237S26_C77
public import L5.t.E237S26_C78
public import L5.t.E237S26_C79
public import L5.t.E237S26_C80
public import L5.t.E237S26_C81
public import L5.t.E237S26_C82
public import L5.t.E237S26_C83
public import L5.t.E237S26_C84
public import L5.t.E237S26_C85
public import L5.t.E237S26_C86
public import L5.t.E237S26_C87
public import L5.t.E237S26_C88
public import L5.t.E237S26_C89
public import L5.t.E237S26_C90
public import L5.t.E237S26_C91
public import L5.t.E237S26_C92
public import L5.t.E237S26_C93
public import L5.t.E237S26_C94
public import L5.t.E237S26_C95
public import L5.t.E237S26_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E237S26
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4266 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4266 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 52 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 59 m0 = true :=
    chunkT_join _ _ _ 0 52 7 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 81 m0 = true :=
    chunkT_join _ _ _ 0 59 22 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 101 m0 = true :=
    chunkT_join _ _ _ 0 81 20 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 150 m0 = true :=
    chunkT_join _ _ _ 0 101 49 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 197 m0 = true :=
    chunkT_join _ _ _ 0 150 47 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 197 2 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 199 1 m0 1224 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 210 m0 = true :=
    chunkT_join _ _ _ 0 200 10 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 212 m0 = true :=
    chunkT_join _ _ _ 0 210 2 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 214 m0 = true :=
    chunkT_join _ _ _ 0 212 2 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 221 m0 = true :=
    chunkT_join _ _ _ 0 214 7 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 223 m0 = true :=
    chunkT_join _ _ _ 0 221 2 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 228 m0 = true :=
    chunkT_join _ _ _ 0 223 5 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 240 m0 = true :=
    chunkT_join _ _ _ 0 228 12 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 283 m0 = true :=
    chunkT_join _ _ _ 0 240 43 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 336 m0 = true :=
    chunkT_join _ _ _ 0 283 53 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 338 m0 = true :=
    chunkT_join _ _ _ 0 336 2 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 339 m0 = true :=
    chunkT_join _ _ _ 0 338 1 m0 1703 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 349 m0 = true :=
    chunkT_join _ _ _ 0 339 10 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 351 m0 = true :=
    chunkT_join _ _ _ 0 349 2 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 354 m0 = true :=
    chunkT_join _ _ _ 0 351 3 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 366 m0 = true :=
    chunkT_join _ _ _ 0 354 12 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 366 19 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 386 m0 = true :=
    chunkT_join _ _ _ 0 385 1 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 387 m0 = true :=
    chunkT_join _ _ _ 0 386 1 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 393 m0 = true :=
    chunkT_join _ _ _ 0 387 6 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 408 m0 = true :=
    chunkT_join _ _ _ 0 393 15 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 422 m0 = true :=
    chunkT_join _ _ _ 0 408 14 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 463 m0 = true :=
    chunkT_join _ _ _ 0 422 41 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 527 m0 = true :=
    chunkT_join _ _ _ 0 463 64 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 591 m0 = true :=
    chunkT_join _ _ _ 0 527 64 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 611 m0 = true :=
    chunkT_join _ _ _ 0 591 20 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 627 m0 = true :=
    chunkT_join _ _ _ 0 611 16 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 653 m0 = true :=
    chunkT_join _ _ _ 0 627 26 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 657 m0 = true :=
    chunkT_join _ _ _ 0 653 4 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 659 m0 = true :=
    chunkT_join _ _ _ 0 657 2 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 660 m0 = true :=
    chunkT_join _ _ _ 0 659 1 m0 4265 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 724 m0 = true :=
    chunkT_join _ _ _ 0 660 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 776 m0 = true :=
    chunkT_join _ _ _ 0 724 52 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 803 m0 = true :=
    chunkT_join _ _ _ 0 776 27 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 867 m0 = true :=
    chunkT_join _ _ _ 0 803 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 899 m0 = true :=
    chunkT_join _ _ _ 0 867 32 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 963 m0 = true :=
    chunkT_join _ _ _ 0 899 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1027 m0 = true :=
    chunkT_join _ _ _ 0 963 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 1091 m0 = true :=
    chunkT_join _ _ _ 0 1027 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 1155 m0 = true :=
    chunkT_join _ _ _ 0 1091 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 1219 m0 = true :=
    chunkT_join _ _ _ 0 1155 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 1283 m0 = true :=
    chunkT_join _ _ _ 0 1219 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 1347 m0 = true :=
    chunkT_join _ _ _ 0 1283 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 1411 m0 = true :=
    chunkT_join _ _ _ 0 1347 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 1475 m0 = true :=
    chunkT_join _ _ _ 0 1411 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1539 m0 = true :=
    chunkT_join _ _ _ 0 1475 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1603 m0 = true :=
    chunkT_join _ _ _ 0 1539 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 1667 m0 = true :=
    chunkT_join _ _ _ 0 1603 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1731 m0 = true :=
    chunkT_join _ _ _ 0 1667 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1795 m0 = true :=
    chunkT_join _ _ _ 0 1731 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1859 m0 = true :=
    chunkT_join _ _ _ 0 1795 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1923 m0 = true :=
    chunkT_join _ _ _ 0 1859 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 1987 m0 = true :=
    chunkT_join _ _ _ 0 1923 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 2051 m0 = true :=
    chunkT_join _ _ _ 0 1987 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 2115 m0 = true :=
    chunkT_join _ _ _ 0 2051 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 2179 m0 = true :=
    chunkT_join _ _ _ 0 2115 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 2243 m0 = true :=
    chunkT_join _ _ _ 0 2179 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 2307 m0 = true :=
    chunkT_join _ _ _ 0 2243 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 2371 m0 = true :=
    chunkT_join _ _ _ 0 2307 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 2435 m0 = true :=
    chunkT_join _ _ _ 0 2371 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 2499 m0 = true :=
    chunkT_join _ _ _ 0 2435 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 2563 m0 = true :=
    chunkT_join _ _ _ 0 2499 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 2627 m0 = true :=
    chunkT_join _ _ _ 0 2563 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 2691 m0 = true :=
    chunkT_join _ _ _ 0 2627 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2755 m0 = true :=
    chunkT_join _ _ _ 0 2691 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2819 m0 = true :=
    chunkT_join _ _ _ 0 2755 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2883 m0 = true :=
    chunkT_join _ _ _ 0 2819 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2947 m0 = true :=
    chunkT_join _ _ _ 0 2883 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 3011 m0 = true :=
    chunkT_join _ _ _ 0 2947 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 3075 m0 = true :=
    chunkT_join _ _ _ 0 3011 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 3139 m0 = true :=
    chunkT_join _ _ _ 0 3075 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 3203 m0 = true :=
    chunkT_join _ _ _ 0 3139 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 3267 m0 = true :=
    chunkT_join _ _ _ 0 3203 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 3331 m0 = true :=
    chunkT_join _ _ _ 0 3267 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 3395 m0 = true :=
    chunkT_join _ _ _ 0 3331 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 3459 m0 = true :=
    chunkT_join _ _ _ 0 3395 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 3523 m0 = true :=
    chunkT_join _ _ _ 0 3459 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 3587 m0 = true :=
    chunkT_join _ _ _ 0 3523 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 3651 m0 = true :=
    chunkT_join _ _ _ 0 3587 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 3715 m0 = true :=
    chunkT_join _ _ _ 0 3651 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 3779 m0 = true :=
    chunkT_join _ _ _ 0 3715 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 3843 m0 = true :=
    chunkT_join _ _ _ 0 3779 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 3907 m0 = true :=
    chunkT_join _ _ _ 0 3843 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 3971 m0 = true :=
    chunkT_join _ _ _ 0 3907 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 4035 m0 = true :=
    chunkT_join _ _ _ 0 3971 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 4099 m0 = true :=
    chunkT_join _ _ _ 0 4035 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 4163 m0 = true :=
    chunkT_join _ _ _ 0 4099 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 4227 m0 = true :=
    chunkT_join _ _ _ 0 4163 64 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 4266 m0 = true :=
    chunkT_join _ _ _ 0 4227 39 m0 4266 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  exact h95
/-- **the leaf has no decomposition** (nested split leaf: main record and 4266 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E237S26
#print axioms E237S26.leaf
