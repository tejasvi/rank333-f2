module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_B0
public import E1.C387X_B1
public import E1.C387X_B2
public import E1.C387X_B3
public import E1.C387X_B4
public import E1.C387X_B5
public import E1.C387X_B6
public import E1.C387X_B7
public import E1.C387X_B8
public import E1.C387X_B9
public import E1.C387X_B10
public import E1.C387X_B11
public import E1.C387X_B12
public import E1.C387X_B13
public import E1.C387X_B14
public import E1.C387X_B15
public import E1.C387X_B16
public import E1.C387X_B17
public import E1.C387X_B18
public import E1.C387X_B19
public import E1.C387X_B20
public import E1.C387X_B21
public import E1.C387X_B22
public import E1.C387X_B23
public import E1.C387X_B24
public import E1.C387X_B25
public import E1.C387X_B26
public import E1.C387X_B27
public import E1.C387X_B28
public import E1.C387X_B29
public import E1.C387X_B30
public import E1.C387X_B31
public import E1.C387X_B32
public import E1.C387X_B33
public import E1.C387X_B34
public import E1.C387X_B35
public import E1.C387X_B36
public import E1.C387X_B37
public import E1.C387X_B38
public import E1.C387X_B39
public import E1.C387X_B40
public import E1.C387X_B41
public import E1.C387X_B42
public import E1.C387X_B43
public import E1.C387X_B44
public import E1.C387X_B45
public import E1.C387X_B46
public import E1.C387X_B47
public import E1.C387X_B48
public import E1.C387X_B49
public import E1.C387X_B50
public import E1.C387X_B51
public import E1.C387X_B52
public import E1.C387X_B53
public import E1.C387X_B54
public import E1.C387X_B55
public import E1.C387X_B56
public import E1.C387X_B57
public import E1.C387X_B58
public import E1.C387X_B59
public import E1.C387X_B60
public import E1.C387X_B61
public import E1.C387X_B62
public import E1.C387X_B63
public import E1.C387X_B64
public import E1.C387X_B65
public import E1.C387X_B66
public import E1.C387X_B67
public import E1.C387X_B68
public import E1.C387X_B69
public import E1.C387X_B70
public import E1.C387X_B71
public import E1.C387X_B72
public import E1.C387X_B73
public import E1.C387X_B74
public import E1.C387X_B75
public import E1.C387X_B76
public import E1.C387X_B77
public import E1.C387X_B78
public import E1.C387X_B79
public import E1.C387X_B80
public import E1.C387X_B81
public import E1.C387X_B82
public import E1.C387X_B83
public import E1.C387X_B84
public import E1.C387X_B85
public import E1.C387X_B86
public import E1.C387X_B87
public import E1.C387X_B88
public import E1.C387X_B89
public import E1.C387X_B90
public import E1.C387X_B91
public import E1.C387X_B92
public import E1.C387X_B93
public import E1.C387X_B94
public import E1.C387X_B95
public import E1.C387X_B96
public import E1.C387X_B97
public import E1.C387X_B98
public import E1.C387X_B99
public import E1.C387X_B100
public import E1.C387X_B101
public import E1.C387X_B102
public import E1.C387X_B103
public import E1.C387X_B104
public import E1.C387X_B105
public import E1.C387X_B106
public import E1.C387X_B107
public import E1.C387X_B108
public import E1.C387X_B109
public import E1.C387X_B110
public import E1.C387X_B111
public import E1.C387X_B112
public import E1.C387X_B113
public import E1.C387X_B114
public import E1.OK_e387
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C387X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C387X
open E1S E1.IP_e387
theorem okAll : blkChk C E1.SL_e387.entry UB UBR lits 0 1241 = true := by
  have h0 : blkChk C E1.SL_e387.entry UB UBR lits 0 10 = true := okM0
  have h1 : blkChk C E1.SL_e387.entry UB UBR lits 0 26 = true := blkChk_join _ _ _ _ _ 0 10 16 h0 okM1
  have h2 : blkChk C E1.SL_e387.entry UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 26 10 h1 okM2
  have h3 : blkChk C E1.SL_e387.entry UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 36 12 h2 okM3
  have h4 : blkChk C E1.SL_e387.entry UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 48 8 h3 okM4
  have h5 : blkChk C E1.SL_e387.entry UB UBR lits 0 67 = true := blkChk_join _ _ _ _ _ 0 56 11 h4 okM5
  have h6 : blkChk C E1.SL_e387.entry UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 67 13 h5 okM6
  have h7 : blkChk C E1.SL_e387.entry UB UBR lits 0 94 = true := blkChk_join _ _ _ _ _ 0 80 14 h6 okM7
  have h8 : blkChk C E1.SL_e387.entry UB UBR lits 0 105 = true := blkChk_join _ _ _ _ _ 0 94 11 h7 okM8
  have h9 : blkChk C E1.SL_e387.entry UB UBR lits 0 113 = true := blkChk_join _ _ _ _ _ 0 105 8 h8 okM9
  have h10 : blkChk C E1.SL_e387.entry UB UBR lits 0 123 = true := blkChk_join _ _ _ _ _ 0 113 10 h9 okM10
  have h11 : blkChk C E1.SL_e387.entry UB UBR lits 0 135 = true := blkChk_join _ _ _ _ _ 0 123 12 h10 okM11
  have h12 : blkChk C E1.SL_e387.entry UB UBR lits 0 147 = true := blkChk_join _ _ _ _ _ 0 135 12 h11 okM12
  have h13 : blkChk C E1.SL_e387.entry UB UBR lits 0 157 = true := blkChk_join _ _ _ _ _ 0 147 10 h12 okM13
  have h14 : blkChk C E1.SL_e387.entry UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 157 11 h13 okM14
  have h15 : blkChk C E1.SL_e387.entry UB UBR lits 0 178 = true := blkChk_join _ _ _ _ _ 0 168 10 h14 okM15
  have h16 : blkChk C E1.SL_e387.entry UB UBR lits 0 187 = true := blkChk_join _ _ _ _ _ 0 178 9 h15 okM16
  have h17 : blkChk C E1.SL_e387.entry UB UBR lits 0 197 = true := blkChk_join _ _ _ _ _ 0 187 10 h16 okM17
  have h18 : blkChk C E1.SL_e387.entry UB UBR lits 0 207 = true := blkChk_join _ _ _ _ _ 0 197 10 h17 okM18
  have h19 : blkChk C E1.SL_e387.entry UB UBR lits 0 219 = true := blkChk_join _ _ _ _ _ 0 207 12 h18 okM19
  have h20 : blkChk C E1.SL_e387.entry UB UBR lits 0 228 = true := blkChk_join _ _ _ _ _ 0 219 9 h19 okM20
  have h21 : blkChk C E1.SL_e387.entry UB UBR lits 0 241 = true := blkChk_join _ _ _ _ _ 0 228 13 h20 okM21
  have h22 : blkChk C E1.SL_e387.entry UB UBR lits 0 250 = true := blkChk_join _ _ _ _ _ 0 241 9 h21 okM22
  have h23 : blkChk C E1.SL_e387.entry UB UBR lits 0 261 = true := blkChk_join _ _ _ _ _ 0 250 11 h22 okM23
  have h24 : blkChk C E1.SL_e387.entry UB UBR lits 0 273 = true := blkChk_join _ _ _ _ _ 0 261 12 h23 okM24
  have h25 : blkChk C E1.SL_e387.entry UB UBR lits 0 287 = true := blkChk_join _ _ _ _ _ 0 273 14 h24 okM25
  have h26 : blkChk C E1.SL_e387.entry UB UBR lits 0 296 = true := blkChk_join _ _ _ _ _ 0 287 9 h25 okM26
  have h27 : blkChk C E1.SL_e387.entry UB UBR lits 0 307 = true := blkChk_join _ _ _ _ _ 0 296 11 h26 okM27
  have h28 : blkChk C E1.SL_e387.entry UB UBR lits 0 321 = true := blkChk_join _ _ _ _ _ 0 307 14 h27 okM28
  have h29 : blkChk C E1.SL_e387.entry UB UBR lits 0 330 = true := blkChk_join _ _ _ _ _ 0 321 9 h28 okM29
  have h30 : blkChk C E1.SL_e387.entry UB UBR lits 0 339 = true := blkChk_join _ _ _ _ _ 0 330 9 h29 okM30
  have h31 : blkChk C E1.SL_e387.entry UB UBR lits 0 347 = true := blkChk_join _ _ _ _ _ 0 339 8 h30 okM31
  have h32 : blkChk C E1.SL_e387.entry UB UBR lits 0 360 = true := blkChk_join _ _ _ _ _ 0 347 13 h31 okM32
  have h33 : blkChk C E1.SL_e387.entry UB UBR lits 0 369 = true := blkChk_join _ _ _ _ _ 0 360 9 h32 okM33
  have h34 : blkChk C E1.SL_e387.entry UB UBR lits 0 377 = true := blkChk_join _ _ _ _ _ 0 369 8 h33 okM34
  have h35 : blkChk C E1.SL_e387.entry UB UBR lits 0 391 = true := blkChk_join _ _ _ _ _ 0 377 14 h34 okM35
  have h36 : blkChk C E1.SL_e387.entry UB UBR lits 0 403 = true := blkChk_join _ _ _ _ _ 0 391 12 h35 okM36
  have h37 : blkChk C E1.SL_e387.entry UB UBR lits 0 418 = true := blkChk_join _ _ _ _ _ 0 403 15 h36 okM37
  have h38 : blkChk C E1.SL_e387.entry UB UBR lits 0 428 = true := blkChk_join _ _ _ _ _ 0 418 10 h37 okM38
  have h39 : blkChk C E1.SL_e387.entry UB UBR lits 0 441 = true := blkChk_join _ _ _ _ _ 0 428 13 h38 okM39
  have h40 : blkChk C E1.SL_e387.entry UB UBR lits 0 451 = true := blkChk_join _ _ _ _ _ 0 441 10 h39 okM40
  have h41 : blkChk C E1.SL_e387.entry UB UBR lits 0 466 = true := blkChk_join _ _ _ _ _ 0 451 15 h40 okM41
  have h42 : blkChk C E1.SL_e387.entry UB UBR lits 0 479 = true := blkChk_join _ _ _ _ _ 0 466 13 h41 okM42
  have h43 : blkChk C E1.SL_e387.entry UB UBR lits 0 489 = true := blkChk_join _ _ _ _ _ 0 479 10 h42 okM43
  have h44 : blkChk C E1.SL_e387.entry UB UBR lits 0 498 = true := blkChk_join _ _ _ _ _ 0 489 9 h43 okM44
  have h45 : blkChk C E1.SL_e387.entry UB UBR lits 0 507 = true := blkChk_join _ _ _ _ _ 0 498 9 h44 okM45
  have h46 : blkChk C E1.SL_e387.entry UB UBR lits 0 516 = true := blkChk_join _ _ _ _ _ 0 507 9 h45 okM46
  have h47 : blkChk C E1.SL_e387.entry UB UBR lits 0 528 = true := blkChk_join _ _ _ _ _ 0 516 12 h46 okM47
  have h48 : blkChk C E1.SL_e387.entry UB UBR lits 0 542 = true := blkChk_join _ _ _ _ _ 0 528 14 h47 okM48
  have h49 : blkChk C E1.SL_e387.entry UB UBR lits 0 553 = true := blkChk_join _ _ _ _ _ 0 542 11 h48 okM49
  have h50 : blkChk C E1.SL_e387.entry UB UBR lits 0 566 = true := blkChk_join _ _ _ _ _ 0 553 13 h49 okM50
  have h51 : blkChk C E1.SL_e387.entry UB UBR lits 0 577 = true := blkChk_join _ _ _ _ _ 0 566 11 h50 okM51
  have h52 : blkChk C E1.SL_e387.entry UB UBR lits 0 586 = true := blkChk_join _ _ _ _ _ 0 577 9 h51 okM52
  have h53 : blkChk C E1.SL_e387.entry UB UBR lits 0 595 = true := blkChk_join _ _ _ _ _ 0 586 9 h52 okM53
  have h54 : blkChk C E1.SL_e387.entry UB UBR lits 0 603 = true := blkChk_join _ _ _ _ _ 0 595 8 h53 okM54
  have h55 : blkChk C E1.SL_e387.entry UB UBR lits 0 615 = true := blkChk_join _ _ _ _ _ 0 603 12 h54 okM55
  have h56 : blkChk C E1.SL_e387.entry UB UBR lits 0 629 = true := blkChk_join _ _ _ _ _ 0 615 14 h55 okM56
  have h57 : blkChk C E1.SL_e387.entry UB UBR lits 0 640 = true := blkChk_join _ _ _ _ _ 0 629 11 h56 okM57
  have h58 : blkChk C E1.SL_e387.entry UB UBR lits 0 648 = true := blkChk_join _ _ _ _ _ 0 640 8 h57 okM58
  have h59 : blkChk C E1.SL_e387.entry UB UBR lits 0 657 = true := blkChk_join _ _ _ _ _ 0 648 9 h58 okM59
  have h60 : blkChk C E1.SL_e387.entry UB UBR lits 0 670 = true := blkChk_join _ _ _ _ _ 0 657 13 h59 okM60
  have h61 : blkChk C E1.SL_e387.entry UB UBR lits 0 681 = true := blkChk_join _ _ _ _ _ 0 670 11 h60 okM61
  have h62 : blkChk C E1.SL_e387.entry UB UBR lits 0 696 = true := blkChk_join _ _ _ _ _ 0 681 15 h61 okM62
  have h63 : blkChk C E1.SL_e387.entry UB UBR lits 0 706 = true := blkChk_join _ _ _ _ _ 0 696 10 h62 okM63
  have h64 : blkChk C E1.SL_e387.entry UB UBR lits 0 713 = true := blkChk_join _ _ _ _ _ 0 706 7 h63 okM64
  have h65 : blkChk C E1.SL_e387.entry UB UBR lits 0 723 = true := blkChk_join _ _ _ _ _ 0 713 10 h64 okM65
  have h66 : blkChk C E1.SL_e387.entry UB UBR lits 0 737 = true := blkChk_join _ _ _ _ _ 0 723 14 h65 okM66
  have h67 : blkChk C E1.SL_e387.entry UB UBR lits 0 744 = true := blkChk_join _ _ _ _ _ 0 737 7 h66 okM67
  have h68 : blkChk C E1.SL_e387.entry UB UBR lits 0 753 = true := blkChk_join _ _ _ _ _ 0 744 9 h67 okM68
  have h69 : blkChk C E1.SL_e387.entry UB UBR lits 0 764 = true := blkChk_join _ _ _ _ _ 0 753 11 h68 okM69
  have h70 : blkChk C E1.SL_e387.entry UB UBR lits 0 773 = true := blkChk_join _ _ _ _ _ 0 764 9 h69 okM70
  have h71 : blkChk C E1.SL_e387.entry UB UBR lits 0 783 = true := blkChk_join _ _ _ _ _ 0 773 10 h70 okM71
  have h72 : blkChk C E1.SL_e387.entry UB UBR lits 0 792 = true := blkChk_join _ _ _ _ _ 0 783 9 h71 okM72
  have h73 : blkChk C E1.SL_e387.entry UB UBR lits 0 799 = true := blkChk_join _ _ _ _ _ 0 792 7 h72 okM73
  have h74 : blkChk C E1.SL_e387.entry UB UBR lits 0 814 = true := blkChk_join _ _ _ _ _ 0 799 15 h73 okM74
  have h75 : blkChk C E1.SL_e387.entry UB UBR lits 0 824 = true := blkChk_join _ _ _ _ _ 0 814 10 h74 okM75
  have h76 : blkChk C E1.SL_e387.entry UB UBR lits 0 834 = true := blkChk_join _ _ _ _ _ 0 824 10 h75 okM76
  have h77 : blkChk C E1.SL_e387.entry UB UBR lits 0 845 = true := blkChk_join _ _ _ _ _ 0 834 11 h76 okM77
  have h78 : blkChk C E1.SL_e387.entry UB UBR lits 0 855 = true := blkChk_join _ _ _ _ _ 0 845 10 h77 okM78
  have h79 : blkChk C E1.SL_e387.entry UB UBR lits 0 865 = true := blkChk_join _ _ _ _ _ 0 855 10 h78 okM79
  have h80 : blkChk C E1.SL_e387.entry UB UBR lits 0 876 = true := blkChk_join _ _ _ _ _ 0 865 11 h79 okM80
  have h81 : blkChk C E1.SL_e387.entry UB UBR lits 0 886 = true := blkChk_join _ _ _ _ _ 0 876 10 h80 okM81
  have h82 : blkChk C E1.SL_e387.entry UB UBR lits 0 895 = true := blkChk_join _ _ _ _ _ 0 886 9 h81 okM82
  have h83 : blkChk C E1.SL_e387.entry UB UBR lits 0 909 = true := blkChk_join _ _ _ _ _ 0 895 14 h82 okM83
  have h84 : blkChk C E1.SL_e387.entry UB UBR lits 0 921 = true := blkChk_join _ _ _ _ _ 0 909 12 h83 okM84
  have h85 : blkChk C E1.SL_e387.entry UB UBR lits 0 931 = true := blkChk_join _ _ _ _ _ 0 921 10 h84 okM85
  have h86 : blkChk C E1.SL_e387.entry UB UBR lits 0 941 = true := blkChk_join _ _ _ _ _ 0 931 10 h85 okM86
  have h87 : blkChk C E1.SL_e387.entry UB UBR lits 0 952 = true := blkChk_join _ _ _ _ _ 0 941 11 h86 okM87
  have h88 : blkChk C E1.SL_e387.entry UB UBR lits 0 963 = true := blkChk_join _ _ _ _ _ 0 952 11 h87 okM88
  have h89 : blkChk C E1.SL_e387.entry UB UBR lits 0 976 = true := blkChk_join _ _ _ _ _ 0 963 13 h88 okM89
  have h90 : blkChk C E1.SL_e387.entry UB UBR lits 0 989 = true := blkChk_join _ _ _ _ _ 0 976 13 h89 okM90
  have h91 : blkChk C E1.SL_e387.entry UB UBR lits 0 1001 = true := blkChk_join _ _ _ _ _ 0 989 12 h90 okM91
  have h92 : blkChk C E1.SL_e387.entry UB UBR lits 0 1013 = true := blkChk_join _ _ _ _ _ 0 1001 12 h91 okM92
  have h93 : blkChk C E1.SL_e387.entry UB UBR lits 0 1023 = true := blkChk_join _ _ _ _ _ 0 1013 10 h92 okM93
  have h94 : blkChk C E1.SL_e387.entry UB UBR lits 0 1032 = true := blkChk_join _ _ _ _ _ 0 1023 9 h93 okM94
  have h95 : blkChk C E1.SL_e387.entry UB UBR lits 0 1044 = true := blkChk_join _ _ _ _ _ 0 1032 12 h94 okM95
  have h96 : blkChk C E1.SL_e387.entry UB UBR lits 0 1053 = true := blkChk_join _ _ _ _ _ 0 1044 9 h95 okM96
  have h97 : blkChk C E1.SL_e387.entry UB UBR lits 0 1062 = true := blkChk_join _ _ _ _ _ 0 1053 9 h96 okM97
  have h98 : blkChk C E1.SL_e387.entry UB UBR lits 0 1071 = true := blkChk_join _ _ _ _ _ 0 1062 9 h97 okM98
  have h99 : blkChk C E1.SL_e387.entry UB UBR lits 0 1079 = true := blkChk_join _ _ _ _ _ 0 1071 8 h98 okM99
  have h100 : blkChk C E1.SL_e387.entry UB UBR lits 0 1090 = true := blkChk_join _ _ _ _ _ 0 1079 11 h99 okM100
  have h101 : blkChk C E1.SL_e387.entry UB UBR lits 0 1100 = true := blkChk_join _ _ _ _ _ 0 1090 10 h100 okM101
  have h102 : blkChk C E1.SL_e387.entry UB UBR lits 0 1109 = true := blkChk_join _ _ _ _ _ 0 1100 9 h101 okM102
  have h103 : blkChk C E1.SL_e387.entry UB UBR lits 0 1121 = true := blkChk_join _ _ _ _ _ 0 1109 12 h102 okM103
  have h104 : blkChk C E1.SL_e387.entry UB UBR lits 0 1137 = true := blkChk_join _ _ _ _ _ 0 1121 16 h103 okM104
  have h105 : blkChk C E1.SL_e387.entry UB UBR lits 0 1147 = true := blkChk_join _ _ _ _ _ 0 1137 10 h104 okM105
  have h106 : blkChk C E1.SL_e387.entry UB UBR lits 0 1163 = true := blkChk_join _ _ _ _ _ 0 1147 16 h105 okM106
  have h107 : blkChk C E1.SL_e387.entry UB UBR lits 0 1172 = true := blkChk_join _ _ _ _ _ 0 1163 9 h106 okM107
  have h108 : blkChk C E1.SL_e387.entry UB UBR lits 0 1180 = true := blkChk_join _ _ _ _ _ 0 1172 8 h107 okM108
  have h109 : blkChk C E1.SL_e387.entry UB UBR lits 0 1193 = true := blkChk_join _ _ _ _ _ 0 1180 13 h108 okM109
  have h110 : blkChk C E1.SL_e387.entry UB UBR lits 0 1205 = true := blkChk_join _ _ _ _ _ 0 1193 12 h109 okM110
  have h111 : blkChk C E1.SL_e387.entry UB UBR lits 0 1216 = true := blkChk_join _ _ _ _ _ 0 1205 11 h110 okM111
  have h112 : blkChk C E1.SL_e387.entry UB UBR lits 0 1227 = true := blkChk_join _ _ _ _ _ 0 1216 11 h111 okM112
  have h113 : blkChk C E1.SL_e387.entry UB UBR lits 0 1240 = true := blkChk_join _ _ _ _ _ 0 1227 13 h112 okM113
  have h114 : blkChk C E1.SL_e387.entry UB UBR lits 0 1241 = true := blkChk_join _ _ _ _ _ 0 1240 1 h113 okM114
  exact h114
theorem len : lits.length = 1241 := by decide
theorem okGAll : glueChkR lits W 0 1241 = true := by
  have g0 : glueChkR lits W 0 10 = true := okG0
  have g1 : glueChkR lits W 0 26 = true := glueChkR_join _ _ 0 10 16 g0 okG1
  have g2 : glueChkR lits W 0 36 = true := glueChkR_join _ _ 0 26 10 g1 okG2
  have g3 : glueChkR lits W 0 48 = true := glueChkR_join _ _ 0 36 12 g2 okG3
  have g4 : glueChkR lits W 0 56 = true := glueChkR_join _ _ 0 48 8 g3 okG4
  have g5 : glueChkR lits W 0 67 = true := glueChkR_join _ _ 0 56 11 g4 okG5
  have g6 : glueChkR lits W 0 80 = true := glueChkR_join _ _ 0 67 13 g5 okG6
  have g7 : glueChkR lits W 0 94 = true := glueChkR_join _ _ 0 80 14 g6 okG7
  have g8 : glueChkR lits W 0 105 = true := glueChkR_join _ _ 0 94 11 g7 okG8
  have g9 : glueChkR lits W 0 113 = true := glueChkR_join _ _ 0 105 8 g8 okG9
  have g10 : glueChkR lits W 0 123 = true := glueChkR_join _ _ 0 113 10 g9 okG10
  have g11 : glueChkR lits W 0 135 = true := glueChkR_join _ _ 0 123 12 g10 okG11
  have g12 : glueChkR lits W 0 147 = true := glueChkR_join _ _ 0 135 12 g11 okG12
  have g13 : glueChkR lits W 0 157 = true := glueChkR_join _ _ 0 147 10 g12 okG13
  have g14 : glueChkR lits W 0 168 = true := glueChkR_join _ _ 0 157 11 g13 okG14
  have g15 : glueChkR lits W 0 178 = true := glueChkR_join _ _ 0 168 10 g14 okG15
  have g16 : glueChkR lits W 0 187 = true := glueChkR_join _ _ 0 178 9 g15 okG16
  have g17 : glueChkR lits W 0 197 = true := glueChkR_join _ _ 0 187 10 g16 okG17
  have g18 : glueChkR lits W 0 207 = true := glueChkR_join _ _ 0 197 10 g17 okG18
  have g19 : glueChkR lits W 0 219 = true := glueChkR_join _ _ 0 207 12 g18 okG19
  have g20 : glueChkR lits W 0 228 = true := glueChkR_join _ _ 0 219 9 g19 okG20
  have g21 : glueChkR lits W 0 241 = true := glueChkR_join _ _ 0 228 13 g20 okG21
  have g22 : glueChkR lits W 0 250 = true := glueChkR_join _ _ 0 241 9 g21 okG22
  have g23 : glueChkR lits W 0 261 = true := glueChkR_join _ _ 0 250 11 g22 okG23
  have g24 : glueChkR lits W 0 273 = true := glueChkR_join _ _ 0 261 12 g23 okG24
  have g25 : glueChkR lits W 0 287 = true := glueChkR_join _ _ 0 273 14 g24 okG25
  have g26 : glueChkR lits W 0 296 = true := glueChkR_join _ _ 0 287 9 g25 okG26
  have g27 : glueChkR lits W 0 307 = true := glueChkR_join _ _ 0 296 11 g26 okG27
  have g28 : glueChkR lits W 0 321 = true := glueChkR_join _ _ 0 307 14 g27 okG28
  have g29 : glueChkR lits W 0 330 = true := glueChkR_join _ _ 0 321 9 g28 okG29
  have g30 : glueChkR lits W 0 339 = true := glueChkR_join _ _ 0 330 9 g29 okG30
  have g31 : glueChkR lits W 0 347 = true := glueChkR_join _ _ 0 339 8 g30 okG31
  have g32 : glueChkR lits W 0 360 = true := glueChkR_join _ _ 0 347 13 g31 okG32
  have g33 : glueChkR lits W 0 369 = true := glueChkR_join _ _ 0 360 9 g32 okG33
  have g34 : glueChkR lits W 0 377 = true := glueChkR_join _ _ 0 369 8 g33 okG34
  have g35 : glueChkR lits W 0 391 = true := glueChkR_join _ _ 0 377 14 g34 okG35
  have g36 : glueChkR lits W 0 403 = true := glueChkR_join _ _ 0 391 12 g35 okG36
  have g37 : glueChkR lits W 0 418 = true := glueChkR_join _ _ 0 403 15 g36 okG37
  have g38 : glueChkR lits W 0 428 = true := glueChkR_join _ _ 0 418 10 g37 okG38
  have g39 : glueChkR lits W 0 441 = true := glueChkR_join _ _ 0 428 13 g38 okG39
  have g40 : glueChkR lits W 0 451 = true := glueChkR_join _ _ 0 441 10 g39 okG40
  have g41 : glueChkR lits W 0 466 = true := glueChkR_join _ _ 0 451 15 g40 okG41
  have g42 : glueChkR lits W 0 479 = true := glueChkR_join _ _ 0 466 13 g41 okG42
  have g43 : glueChkR lits W 0 489 = true := glueChkR_join _ _ 0 479 10 g42 okG43
  have g44 : glueChkR lits W 0 498 = true := glueChkR_join _ _ 0 489 9 g43 okG44
  have g45 : glueChkR lits W 0 507 = true := glueChkR_join _ _ 0 498 9 g44 okG45
  have g46 : glueChkR lits W 0 516 = true := glueChkR_join _ _ 0 507 9 g45 okG46
  have g47 : glueChkR lits W 0 528 = true := glueChkR_join _ _ 0 516 12 g46 okG47
  have g48 : glueChkR lits W 0 542 = true := glueChkR_join _ _ 0 528 14 g47 okG48
  have g49 : glueChkR lits W 0 553 = true := glueChkR_join _ _ 0 542 11 g48 okG49
  have g50 : glueChkR lits W 0 566 = true := glueChkR_join _ _ 0 553 13 g49 okG50
  have g51 : glueChkR lits W 0 577 = true := glueChkR_join _ _ 0 566 11 g50 okG51
  have g52 : glueChkR lits W 0 586 = true := glueChkR_join _ _ 0 577 9 g51 okG52
  have g53 : glueChkR lits W 0 595 = true := glueChkR_join _ _ 0 586 9 g52 okG53
  have g54 : glueChkR lits W 0 603 = true := glueChkR_join _ _ 0 595 8 g53 okG54
  have g55 : glueChkR lits W 0 615 = true := glueChkR_join _ _ 0 603 12 g54 okG55
  have g56 : glueChkR lits W 0 629 = true := glueChkR_join _ _ 0 615 14 g55 okG56
  have g57 : glueChkR lits W 0 640 = true := glueChkR_join _ _ 0 629 11 g56 okG57
  have g58 : glueChkR lits W 0 648 = true := glueChkR_join _ _ 0 640 8 g57 okG58
  have g59 : glueChkR lits W 0 657 = true := glueChkR_join _ _ 0 648 9 g58 okG59
  have g60 : glueChkR lits W 0 670 = true := glueChkR_join _ _ 0 657 13 g59 okG60
  have g61 : glueChkR lits W 0 681 = true := glueChkR_join _ _ 0 670 11 g60 okG61
  have g62 : glueChkR lits W 0 696 = true := glueChkR_join _ _ 0 681 15 g61 okG62
  have g63 : glueChkR lits W 0 706 = true := glueChkR_join _ _ 0 696 10 g62 okG63
  have g64 : glueChkR lits W 0 713 = true := glueChkR_join _ _ 0 706 7 g63 okG64
  have g65 : glueChkR lits W 0 723 = true := glueChkR_join _ _ 0 713 10 g64 okG65
  have g66 : glueChkR lits W 0 737 = true := glueChkR_join _ _ 0 723 14 g65 okG66
  have g67 : glueChkR lits W 0 744 = true := glueChkR_join _ _ 0 737 7 g66 okG67
  have g68 : glueChkR lits W 0 753 = true := glueChkR_join _ _ 0 744 9 g67 okG68
  have g69 : glueChkR lits W 0 764 = true := glueChkR_join _ _ 0 753 11 g68 okG69
  have g70 : glueChkR lits W 0 773 = true := glueChkR_join _ _ 0 764 9 g69 okG70
  have g71 : glueChkR lits W 0 783 = true := glueChkR_join _ _ 0 773 10 g70 okG71
  have g72 : glueChkR lits W 0 792 = true := glueChkR_join _ _ 0 783 9 g71 okG72
  have g73 : glueChkR lits W 0 799 = true := glueChkR_join _ _ 0 792 7 g72 okG73
  have g74 : glueChkR lits W 0 814 = true := glueChkR_join _ _ 0 799 15 g73 okG74
  have g75 : glueChkR lits W 0 824 = true := glueChkR_join _ _ 0 814 10 g74 okG75
  have g76 : glueChkR lits W 0 834 = true := glueChkR_join _ _ 0 824 10 g75 okG76
  have g77 : glueChkR lits W 0 845 = true := glueChkR_join _ _ 0 834 11 g76 okG77
  have g78 : glueChkR lits W 0 855 = true := glueChkR_join _ _ 0 845 10 g77 okG78
  have g79 : glueChkR lits W 0 865 = true := glueChkR_join _ _ 0 855 10 g78 okG79
  have g80 : glueChkR lits W 0 876 = true := glueChkR_join _ _ 0 865 11 g79 okG80
  have g81 : glueChkR lits W 0 886 = true := glueChkR_join _ _ 0 876 10 g80 okG81
  have g82 : glueChkR lits W 0 895 = true := glueChkR_join _ _ 0 886 9 g81 okG82
  have g83 : glueChkR lits W 0 909 = true := glueChkR_join _ _ 0 895 14 g82 okG83
  have g84 : glueChkR lits W 0 921 = true := glueChkR_join _ _ 0 909 12 g83 okG84
  have g85 : glueChkR lits W 0 931 = true := glueChkR_join _ _ 0 921 10 g84 okG85
  have g86 : glueChkR lits W 0 941 = true := glueChkR_join _ _ 0 931 10 g85 okG86
  have g87 : glueChkR lits W 0 952 = true := glueChkR_join _ _ 0 941 11 g86 okG87
  have g88 : glueChkR lits W 0 963 = true := glueChkR_join _ _ 0 952 11 g87 okG88
  have g89 : glueChkR lits W 0 976 = true := glueChkR_join _ _ 0 963 13 g88 okG89
  have g90 : glueChkR lits W 0 989 = true := glueChkR_join _ _ 0 976 13 g89 okG90
  have g91 : glueChkR lits W 0 1001 = true := glueChkR_join _ _ 0 989 12 g90 okG91
  have g92 : glueChkR lits W 0 1013 = true := glueChkR_join _ _ 0 1001 12 g91 okG92
  have g93 : glueChkR lits W 0 1023 = true := glueChkR_join _ _ 0 1013 10 g92 okG93
  have g94 : glueChkR lits W 0 1032 = true := glueChkR_join _ _ 0 1023 9 g93 okG94
  have g95 : glueChkR lits W 0 1044 = true := glueChkR_join _ _ 0 1032 12 g94 okG95
  have g96 : glueChkR lits W 0 1053 = true := glueChkR_join _ _ 0 1044 9 g95 okG96
  have g97 : glueChkR lits W 0 1062 = true := glueChkR_join _ _ 0 1053 9 g96 okG97
  have g98 : glueChkR lits W 0 1071 = true := glueChkR_join _ _ 0 1062 9 g97 okG98
  have g99 : glueChkR lits W 0 1079 = true := glueChkR_join _ _ 0 1071 8 g98 okG99
  have g100 : glueChkR lits W 0 1090 = true := glueChkR_join _ _ 0 1079 11 g99 okG100
  have g101 : glueChkR lits W 0 1100 = true := glueChkR_join _ _ 0 1090 10 g100 okG101
  have g102 : glueChkR lits W 0 1109 = true := glueChkR_join _ _ 0 1100 9 g101 okG102
  have g103 : glueChkR lits W 0 1121 = true := glueChkR_join _ _ 0 1109 12 g102 okG103
  have g104 : glueChkR lits W 0 1137 = true := glueChkR_join _ _ 0 1121 16 g103 okG104
  have g105 : glueChkR lits W 0 1147 = true := glueChkR_join _ _ 0 1137 10 g104 okG105
  have g106 : glueChkR lits W 0 1163 = true := glueChkR_join _ _ 0 1147 16 g105 okG106
  have g107 : glueChkR lits W 0 1172 = true := glueChkR_join _ _ 0 1163 9 g106 okG107
  have g108 : glueChkR lits W 0 1180 = true := glueChkR_join _ _ 0 1172 8 g107 okG108
  have g109 : glueChkR lits W 0 1193 = true := glueChkR_join _ _ 0 1180 13 g108 okG109
  have g110 : glueChkR lits W 0 1205 = true := glueChkR_join _ _ 0 1193 12 g109 okG110
  have g111 : glueChkR lits W 0 1216 = true := glueChkR_join _ _ 0 1205 11 g110 okG111
  have g112 : glueChkR lits W 0 1227 = true := glueChkR_join _ _ 0 1216 11 g111 okG112
  have g113 : glueChkR lits W 0 1240 = true := glueChkR_join _ _ 0 1227 13 g112 okG113
  have g114 : glueChkR lits W 0 1241 = true := glueChkR_join _ _ 0 1240 1 g113 okG114
  exact g114
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e387.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e387.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e387.UB_eq E1.OK_e387.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C387X
