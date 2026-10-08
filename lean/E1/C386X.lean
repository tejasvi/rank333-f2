module
public import R22Port.U_d41d8cd98f00
public import E1.C386X_B0
public import E1.C386X_B1
public import E1.C386X_B2
public import E1.C386X_B3
public import E1.C386X_B4
public import E1.C386X_B5
public import E1.C386X_B6
public import E1.C386X_B7
public import E1.C386X_B8
public import E1.C386X_B9
public import E1.C386X_B10
public import E1.C386X_B11
public import E1.C386X_B12
public import E1.C386X_B13
public import E1.C386X_B14
public import E1.C386X_B15
public import E1.C386X_B16
public import E1.C386X_B17
public import E1.C386X_B18
public import E1.C386X_B19
public import E1.C386X_B20
public import E1.C386X_B21
public import E1.C386X_B22
public import E1.C386X_B23
public import E1.C386X_B24
public import E1.C386X_B25
public import E1.C386X_B26
public import E1.C386X_B27
public import E1.C386X_B28
public import E1.C386X_B29
public import E1.C386X_B30
public import E1.C386X_B31
public import E1.C386X_B32
public import E1.C386X_B33
public import E1.C386X_B34
public import E1.C386X_B35
public import E1.C386X_B36
public import E1.C386X_B37
public import E1.C386X_B38
public import E1.C386X_B39
public import E1.C386X_B40
public import E1.C386X_B41
public import E1.C386X_B42
public import E1.C386X_B43
public import E1.C386X_B44
public import E1.C386X_B45
public import E1.C386X_B46
public import E1.C386X_B47
public import E1.C386X_B48
public import E1.C386X_B49
public import E1.C386X_B50
public import E1.C386X_B51
public import E1.C386X_B52
public import E1.C386X_B53
public import E1.C386X_B54
public import E1.C386X_B55
public import E1.C386X_B56
public import E1.C386X_B57
public import E1.C386X_B58
public import E1.C386X_B59
public import E1.C386X_B60
public import E1.C386X_B61
public import E1.C386X_B62
public import E1.C386X_B63
public import E1.C386X_B64
public import E1.C386X_B65
public import E1.C386X_B66
public import E1.C386X_B67
public import E1.C386X_B68
public import E1.C386X_B69
public import E1.C386X_B70
public import E1.C386X_B71
public import E1.C386X_B72
public import E1.OK_e386
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C386X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C386X
open E1S E1.IP_e386
theorem okAll : blkChk C E1.SL_e386.entry UB UBR lits 0 864 = true := by
  have h0 : blkChk C E1.SL_e386.entry UB UBR lits 0 14 = true := okM0
  have h1 : blkChk C E1.SL_e386.entry UB UBR lits 0 26 = true := blkChk_join _ _ _ _ _ 0 14 12 h0 okM1
  have h2 : blkChk C E1.SL_e386.entry UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 26 10 h1 okM2
  have h3 : blkChk C E1.SL_e386.entry UB UBR lits 0 45 = true := blkChk_join _ _ _ _ _ 0 36 9 h2 okM3
  have h4 : blkChk C E1.SL_e386.entry UB UBR lits 0 57 = true := blkChk_join _ _ _ _ _ 0 45 12 h3 okM4
  have h5 : blkChk C E1.SL_e386.entry UB UBR lits 0 67 = true := blkChk_join _ _ _ _ _ 0 57 10 h4 okM5
  have h6 : blkChk C E1.SL_e386.entry UB UBR lits 0 77 = true := blkChk_join _ _ _ _ _ 0 67 10 h5 okM6
  have h7 : blkChk C E1.SL_e386.entry UB UBR lits 0 87 = true := blkChk_join _ _ _ _ _ 0 77 10 h6 okM7
  have h8 : blkChk C E1.SL_e386.entry UB UBR lits 0 98 = true := blkChk_join _ _ _ _ _ 0 87 11 h7 okM8
  have h9 : blkChk C E1.SL_e386.entry UB UBR lits 0 109 = true := blkChk_join _ _ _ _ _ 0 98 11 h8 okM9
  have h10 : blkChk C E1.SL_e386.entry UB UBR lits 0 119 = true := blkChk_join _ _ _ _ _ 0 109 10 h9 okM10
  have h11 : blkChk C E1.SL_e386.entry UB UBR lits 0 129 = true := blkChk_join _ _ _ _ _ 0 119 10 h10 okM11
  have h12 : blkChk C E1.SL_e386.entry UB UBR lits 0 138 = true := blkChk_join _ _ _ _ _ 0 129 9 h11 okM12
  have h13 : blkChk C E1.SL_e386.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 138 11 h12 okM13
  have h14 : blkChk C E1.SL_e386.entry UB UBR lits 0 158 = true := blkChk_join _ _ _ _ _ 0 149 9 h13 okM14
  have h15 : blkChk C E1.SL_e386.entry UB UBR lits 0 169 = true := blkChk_join _ _ _ _ _ 0 158 11 h14 okM15
  have h16 : blkChk C E1.SL_e386.entry UB UBR lits 0 182 = true := blkChk_join _ _ _ _ _ 0 169 13 h15 okM16
  have h17 : blkChk C E1.SL_e386.entry UB UBR lits 0 193 = true := blkChk_join _ _ _ _ _ 0 182 11 h16 okM17
  have h18 : blkChk C E1.SL_e386.entry UB UBR lits 0 205 = true := blkChk_join _ _ _ _ _ 0 193 12 h17 okM18
  have h19 : blkChk C E1.SL_e386.entry UB UBR lits 0 217 = true := blkChk_join _ _ _ _ _ 0 205 12 h18 okM19
  have h20 : blkChk C E1.SL_e386.entry UB UBR lits 0 228 = true := blkChk_join _ _ _ _ _ 0 217 11 h19 okM20
  have h21 : blkChk C E1.SL_e386.entry UB UBR lits 0 238 = true := blkChk_join _ _ _ _ _ 0 228 10 h20 okM21
  have h22 : blkChk C E1.SL_e386.entry UB UBR lits 0 248 = true := blkChk_join _ _ _ _ _ 0 238 10 h21 okM22
  have h23 : blkChk C E1.SL_e386.entry UB UBR lits 0 259 = true := blkChk_join _ _ _ _ _ 0 248 11 h22 okM23
  have h24 : blkChk C E1.SL_e386.entry UB UBR lits 0 269 = true := blkChk_join _ _ _ _ _ 0 259 10 h23 okM24
  have h25 : blkChk C E1.SL_e386.entry UB UBR lits 0 281 = true := blkChk_join _ _ _ _ _ 0 269 12 h24 okM25
  have h26 : blkChk C E1.SL_e386.entry UB UBR lits 0 291 = true := blkChk_join _ _ _ _ _ 0 281 10 h25 okM26
  have h27 : blkChk C E1.SL_e386.entry UB UBR lits 0 302 = true := blkChk_join _ _ _ _ _ 0 291 11 h26 okM27
  have h28 : blkChk C E1.SL_e386.entry UB UBR lits 0 313 = true := blkChk_join _ _ _ _ _ 0 302 11 h27 okM28
  have h29 : blkChk C E1.SL_e386.entry UB UBR lits 0 325 = true := blkChk_join _ _ _ _ _ 0 313 12 h28 okM29
  have h30 : blkChk C E1.SL_e386.entry UB UBR lits 0 339 = true := blkChk_join _ _ _ _ _ 0 325 14 h29 okM30
  have h31 : blkChk C E1.SL_e386.entry UB UBR lits 0 349 = true := blkChk_join _ _ _ _ _ 0 339 10 h30 okM31
  have h32 : blkChk C E1.SL_e386.entry UB UBR lits 0 365 = true := blkChk_join _ _ _ _ _ 0 349 16 h31 okM32
  have h33 : blkChk C E1.SL_e386.entry UB UBR lits 0 374 = true := blkChk_join _ _ _ _ _ 0 365 9 h32 okM33
  have h34 : blkChk C E1.SL_e386.entry UB UBR lits 0 390 = true := blkChk_join _ _ _ _ _ 0 374 16 h33 okM34
  have h35 : blkChk C E1.SL_e386.entry UB UBR lits 0 406 = true := blkChk_join _ _ _ _ _ 0 390 16 h34 okM35
  have h36 : blkChk C E1.SL_e386.entry UB UBR lits 0 421 = true := blkChk_join _ _ _ _ _ 0 406 15 h35 okM36
  have h37 : blkChk C E1.SL_e386.entry UB UBR lits 0 435 = true := blkChk_join _ _ _ _ _ 0 421 14 h36 okM37
  have h38 : blkChk C E1.SL_e386.entry UB UBR lits 0 450 = true := blkChk_join _ _ _ _ _ 0 435 15 h37 okM38
  have h39 : blkChk C E1.SL_e386.entry UB UBR lits 0 465 = true := blkChk_join _ _ _ _ _ 0 450 15 h38 okM39
  have h40 : blkChk C E1.SL_e386.entry UB UBR lits 0 478 = true := blkChk_join _ _ _ _ _ 0 465 13 h39 okM40
  have h41 : blkChk C E1.SL_e386.entry UB UBR lits 0 488 = true := blkChk_join _ _ _ _ _ 0 478 10 h40 okM41
  have h42 : blkChk C E1.SL_e386.entry UB UBR lits 0 498 = true := blkChk_join _ _ _ _ _ 0 488 10 h41 okM42
  have h43 : blkChk C E1.SL_e386.entry UB UBR lits 0 512 = true := blkChk_join _ _ _ _ _ 0 498 14 h42 okM43
  have h44 : blkChk C E1.SL_e386.entry UB UBR lits 0 528 = true := blkChk_join _ _ _ _ _ 0 512 16 h43 okM44
  have h45 : blkChk C E1.SL_e386.entry UB UBR lits 0 540 = true := blkChk_join _ _ _ _ _ 0 528 12 h44 okM45
  have h46 : blkChk C E1.SL_e386.entry UB UBR lits 0 548 = true := blkChk_join _ _ _ _ _ 0 540 8 h45 okM46
  have h47 : blkChk C E1.SL_e386.entry UB UBR lits 0 561 = true := blkChk_join _ _ _ _ _ 0 548 13 h46 okM47
  have h48 : blkChk C E1.SL_e386.entry UB UBR lits 0 571 = true := blkChk_join _ _ _ _ _ 0 561 10 h47 okM48
  have h49 : blkChk C E1.SL_e386.entry UB UBR lits 0 581 = true := blkChk_join _ _ _ _ _ 0 571 10 h48 okM49
  have h50 : blkChk C E1.SL_e386.entry UB UBR lits 0 592 = true := blkChk_join _ _ _ _ _ 0 581 11 h49 okM50
  have h51 : blkChk C E1.SL_e386.entry UB UBR lits 0 604 = true := blkChk_join _ _ _ _ _ 0 592 12 h50 okM51
  have h52 : blkChk C E1.SL_e386.entry UB UBR lits 0 618 = true := blkChk_join _ _ _ _ _ 0 604 14 h51 okM52
  have h53 : blkChk C E1.SL_e386.entry UB UBR lits 0 627 = true := blkChk_join _ _ _ _ _ 0 618 9 h52 okM53
  have h54 : blkChk C E1.SL_e386.entry UB UBR lits 0 638 = true := blkChk_join _ _ _ _ _ 0 627 11 h53 okM54
  have h55 : blkChk C E1.SL_e386.entry UB UBR lits 0 652 = true := blkChk_join _ _ _ _ _ 0 638 14 h54 okM55
  have h56 : blkChk C E1.SL_e386.entry UB UBR lits 0 663 = true := blkChk_join _ _ _ _ _ 0 652 11 h55 okM56
  have h57 : blkChk C E1.SL_e386.entry UB UBR lits 0 671 = true := blkChk_join _ _ _ _ _ 0 663 8 h56 okM57
  have h58 : blkChk C E1.SL_e386.entry UB UBR lits 0 682 = true := blkChk_join _ _ _ _ _ 0 671 11 h57 okM58
  have h59 : blkChk C E1.SL_e386.entry UB UBR lits 0 692 = true := blkChk_join _ _ _ _ _ 0 682 10 h58 okM59
  have h60 : blkChk C E1.SL_e386.entry UB UBR lits 0 702 = true := blkChk_join _ _ _ _ _ 0 692 10 h59 okM60
  have h61 : blkChk C E1.SL_e386.entry UB UBR lits 0 712 = true := blkChk_join _ _ _ _ _ 0 702 10 h60 okM61
  have h62 : blkChk C E1.SL_e386.entry UB UBR lits 0 724 = true := blkChk_join _ _ _ _ _ 0 712 12 h61 okM62
  have h63 : blkChk C E1.SL_e386.entry UB UBR lits 0 738 = true := blkChk_join _ _ _ _ _ 0 724 14 h62 okM63
  have h64 : blkChk C E1.SL_e386.entry UB UBR lits 0 754 = true := blkChk_join _ _ _ _ _ 0 738 16 h63 okM64
  have h65 : blkChk C E1.SL_e386.entry UB UBR lits 0 770 = true := blkChk_join _ _ _ _ _ 0 754 16 h64 okM65
  have h66 : blkChk C E1.SL_e386.entry UB UBR lits 0 786 = true := blkChk_join _ _ _ _ _ 0 770 16 h65 okM66
  have h67 : blkChk C E1.SL_e386.entry UB UBR lits 0 802 = true := blkChk_join _ _ _ _ _ 0 786 16 h66 okM67
  have h68 : blkChk C E1.SL_e386.entry UB UBR lits 0 818 = true := blkChk_join _ _ _ _ _ 0 802 16 h67 okM68
  have h69 : blkChk C E1.SL_e386.entry UB UBR lits 0 834 = true := blkChk_join _ _ _ _ _ 0 818 16 h68 okM69
  have h70 : blkChk C E1.SL_e386.entry UB UBR lits 0 846 = true := blkChk_join _ _ _ _ _ 0 834 12 h69 okM70
  have h71 : blkChk C E1.SL_e386.entry UB UBR lits 0 856 = true := blkChk_join _ _ _ _ _ 0 846 10 h70 okM71
  have h72 : blkChk C E1.SL_e386.entry UB UBR lits 0 864 = true := blkChk_join _ _ _ _ _ 0 856 8 h71 okM72
  exact h72
theorem len : lits.length = 864 := by decide
theorem okGAll : glueChkR lits W 0 864 = true := by
  have g0 : glueChkR lits W 0 14 = true := okG0
  have g1 : glueChkR lits W 0 26 = true := glueChkR_join _ _ 0 14 12 g0 okG1
  have g2 : glueChkR lits W 0 36 = true := glueChkR_join _ _ 0 26 10 g1 okG2
  have g3 : glueChkR lits W 0 45 = true := glueChkR_join _ _ 0 36 9 g2 okG3
  have g4 : glueChkR lits W 0 57 = true := glueChkR_join _ _ 0 45 12 g3 okG4
  have g5 : glueChkR lits W 0 67 = true := glueChkR_join _ _ 0 57 10 g4 okG5
  have g6 : glueChkR lits W 0 77 = true := glueChkR_join _ _ 0 67 10 g5 okG6
  have g7 : glueChkR lits W 0 87 = true := glueChkR_join _ _ 0 77 10 g6 okG7
  have g8 : glueChkR lits W 0 98 = true := glueChkR_join _ _ 0 87 11 g7 okG8
  have g9 : glueChkR lits W 0 109 = true := glueChkR_join _ _ 0 98 11 g8 okG9
  have g10 : glueChkR lits W 0 119 = true := glueChkR_join _ _ 0 109 10 g9 okG10
  have g11 : glueChkR lits W 0 129 = true := glueChkR_join _ _ 0 119 10 g10 okG11
  have g12 : glueChkR lits W 0 138 = true := glueChkR_join _ _ 0 129 9 g11 okG12
  have g13 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 138 11 g12 okG13
  have g14 : glueChkR lits W 0 158 = true := glueChkR_join _ _ 0 149 9 g13 okG14
  have g15 : glueChkR lits W 0 169 = true := glueChkR_join _ _ 0 158 11 g14 okG15
  have g16 : glueChkR lits W 0 182 = true := glueChkR_join _ _ 0 169 13 g15 okG16
  have g17 : glueChkR lits W 0 193 = true := glueChkR_join _ _ 0 182 11 g16 okG17
  have g18 : glueChkR lits W 0 205 = true := glueChkR_join _ _ 0 193 12 g17 okG18
  have g19 : glueChkR lits W 0 217 = true := glueChkR_join _ _ 0 205 12 g18 okG19
  have g20 : glueChkR lits W 0 228 = true := glueChkR_join _ _ 0 217 11 g19 okG20
  have g21 : glueChkR lits W 0 238 = true := glueChkR_join _ _ 0 228 10 g20 okG21
  have g22 : glueChkR lits W 0 248 = true := glueChkR_join _ _ 0 238 10 g21 okG22
  have g23 : glueChkR lits W 0 259 = true := glueChkR_join _ _ 0 248 11 g22 okG23
  have g24 : glueChkR lits W 0 269 = true := glueChkR_join _ _ 0 259 10 g23 okG24
  have g25 : glueChkR lits W 0 281 = true := glueChkR_join _ _ 0 269 12 g24 okG25
  have g26 : glueChkR lits W 0 291 = true := glueChkR_join _ _ 0 281 10 g25 okG26
  have g27 : glueChkR lits W 0 302 = true := glueChkR_join _ _ 0 291 11 g26 okG27
  have g28 : glueChkR lits W 0 313 = true := glueChkR_join _ _ 0 302 11 g27 okG28
  have g29 : glueChkR lits W 0 325 = true := glueChkR_join _ _ 0 313 12 g28 okG29
  have g30 : glueChkR lits W 0 339 = true := glueChkR_join _ _ 0 325 14 g29 okG30
  have g31 : glueChkR lits W 0 349 = true := glueChkR_join _ _ 0 339 10 g30 okG31
  have g32 : glueChkR lits W 0 365 = true := glueChkR_join _ _ 0 349 16 g31 okG32
  have g33 : glueChkR lits W 0 374 = true := glueChkR_join _ _ 0 365 9 g32 okG33
  have g34 : glueChkR lits W 0 390 = true := glueChkR_join _ _ 0 374 16 g33 okG34
  have g35 : glueChkR lits W 0 406 = true := glueChkR_join _ _ 0 390 16 g34 okG35
  have g36 : glueChkR lits W 0 421 = true := glueChkR_join _ _ 0 406 15 g35 okG36
  have g37 : glueChkR lits W 0 435 = true := glueChkR_join _ _ 0 421 14 g36 okG37
  have g38 : glueChkR lits W 0 450 = true := glueChkR_join _ _ 0 435 15 g37 okG38
  have g39 : glueChkR lits W 0 465 = true := glueChkR_join _ _ 0 450 15 g38 okG39
  have g40 : glueChkR lits W 0 478 = true := glueChkR_join _ _ 0 465 13 g39 okG40
  have g41 : glueChkR lits W 0 488 = true := glueChkR_join _ _ 0 478 10 g40 okG41
  have g42 : glueChkR lits W 0 498 = true := glueChkR_join _ _ 0 488 10 g41 okG42
  have g43 : glueChkR lits W 0 512 = true := glueChkR_join _ _ 0 498 14 g42 okG43
  have g44 : glueChkR lits W 0 528 = true := glueChkR_join _ _ 0 512 16 g43 okG44
  have g45 : glueChkR lits W 0 540 = true := glueChkR_join _ _ 0 528 12 g44 okG45
  have g46 : glueChkR lits W 0 548 = true := glueChkR_join _ _ 0 540 8 g45 okG46
  have g47 : glueChkR lits W 0 561 = true := glueChkR_join _ _ 0 548 13 g46 okG47
  have g48 : glueChkR lits W 0 571 = true := glueChkR_join _ _ 0 561 10 g47 okG48
  have g49 : glueChkR lits W 0 581 = true := glueChkR_join _ _ 0 571 10 g48 okG49
  have g50 : glueChkR lits W 0 592 = true := glueChkR_join _ _ 0 581 11 g49 okG50
  have g51 : glueChkR lits W 0 604 = true := glueChkR_join _ _ 0 592 12 g50 okG51
  have g52 : glueChkR lits W 0 618 = true := glueChkR_join _ _ 0 604 14 g51 okG52
  have g53 : glueChkR lits W 0 627 = true := glueChkR_join _ _ 0 618 9 g52 okG53
  have g54 : glueChkR lits W 0 638 = true := glueChkR_join _ _ 0 627 11 g53 okG54
  have g55 : glueChkR lits W 0 652 = true := glueChkR_join _ _ 0 638 14 g54 okG55
  have g56 : glueChkR lits W 0 663 = true := glueChkR_join _ _ 0 652 11 g55 okG56
  have g57 : glueChkR lits W 0 671 = true := glueChkR_join _ _ 0 663 8 g56 okG57
  have g58 : glueChkR lits W 0 682 = true := glueChkR_join _ _ 0 671 11 g57 okG58
  have g59 : glueChkR lits W 0 692 = true := glueChkR_join _ _ 0 682 10 g58 okG59
  have g60 : glueChkR lits W 0 702 = true := glueChkR_join _ _ 0 692 10 g59 okG60
  have g61 : glueChkR lits W 0 712 = true := glueChkR_join _ _ 0 702 10 g60 okG61
  have g62 : glueChkR lits W 0 724 = true := glueChkR_join _ _ 0 712 12 g61 okG62
  have g63 : glueChkR lits W 0 738 = true := glueChkR_join _ _ 0 724 14 g62 okG63
  have g64 : glueChkR lits W 0 754 = true := glueChkR_join _ _ 0 738 16 g63 okG64
  have g65 : glueChkR lits W 0 770 = true := glueChkR_join _ _ 0 754 16 g64 okG65
  have g66 : glueChkR lits W 0 786 = true := glueChkR_join _ _ 0 770 16 g65 okG66
  have g67 : glueChkR lits W 0 802 = true := glueChkR_join _ _ 0 786 16 g66 okG67
  have g68 : glueChkR lits W 0 818 = true := glueChkR_join _ _ 0 802 16 g67 okG68
  have g69 : glueChkR lits W 0 834 = true := glueChkR_join _ _ 0 818 16 g68 okG69
  have g70 : glueChkR lits W 0 846 = true := glueChkR_join _ _ 0 834 12 g69 okG70
  have g71 : glueChkR lits W 0 856 = true := glueChkR_join _ _ 0 846 10 g70 okG71
  have g72 : glueChkR lits W 0 864 = true := glueChkR_join _ _ 0 856 8 g71 okG72
  exact g72
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e386.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e386.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e386.UB_eq E1.OK_e386.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C386X
