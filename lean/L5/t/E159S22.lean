module
public import R22Port.U_d41d8cd98f00
public import L5.t.E159S22_C0
public import L5.t.E159S22_C1
public import L5.t.E159S22_C2
public import L5.t.E159S22_C3
public import L5.t.E159S22_C4
public import L5.t.E159S22_C5
public import L5.t.E159S22_C6
public import L5.t.E159S22_C7
public import L5.t.E159S22_C8
public import L5.t.E159S22_C9
public import L5.t.E159S22_C10
public import L5.t.E159S22_C11
public import L5.t.E159S22_C12
public import L5.t.E159S22_C13
public import L5.t.E159S22_C14
public import L5.t.E159S22_C15
public import L5.t.E159S22_C16
public import L5.t.E159S22_C17
public import L5.t.E159S22_C18
public import L5.t.E159S22_C19
public import L5.t.E159S22_C20
public import L5.t.E159S22_C21
public import L5.t.E159S22_C22
public import L5.t.E159S22_C23
public import L5.t.E159S22_C24
public import L5.t.E159S22_C25
public import L5.t.E159S22_C26
public import L5.t.E159S22_C27
public import L5.t.E159S22_C28
public import L5.t.E159S22_C29
public import L5.t.E159S22_C30
public import L5.t.E159S22_C31
public import L5.t.E159S22_C32
public import L5.t.E159S22_C33
public import L5.t.E159S22_C34
public import L5.t.E159S22_C35
public import L5.t.E159S22_C36
public import L5.t.E159S22_C37
public import L5.t.E159S22_C38
public import L5.t.E159S22_C39
public import L5.t.E159S22_C40
public import L5.t.E159S22_C41
public import L5.t.E159S22_C42
public import L5.t.E159S22_C43
public import L5.t.E159S22_C44
public import L5.t.E159S22_C45
public import L5.t.E159S22_C46
public import L5.t.E159S22_C47
public import L5.t.E159S22_C48
public import L5.t.E159S22_C49
public import L5.t.E159S22_C50
public import L5.t.E159S22_C51
public import L5.t.E159S22_C52
public import L5.t.E159S22_C53
public import L5.t.E159S22_C54
public import L5.t.E159S22_C55
public import L5.t.E159S22_C56
public import L5.t.E159S22_C57
public import L5.t.E159S22_C58
public import L5.t.E159S22_C59
public import L5.t.E159S22_C60
public import L5.t.E159S22_C61
public import L5.t.E159S22_C62
public import L5.t.E159S22_C63
public import L5.t.E159S22_C64
public import L5.t.E159S22_C65
public import L5.t.E159S22_C66
public import L5.t.E159S22_C67
public import L5.t.E159S22_C68
public import L5.t.E159S22_C69
public import L5.t.E159S22_C70
public import L5.t.E159S22_C71
public import L5.t.E159S22_C72
public import L5.t.E159S22_C73
public import L5.t.E159S22_C74
public import L5.t.E159S22_C75
public import L5.t.E159S22_C76
public import L5.t.E159S22_C77
public import L5.t.E159S22_C78
public import L5.t.E159S22_C79
public import L5.t.E159S22_C80
public import L5.t.E159S22_C81
public import L5.t.E159S22_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace E159S22
open BC7x S7X
theorem main : leafSX (lits.getD 0 0) ((recs.map Prod.fst).take m0) = true := by decide +kernel
theorem lenR : recs.length = 9815 := by decide
theorem all : nestChkR (lits.getD 0 0) paths recs 0 9815 = true := by
  have h0 : nestChkR (lits.getD 0 0) paths recs 0 11 = true := ok0
  have h1 : nestChkR (lits.getD 0 0) paths recs 0 40 = true := nestChk_join _ _ _ 0 11 29 (by rw [lenR]; decide) h0 ok1
  have h2 : nestChkR (lits.getD 0 0) paths recs 0 43 = true := nestChk_join _ _ _ 0 40 3 (by rw [lenR]; decide) h1 ok2
  have h3 : nestChkR (lits.getD 0 0) paths recs 0 45 = true := nestChk_join _ _ _ 0 43 2 (by rw [lenR]; decide) h2 ok3
  have h4 : nestChkR (lits.getD 0 0) paths recs 0 46 = true := nestChk_join _ _ _ 0 45 1 (by rw [lenR]; decide) h3 ok4
  have h5 : nestChkR (lits.getD 0 0) paths recs 0 47 = true := nestChk_join _ _ _ 0 46 1 (by rw [lenR]; decide) h4 ok5
  have h6 : nestChkR (lits.getD 0 0) paths recs 0 52 = true := nestChk_join _ _ _ 0 47 5 (by rw [lenR]; decide) h5 ok6
  have h7 : nestChkR (lits.getD 0 0) paths recs 0 53 = true := nestChk_join _ _ _ 0 52 1 (by rw [lenR]; decide) h6 ok7
  have h8 : nestChkR (lits.getD 0 0) paths recs 0 56 = true := nestChk_join _ _ _ 0 53 3 (by rw [lenR]; decide) h7 ok8
  have h9 : nestChkR (lits.getD 0 0) paths recs 0 61 = true := nestChk_join _ _ _ 0 56 5 (by rw [lenR]; decide) h8 ok9
  have h10 : nestChkR (lits.getD 0 0) paths recs 0 72 = true := nestChk_join _ _ _ 0 61 11 (by rw [lenR]; decide) h9 ok10
  have h11 : nestChkR (lits.getD 0 0) paths recs 0 73 = true := nestChk_join _ _ _ 0 72 1 (by rw [lenR]; decide) h10 ok11
  have h12 : nestChkR (lits.getD 0 0) paths recs 0 74 = true := nestChk_join _ _ _ 0 73 1 (by rw [lenR]; decide) h11 ok12
  have h13 : nestChkR (lits.getD 0 0) paths recs 0 83 = true := nestChk_join _ _ _ 0 74 9 (by rw [lenR]; decide) h12 ok13
  have h14 : nestChkR (lits.getD 0 0) paths recs 0 111 = true := nestChk_join _ _ _ 0 83 28 (by rw [lenR]; decide) h13 ok14
  have h15 : nestChkR (lits.getD 0 0) paths recs 0 165 = true := nestChk_join _ _ _ 0 111 54 (by rw [lenR]; decide) h14 ok15
  have h16 : nestChkR (lits.getD 0 0) paths recs 0 176 = true := nestChk_join _ _ _ 0 165 11 (by rw [lenR]; decide) h15 ok16
  have h17 : nestChkR (lits.getD 0 0) paths recs 0 187 = true := nestChk_join _ _ _ 0 176 11 (by rw [lenR]; decide) h16 ok17
  have h18 : nestChkR (lits.getD 0 0) paths recs 0 208 = true := nestChk_join _ _ _ 0 187 21 (by rw [lenR]; decide) h17 ok18
  have h19 : nestChkR (lits.getD 0 0) paths recs 0 219 = true := nestChk_join _ _ _ 0 208 11 (by rw [lenR]; decide) h18 ok19
  have h20 : nestChkR (lits.getD 0 0) paths recs 0 244 = true := nestChk_join _ _ _ 0 219 25 (by rw [lenR]; decide) h19 ok20
  have h21 : nestChkR (lits.getD 0 0) paths recs 0 288 = true := nestChk_join _ _ _ 0 244 44 (by rw [lenR]; decide) h20 ok21
  have h22 : nestChkR (lits.getD 0 0) paths recs 0 326 = true := nestChk_join _ _ _ 0 288 38 (by rw [lenR]; decide) h21 ok22
  have h23 : nestChkR (lits.getD 0 0) paths recs 0 327 = true := nestChk_join _ _ _ 0 326 1 (by rw [lenR]; decide) h22 ok23
  have h24 : nestChkR (lits.getD 0 0) paths recs 0 331 = true := nestChk_join _ _ _ 0 327 4 (by rw [lenR]; decide) h23 ok24
  have h25 : nestChkR (lits.getD 0 0) paths recs 0 332 = true := nestChk_join _ _ _ 0 331 1 (by rw [lenR]; decide) h24 ok25
  have h26 : nestChkR (lits.getD 0 0) paths recs 0 340 = true := nestChk_join _ _ _ 0 332 8 (by rw [lenR]; decide) h25 ok26
  have h27 : nestChkR (lits.getD 0 0) paths recs 0 344 = true := nestChk_join _ _ _ 0 340 4 (by rw [lenR]; decide) h26 ok27
  have h28 : nestChkR (lits.getD 0 0) paths recs 0 345 = true := nestChk_join _ _ _ 0 344 1 (by rw [lenR]; decide) h27 ok28
  have h29 : nestChkR (lits.getD 0 0) paths recs 0 355 = true := nestChk_join _ _ _ 0 345 10 (by rw [lenR]; decide) h28 ok29
  have h30 : nestChkR (lits.getD 0 0) paths recs 0 358 = true := nestChk_join _ _ _ 0 355 3 (by rw [lenR]; decide) h29 ok30
  have h31 : nestChkR (lits.getD 0 0) paths recs 0 366 = true := nestChk_join _ _ _ 0 358 8 (by rw [lenR]; decide) h30 ok31
  have h32 : nestChkR (lits.getD 0 0) paths recs 0 375 = true := nestChk_join _ _ _ 0 366 9 (by rw [lenR]; decide) h31 ok32
  have h33 : nestChkR (lits.getD 0 0) paths recs 0 376 = true := nestChk_join _ _ _ 0 375 1 (by rw [lenR]; decide) h32 ok33
  have h34 : nestChkR (lits.getD 0 0) paths recs 0 379 = true := nestChk_join _ _ _ 0 376 3 (by rw [lenR]; decide) h33 ok34
  have h35 : nestChkR (lits.getD 0 0) paths recs 0 380 = true := nestChk_join _ _ _ 0 379 1 (by rw [lenR]; decide) h34 ok35
  have h36 : nestChkR (lits.getD 0 0) paths recs 0 390 = true := nestChk_join _ _ _ 0 380 10 (by rw [lenR]; decide) h35 ok36
  have h37 : nestChkR (lits.getD 0 0) paths recs 0 392 = true := nestChk_join _ _ _ 0 390 2 (by rw [lenR]; decide) h36 ok37
  have h38 : nestChkR (lits.getD 0 0) paths recs 0 393 = true := nestChk_join _ _ _ 0 392 1 (by rw [lenR]; decide) h37 ok38
  have h39 : nestChkR (lits.getD 0 0) paths recs 0 401 = true := nestChk_join _ _ _ 0 393 8 (by rw [lenR]; decide) h38 ok39
  have h40 : nestChkR (lits.getD 0 0) paths recs 0 406 = true := nestChk_join _ _ _ 0 401 5 (by rw [lenR]; decide) h39 ok40
  have h41 : nestChkR (lits.getD 0 0) paths recs 0 418 = true := nestChk_join _ _ _ 0 406 12 (by rw [lenR]; decide) h40 ok41
  have h42 : nestChkR (lits.getD 0 0) paths recs 0 424 = true := nestChk_join _ _ _ 0 418 6 (by rw [lenR]; decide) h41 ok42
  have h43 : nestChkR (lits.getD 0 0) paths recs 0 429 = true := nestChk_join _ _ _ 0 424 5 (by rw [lenR]; decide) h42 ok43
  have h44 : nestChkR (lits.getD 0 0) paths recs 0 438 = true := nestChk_join _ _ _ 0 429 9 (by rw [lenR]; decide) h43 ok44
  have h45 : nestChkR (lits.getD 0 0) paths recs 0 440 = true := nestChk_join _ _ _ 0 438 2 (by rw [lenR]; decide) h44 ok45
  have h46 : nestChkR (lits.getD 0 0) paths recs 0 444 = true := nestChk_join _ _ _ 0 440 4 (by rw [lenR]; decide) h45 ok46
  have h47 : nestChkR (lits.getD 0 0) paths recs 0 472 = true := nestChk_join _ _ _ 0 444 28 (by rw [lenR]; decide) h46 ok47
  have h48 : nestChkR (lits.getD 0 0) paths recs 0 522 = true := nestChk_join _ _ _ 0 472 50 (by rw [lenR]; decide) h47 ok48
  have h49 : nestChkR (lits.getD 0 0) paths recs 0 540 = true := nestChk_join _ _ _ 0 522 18 (by rw [lenR]; decide) h48 ok49
  have h50 : nestChkR (lits.getD 0 0) paths recs 0 574 = true := nestChk_join _ _ _ 0 540 34 (by rw [lenR]; decide) h49 ok50
  have h51 : nestChkR (lits.getD 0 0) paths recs 0 589 = true := nestChk_join _ _ _ 0 574 15 (by rw [lenR]; decide) h50 ok51
  have h52 : nestChkR (lits.getD 0 0) paths recs 0 591 = true := nestChk_join _ _ _ 0 589 2 (by rw [lenR]; decide) h51 ok52
  have h53 : nestChkR (lits.getD 0 0) paths recs 0 620 = true := nestChk_join _ _ _ 0 591 29 (by rw [lenR]; decide) h52 ok53
  have h54 : nestChkR (lits.getD 0 0) paths recs 0 636 = true := nestChk_join _ _ _ 0 620 16 (by rw [lenR]; decide) h53 ok54
  have h55 : nestChkR (lits.getD 0 0) paths recs 0 643 = true := nestChk_join _ _ _ 0 636 7 (by rw [lenR]; decide) h54 ok55
  have h56 : nestChkR (lits.getD 0 0) paths recs 0 644 = true := nestChk_join _ _ _ 0 643 1 (by rw [lenR]; decide) h55 ok56
  have h57 : nestChkR (lits.getD 0 0) paths recs 0 685 = true := nestChk_join _ _ _ 0 644 41 (by rw [lenR]; decide) h56 ok57
  have h58 : nestChkR (lits.getD 0 0) paths recs 0 711 = true := nestChk_join _ _ _ 0 685 26 (by rw [lenR]; decide) h57 ok58
  have h59 : nestChkR (lits.getD 0 0) paths recs 0 749 = true := nestChk_join _ _ _ 0 711 38 (by rw [lenR]; decide) h58 ok59
  have h60 : nestChkR (lits.getD 0 0) paths recs 0 755 = true := nestChk_join _ _ _ 0 749 6 (by rw [lenR]; decide) h59 ok60
  have h61 : nestChkR (lits.getD 0 0) paths recs 0 769 = true := nestChk_join _ _ _ 0 755 14 (by rw [lenR]; decide) h60 ok61
  have h62 : nestChkR (lits.getD 0 0) paths recs 0 797 = true := nestChk_join _ _ _ 0 769 28 (by rw [lenR]; decide) h61 ok62
  have h63 : nestChkR (lits.getD 0 0) paths recs 0 801 = true := nestChk_join _ _ _ 0 797 4 (by rw [lenR]; decide) h62 ok63
  have h64 : nestChkR (lits.getD 0 0) paths recs 0 803 = true := nestChk_join _ _ _ 0 801 2 (by rw [lenR]; decide) h63 ok64
  have h65 : nestChkR (lits.getD 0 0) paths recs 0 804 = true := nestChk_join _ _ _ 0 803 1 (by rw [lenR]; decide) h64 ok65
  have h66 : nestChkR (lits.getD 0 0) paths recs 0 849 = true := nestChk_join _ _ _ 0 804 45 (by rw [lenR]; decide) h65 ok66
  have h67 : nestChkR (lits.getD 0 0) paths recs 0 878 = true := nestChk_join _ _ _ 0 849 29 (by rw [lenR]; decide) h66 ok67
  have h68 : nestChkR (lits.getD 0 0) paths recs 0 919 = true := nestChk_join _ _ _ 0 878 41 (by rw [lenR]; decide) h67 ok68
  have h69 : nestChkR (lits.getD 0 0) paths recs 0 935 = true := nestChk_join _ _ _ 0 919 16 (by rw [lenR]; decide) h68 ok69
  have h70 : nestChkR (lits.getD 0 0) paths recs 0 990 = true := nestChk_join _ _ _ 0 935 55 (by rw [lenR]; decide) h69 ok70
  have h71 : nestChkR (lits.getD 0 0) paths recs 0 1037 = true := nestChk_join _ _ _ 0 990 47 (by rw [lenR]; decide) h70 ok71
  have h72 : nestChkR (lits.getD 0 0) paths recs 0 1078 = true := nestChk_join _ _ _ 0 1037 41 (by rw [lenR]; decide) h71 ok72
  have h73 : nestChkR (lits.getD 0 0) paths recs 0 1114 = true := nestChk_join _ _ _ 0 1078 36 (by rw [lenR]; decide) h72 ok73
  have h74 : nestChkR (lits.getD 0 0) paths recs 0 1182 = true := nestChk_join _ _ _ 0 1114 68 (by rw [lenR]; decide) h73 ok74
  have h75 : nestChkR (lits.getD 0 0) paths recs 0 1451 = true := nestChk_join _ _ _ 0 1182 269 (by rw [lenR]; decide) h74 ok75
  have h76 : nestChkR (lits.getD 0 0) paths recs 0 2307 = true := nestChk_join _ _ _ 0 1451 856 (by rw [lenR]; decide) h75 ok76
  have h77 : nestChkR (lits.getD 0 0) paths recs 0 4457 = true := nestChk_join _ _ _ 0 2307 2150 (by rw [lenR]; decide) h76 ok77
  have h78 : nestChkR (lits.getD 0 0) paths recs 0 5676 = true := nestChk_join _ _ _ 0 4457 1219 (by rw [lenR]; decide) h77 ok78
  have h79 : nestChkR (lits.getD 0 0) paths recs 0 7498 = true := nestChk_join _ _ _ 0 5676 1822 (by rw [lenR]; decide) h78 ok79
  have h80 : nestChkR (lits.getD 0 0) paths recs 0 8981 = true := nestChk_join _ _ _ 0 7498 1483 (by rw [lenR]; decide) h79 ok80
  have h81 : nestChkR (lits.getD 0 0) paths recs 0 9815 = true := nestChk_join _ _ _ 0 8981 834 (by rw [lenR]; decide) h80 ok81
  exact h81
/-- **the leaf has no decomposition** (nested split leaf: main record and 9815 records) -/
theorem leaf : S5.NoDecomp (S5.leafT (lits.getD 0 0)) (S5.leafN (lits.getD 0 0)) (S6.leafDom6 (lits.getD 0 0)) :=
  nestSplit_sound' _ recs m0 main (by rw [lenR]; exact all)
end E159S22
#print axioms E159S22.leaf
