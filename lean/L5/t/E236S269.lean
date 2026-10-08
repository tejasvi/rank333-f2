module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S269_C0
public import L5.t.E236S269_C1
public import L5.t.E236S269_C2
public import L5.t.E236S269_C3
public import L5.t.E236S269_C4
public import L5.t.E236S269_C5
public import L5.t.E236S269_C6
public import L5.t.E236S269_C7
public import L5.t.E236S269_C8
public import L5.t.E236S269_C9
public import L5.t.E236S269_C10
public import L5.t.E236S269_C11
public import L5.t.E236S269_C12
public import L5.t.E236S269_C13
public import L5.t.E236S269_C14
public import L5.t.E236S269_C15
public import L5.t.E236S269_C16
public import L5.t.E236S269_C17
public import L5.t.E236S269_C18
public import L5.t.E236S269_C19
public import L5.t.E236S269_C20
public import L5.t.E236S269_C21
public import L5.t.E236S269_C22
public import L5.t.E236S269_C23
public import L5.t.E236S269_C24
public import L5.t.E236S269_C25
public import L5.t.E236S269_C26
public import L5.t.E236S269_C27
public import L5.t.E236S269_C28
public import L5.t.E236S269_C29
public import L5.t.E236S269_C30
public import L5.t.E236S269_C31
public import L5.t.E236S269_C32
public import L5.t.E236S269_C33
public import L5.t.E236S269_C34
public import L5.t.E236S269_C35
public import L5.t.E236S269_C36
public import L5.t.E236S269_C37
public import L5.t.E236S269_C38
public import L5.t.E236S269_C39
public import L5.t.E236S269_C40
public import L5.t.E236S269_C41
public import L5.t.E236S269_C42
public import L5.t.E236S269_C43
public import L5.t.E236S269_C44
public import L5.t.E236S269_C45
public import L5.t.E236S269_C46
public import L5.t.E236S269_C47
public import L5.t.E236S269_C48
public import L5.t.E236S269_C49
public import L5.t.E236S269_C50
public import L5.t.E236S269_C51
public import L5.t.E236S269_C52
public import L5.t.E236S269_C53
public import L5.t.E236S269_C54
public import L5.t.E236S269_C55
public import L5.t.E236S269_C56
public import L5.t.E236S269_C57
public import L5.t.E236S269_C58
public import L5.t.E236S269_C59
public import L5.t.E236S269_C60
public import L5.t.E236S269_C61
public import L5.t.E236S269_C62
public import L5.t.E236S269_C63
public import L5.t.E236S269_C64
public import L5.t.E236S269_C65
public import L5.t.E236S269_C66
public import L5.t.E236S269_C67
public import L5.t.E236S269_C68
public import L5.t.E236S269_C69
public import L5.t.E236S269_C70
public import L5.t.E236S269_C71
public import L5.t.E236S269_C72
public import L5.t.E236S269_C73
public import L5.t.E236S269_C74
public import L5.t.E236S269_C75
public import L5.t.E236S269_C76
public import L5.t.E236S269_C77
public import L5.t.E236S269_C78
public import L5.t.E236S269_C79
public import L5.t.E236S269_C80
public import L5.t.E236S269_C81
public import L5.t.E236S269_C82
public import L5.t.E236S269_C83
public import L5.t.E236S269_C84
public import L5.t.E236S269_C85
public import L5.t.E236S269_C86
public import L5.t.E236S269_C87
public import L5.t.E236S269_C88
public import L5.t.E236S269_C89
public import L5.t.E236S269_C90
public import L5.t.E236S269_C91
public import L5.t.E236S269_C92
public import L5.t.E236S269_C93
public import L5.t.E236S269_C94
public import L5.t.E236S269_C95
public import L5.t.E236S269_C96
public import L5.t.E236S269_C97
public import L5.t.E236S269_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E236S269
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 4398 := by decide
theorem all : chunkT (lits.getD 0 0) paths recs 0 4398 m0 = true := by
  have h0 : chunkT (lits.getD 0 0) paths recs 0 31 m0 = true := ok0
  have h1 : chunkT (lits.getD 0 0) paths recs 0 45 m0 = true :=
    chunkT_join _ _ _ 0 31 14 m0 1260 (by rw [lenR]; decide) (by decide +kernel) h0 ok1
  have h2 : chunkT (lits.getD 0 0) paths recs 0 46 m0 = true :=
    chunkT_join _ _ _ 0 45 1 m0 1260 (by rw [lenR]; decide) (by decide +kernel) h1 ok2
  have h3 : chunkT (lits.getD 0 0) paths recs 0 47 m0 = true :=
    chunkT_join _ _ _ 0 46 1 m0 3822 (by rw [lenR]; decide) (by decide +kernel) h2 ok3
  have h4 : chunkT (lits.getD 0 0) paths recs 0 48 m0 = true :=
    chunkT_join _ _ _ 0 47 1 m0 3822 (by rw [lenR]; decide) (by decide +kernel) h3 ok4
  have h5 : chunkT (lits.getD 0 0) paths recs 0 49 m0 = true :=
    chunkT_join _ _ _ 0 48 1 m0 3836 (by rw [lenR]; decide) (by decide +kernel) h4 ok5
  have h6 : chunkT (lits.getD 0 0) paths recs 0 53 m0 = true :=
    chunkT_join _ _ _ 0 49 4 m0 3836 (by rw [lenR]; decide) (by decide +kernel) h5 ok6
  have h7 : chunkT (lits.getD 0 0) paths recs 0 58 m0 = true :=
    chunkT_join _ _ _ 0 53 5 m0 3836 (by rw [lenR]; decide) (by decide +kernel) h6 ok7
  have h8 : chunkT (lits.getD 0 0) paths recs 0 60 m0 = true :=
    chunkT_join _ _ _ 0 58 2 m0 3836 (by rw [lenR]; decide) (by decide +kernel) h7 ok8
  have h9 : chunkT (lits.getD 0 0) paths recs 0 61 m0 = true :=
    chunkT_join _ _ _ 0 60 1 m0 3836 (by rw [lenR]; decide) (by decide +kernel) h8 ok9
  have h10 : chunkT (lits.getD 0 0) paths recs 0 63 m0 = true :=
    chunkT_join _ _ _ 0 61 2 m0 3904 (by rw [lenR]; decide) (by decide +kernel) h9 ok10
  have h11 : chunkT (lits.getD 0 0) paths recs 0 69 m0 = true :=
    chunkT_join _ _ _ 0 63 6 m0 3904 (by rw [lenR]; decide) (by decide +kernel) h10 ok11
  have h12 : chunkT (lits.getD 0 0) paths recs 0 71 m0 = true :=
    chunkT_join _ _ _ 0 69 2 m0 3904 (by rw [lenR]; decide) (by decide +kernel) h11 ok12
  have h13 : chunkT (lits.getD 0 0) paths recs 0 72 m0 = true :=
    chunkT_join _ _ _ 0 71 1 m0 3904 (by rw [lenR]; decide) (by decide +kernel) h12 ok13
  have h14 : chunkT (lits.getD 0 0) paths recs 0 78 m0 = true :=
    chunkT_join _ _ _ 0 72 6 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h13 ok14
  have h15 : chunkT (lits.getD 0 0) paths recs 0 88 m0 = true :=
    chunkT_join _ _ _ 0 78 10 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h14 ok15
  have h16 : chunkT (lits.getD 0 0) paths recs 0 95 m0 = true :=
    chunkT_join _ _ _ 0 88 7 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h15 ok16
  have h17 : chunkT (lits.getD 0 0) paths recs 0 159 m0 = true :=
    chunkT_join _ _ _ 0 95 64 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h16 ok17
  have h18 : chunkT (lits.getD 0 0) paths recs 0 196 m0 = true :=
    chunkT_join _ _ _ 0 159 37 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h17 ok18
  have h19 : chunkT (lits.getD 0 0) paths recs 0 199 m0 = true :=
    chunkT_join _ _ _ 0 196 3 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h18 ok19
  have h20 : chunkT (lits.getD 0 0) paths recs 0 200 m0 = true :=
    chunkT_join _ _ _ 0 199 1 m0 4145 (by rw [lenR]; decide) (by decide +kernel) h19 ok20
  have h21 : chunkT (lits.getD 0 0) paths recs 0 216 m0 = true :=
    chunkT_join _ _ _ 0 200 16 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h20 ok21
  have h22 : chunkT (lits.getD 0 0) paths recs 0 225 m0 = true :=
    chunkT_join _ _ _ 0 216 9 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h21 ok22
  have h23 : chunkT (lits.getD 0 0) paths recs 0 239 m0 = true :=
    chunkT_join _ _ _ 0 225 14 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h22 ok23
  have h24 : chunkT (lits.getD 0 0) paths recs 0 257 m0 = true :=
    chunkT_join _ _ _ 0 239 18 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h23 ok24
  have h25 : chunkT (lits.getD 0 0) paths recs 0 321 m0 = true :=
    chunkT_join _ _ _ 0 257 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h24 ok25
  have h26 : chunkT (lits.getD 0 0) paths recs 0 385 m0 = true :=
    chunkT_join _ _ _ 0 321 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h25 ok26
  have h27 : chunkT (lits.getD 0 0) paths recs 0 449 m0 = true :=
    chunkT_join _ _ _ 0 385 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h26 ok27
  have h28 : chunkT (lits.getD 0 0) paths recs 0 469 m0 = true :=
    chunkT_join _ _ _ 0 449 20 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h27 ok28
  have h29 : chunkT (lits.getD 0 0) paths recs 0 488 m0 = true :=
    chunkT_join _ _ _ 0 469 19 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h28 ok29
  have h30 : chunkT (lits.getD 0 0) paths recs 0 516 m0 = true :=
    chunkT_join _ _ _ 0 488 28 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h29 ok30
  have h31 : chunkT (lits.getD 0 0) paths recs 0 580 m0 = true :=
    chunkT_join _ _ _ 0 516 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h30 ok31
  have h32 : chunkT (lits.getD 0 0) paths recs 0 628 m0 = true :=
    chunkT_join _ _ _ 0 580 48 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h31 ok32
  have h33 : chunkT (lits.getD 0 0) paths recs 0 638 m0 = true :=
    chunkT_join _ _ _ 0 628 10 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h32 ok33
  have h34 : chunkT (lits.getD 0 0) paths recs 0 644 m0 = true :=
    chunkT_join _ _ _ 0 638 6 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h33 ok34
  have h35 : chunkT (lits.getD 0 0) paths recs 0 665 m0 = true :=
    chunkT_join _ _ _ 0 644 21 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h34 ok35
  have h36 : chunkT (lits.getD 0 0) paths recs 0 676 m0 = true :=
    chunkT_join _ _ _ 0 665 11 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h35 ok36
  have h37 : chunkT (lits.getD 0 0) paths recs 0 700 m0 = true :=
    chunkT_join _ _ _ 0 676 24 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h36 ok37
  have h38 : chunkT (lits.getD 0 0) paths recs 0 757 m0 = true :=
    chunkT_join _ _ _ 0 700 57 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h37 ok38
  have h39 : chunkT (lits.getD 0 0) paths recs 0 791 m0 = true :=
    chunkT_join _ _ _ 0 757 34 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h38 ok39
  have h40 : chunkT (lits.getD 0 0) paths recs 0 806 m0 = true :=
    chunkT_join _ _ _ 0 791 15 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h39 ok40
  have h41 : chunkT (lits.getD 0 0) paths recs 0 859 m0 = true :=
    chunkT_join _ _ _ 0 806 53 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h40 ok41
  have h42 : chunkT (lits.getD 0 0) paths recs 0 923 m0 = true :=
    chunkT_join _ _ _ 0 859 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h41 ok42
  have h43 : chunkT (lits.getD 0 0) paths recs 0 987 m0 = true :=
    chunkT_join _ _ _ 0 923 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h42 ok43
  have h44 : chunkT (lits.getD 0 0) paths recs 0 1051 m0 = true :=
    chunkT_join _ _ _ 0 987 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h43 ok44
  have h45 : chunkT (lits.getD 0 0) paths recs 0 1115 m0 = true :=
    chunkT_join _ _ _ 0 1051 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h44 ok45
  have h46 : chunkT (lits.getD 0 0) paths recs 0 1179 m0 = true :=
    chunkT_join _ _ _ 0 1115 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h45 ok46
  have h47 : chunkT (lits.getD 0 0) paths recs 0 1243 m0 = true :=
    chunkT_join _ _ _ 0 1179 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h46 ok47
  have h48 : chunkT (lits.getD 0 0) paths recs 0 1307 m0 = true :=
    chunkT_join _ _ _ 0 1243 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h47 ok48
  have h49 : chunkT (lits.getD 0 0) paths recs 0 1371 m0 = true :=
    chunkT_join _ _ _ 0 1307 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h48 ok49
  have h50 : chunkT (lits.getD 0 0) paths recs 0 1435 m0 = true :=
    chunkT_join _ _ _ 0 1371 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h49 ok50
  have h51 : chunkT (lits.getD 0 0) paths recs 0 1499 m0 = true :=
    chunkT_join _ _ _ 0 1435 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h50 ok51
  have h52 : chunkT (lits.getD 0 0) paths recs 0 1563 m0 = true :=
    chunkT_join _ _ _ 0 1499 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h51 ok52
  have h53 : chunkT (lits.getD 0 0) paths recs 0 1627 m0 = true :=
    chunkT_join _ _ _ 0 1563 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h52 ok53
  have h54 : chunkT (lits.getD 0 0) paths recs 0 1691 m0 = true :=
    chunkT_join _ _ _ 0 1627 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h53 ok54
  have h55 : chunkT (lits.getD 0 0) paths recs 0 1755 m0 = true :=
    chunkT_join _ _ _ 0 1691 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h54 ok55
  have h56 : chunkT (lits.getD 0 0) paths recs 0 1819 m0 = true :=
    chunkT_join _ _ _ 0 1755 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h55 ok56
  have h57 : chunkT (lits.getD 0 0) paths recs 0 1883 m0 = true :=
    chunkT_join _ _ _ 0 1819 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h56 ok57
  have h58 : chunkT (lits.getD 0 0) paths recs 0 1947 m0 = true :=
    chunkT_join _ _ _ 0 1883 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h57 ok58
  have h59 : chunkT (lits.getD 0 0) paths recs 0 2011 m0 = true :=
    chunkT_join _ _ _ 0 1947 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h58 ok59
  have h60 : chunkT (lits.getD 0 0) paths recs 0 2075 m0 = true :=
    chunkT_join _ _ _ 0 2011 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h59 ok60
  have h61 : chunkT (lits.getD 0 0) paths recs 0 2139 m0 = true :=
    chunkT_join _ _ _ 0 2075 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h60 ok61
  have h62 : chunkT (lits.getD 0 0) paths recs 0 2203 m0 = true :=
    chunkT_join _ _ _ 0 2139 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h61 ok62
  have h63 : chunkT (lits.getD 0 0) paths recs 0 2267 m0 = true :=
    chunkT_join _ _ _ 0 2203 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h62 ok63
  have h64 : chunkT (lits.getD 0 0) paths recs 0 2331 m0 = true :=
    chunkT_join _ _ _ 0 2267 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h63 ok64
  have h65 : chunkT (lits.getD 0 0) paths recs 0 2395 m0 = true :=
    chunkT_join _ _ _ 0 2331 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h64 ok65
  have h66 : chunkT (lits.getD 0 0) paths recs 0 2459 m0 = true :=
    chunkT_join _ _ _ 0 2395 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h65 ok66
  have h67 : chunkT (lits.getD 0 0) paths recs 0 2523 m0 = true :=
    chunkT_join _ _ _ 0 2459 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h66 ok67
  have h68 : chunkT (lits.getD 0 0) paths recs 0 2587 m0 = true :=
    chunkT_join _ _ _ 0 2523 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h67 ok68
  have h69 : chunkT (lits.getD 0 0) paths recs 0 2651 m0 = true :=
    chunkT_join _ _ _ 0 2587 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h68 ok69
  have h70 : chunkT (lits.getD 0 0) paths recs 0 2715 m0 = true :=
    chunkT_join _ _ _ 0 2651 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h69 ok70
  have h71 : chunkT (lits.getD 0 0) paths recs 0 2779 m0 = true :=
    chunkT_join _ _ _ 0 2715 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h70 ok71
  have h72 : chunkT (lits.getD 0 0) paths recs 0 2843 m0 = true :=
    chunkT_join _ _ _ 0 2779 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h71 ok72
  have h73 : chunkT (lits.getD 0 0) paths recs 0 2907 m0 = true :=
    chunkT_join _ _ _ 0 2843 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h72 ok73
  have h74 : chunkT (lits.getD 0 0) paths recs 0 2971 m0 = true :=
    chunkT_join _ _ _ 0 2907 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h73 ok74
  have h75 : chunkT (lits.getD 0 0) paths recs 0 3035 m0 = true :=
    chunkT_join _ _ _ 0 2971 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h74 ok75
  have h76 : chunkT (lits.getD 0 0) paths recs 0 3099 m0 = true :=
    chunkT_join _ _ _ 0 3035 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h75 ok76
  have h77 : chunkT (lits.getD 0 0) paths recs 0 3163 m0 = true :=
    chunkT_join _ _ _ 0 3099 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h76 ok77
  have h78 : chunkT (lits.getD 0 0) paths recs 0 3227 m0 = true :=
    chunkT_join _ _ _ 0 3163 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h77 ok78
  have h79 : chunkT (lits.getD 0 0) paths recs 0 3291 m0 = true :=
    chunkT_join _ _ _ 0 3227 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h78 ok79
  have h80 : chunkT (lits.getD 0 0) paths recs 0 3355 m0 = true :=
    chunkT_join _ _ _ 0 3291 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h79 ok80
  have h81 : chunkT (lits.getD 0 0) paths recs 0 3419 m0 = true :=
    chunkT_join _ _ _ 0 3355 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h80 ok81
  have h82 : chunkT (lits.getD 0 0) paths recs 0 3483 m0 = true :=
    chunkT_join _ _ _ 0 3419 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h81 ok82
  have h83 : chunkT (lits.getD 0 0) paths recs 0 3547 m0 = true :=
    chunkT_join _ _ _ 0 3483 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h82 ok83
  have h84 : chunkT (lits.getD 0 0) paths recs 0 3611 m0 = true :=
    chunkT_join _ _ _ 0 3547 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h83 ok84
  have h85 : chunkT (lits.getD 0 0) paths recs 0 3675 m0 = true :=
    chunkT_join _ _ _ 0 3611 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h84 ok85
  have h86 : chunkT (lits.getD 0 0) paths recs 0 3739 m0 = true :=
    chunkT_join _ _ _ 0 3675 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h85 ok86
  have h87 : chunkT (lits.getD 0 0) paths recs 0 3803 m0 = true :=
    chunkT_join _ _ _ 0 3739 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h86 ok87
  have h88 : chunkT (lits.getD 0 0) paths recs 0 3867 m0 = true :=
    chunkT_join _ _ _ 0 3803 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h87 ok88
  have h89 : chunkT (lits.getD 0 0) paths recs 0 3931 m0 = true :=
    chunkT_join _ _ _ 0 3867 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h88 ok89
  have h90 : chunkT (lits.getD 0 0) paths recs 0 3995 m0 = true :=
    chunkT_join _ _ _ 0 3931 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h89 ok90
  have h91 : chunkT (lits.getD 0 0) paths recs 0 4059 m0 = true :=
    chunkT_join _ _ _ 0 3995 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h90 ok91
  have h92 : chunkT (lits.getD 0 0) paths recs 0 4123 m0 = true :=
    chunkT_join _ _ _ 0 4059 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h91 ok92
  have h93 : chunkT (lits.getD 0 0) paths recs 0 4187 m0 = true :=
    chunkT_join _ _ _ 0 4123 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h92 ok93
  have h94 : chunkT (lits.getD 0 0) paths recs 0 4251 m0 = true :=
    chunkT_join _ _ _ 0 4187 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h93 ok94
  have h95 : chunkT (lits.getD 0 0) paths recs 0 4315 m0 = true :=
    chunkT_join _ _ _ 0 4251 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h94 ok95
  have h96 : chunkT (lits.getD 0 0) paths recs 0 4379 m0 = true :=
    chunkT_join _ _ _ 0 4315 64 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h95 ok96
  have h97 : chunkT (lits.getD 0 0) paths recs 0 4398 m0 = true :=
    chunkT_join _ _ _ 0 4379 19 m0 4398 (by rw [lenR]; decide) (by decide +kernel) h96 ok97
  exact h97
/-- **the leaf has no decomposition** (nested split leaf: main record and 4398 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplitT_sound' _ recs m0 main (by rw [lenR]; exact all)
end E236S269
#print axioms E236S269.leaf
