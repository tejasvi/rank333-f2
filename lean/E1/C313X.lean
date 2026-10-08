module
public import R22Port.U_d41d8cd98f00
public import E1.C313X_B0
public import E1.C313X_B1
public import E1.C313X_B2
public import E1.C313X_B3
public import E1.C313X_B4
public import E1.C313X_B5
public import E1.C313X_B6
public import E1.C313X_B7
public import E1.C313X_B8
public import E1.C313X_B9
public import E1.C313X_B10
public import E1.C313X_B11
public import E1.C313X_B12
public import E1.C313X_B13
public import E1.C313X_B14
public import E1.C313X_B15
public import E1.C313X_B16
public import E1.C313X_B17
public import E1.C313X_B18
public import E1.C313X_B19
public import E1.C313X_B20
public import E1.C313X_B21
public import E1.C313X_B22
public import E1.C313X_B23
public import E1.C313X_B24
public import E1.C313X_B25
public import E1.C313X_B26
public import E1.C313X_B27
public import E1.C313X_B28
public import E1.C313X_B29
public import E1.C313X_B30
public import E1.C313X_B31
public import E1.C313X_B32
public import E1.C313X_B33
public import E1.C313X_B34
public import E1.C313X_B35
public import E1.C313X_B36
public import E1.C313X_B37
public import E1.C313X_B38
public import E1.C313X_B39
public import E1.C313X_B40
public import E1.C313X_B41
public import E1.C313X_B42
public import E1.C313X_B43
public import E1.C313X_B44
public import E1.C313X_B45
public import E1.C313X_B46
public import E1.C313X_B47
public import E1.C313X_B48
public import E1.C313X_B49
public import E1.C313X_B50
public import E1.C313X_B51
public import E1.C313X_B52
public import E1.C313X_B53
public import E1.C313X_B54
public import E1.C313X_B55
public import E1.C313X_B56
public import E1.C313X_B57
public import E1.C313X_B58
public import E1.C313X_B59
public import E1.C313X_B60
public import E1.C313X_B61
public import E1.C313X_B62
public import E1.C313X_B63
public import E1.C313X_B64
public import E1.C313X_B65
public import E1.C313X_B66
public import E1.C313X_B67
public import E1.C313X_B68
public import E1.C313X_B69
public import E1.OK_e313
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C313X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C313X
open E1S E1.IP_e313
theorem okAll : blkChk C E1.SL_e313.entry UB UBR lits 0 817 = true := by
  have h0 : blkChk C E1.SL_e313.entry UB UBR lits 0 13 = true := okM0
  have h1 : blkChk C E1.SL_e313.entry UB UBR lits 0 26 = true := blkChk_join _ _ _ _ _ 0 13 13 h0 okM1
  have h2 : blkChk C E1.SL_e313.entry UB UBR lits 0 39 = true := blkChk_join _ _ _ _ _ 0 26 13 h1 okM2
  have h3 : blkChk C E1.SL_e313.entry UB UBR lits 0 51 = true := blkChk_join _ _ _ _ _ 0 39 12 h2 okM3
  have h4 : blkChk C E1.SL_e313.entry UB UBR lits 0 67 = true := blkChk_join _ _ _ _ _ 0 51 16 h3 okM4
  have h5 : blkChk C E1.SL_e313.entry UB UBR lits 0 79 = true := blkChk_join _ _ _ _ _ 0 67 12 h4 okM5
  have h6 : blkChk C E1.SL_e313.entry UB UBR lits 0 94 = true := blkChk_join _ _ _ _ _ 0 79 15 h5 okM6
  have h7 : blkChk C E1.SL_e313.entry UB UBR lits 0 105 = true := blkChk_join _ _ _ _ _ 0 94 11 h6 okM7
  have h8 : blkChk C E1.SL_e313.entry UB UBR lits 0 118 = true := blkChk_join _ _ _ _ _ 0 105 13 h7 okM8
  have h9 : blkChk C E1.SL_e313.entry UB UBR lits 0 130 = true := blkChk_join _ _ _ _ _ 0 118 12 h8 okM9
  have h10 : blkChk C E1.SL_e313.entry UB UBR lits 0 146 = true := blkChk_join _ _ _ _ _ 0 130 16 h9 okM10
  have h11 : blkChk C E1.SL_e313.entry UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 146 10 h10 okM11
  have h12 : blkChk C E1.SL_e313.entry UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 156 12 h11 okM12
  have h13 : blkChk C E1.SL_e313.entry UB UBR lits 0 184 = true := blkChk_join _ _ _ _ _ 0 168 16 h12 okM13
  have h14 : blkChk C E1.SL_e313.entry UB UBR lits 0 193 = true := blkChk_join _ _ _ _ _ 0 184 9 h13 okM14
  have h15 : blkChk C E1.SL_e313.entry UB UBR lits 0 205 = true := blkChk_join _ _ _ _ _ 0 193 12 h14 okM15
  have h16 : blkChk C E1.SL_e313.entry UB UBR lits 0 217 = true := blkChk_join _ _ _ _ _ 0 205 12 h15 okM16
  have h17 : blkChk C E1.SL_e313.entry UB UBR lits 0 227 = true := blkChk_join _ _ _ _ _ 0 217 10 h16 okM17
  have h18 : blkChk C E1.SL_e313.entry UB UBR lits 0 239 = true := blkChk_join _ _ _ _ _ 0 227 12 h17 okM18
  have h19 : blkChk C E1.SL_e313.entry UB UBR lits 0 249 = true := blkChk_join _ _ _ _ _ 0 239 10 h18 okM19
  have h20 : blkChk C E1.SL_e313.entry UB UBR lits 0 263 = true := blkChk_join _ _ _ _ _ 0 249 14 h19 okM20
  have h21 : blkChk C E1.SL_e313.entry UB UBR lits 0 277 = true := blkChk_join _ _ _ _ _ 0 263 14 h20 okM21
  have h22 : blkChk C E1.SL_e313.entry UB UBR lits 0 290 = true := blkChk_join _ _ _ _ _ 0 277 13 h21 okM22
  have h23 : blkChk C E1.SL_e313.entry UB UBR lits 0 306 = true := blkChk_join _ _ _ _ _ 0 290 16 h22 okM23
  have h24 : blkChk C E1.SL_e313.entry UB UBR lits 0 315 = true := blkChk_join _ _ _ _ _ 0 306 9 h23 okM24
  have h25 : blkChk C E1.SL_e313.entry UB UBR lits 0 326 = true := blkChk_join _ _ _ _ _ 0 315 11 h24 okM25
  have h26 : blkChk C E1.SL_e313.entry UB UBR lits 0 337 = true := blkChk_join _ _ _ _ _ 0 326 11 h25 okM26
  have h27 : blkChk C E1.SL_e313.entry UB UBR lits 0 345 = true := blkChk_join _ _ _ _ _ 0 337 8 h26 okM27
  have h28 : blkChk C E1.SL_e313.entry UB UBR lits 0 357 = true := blkChk_join _ _ _ _ _ 0 345 12 h27 okM28
  have h29 : blkChk C E1.SL_e313.entry UB UBR lits 0 368 = true := blkChk_join _ _ _ _ _ 0 357 11 h28 okM29
  have h30 : blkChk C E1.SL_e313.entry UB UBR lits 0 384 = true := blkChk_join _ _ _ _ _ 0 368 16 h29 okM30
  have h31 : blkChk C E1.SL_e313.entry UB UBR lits 0 399 = true := blkChk_join _ _ _ _ _ 0 384 15 h30 okM31
  have h32 : blkChk C E1.SL_e313.entry UB UBR lits 0 410 = true := blkChk_join _ _ _ _ _ 0 399 11 h31 okM32
  have h33 : blkChk C E1.SL_e313.entry UB UBR lits 0 422 = true := blkChk_join _ _ _ _ _ 0 410 12 h32 okM33
  have h34 : blkChk C E1.SL_e313.entry UB UBR lits 0 431 = true := blkChk_join _ _ _ _ _ 0 422 9 h33 okM34
  have h35 : blkChk C E1.SL_e313.entry UB UBR lits 0 440 = true := blkChk_join _ _ _ _ _ 0 431 9 h34 okM35
  have h36 : blkChk C E1.SL_e313.entry UB UBR lits 0 453 = true := blkChk_join _ _ _ _ _ 0 440 13 h35 okM36
  have h37 : blkChk C E1.SL_e313.entry UB UBR lits 0 463 = true := blkChk_join _ _ _ _ _ 0 453 10 h36 okM37
  have h38 : blkChk C E1.SL_e313.entry UB UBR lits 0 474 = true := blkChk_join _ _ _ _ _ 0 463 11 h37 okM38
  have h39 : blkChk C E1.SL_e313.entry UB UBR lits 0 489 = true := blkChk_join _ _ _ _ _ 0 474 15 h38 okM39
  have h40 : blkChk C E1.SL_e313.entry UB UBR lits 0 501 = true := blkChk_join _ _ _ _ _ 0 489 12 h39 okM40
  have h41 : blkChk C E1.SL_e313.entry UB UBR lits 0 508 = true := blkChk_join _ _ _ _ _ 0 501 7 h40 okM41
  have h42 : blkChk C E1.SL_e313.entry UB UBR lits 0 518 = true := blkChk_join _ _ _ _ _ 0 508 10 h41 okM42
  have h43 : blkChk C E1.SL_e313.entry UB UBR lits 0 527 = true := blkChk_join _ _ _ _ _ 0 518 9 h42 okM43
  have h44 : blkChk C E1.SL_e313.entry UB UBR lits 0 537 = true := blkChk_join _ _ _ _ _ 0 527 10 h43 okM44
  have h45 : blkChk C E1.SL_e313.entry UB UBR lits 0 548 = true := blkChk_join _ _ _ _ _ 0 537 11 h44 okM45
  have h46 : blkChk C E1.SL_e313.entry UB UBR lits 0 559 = true := blkChk_join _ _ _ _ _ 0 548 11 h45 okM46
  have h47 : blkChk C E1.SL_e313.entry UB UBR lits 0 572 = true := blkChk_join _ _ _ _ _ 0 559 13 h46 okM47
  have h48 : blkChk C E1.SL_e313.entry UB UBR lits 0 583 = true := blkChk_join _ _ _ _ _ 0 572 11 h47 okM48
  have h49 : blkChk C E1.SL_e313.entry UB UBR lits 0 595 = true := blkChk_join _ _ _ _ _ 0 583 12 h48 okM49
  have h50 : blkChk C E1.SL_e313.entry UB UBR lits 0 610 = true := blkChk_join _ _ _ _ _ 0 595 15 h49 okM50
  have h51 : blkChk C E1.SL_e313.entry UB UBR lits 0 619 = true := blkChk_join _ _ _ _ _ 0 610 9 h50 okM51
  have h52 : blkChk C E1.SL_e313.entry UB UBR lits 0 630 = true := blkChk_join _ _ _ _ _ 0 619 11 h51 okM52
  have h53 : blkChk C E1.SL_e313.entry UB UBR lits 0 643 = true := blkChk_join _ _ _ _ _ 0 630 13 h52 okM53
  have h54 : blkChk C E1.SL_e313.entry UB UBR lits 0 654 = true := blkChk_join _ _ _ _ _ 0 643 11 h53 okM54
  have h55 : blkChk C E1.SL_e313.entry UB UBR lits 0 667 = true := blkChk_join _ _ _ _ _ 0 654 13 h54 okM55
  have h56 : blkChk C E1.SL_e313.entry UB UBR lits 0 676 = true := blkChk_join _ _ _ _ _ 0 667 9 h55 okM56
  have h57 : blkChk C E1.SL_e313.entry UB UBR lits 0 685 = true := blkChk_join _ _ _ _ _ 0 676 9 h56 okM57
  have h58 : blkChk C E1.SL_e313.entry UB UBR lits 0 693 = true := blkChk_join _ _ _ _ _ 0 685 8 h57 okM58
  have h59 : blkChk C E1.SL_e313.entry UB UBR lits 0 705 = true := blkChk_join _ _ _ _ _ 0 693 12 h58 okM59
  have h60 : blkChk C E1.SL_e313.entry UB UBR lits 0 720 = true := blkChk_join _ _ _ _ _ 0 705 15 h59 okM60
  have h61 : blkChk C E1.SL_e313.entry UB UBR lits 0 735 = true := blkChk_join _ _ _ _ _ 0 720 15 h60 okM61
  have h62 : blkChk C E1.SL_e313.entry UB UBR lits 0 747 = true := blkChk_join _ _ _ _ _ 0 735 12 h61 okM62
  have h63 : blkChk C E1.SL_e313.entry UB UBR lits 0 758 = true := blkChk_join _ _ _ _ _ 0 747 11 h62 okM63
  have h64 : blkChk C E1.SL_e313.entry UB UBR lits 0 772 = true := blkChk_join _ _ _ _ _ 0 758 14 h63 okM64
  have h65 : blkChk C E1.SL_e313.entry UB UBR lits 0 782 = true := blkChk_join _ _ _ _ _ 0 772 10 h64 okM65
  have h66 : blkChk C E1.SL_e313.entry UB UBR lits 0 792 = true := blkChk_join _ _ _ _ _ 0 782 10 h65 okM66
  have h67 : blkChk C E1.SL_e313.entry UB UBR lits 0 804 = true := blkChk_join _ _ _ _ _ 0 792 12 h66 okM67
  have h68 : blkChk C E1.SL_e313.entry UB UBR lits 0 815 = true := blkChk_join _ _ _ _ _ 0 804 11 h67 okM68
  have h69 : blkChk C E1.SL_e313.entry UB UBR lits 0 817 = true := blkChk_join _ _ _ _ _ 0 815 2 h68 okM69
  exact h69
theorem len : lits.length = 817 := by decide
theorem okGAll : glueChkR lits W 0 817 = true := by
  have g0 : glueChkR lits W 0 13 = true := okG0
  have g1 : glueChkR lits W 0 26 = true := glueChkR_join _ _ 0 13 13 g0 okG1
  have g2 : glueChkR lits W 0 39 = true := glueChkR_join _ _ 0 26 13 g1 okG2
  have g3 : glueChkR lits W 0 51 = true := glueChkR_join _ _ 0 39 12 g2 okG3
  have g4 : glueChkR lits W 0 67 = true := glueChkR_join _ _ 0 51 16 g3 okG4
  have g5 : glueChkR lits W 0 79 = true := glueChkR_join _ _ 0 67 12 g4 okG5
  have g6 : glueChkR lits W 0 94 = true := glueChkR_join _ _ 0 79 15 g5 okG6
  have g7 : glueChkR lits W 0 105 = true := glueChkR_join _ _ 0 94 11 g6 okG7
  have g8 : glueChkR lits W 0 118 = true := glueChkR_join _ _ 0 105 13 g7 okG8
  have g9 : glueChkR lits W 0 130 = true := glueChkR_join _ _ 0 118 12 g8 okG9
  have g10 : glueChkR lits W 0 146 = true := glueChkR_join _ _ 0 130 16 g9 okG10
  have g11 : glueChkR lits W 0 156 = true := glueChkR_join _ _ 0 146 10 g10 okG11
  have g12 : glueChkR lits W 0 168 = true := glueChkR_join _ _ 0 156 12 g11 okG12
  have g13 : glueChkR lits W 0 184 = true := glueChkR_join _ _ 0 168 16 g12 okG13
  have g14 : glueChkR lits W 0 193 = true := glueChkR_join _ _ 0 184 9 g13 okG14
  have g15 : glueChkR lits W 0 205 = true := glueChkR_join _ _ 0 193 12 g14 okG15
  have g16 : glueChkR lits W 0 217 = true := glueChkR_join _ _ 0 205 12 g15 okG16
  have g17 : glueChkR lits W 0 227 = true := glueChkR_join _ _ 0 217 10 g16 okG17
  have g18 : glueChkR lits W 0 239 = true := glueChkR_join _ _ 0 227 12 g17 okG18
  have g19 : glueChkR lits W 0 249 = true := glueChkR_join _ _ 0 239 10 g18 okG19
  have g20 : glueChkR lits W 0 263 = true := glueChkR_join _ _ 0 249 14 g19 okG20
  have g21 : glueChkR lits W 0 277 = true := glueChkR_join _ _ 0 263 14 g20 okG21
  have g22 : glueChkR lits W 0 290 = true := glueChkR_join _ _ 0 277 13 g21 okG22
  have g23 : glueChkR lits W 0 306 = true := glueChkR_join _ _ 0 290 16 g22 okG23
  have g24 : glueChkR lits W 0 315 = true := glueChkR_join _ _ 0 306 9 g23 okG24
  have g25 : glueChkR lits W 0 326 = true := glueChkR_join _ _ 0 315 11 g24 okG25
  have g26 : glueChkR lits W 0 337 = true := glueChkR_join _ _ 0 326 11 g25 okG26
  have g27 : glueChkR lits W 0 345 = true := glueChkR_join _ _ 0 337 8 g26 okG27
  have g28 : glueChkR lits W 0 357 = true := glueChkR_join _ _ 0 345 12 g27 okG28
  have g29 : glueChkR lits W 0 368 = true := glueChkR_join _ _ 0 357 11 g28 okG29
  have g30 : glueChkR lits W 0 384 = true := glueChkR_join _ _ 0 368 16 g29 okG30
  have g31 : glueChkR lits W 0 399 = true := glueChkR_join _ _ 0 384 15 g30 okG31
  have g32 : glueChkR lits W 0 410 = true := glueChkR_join _ _ 0 399 11 g31 okG32
  have g33 : glueChkR lits W 0 422 = true := glueChkR_join _ _ 0 410 12 g32 okG33
  have g34 : glueChkR lits W 0 431 = true := glueChkR_join _ _ 0 422 9 g33 okG34
  have g35 : glueChkR lits W 0 440 = true := glueChkR_join _ _ 0 431 9 g34 okG35
  have g36 : glueChkR lits W 0 453 = true := glueChkR_join _ _ 0 440 13 g35 okG36
  have g37 : glueChkR lits W 0 463 = true := glueChkR_join _ _ 0 453 10 g36 okG37
  have g38 : glueChkR lits W 0 474 = true := glueChkR_join _ _ 0 463 11 g37 okG38
  have g39 : glueChkR lits W 0 489 = true := glueChkR_join _ _ 0 474 15 g38 okG39
  have g40 : glueChkR lits W 0 501 = true := glueChkR_join _ _ 0 489 12 g39 okG40
  have g41 : glueChkR lits W 0 508 = true := glueChkR_join _ _ 0 501 7 g40 okG41
  have g42 : glueChkR lits W 0 518 = true := glueChkR_join _ _ 0 508 10 g41 okG42
  have g43 : glueChkR lits W 0 527 = true := glueChkR_join _ _ 0 518 9 g42 okG43
  have g44 : glueChkR lits W 0 537 = true := glueChkR_join _ _ 0 527 10 g43 okG44
  have g45 : glueChkR lits W 0 548 = true := glueChkR_join _ _ 0 537 11 g44 okG45
  have g46 : glueChkR lits W 0 559 = true := glueChkR_join _ _ 0 548 11 g45 okG46
  have g47 : glueChkR lits W 0 572 = true := glueChkR_join _ _ 0 559 13 g46 okG47
  have g48 : glueChkR lits W 0 583 = true := glueChkR_join _ _ 0 572 11 g47 okG48
  have g49 : glueChkR lits W 0 595 = true := glueChkR_join _ _ 0 583 12 g48 okG49
  have g50 : glueChkR lits W 0 610 = true := glueChkR_join _ _ 0 595 15 g49 okG50
  have g51 : glueChkR lits W 0 619 = true := glueChkR_join _ _ 0 610 9 g50 okG51
  have g52 : glueChkR lits W 0 630 = true := glueChkR_join _ _ 0 619 11 g51 okG52
  have g53 : glueChkR lits W 0 643 = true := glueChkR_join _ _ 0 630 13 g52 okG53
  have g54 : glueChkR lits W 0 654 = true := glueChkR_join _ _ 0 643 11 g53 okG54
  have g55 : glueChkR lits W 0 667 = true := glueChkR_join _ _ 0 654 13 g54 okG55
  have g56 : glueChkR lits W 0 676 = true := glueChkR_join _ _ 0 667 9 g55 okG56
  have g57 : glueChkR lits W 0 685 = true := glueChkR_join _ _ 0 676 9 g56 okG57
  have g58 : glueChkR lits W 0 693 = true := glueChkR_join _ _ 0 685 8 g57 okG58
  have g59 : glueChkR lits W 0 705 = true := glueChkR_join _ _ 0 693 12 g58 okG59
  have g60 : glueChkR lits W 0 720 = true := glueChkR_join _ _ 0 705 15 g59 okG60
  have g61 : glueChkR lits W 0 735 = true := glueChkR_join _ _ 0 720 15 g60 okG61
  have g62 : glueChkR lits W 0 747 = true := glueChkR_join _ _ 0 735 12 g61 okG62
  have g63 : glueChkR lits W 0 758 = true := glueChkR_join _ _ 0 747 11 g62 okG63
  have g64 : glueChkR lits W 0 772 = true := glueChkR_join _ _ 0 758 14 g63 okG64
  have g65 : glueChkR lits W 0 782 = true := glueChkR_join _ _ 0 772 10 g64 okG65
  have g66 : glueChkR lits W 0 792 = true := glueChkR_join _ _ 0 782 10 g65 okG66
  have g67 : glueChkR lits W 0 804 = true := glueChkR_join _ _ 0 792 12 g66 okG67
  have g68 : glueChkR lits W 0 815 = true := glueChkR_join _ _ 0 804 11 g67 okG68
  have g69 : glueChkR lits W 0 817 = true := glueChkR_join _ _ 0 815 2 g68 okG69
  exact g69
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e313.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e313.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e313.UB_eq E1.OK_e313.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C313X
