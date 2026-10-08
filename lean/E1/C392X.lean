module
public import R22Port.U_d41d8cd98f00
public import E1.C392X_B0
public import E1.C392X_B1
public import E1.C392X_B2
public import E1.C392X_B3
public import E1.C392X_B4
public import E1.C392X_B5
public import E1.C392X_B6
public import E1.C392X_B7
public import E1.C392X_B8
public import E1.C392X_B9
public import E1.C392X_B10
public import E1.C392X_B11
public import E1.C392X_B12
public import E1.C392X_B13
public import E1.C392X_B14
public import E1.C392X_B15
public import E1.C392X_B16
public import E1.C392X_B17
public import E1.C392X_B18
public import E1.C392X_B19
public import E1.C392X_B20
public import E1.C392X_B21
public import E1.C392X_B22
public import E1.C392X_B23
public import E1.C392X_B24
public import E1.C392X_B25
public import E1.C392X_B26
public import E1.C392X_B27
public import E1.C392X_B28
public import E1.C392X_B29
public import E1.C392X_B30
public import E1.C392X_B31
public import E1.C392X_B32
public import E1.C392X_B33
public import E1.C392X_B34
public import E1.C392X_B35
public import E1.C392X_B36
public import E1.C392X_B37
public import E1.C392X_B38
public import E1.C392X_B39
public import E1.C392X_B40
public import E1.C392X_B41
public import E1.C392X_B42
public import E1.C392X_B43
public import E1.C392X_B44
public import E1.C392X_B45
public import E1.C392X_B46
public import E1.C392X_B47
public import E1.C392X_B48
public import E1.C392X_B49
public import E1.C392X_B50
public import E1.C392X_B51
public import E1.C392X_B52
public import E1.C392X_B53
public import E1.C392X_B54
public import E1.C392X_B55
public import E1.C392X_B56
public import E1.C392X_B57
public import E1.C392X_B58
public import E1.C392X_B59
public import E1.C392X_B60
public import E1.C392X_B61
public import E1.C392X_B62
public import E1.C392X_B63
public import E1.C392X_B64
public import E1.C392X_B65
public import E1.C392X_B66
public import E1.C392X_B67
public import E1.C392X_B68
public import E1.C392X_B69
public import E1.C392X_B70
public import E1.C392X_B71
public import E1.C392X_B72
public import E1.C392X_B73
public import E1.C392X_B74
public import E1.C392X_B75
public import E1.C392X_B76
public import E1.C392X_B77
public import E1.C392X_B78
public import E1.C392X_B79
public import E1.C392X_B80
public import E1.C392X_B81
public import E1.C392X_B82
public import E1.C392X_B83
public import E1.C392X_B84
public import E1.C392X_B85
public import E1.C392X_B86
public import E1.C392X_B87
public import E1.C392X_B88
public import E1.C392X_B89
public import E1.C392X_B90
public import E1.C392X_B91
public import E1.C392X_B92
public import E1.C392X_B93
public import E1.C392X_B94
public import E1.C392X_B95
public import E1.C392X_B96
public import E1.C392X_B97
public import E1.C392X_B98
public import E1.C392X_B99
public import E1.C392X_B100
public import E1.C392X_B101
public import E1.C392X_B102
public import E1.C392X_B103
public import E1.C392X_B104
public import E1.C392X_B105
public import E1.C392X_B106
public import E1.C392X_B107
public import E1.C392X_B108
public import E1.C392X_B109
public import E1.C392X_B110
public import E1.C392X_B111
public import E1.C392X_B112
public import E1.C392X_B113
public import E1.OK_e392
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C392X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C392X
open E1S E1.IP_e392
theorem okAll : blkChk C E1.SL_e392.entry UB UBR lits 0 1402 = true := by
  have h0 : blkChk C E1.SL_e392.entry UB UBR lits 0 15 = true := okM0
  have h1 : blkChk C E1.SL_e392.entry UB UBR lits 0 25 = true := blkChk_join _ _ _ _ _ 0 15 10 h0 okM1
  have h2 : blkChk C E1.SL_e392.entry UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 25 11 h1 okM2
  have h3 : blkChk C E1.SL_e392.entry UB UBR lits 0 49 = true := blkChk_join _ _ _ _ _ 0 36 13 h2 okM3
  have h4 : blkChk C E1.SL_e392.entry UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 49 15 h3 okM4
  have h5 : blkChk C E1.SL_e392.entry UB UBR lits 0 78 = true := blkChk_join _ _ _ _ _ 0 64 14 h4 okM5
  have h6 : blkChk C E1.SL_e392.entry UB UBR lits 0 91 = true := blkChk_join _ _ _ _ _ 0 78 13 h5 okM6
  have h7 : blkChk C E1.SL_e392.entry UB UBR lits 0 105 = true := blkChk_join _ _ _ _ _ 0 91 14 h6 okM7
  have h8 : blkChk C E1.SL_e392.entry UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 105 11 h7 okM8
  have h9 : blkChk C E1.SL_e392.entry UB UBR lits 0 125 = true := blkChk_join _ _ _ _ _ 0 116 9 h8 okM9
  have h10 : blkChk C E1.SL_e392.entry UB UBR lits 0 140 = true := blkChk_join _ _ _ _ _ 0 125 15 h9 okM10
  have h11 : blkChk C E1.SL_e392.entry UB UBR lits 0 153 = true := blkChk_join _ _ _ _ _ 0 140 13 h10 okM11
  have h12 : blkChk C E1.SL_e392.entry UB UBR lits 0 163 = true := blkChk_join _ _ _ _ _ 0 153 10 h11 okM12
  have h13 : blkChk C E1.SL_e392.entry UB UBR lits 0 173 = true := blkChk_join _ _ _ _ _ 0 163 10 h12 okM13
  have h14 : blkChk C E1.SL_e392.entry UB UBR lits 0 181 = true := blkChk_join _ _ _ _ _ 0 173 8 h13 okM14
  have h15 : blkChk C E1.SL_e392.entry UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 181 11 h14 okM15
  have h16 : blkChk C E1.SL_e392.entry UB UBR lits 0 202 = true := blkChk_join _ _ _ _ _ 0 192 10 h15 okM16
  have h17 : blkChk C E1.SL_e392.entry UB UBR lits 0 218 = true := blkChk_join _ _ _ _ _ 0 202 16 h16 okM17
  have h18 : blkChk C E1.SL_e392.entry UB UBR lits 0 232 = true := blkChk_join _ _ _ _ _ 0 218 14 h17 okM18
  have h19 : blkChk C E1.SL_e392.entry UB UBR lits 0 242 = true := blkChk_join _ _ _ _ _ 0 232 10 h18 okM19
  have h20 : blkChk C E1.SL_e392.entry UB UBR lits 0 255 = true := blkChk_join _ _ _ _ _ 0 242 13 h19 okM20
  have h21 : blkChk C E1.SL_e392.entry UB UBR lits 0 271 = true := blkChk_join _ _ _ _ _ 0 255 16 h20 okM21
  have h22 : blkChk C E1.SL_e392.entry UB UBR lits 0 283 = true := blkChk_join _ _ _ _ _ 0 271 12 h21 okM22
  have h23 : blkChk C E1.SL_e392.entry UB UBR lits 0 294 = true := blkChk_join _ _ _ _ _ 0 283 11 h22 okM23
  have h24 : blkChk C E1.SL_e392.entry UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 294 10 h23 okM24
  have h25 : blkChk C E1.SL_e392.entry UB UBR lits 0 320 = true := blkChk_join _ _ _ _ _ 0 304 16 h24 okM25
  have h26 : blkChk C E1.SL_e392.entry UB UBR lits 0 336 = true := blkChk_join _ _ _ _ _ 0 320 16 h25 okM26
  have h27 : blkChk C E1.SL_e392.entry UB UBR lits 0 344 = true := blkChk_join _ _ _ _ _ 0 336 8 h26 okM27
  have h28 : blkChk C E1.SL_e392.entry UB UBR lits 0 357 = true := blkChk_join _ _ _ _ _ 0 344 13 h27 okM28
  have h29 : blkChk C E1.SL_e392.entry UB UBR lits 0 365 = true := blkChk_join _ _ _ _ _ 0 357 8 h28 okM29
  have h30 : blkChk C E1.SL_e392.entry UB UBR lits 0 378 = true := blkChk_join _ _ _ _ _ 0 365 13 h29 okM30
  have h31 : blkChk C E1.SL_e392.entry UB UBR lits 0 387 = true := blkChk_join _ _ _ _ _ 0 378 9 h30 okM31
  have h32 : blkChk C E1.SL_e392.entry UB UBR lits 0 400 = true := blkChk_join _ _ _ _ _ 0 387 13 h31 okM32
  have h33 : blkChk C E1.SL_e392.entry UB UBR lits 0 416 = true := blkChk_join _ _ _ _ _ 0 400 16 h32 okM33
  have h34 : blkChk C E1.SL_e392.entry UB UBR lits 0 425 = true := blkChk_join _ _ _ _ _ 0 416 9 h33 okM34
  have h35 : blkChk C E1.SL_e392.entry UB UBR lits 0 438 = true := blkChk_join _ _ _ _ _ 0 425 13 h34 okM35
  have h36 : blkChk C E1.SL_e392.entry UB UBR lits 0 447 = true := blkChk_join _ _ _ _ _ 0 438 9 h35 okM36
  have h37 : blkChk C E1.SL_e392.entry UB UBR lits 0 462 = true := blkChk_join _ _ _ _ _ 0 447 15 h36 okM37
  have h38 : blkChk C E1.SL_e392.entry UB UBR lits 0 470 = true := blkChk_join _ _ _ _ _ 0 462 8 h37 okM38
  have h39 : blkChk C E1.SL_e392.entry UB UBR lits 0 486 = true := blkChk_join _ _ _ _ _ 0 470 16 h38 okM39
  have h40 : blkChk C E1.SL_e392.entry UB UBR lits 0 502 = true := blkChk_join _ _ _ _ _ 0 486 16 h39 okM40
  have h41 : blkChk C E1.SL_e392.entry UB UBR lits 0 514 = true := blkChk_join _ _ _ _ _ 0 502 12 h40 okM41
  have h42 : blkChk C E1.SL_e392.entry UB UBR lits 0 522 = true := blkChk_join _ _ _ _ _ 0 514 8 h41 okM42
  have h43 : blkChk C E1.SL_e392.entry UB UBR lits 0 532 = true := blkChk_join _ _ _ _ _ 0 522 10 h42 okM43
  have h44 : blkChk C E1.SL_e392.entry UB UBR lits 0 544 = true := blkChk_join _ _ _ _ _ 0 532 12 h43 okM44
  have h45 : blkChk C E1.SL_e392.entry UB UBR lits 0 554 = true := blkChk_join _ _ _ _ _ 0 544 10 h44 okM45
  have h46 : blkChk C E1.SL_e392.entry UB UBR lits 0 566 = true := blkChk_join _ _ _ _ _ 0 554 12 h45 okM46
  have h47 : blkChk C E1.SL_e392.entry UB UBR lits 0 577 = true := blkChk_join _ _ _ _ _ 0 566 11 h46 okM47
  have h48 : blkChk C E1.SL_e392.entry UB UBR lits 0 591 = true := blkChk_join _ _ _ _ _ 0 577 14 h47 okM48
  have h49 : blkChk C E1.SL_e392.entry UB UBR lits 0 607 = true := blkChk_join _ _ _ _ _ 0 591 16 h48 okM49
  have h50 : blkChk C E1.SL_e392.entry UB UBR lits 0 621 = true := blkChk_join _ _ _ _ _ 0 607 14 h49 okM50
  have h51 : blkChk C E1.SL_e392.entry UB UBR lits 0 633 = true := blkChk_join _ _ _ _ _ 0 621 12 h50 okM51
  have h52 : blkChk C E1.SL_e392.entry UB UBR lits 0 649 = true := blkChk_join _ _ _ _ _ 0 633 16 h51 okM52
  have h53 : blkChk C E1.SL_e392.entry UB UBR lits 0 665 = true := blkChk_join _ _ _ _ _ 0 649 16 h52 okM53
  have h54 : blkChk C E1.SL_e392.entry UB UBR lits 0 675 = true := blkChk_join _ _ _ _ _ 0 665 10 h53 okM54
  have h55 : blkChk C E1.SL_e392.entry UB UBR lits 0 688 = true := blkChk_join _ _ _ _ _ 0 675 13 h54 okM55
  have h56 : blkChk C E1.SL_e392.entry UB UBR lits 0 700 = true := blkChk_join _ _ _ _ _ 0 688 12 h55 okM56
  have h57 : blkChk C E1.SL_e392.entry UB UBR lits 0 715 = true := blkChk_join _ _ _ _ _ 0 700 15 h56 okM57
  have h58 : blkChk C E1.SL_e392.entry UB UBR lits 0 730 = true := blkChk_join _ _ _ _ _ 0 715 15 h57 okM58
  have h59 : blkChk C E1.SL_e392.entry UB UBR lits 0 742 = true := blkChk_join _ _ _ _ _ 0 730 12 h58 okM59
  have h60 : blkChk C E1.SL_e392.entry UB UBR lits 0 758 = true := blkChk_join _ _ _ _ _ 0 742 16 h59 okM60
  have h61 : blkChk C E1.SL_e392.entry UB UBR lits 0 771 = true := blkChk_join _ _ _ _ _ 0 758 13 h60 okM61
  have h62 : blkChk C E1.SL_e392.entry UB UBR lits 0 780 = true := blkChk_join _ _ _ _ _ 0 771 9 h61 okM62
  have h63 : blkChk C E1.SL_e392.entry UB UBR lits 0 789 = true := blkChk_join _ _ _ _ _ 0 780 9 h62 okM63
  have h64 : blkChk C E1.SL_e392.entry UB UBR lits 0 800 = true := blkChk_join _ _ _ _ _ 0 789 11 h63 okM64
  have h65 : blkChk C E1.SL_e392.entry UB UBR lits 0 812 = true := blkChk_join _ _ _ _ _ 0 800 12 h64 okM65
  have h66 : blkChk C E1.SL_e392.entry UB UBR lits 0 822 = true := blkChk_join _ _ _ _ _ 0 812 10 h65 okM66
  have h67 : blkChk C E1.SL_e392.entry UB UBR lits 0 830 = true := blkChk_join _ _ _ _ _ 0 822 8 h66 okM67
  have h68 : blkChk C E1.SL_e392.entry UB UBR lits 0 840 = true := blkChk_join _ _ _ _ _ 0 830 10 h67 okM68
  have h69 : blkChk C E1.SL_e392.entry UB UBR lits 0 855 = true := blkChk_join _ _ _ _ _ 0 840 15 h68 okM69
  have h70 : blkChk C E1.SL_e392.entry UB UBR lits 0 867 = true := blkChk_join _ _ _ _ _ 0 855 12 h69 okM70
  have h71 : blkChk C E1.SL_e392.entry UB UBR lits 0 879 = true := blkChk_join _ _ _ _ _ 0 867 12 h70 okM71
  have h72 : blkChk C E1.SL_e392.entry UB UBR lits 0 887 = true := blkChk_join _ _ _ _ _ 0 879 8 h71 okM72
  have h73 : blkChk C E1.SL_e392.entry UB UBR lits 0 896 = true := blkChk_join _ _ _ _ _ 0 887 9 h72 okM73
  have h74 : blkChk C E1.SL_e392.entry UB UBR lits 0 911 = true := blkChk_join _ _ _ _ _ 0 896 15 h73 okM74
  have h75 : blkChk C E1.SL_e392.entry UB UBR lits 0 919 = true := blkChk_join _ _ _ _ _ 0 911 8 h74 okM75
  have h76 : blkChk C E1.SL_e392.entry UB UBR lits 0 930 = true := blkChk_join _ _ _ _ _ 0 919 11 h75 okM76
  have h77 : blkChk C E1.SL_e392.entry UB UBR lits 0 938 = true := blkChk_join _ _ _ _ _ 0 930 8 h76 okM77
  have h78 : blkChk C E1.SL_e392.entry UB UBR lits 0 945 = true := blkChk_join _ _ _ _ _ 0 938 7 h77 okM78
  have h79 : blkChk C E1.SL_e392.entry UB UBR lits 0 954 = true := blkChk_join _ _ _ _ _ 0 945 9 h78 okM79
  have h80 : blkChk C E1.SL_e392.entry UB UBR lits 0 964 = true := blkChk_join _ _ _ _ _ 0 954 10 h79 okM80
  have h81 : blkChk C E1.SL_e392.entry UB UBR lits 0 974 = true := blkChk_join _ _ _ _ _ 0 964 10 h80 okM81
  have h82 : blkChk C E1.SL_e392.entry UB UBR lits 0 987 = true := blkChk_join _ _ _ _ _ 0 974 13 h81 okM82
  have h83 : blkChk C E1.SL_e392.entry UB UBR lits 0 1000 = true := blkChk_join _ _ _ _ _ 0 987 13 h82 okM83
  have h84 : blkChk C E1.SL_e392.entry UB UBR lits 0 1010 = true := blkChk_join _ _ _ _ _ 0 1000 10 h83 okM84
  have h85 : blkChk C E1.SL_e392.entry UB UBR lits 0 1022 = true := blkChk_join _ _ _ _ _ 0 1010 12 h84 okM85
  have h86 : blkChk C E1.SL_e392.entry UB UBR lits 0 1033 = true := blkChk_join _ _ _ _ _ 0 1022 11 h85 okM86
  have h87 : blkChk C E1.SL_e392.entry UB UBR lits 0 1044 = true := blkChk_join _ _ _ _ _ 0 1033 11 h86 okM87
  have h88 : blkChk C E1.SL_e392.entry UB UBR lits 0 1056 = true := blkChk_join _ _ _ _ _ 0 1044 12 h87 okM88
  have h89 : blkChk C E1.SL_e392.entry UB UBR lits 0 1072 = true := blkChk_join _ _ _ _ _ 0 1056 16 h88 okM89
  have h90 : blkChk C E1.SL_e392.entry UB UBR lits 0 1088 = true := blkChk_join _ _ _ _ _ 0 1072 16 h89 okM90
  have h91 : blkChk C E1.SL_e392.entry UB UBR lits 0 1098 = true := blkChk_join _ _ _ _ _ 0 1088 10 h90 okM91
  have h92 : blkChk C E1.SL_e392.entry UB UBR lits 0 1114 = true := blkChk_join _ _ _ _ _ 0 1098 16 h91 okM92
  have h93 : blkChk C E1.SL_e392.entry UB UBR lits 0 1130 = true := blkChk_join _ _ _ _ _ 0 1114 16 h92 okM93
  have h94 : blkChk C E1.SL_e392.entry UB UBR lits 0 1144 = true := blkChk_join _ _ _ _ _ 0 1130 14 h93 okM94
  have h95 : blkChk C E1.SL_e392.entry UB UBR lits 0 1153 = true := blkChk_join _ _ _ _ _ 0 1144 9 h94 okM95
  have h96 : blkChk C E1.SL_e392.entry UB UBR lits 0 1169 = true := blkChk_join _ _ _ _ _ 0 1153 16 h95 okM96
  have h97 : blkChk C E1.SL_e392.entry UB UBR lits 0 1182 = true := blkChk_join _ _ _ _ _ 0 1169 13 h96 okM97
  have h98 : blkChk C E1.SL_e392.entry UB UBR lits 0 1194 = true := blkChk_join _ _ _ _ _ 0 1182 12 h97 okM98
  have h99 : blkChk C E1.SL_e392.entry UB UBR lits 0 1208 = true := blkChk_join _ _ _ _ _ 0 1194 14 h98 okM99
  have h100 : blkChk C E1.SL_e392.entry UB UBR lits 0 1224 = true := blkChk_join _ _ _ _ _ 0 1208 16 h99 okM100
  have h101 : blkChk C E1.SL_e392.entry UB UBR lits 0 1232 = true := blkChk_join _ _ _ _ _ 0 1224 8 h100 okM101
  have h102 : blkChk C E1.SL_e392.entry UB UBR lits 0 1247 = true := blkChk_join _ _ _ _ _ 0 1232 15 h101 okM102
  have h103 : blkChk C E1.SL_e392.entry UB UBR lits 0 1258 = true := blkChk_join _ _ _ _ _ 0 1247 11 h102 okM103
  have h104 : blkChk C E1.SL_e392.entry UB UBR lits 0 1274 = true := blkChk_join _ _ _ _ _ 0 1258 16 h103 okM104
  have h105 : blkChk C E1.SL_e392.entry UB UBR lits 0 1284 = true := blkChk_join _ _ _ _ _ 0 1274 10 h104 okM105
  have h106 : blkChk C E1.SL_e392.entry UB UBR lits 0 1300 = true := blkChk_join _ _ _ _ _ 0 1284 16 h105 okM106
  have h107 : blkChk C E1.SL_e392.entry UB UBR lits 0 1315 = true := blkChk_join _ _ _ _ _ 0 1300 15 h106 okM107
  have h108 : blkChk C E1.SL_e392.entry UB UBR lits 0 1331 = true := blkChk_join _ _ _ _ _ 0 1315 16 h107 okM108
  have h109 : blkChk C E1.SL_e392.entry UB UBR lits 0 1347 = true := blkChk_join _ _ _ _ _ 0 1331 16 h108 okM109
  have h110 : blkChk C E1.SL_e392.entry UB UBR lits 0 1363 = true := blkChk_join _ _ _ _ _ 0 1347 16 h109 okM110
  have h111 : blkChk C E1.SL_e392.entry UB UBR lits 0 1379 = true := blkChk_join _ _ _ _ _ 0 1363 16 h110 okM111
  have h112 : blkChk C E1.SL_e392.entry UB UBR lits 0 1395 = true := blkChk_join _ _ _ _ _ 0 1379 16 h111 okM112
  have h113 : blkChk C E1.SL_e392.entry UB UBR lits 0 1402 = true := blkChk_join _ _ _ _ _ 0 1395 7 h112 okM113
  exact h113
theorem len : lits.length = 1402 := by decide
theorem okGAll : glueChkR lits W 0 1402 = true := by
  have g0 : glueChkR lits W 0 15 = true := okG0
  have g1 : glueChkR lits W 0 25 = true := glueChkR_join _ _ 0 15 10 g0 okG1
  have g2 : glueChkR lits W 0 36 = true := glueChkR_join _ _ 0 25 11 g1 okG2
  have g3 : glueChkR lits W 0 49 = true := glueChkR_join _ _ 0 36 13 g2 okG3
  have g4 : glueChkR lits W 0 64 = true := glueChkR_join _ _ 0 49 15 g3 okG4
  have g5 : glueChkR lits W 0 78 = true := glueChkR_join _ _ 0 64 14 g4 okG5
  have g6 : glueChkR lits W 0 91 = true := glueChkR_join _ _ 0 78 13 g5 okG6
  have g7 : glueChkR lits W 0 105 = true := glueChkR_join _ _ 0 91 14 g6 okG7
  have g8 : glueChkR lits W 0 116 = true := glueChkR_join _ _ 0 105 11 g7 okG8
  have g9 : glueChkR lits W 0 125 = true := glueChkR_join _ _ 0 116 9 g8 okG9
  have g10 : glueChkR lits W 0 140 = true := glueChkR_join _ _ 0 125 15 g9 okG10
  have g11 : glueChkR lits W 0 153 = true := glueChkR_join _ _ 0 140 13 g10 okG11
  have g12 : glueChkR lits W 0 163 = true := glueChkR_join _ _ 0 153 10 g11 okG12
  have g13 : glueChkR lits W 0 173 = true := glueChkR_join _ _ 0 163 10 g12 okG13
  have g14 : glueChkR lits W 0 181 = true := glueChkR_join _ _ 0 173 8 g13 okG14
  have g15 : glueChkR lits W 0 192 = true := glueChkR_join _ _ 0 181 11 g14 okG15
  have g16 : glueChkR lits W 0 202 = true := glueChkR_join _ _ 0 192 10 g15 okG16
  have g17 : glueChkR lits W 0 218 = true := glueChkR_join _ _ 0 202 16 g16 okG17
  have g18 : glueChkR lits W 0 232 = true := glueChkR_join _ _ 0 218 14 g17 okG18
  have g19 : glueChkR lits W 0 242 = true := glueChkR_join _ _ 0 232 10 g18 okG19
  have g20 : glueChkR lits W 0 255 = true := glueChkR_join _ _ 0 242 13 g19 okG20
  have g21 : glueChkR lits W 0 271 = true := glueChkR_join _ _ 0 255 16 g20 okG21
  have g22 : glueChkR lits W 0 283 = true := glueChkR_join _ _ 0 271 12 g21 okG22
  have g23 : glueChkR lits W 0 294 = true := glueChkR_join _ _ 0 283 11 g22 okG23
  have g24 : glueChkR lits W 0 304 = true := glueChkR_join _ _ 0 294 10 g23 okG24
  have g25 : glueChkR lits W 0 320 = true := glueChkR_join _ _ 0 304 16 g24 okG25
  have g26 : glueChkR lits W 0 336 = true := glueChkR_join _ _ 0 320 16 g25 okG26
  have g27 : glueChkR lits W 0 344 = true := glueChkR_join _ _ 0 336 8 g26 okG27
  have g28 : glueChkR lits W 0 357 = true := glueChkR_join _ _ 0 344 13 g27 okG28
  have g29 : glueChkR lits W 0 365 = true := glueChkR_join _ _ 0 357 8 g28 okG29
  have g30 : glueChkR lits W 0 378 = true := glueChkR_join _ _ 0 365 13 g29 okG30
  have g31 : glueChkR lits W 0 387 = true := glueChkR_join _ _ 0 378 9 g30 okG31
  have g32 : glueChkR lits W 0 400 = true := glueChkR_join _ _ 0 387 13 g31 okG32
  have g33 : glueChkR lits W 0 416 = true := glueChkR_join _ _ 0 400 16 g32 okG33
  have g34 : glueChkR lits W 0 425 = true := glueChkR_join _ _ 0 416 9 g33 okG34
  have g35 : glueChkR lits W 0 438 = true := glueChkR_join _ _ 0 425 13 g34 okG35
  have g36 : glueChkR lits W 0 447 = true := glueChkR_join _ _ 0 438 9 g35 okG36
  have g37 : glueChkR lits W 0 462 = true := glueChkR_join _ _ 0 447 15 g36 okG37
  have g38 : glueChkR lits W 0 470 = true := glueChkR_join _ _ 0 462 8 g37 okG38
  have g39 : glueChkR lits W 0 486 = true := glueChkR_join _ _ 0 470 16 g38 okG39
  have g40 : glueChkR lits W 0 502 = true := glueChkR_join _ _ 0 486 16 g39 okG40
  have g41 : glueChkR lits W 0 514 = true := glueChkR_join _ _ 0 502 12 g40 okG41
  have g42 : glueChkR lits W 0 522 = true := glueChkR_join _ _ 0 514 8 g41 okG42
  have g43 : glueChkR lits W 0 532 = true := glueChkR_join _ _ 0 522 10 g42 okG43
  have g44 : glueChkR lits W 0 544 = true := glueChkR_join _ _ 0 532 12 g43 okG44
  have g45 : glueChkR lits W 0 554 = true := glueChkR_join _ _ 0 544 10 g44 okG45
  have g46 : glueChkR lits W 0 566 = true := glueChkR_join _ _ 0 554 12 g45 okG46
  have g47 : glueChkR lits W 0 577 = true := glueChkR_join _ _ 0 566 11 g46 okG47
  have g48 : glueChkR lits W 0 591 = true := glueChkR_join _ _ 0 577 14 g47 okG48
  have g49 : glueChkR lits W 0 607 = true := glueChkR_join _ _ 0 591 16 g48 okG49
  have g50 : glueChkR lits W 0 621 = true := glueChkR_join _ _ 0 607 14 g49 okG50
  have g51 : glueChkR lits W 0 633 = true := glueChkR_join _ _ 0 621 12 g50 okG51
  have g52 : glueChkR lits W 0 649 = true := glueChkR_join _ _ 0 633 16 g51 okG52
  have g53 : glueChkR lits W 0 665 = true := glueChkR_join _ _ 0 649 16 g52 okG53
  have g54 : glueChkR lits W 0 675 = true := glueChkR_join _ _ 0 665 10 g53 okG54
  have g55 : glueChkR lits W 0 688 = true := glueChkR_join _ _ 0 675 13 g54 okG55
  have g56 : glueChkR lits W 0 700 = true := glueChkR_join _ _ 0 688 12 g55 okG56
  have g57 : glueChkR lits W 0 715 = true := glueChkR_join _ _ 0 700 15 g56 okG57
  have g58 : glueChkR lits W 0 730 = true := glueChkR_join _ _ 0 715 15 g57 okG58
  have g59 : glueChkR lits W 0 742 = true := glueChkR_join _ _ 0 730 12 g58 okG59
  have g60 : glueChkR lits W 0 758 = true := glueChkR_join _ _ 0 742 16 g59 okG60
  have g61 : glueChkR lits W 0 771 = true := glueChkR_join _ _ 0 758 13 g60 okG61
  have g62 : glueChkR lits W 0 780 = true := glueChkR_join _ _ 0 771 9 g61 okG62
  have g63 : glueChkR lits W 0 789 = true := glueChkR_join _ _ 0 780 9 g62 okG63
  have g64 : glueChkR lits W 0 800 = true := glueChkR_join _ _ 0 789 11 g63 okG64
  have g65 : glueChkR lits W 0 812 = true := glueChkR_join _ _ 0 800 12 g64 okG65
  have g66 : glueChkR lits W 0 822 = true := glueChkR_join _ _ 0 812 10 g65 okG66
  have g67 : glueChkR lits W 0 830 = true := glueChkR_join _ _ 0 822 8 g66 okG67
  have g68 : glueChkR lits W 0 840 = true := glueChkR_join _ _ 0 830 10 g67 okG68
  have g69 : glueChkR lits W 0 855 = true := glueChkR_join _ _ 0 840 15 g68 okG69
  have g70 : glueChkR lits W 0 867 = true := glueChkR_join _ _ 0 855 12 g69 okG70
  have g71 : glueChkR lits W 0 879 = true := glueChkR_join _ _ 0 867 12 g70 okG71
  have g72 : glueChkR lits W 0 887 = true := glueChkR_join _ _ 0 879 8 g71 okG72
  have g73 : glueChkR lits W 0 896 = true := glueChkR_join _ _ 0 887 9 g72 okG73
  have g74 : glueChkR lits W 0 911 = true := glueChkR_join _ _ 0 896 15 g73 okG74
  have g75 : glueChkR lits W 0 919 = true := glueChkR_join _ _ 0 911 8 g74 okG75
  have g76 : glueChkR lits W 0 930 = true := glueChkR_join _ _ 0 919 11 g75 okG76
  have g77 : glueChkR lits W 0 938 = true := glueChkR_join _ _ 0 930 8 g76 okG77
  have g78 : glueChkR lits W 0 945 = true := glueChkR_join _ _ 0 938 7 g77 okG78
  have g79 : glueChkR lits W 0 954 = true := glueChkR_join _ _ 0 945 9 g78 okG79
  have g80 : glueChkR lits W 0 964 = true := glueChkR_join _ _ 0 954 10 g79 okG80
  have g81 : glueChkR lits W 0 974 = true := glueChkR_join _ _ 0 964 10 g80 okG81
  have g82 : glueChkR lits W 0 987 = true := glueChkR_join _ _ 0 974 13 g81 okG82
  have g83 : glueChkR lits W 0 1000 = true := glueChkR_join _ _ 0 987 13 g82 okG83
  have g84 : glueChkR lits W 0 1010 = true := glueChkR_join _ _ 0 1000 10 g83 okG84
  have g85 : glueChkR lits W 0 1022 = true := glueChkR_join _ _ 0 1010 12 g84 okG85
  have g86 : glueChkR lits W 0 1033 = true := glueChkR_join _ _ 0 1022 11 g85 okG86
  have g87 : glueChkR lits W 0 1044 = true := glueChkR_join _ _ 0 1033 11 g86 okG87
  have g88 : glueChkR lits W 0 1056 = true := glueChkR_join _ _ 0 1044 12 g87 okG88
  have g89 : glueChkR lits W 0 1072 = true := glueChkR_join _ _ 0 1056 16 g88 okG89
  have g90 : glueChkR lits W 0 1088 = true := glueChkR_join _ _ 0 1072 16 g89 okG90
  have g91 : glueChkR lits W 0 1098 = true := glueChkR_join _ _ 0 1088 10 g90 okG91
  have g92 : glueChkR lits W 0 1114 = true := glueChkR_join _ _ 0 1098 16 g91 okG92
  have g93 : glueChkR lits W 0 1130 = true := glueChkR_join _ _ 0 1114 16 g92 okG93
  have g94 : glueChkR lits W 0 1144 = true := glueChkR_join _ _ 0 1130 14 g93 okG94
  have g95 : glueChkR lits W 0 1153 = true := glueChkR_join _ _ 0 1144 9 g94 okG95
  have g96 : glueChkR lits W 0 1169 = true := glueChkR_join _ _ 0 1153 16 g95 okG96
  have g97 : glueChkR lits W 0 1182 = true := glueChkR_join _ _ 0 1169 13 g96 okG97
  have g98 : glueChkR lits W 0 1194 = true := glueChkR_join _ _ 0 1182 12 g97 okG98
  have g99 : glueChkR lits W 0 1208 = true := glueChkR_join _ _ 0 1194 14 g98 okG99
  have g100 : glueChkR lits W 0 1224 = true := glueChkR_join _ _ 0 1208 16 g99 okG100
  have g101 : glueChkR lits W 0 1232 = true := glueChkR_join _ _ 0 1224 8 g100 okG101
  have g102 : glueChkR lits W 0 1247 = true := glueChkR_join _ _ 0 1232 15 g101 okG102
  have g103 : glueChkR lits W 0 1258 = true := glueChkR_join _ _ 0 1247 11 g102 okG103
  have g104 : glueChkR lits W 0 1274 = true := glueChkR_join _ _ 0 1258 16 g103 okG104
  have g105 : glueChkR lits W 0 1284 = true := glueChkR_join _ _ 0 1274 10 g104 okG105
  have g106 : glueChkR lits W 0 1300 = true := glueChkR_join _ _ 0 1284 16 g105 okG106
  have g107 : glueChkR lits W 0 1315 = true := glueChkR_join _ _ 0 1300 15 g106 okG107
  have g108 : glueChkR lits W 0 1331 = true := glueChkR_join _ _ 0 1315 16 g107 okG108
  have g109 : glueChkR lits W 0 1347 = true := glueChkR_join _ _ 0 1331 16 g108 okG109
  have g110 : glueChkR lits W 0 1363 = true := glueChkR_join _ _ 0 1347 16 g109 okG110
  have g111 : glueChkR lits W 0 1379 = true := glueChkR_join _ _ 0 1363 16 g110 okG111
  have g112 : glueChkR lits W 0 1395 = true := glueChkR_join _ _ 0 1379 16 g111 okG112
  have g113 : glueChkR lits W 0 1402 = true := glueChkR_join _ _ 0 1395 7 g112 okG113
  exact g113
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e392.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e392.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e392.UB_eq E1.OK_e392.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C392X
