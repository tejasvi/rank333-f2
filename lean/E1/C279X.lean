module
public import R22Port.U_d41d8cd98f00
public import E1.C279X_B0
public import E1.C279X_B1
public import E1.C279X_B2
public import E1.C279X_B3
public import E1.C279X_B4
public import E1.C279X_B5
public import E1.C279X_B6
public import E1.C279X_B7
public import E1.C279X_B8
public import E1.C279X_B9
public import E1.C279X_B10
public import E1.C279X_B11
public import E1.C279X_B12
public import E1.C279X_B13
public import E1.C279X_B14
public import E1.C279X_B15
public import E1.C279X_B16
public import E1.C279X_B17
public import E1.C279X_B18
public import E1.C279X_B19
public import E1.C279X_B20
public import E1.C279X_B21
public import E1.C279X_B22
public import E1.C279X_B23
public import E1.C279X_B24
public import E1.C279X_B25
public import E1.C279X_B26
public import E1.C279X_B27
public import E1.C279X_B28
public import E1.C279X_B29
public import E1.C279X_B30
public import E1.C279X_B31
public import E1.C279X_B32
public import E1.C279X_B33
public import E1.C279X_B34
public import E1.C279X_B35
public import E1.C279X_B36
public import E1.C279X_B37
public import E1.C279X_B38
public import E1.C279X_B39
public import E1.C279X_B40
public import E1.C279X_B41
public import E1.C279X_B42
public import E1.C279X_B43
public import E1.C279X_B44
public import E1.C279X_B45
public import E1.C279X_B46
public import E1.C279X_B47
public import E1.C279X_B48
public import E1.C279X_B49
public import E1.C279X_B50
public import E1.C279X_B51
public import E1.C279X_B52
public import E1.C279X_B53
public import E1.C279X_B54
public import E1.C279X_B55
public import E1.C279X_B56
public import E1.C279X_B57
public import E1.C279X_B58
public import E1.C279X_B59
public import E1.C279X_B60
public import E1.C279X_B61
public import E1.C279X_B62
public import E1.C279X_B63
public import E1.C279X_B64
public import E1.C279X_B65
public import E1.C279X_B66
public import E1.C279X_B67
public import E1.C279X_B68
public import E1.C279X_B69
public import E1.C279X_B70
public import E1.C279X_B71
public import E1.C279X_B72
public import E1.C279X_B73
public import E1.C279X_B74
public import E1.C279X_B75
public import E1.C279X_B76
public import E1.C279X_B77
public import E1.C279X_B78
public import E1.C279X_B79
public import E1.C279X_B80
public import E1.C279X_B81
public import E1.C279X_B82
public import E1.C279X_B83
public import E1.C279X_B84
public import E1.C279X_B85
public import E1.C279X_B86
public import E1.C279X_B87
public import E1.C279X_B88
public import E1.C279X_B89
public import E1.C279X_B90
public import E1.C279X_B91
public import E1.C279X_B92
public import E1.C279X_B93
public import E1.C279X_B94
public import E1.C279X_B95
public import E1.C279X_B96
public import E1.C279X_B97
public import E1.C279X_B98
public import E1.C279X_B99
public import E1.C279X_B100
public import E1.C279X_B101
public import E1.C279X_B102
public import E1.C279X_B103
public import E1.C279X_B104
public import E1.C279X_B105
public import E1.C279X_B106
public import E1.C279X_B107
public import E1.C279X_B108
public import E1.C279X_B109
public import E1.C279X_B110
public import E1.C279X_B111
public import E1.C279X_B112
public import E1.C279X_B113
public import E1.C279X_B114
public import E1.C279X_B115
public import E1.C279X_B116
public import E1.C279X_B117
public import E1.C279X_B118
public import E1.C279X_B119
public import E1.C279X_B120
public import E1.C279X_B121
public import E1.C279X_B122
public import E1.C279X_B123
public import E1.C279X_B124
public import E1.C279X_B125
public import E1.C279X_B126
public import E1.C279X_B127
public import E1.C279X_B128
public import E1.C279X_B129
public import E1.C279X_B130
public import E1.C279X_B131
public import E1.C279X_B132
public import E1.C279X_B133
public import E1.C279X_B134
public import E1.C279X_B135
public import E1.C279X_B136
public import E1.C279X_B137
public import E1.C279X_B138
public import E1.C279X_B139
public import E1.C279X_B140
public import E1.C279X_B141
public import E1.C279X_B142
public import E1.C279X_B143
public import E1.C279X_B144
public import E1.C279X_B145
public import E1.C279X_B146
public import E1.C279X_B147
public import E1.C279X_B148
public import E1.C279X_B149
public import E1.C279X_B150
public import E1.OK_e279
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C279X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C279X
open E1S E1.IP_e279
theorem okAll : blkChk C E1.SL_e279.entry UB UBR lits 0 1747 = true := by
  have h0 : blkChk C E1.SL_e279.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e279.entry UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 16 16 h0 okM1
  have h2 : blkChk C E1.SL_e279.entry UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 32 8 h1 okM2
  have h3 : blkChk C E1.SL_e279.entry UB UBR lits 0 53 = true := blkChk_join _ _ _ _ _ 0 40 13 h2 okM3
  have h4 : blkChk C E1.SL_e279.entry UB UBR lits 0 62 = true := blkChk_join _ _ _ _ _ 0 53 9 h3 okM4
  have h5 : blkChk C E1.SL_e279.entry UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 62 6 h4 okM5
  have h6 : blkChk C E1.SL_e279.entry UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 68 12 h5 okM6
  have h7 : blkChk C E1.SL_e279.entry UB UBR lits 0 91 = true := blkChk_join _ _ _ _ _ 0 80 11 h6 okM7
  have h8 : blkChk C E1.SL_e279.entry UB UBR lits 0 100 = true := blkChk_join _ _ _ _ _ 0 91 9 h7 okM8
  have h9 : blkChk C E1.SL_e279.entry UB UBR lits 0 109 = true := blkChk_join _ _ _ _ _ 0 100 9 h8 okM9
  have h10 : blkChk C E1.SL_e279.entry UB UBR lits 0 121 = true := blkChk_join _ _ _ _ _ 0 109 12 h9 okM10
  have h11 : blkChk C E1.SL_e279.entry UB UBR lits 0 131 = true := blkChk_join _ _ _ _ _ 0 121 10 h10 okM11
  have h12 : blkChk C E1.SL_e279.entry UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 131 13 h11 okM12
  have h13 : blkChk C E1.SL_e279.entry UB UBR lits 0 153 = true := blkChk_join _ _ _ _ _ 0 144 9 h12 okM13
  have h14 : blkChk C E1.SL_e279.entry UB UBR lits 0 161 = true := blkChk_join _ _ _ _ _ 0 153 8 h13 okM14
  have h15 : blkChk C E1.SL_e279.entry UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 161 7 h14 okM15
  have h16 : blkChk C E1.SL_e279.entry UB UBR lits 0 179 = true := blkChk_join _ _ _ _ _ 0 168 11 h15 okM16
  have h17 : blkChk C E1.SL_e279.entry UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 179 9 h16 okM17
  have h18 : blkChk C E1.SL_e279.entry UB UBR lits 0 198 = true := blkChk_join _ _ _ _ _ 0 188 10 h17 okM18
  have h19 : blkChk C E1.SL_e279.entry UB UBR lits 0 206 = true := blkChk_join _ _ _ _ _ 0 198 8 h18 okM19
  have h20 : blkChk C E1.SL_e279.entry UB UBR lits 0 218 = true := blkChk_join _ _ _ _ _ 0 206 12 h19 okM20
  have h21 : blkChk C E1.SL_e279.entry UB UBR lits 0 228 = true := blkChk_join _ _ _ _ _ 0 218 10 h20 okM21
  have h22 : blkChk C E1.SL_e279.entry UB UBR lits 0 237 = true := blkChk_join _ _ _ _ _ 0 228 9 h21 okM22
  have h23 : blkChk C E1.SL_e279.entry UB UBR lits 0 246 = true := blkChk_join _ _ _ _ _ 0 237 9 h22 okM23
  have h24 : blkChk C E1.SL_e279.entry UB UBR lits 0 256 = true := blkChk_join _ _ _ _ _ 0 246 10 h23 okM24
  have h25 : blkChk C E1.SL_e279.entry UB UBR lits 0 266 = true := blkChk_join _ _ _ _ _ 0 256 10 h24 okM25
  have h26 : blkChk C E1.SL_e279.entry UB UBR lits 0 274 = true := blkChk_join _ _ _ _ _ 0 266 8 h25 okM26
  have h27 : blkChk C E1.SL_e279.entry UB UBR lits 0 284 = true := blkChk_join _ _ _ _ _ 0 274 10 h26 okM27
  have h28 : blkChk C E1.SL_e279.entry UB UBR lits 0 291 = true := blkChk_join _ _ _ _ _ 0 284 7 h27 okM28
  have h29 : blkChk C E1.SL_e279.entry UB UBR lits 0 303 = true := blkChk_join _ _ _ _ _ 0 291 12 h28 okM29
  have h30 : blkChk C E1.SL_e279.entry UB UBR lits 0 313 = true := blkChk_join _ _ _ _ _ 0 303 10 h29 okM30
  have h31 : blkChk C E1.SL_e279.entry UB UBR lits 0 324 = true := blkChk_join _ _ _ _ _ 0 313 11 h30 okM31
  have h32 : blkChk C E1.SL_e279.entry UB UBR lits 0 336 = true := blkChk_join _ _ _ _ _ 0 324 12 h31 okM32
  have h33 : blkChk C E1.SL_e279.entry UB UBR lits 0 350 = true := blkChk_join _ _ _ _ _ 0 336 14 h32 okM33
  have h34 : blkChk C E1.SL_e279.entry UB UBR lits 0 363 = true := blkChk_join _ _ _ _ _ 0 350 13 h33 okM34
  have h35 : blkChk C E1.SL_e279.entry UB UBR lits 0 375 = true := blkChk_join _ _ _ _ _ 0 363 12 h34 okM35
  have h36 : blkChk C E1.SL_e279.entry UB UBR lits 0 391 = true := blkChk_join _ _ _ _ _ 0 375 16 h35 okM36
  have h37 : blkChk C E1.SL_e279.entry UB UBR lits 0 406 = true := blkChk_join _ _ _ _ _ 0 391 15 h36 okM37
  have h38 : blkChk C E1.SL_e279.entry UB UBR lits 0 417 = true := blkChk_join _ _ _ _ _ 0 406 11 h37 okM38
  have h39 : blkChk C E1.SL_e279.entry UB UBR lits 0 430 = true := blkChk_join _ _ _ _ _ 0 417 13 h38 okM39
  have h40 : blkChk C E1.SL_e279.entry UB UBR lits 0 446 = true := blkChk_join _ _ _ _ _ 0 430 16 h39 okM40
  have h41 : blkChk C E1.SL_e279.entry UB UBR lits 0 453 = true := blkChk_join _ _ _ _ _ 0 446 7 h40 okM41
  have h42 : blkChk C E1.SL_e279.entry UB UBR lits 0 460 = true := blkChk_join _ _ _ _ _ 0 453 7 h41 okM42
  have h43 : blkChk C E1.SL_e279.entry UB UBR lits 0 468 = true := blkChk_join _ _ _ _ _ 0 460 8 h42 okM43
  have h44 : blkChk C E1.SL_e279.entry UB UBR lits 0 475 = true := blkChk_join _ _ _ _ _ 0 468 7 h43 okM44
  have h45 : blkChk C E1.SL_e279.entry UB UBR lits 0 487 = true := blkChk_join _ _ _ _ _ 0 475 12 h44 okM45
  have h46 : blkChk C E1.SL_e279.entry UB UBR lits 0 497 = true := blkChk_join _ _ _ _ _ 0 487 10 h45 okM46
  have h47 : blkChk C E1.SL_e279.entry UB UBR lits 0 505 = true := blkChk_join _ _ _ _ _ 0 497 8 h46 okM47
  have h48 : blkChk C E1.SL_e279.entry UB UBR lits 0 515 = true := blkChk_join _ _ _ _ _ 0 505 10 h47 okM48
  have h49 : blkChk C E1.SL_e279.entry UB UBR lits 0 525 = true := blkChk_join _ _ _ _ _ 0 515 10 h48 okM49
  have h50 : blkChk C E1.SL_e279.entry UB UBR lits 0 536 = true := blkChk_join _ _ _ _ _ 0 525 11 h49 okM50
  have h51 : blkChk C E1.SL_e279.entry UB UBR lits 0 545 = true := blkChk_join _ _ _ _ _ 0 536 9 h50 okM51
  have h52 : blkChk C E1.SL_e279.entry UB UBR lits 0 557 = true := blkChk_join _ _ _ _ _ 0 545 12 h51 okM52
  have h53 : blkChk C E1.SL_e279.entry UB UBR lits 0 570 = true := blkChk_join _ _ _ _ _ 0 557 13 h52 okM53
  have h54 : blkChk C E1.SL_e279.entry UB UBR lits 0 582 = true := blkChk_join _ _ _ _ _ 0 570 12 h53 okM54
  have h55 : blkChk C E1.SL_e279.entry UB UBR lits 0 594 = true := blkChk_join _ _ _ _ _ 0 582 12 h54 okM55
  have h56 : blkChk C E1.SL_e279.entry UB UBR lits 0 601 = true := blkChk_join _ _ _ _ _ 0 594 7 h55 okM56
  have h57 : blkChk C E1.SL_e279.entry UB UBR lits 0 608 = true := blkChk_join _ _ _ _ _ 0 601 7 h56 okM57
  have h58 : blkChk C E1.SL_e279.entry UB UBR lits 0 616 = true := blkChk_join _ _ _ _ _ 0 608 8 h57 okM58
  have h59 : blkChk C E1.SL_e279.entry UB UBR lits 0 632 = true := blkChk_join _ _ _ _ _ 0 616 16 h58 okM59
  have h60 : blkChk C E1.SL_e279.entry UB UBR lits 0 646 = true := blkChk_join _ _ _ _ _ 0 632 14 h59 okM60
  have h61 : blkChk C E1.SL_e279.entry UB UBR lits 0 662 = true := blkChk_join _ _ _ _ _ 0 646 16 h60 okM61
  have h62 : blkChk C E1.SL_e279.entry UB UBR lits 0 676 = true := blkChk_join _ _ _ _ _ 0 662 14 h61 okM62
  have h63 : blkChk C E1.SL_e279.entry UB UBR lits 0 688 = true := blkChk_join _ _ _ _ _ 0 676 12 h62 okM63
  have h64 : blkChk C E1.SL_e279.entry UB UBR lits 0 698 = true := blkChk_join _ _ _ _ _ 0 688 10 h63 okM64
  have h65 : blkChk C E1.SL_e279.entry UB UBR lits 0 714 = true := blkChk_join _ _ _ _ _ 0 698 16 h64 okM65
  have h66 : blkChk C E1.SL_e279.entry UB UBR lits 0 725 = true := blkChk_join _ _ _ _ _ 0 714 11 h65 okM66
  have h67 : blkChk C E1.SL_e279.entry UB UBR lits 0 737 = true := blkChk_join _ _ _ _ _ 0 725 12 h66 okM67
  have h68 : blkChk C E1.SL_e279.entry UB UBR lits 0 753 = true := blkChk_join _ _ _ _ _ 0 737 16 h67 okM68
  have h69 : blkChk C E1.SL_e279.entry UB UBR lits 0 761 = true := blkChk_join _ _ _ _ _ 0 753 8 h68 okM69
  have h70 : blkChk C E1.SL_e279.entry UB UBR lits 0 771 = true := blkChk_join _ _ _ _ _ 0 761 10 h69 okM70
  have h71 : blkChk C E1.SL_e279.entry UB UBR lits 0 779 = true := blkChk_join _ _ _ _ _ 0 771 8 h70 okM71
  have h72 : blkChk C E1.SL_e279.entry UB UBR lits 0 789 = true := blkChk_join _ _ _ _ _ 0 779 10 h71 okM72
  have h73 : blkChk C E1.SL_e279.entry UB UBR lits 0 801 = true := blkChk_join _ _ _ _ _ 0 789 12 h72 okM73
  have h74 : blkChk C E1.SL_e279.entry UB UBR lits 0 814 = true := blkChk_join _ _ _ _ _ 0 801 13 h73 okM74
  have h75 : blkChk C E1.SL_e279.entry UB UBR lits 0 826 = true := blkChk_join _ _ _ _ _ 0 814 12 h74 okM75
  have h76 : blkChk C E1.SL_e279.entry UB UBR lits 0 837 = true := blkChk_join _ _ _ _ _ 0 826 11 h75 okM76
  have h77 : blkChk C E1.SL_e279.entry UB UBR lits 0 847 = true := blkChk_join _ _ _ _ _ 0 837 10 h76 okM77
  have h78 : blkChk C E1.SL_e279.entry UB UBR lits 0 857 = true := blkChk_join _ _ _ _ _ 0 847 10 h77 okM78
  have h79 : blkChk C E1.SL_e279.entry UB UBR lits 0 868 = true := blkChk_join _ _ _ _ _ 0 857 11 h78 okM79
  have h80 : blkChk C E1.SL_e279.entry UB UBR lits 0 884 = true := blkChk_join _ _ _ _ _ 0 868 16 h79 okM80
  have h81 : blkChk C E1.SL_e279.entry UB UBR lits 0 895 = true := blkChk_join _ _ _ _ _ 0 884 11 h80 okM81
  have h82 : blkChk C E1.SL_e279.entry UB UBR lits 0 906 = true := blkChk_join _ _ _ _ _ 0 895 11 h81 okM82
  have h83 : blkChk C E1.SL_e279.entry UB UBR lits 0 917 = true := blkChk_join _ _ _ _ _ 0 906 11 h82 okM83
  have h84 : blkChk C E1.SL_e279.entry UB UBR lits 0 926 = true := blkChk_join _ _ _ _ _ 0 917 9 h83 okM84
  have h85 : blkChk C E1.SL_e279.entry UB UBR lits 0 937 = true := blkChk_join _ _ _ _ _ 0 926 11 h84 okM85
  have h86 : blkChk C E1.SL_e279.entry UB UBR lits 0 950 = true := blkChk_join _ _ _ _ _ 0 937 13 h85 okM86
  have h87 : blkChk C E1.SL_e279.entry UB UBR lits 0 963 = true := blkChk_join _ _ _ _ _ 0 950 13 h86 okM87
  have h88 : blkChk C E1.SL_e279.entry UB UBR lits 0 974 = true := blkChk_join _ _ _ _ _ 0 963 11 h87 okM88
  have h89 : blkChk C E1.SL_e279.entry UB UBR lits 0 987 = true := blkChk_join _ _ _ _ _ 0 974 13 h88 okM89
  have h90 : blkChk C E1.SL_e279.entry UB UBR lits 0 1002 = true := blkChk_join _ _ _ _ _ 0 987 15 h89 okM90
  have h91 : blkChk C E1.SL_e279.entry UB UBR lits 0 1011 = true := blkChk_join _ _ _ _ _ 0 1002 9 h90 okM91
  have h92 : blkChk C E1.SL_e279.entry UB UBR lits 0 1018 = true := blkChk_join _ _ _ _ _ 0 1011 7 h91 okM92
  have h93 : blkChk C E1.SL_e279.entry UB UBR lits 0 1027 = true := blkChk_join _ _ _ _ _ 0 1018 9 h92 okM93
  have h94 : blkChk C E1.SL_e279.entry UB UBR lits 0 1033 = true := blkChk_join _ _ _ _ _ 0 1027 6 h93 okM94
  have h95 : blkChk C E1.SL_e279.entry UB UBR lits 0 1045 = true := blkChk_join _ _ _ _ _ 0 1033 12 h94 okM95
  have h96 : blkChk C E1.SL_e279.entry UB UBR lits 0 1059 = true := blkChk_join _ _ _ _ _ 0 1045 14 h95 okM96
  have h97 : blkChk C E1.SL_e279.entry UB UBR lits 0 1072 = true := blkChk_join _ _ _ _ _ 0 1059 13 h96 okM97
  have h98 : blkChk C E1.SL_e279.entry UB UBR lits 0 1085 = true := blkChk_join _ _ _ _ _ 0 1072 13 h97 okM98
  have h99 : blkChk C E1.SL_e279.entry UB UBR lits 0 1093 = true := blkChk_join _ _ _ _ _ 0 1085 8 h98 okM99
  have h100 : blkChk C E1.SL_e279.entry UB UBR lits 0 1101 = true := blkChk_join _ _ _ _ _ 0 1093 8 h99 okM100
  have h101 : blkChk C E1.SL_e279.entry UB UBR lits 0 1112 = true := blkChk_join _ _ _ _ _ 0 1101 11 h100 okM101
  have h102 : blkChk C E1.SL_e279.entry UB UBR lits 0 1123 = true := blkChk_join _ _ _ _ _ 0 1112 11 h101 okM102
  have h103 : blkChk C E1.SL_e279.entry UB UBR lits 0 1132 = true := blkChk_join _ _ _ _ _ 0 1123 9 h102 okM103
  have h104 : blkChk C E1.SL_e279.entry UB UBR lits 0 1145 = true := blkChk_join _ _ _ _ _ 0 1132 13 h103 okM104
  have h105 : blkChk C E1.SL_e279.entry UB UBR lits 0 1158 = true := blkChk_join _ _ _ _ _ 0 1145 13 h104 okM105
  have h106 : blkChk C E1.SL_e279.entry UB UBR lits 0 1172 = true := blkChk_join _ _ _ _ _ 0 1158 14 h105 okM106
  have h107 : blkChk C E1.SL_e279.entry UB UBR lits 0 1187 = true := blkChk_join _ _ _ _ _ 0 1172 15 h106 okM107
  have h108 : blkChk C E1.SL_e279.entry UB UBR lits 0 1199 = true := blkChk_join _ _ _ _ _ 0 1187 12 h107 okM108
  have h109 : blkChk C E1.SL_e279.entry UB UBR lits 0 1214 = true := blkChk_join _ _ _ _ _ 0 1199 15 h108 okM109
  have h110 : blkChk C E1.SL_e279.entry UB UBR lits 0 1222 = true := blkChk_join _ _ _ _ _ 0 1214 8 h109 okM110
  have h111 : blkChk C E1.SL_e279.entry UB UBR lits 0 1238 = true := blkChk_join _ _ _ _ _ 0 1222 16 h110 okM111
  have h112 : blkChk C E1.SL_e279.entry UB UBR lits 0 1249 = true := blkChk_join _ _ _ _ _ 0 1238 11 h111 okM112
  have h113 : blkChk C E1.SL_e279.entry UB UBR lits 0 1265 = true := blkChk_join _ _ _ _ _ 0 1249 16 h112 okM113
  have h114 : blkChk C E1.SL_e279.entry UB UBR lits 0 1277 = true := blkChk_join _ _ _ _ _ 0 1265 12 h113 okM114
  have h115 : blkChk C E1.SL_e279.entry UB UBR lits 0 1292 = true := blkChk_join _ _ _ _ _ 0 1277 15 h114 okM115
  have h116 : blkChk C E1.SL_e279.entry UB UBR lits 0 1303 = true := blkChk_join _ _ _ _ _ 0 1292 11 h115 okM116
  have h117 : blkChk C E1.SL_e279.entry UB UBR lits 0 1317 = true := blkChk_join _ _ _ _ _ 0 1303 14 h116 okM117
  have h118 : blkChk C E1.SL_e279.entry UB UBR lits 0 1322 = true := blkChk_join _ _ _ _ _ 0 1317 5 h117 okM118
  have h119 : blkChk C E1.SL_e279.entry UB UBR lits 0 1334 = true := blkChk_join _ _ _ _ _ 0 1322 12 h118 okM119
  have h120 : blkChk C E1.SL_e279.entry UB UBR lits 0 1350 = true := blkChk_join _ _ _ _ _ 0 1334 16 h119 okM120
  have h121 : blkChk C E1.SL_e279.entry UB UBR lits 0 1364 = true := blkChk_join _ _ _ _ _ 0 1350 14 h120 okM121
  have h122 : blkChk C E1.SL_e279.entry UB UBR lits 0 1377 = true := blkChk_join _ _ _ _ _ 0 1364 13 h121 okM122
  have h123 : blkChk C E1.SL_e279.entry UB UBR lits 0 1390 = true := blkChk_join _ _ _ _ _ 0 1377 13 h122 okM123
  have h124 : blkChk C E1.SL_e279.entry UB UBR lits 0 1401 = true := blkChk_join _ _ _ _ _ 0 1390 11 h123 okM124
  have h125 : blkChk C E1.SL_e279.entry UB UBR lits 0 1414 = true := blkChk_join _ _ _ _ _ 0 1401 13 h124 okM125
  have h126 : blkChk C E1.SL_e279.entry UB UBR lits 0 1427 = true := blkChk_join _ _ _ _ _ 0 1414 13 h125 okM126
  have h127 : blkChk C E1.SL_e279.entry UB UBR lits 0 1443 = true := blkChk_join _ _ _ _ _ 0 1427 16 h126 okM127
  have h128 : blkChk C E1.SL_e279.entry UB UBR lits 0 1459 = true := blkChk_join _ _ _ _ _ 0 1443 16 h127 okM128
  have h129 : blkChk C E1.SL_e279.entry UB UBR lits 0 1468 = true := blkChk_join _ _ _ _ _ 0 1459 9 h128 okM129
  have h130 : blkChk C E1.SL_e279.entry UB UBR lits 0 1478 = true := blkChk_join _ _ _ _ _ 0 1468 10 h129 okM130
  have h131 : blkChk C E1.SL_e279.entry UB UBR lits 0 1490 = true := blkChk_join _ _ _ _ _ 0 1478 12 h130 okM131
  have h132 : blkChk C E1.SL_e279.entry UB UBR lits 0 1505 = true := blkChk_join _ _ _ _ _ 0 1490 15 h131 okM132
  have h133 : blkChk C E1.SL_e279.entry UB UBR lits 0 1521 = true := blkChk_join _ _ _ _ _ 0 1505 16 h132 okM133
  have h134 : blkChk C E1.SL_e279.entry UB UBR lits 0 1534 = true := blkChk_join _ _ _ _ _ 0 1521 13 h133 okM134
  have h135 : blkChk C E1.SL_e279.entry UB UBR lits 0 1546 = true := blkChk_join _ _ _ _ _ 0 1534 12 h134 okM135
  have h136 : blkChk C E1.SL_e279.entry UB UBR lits 0 1559 = true := blkChk_join _ _ _ _ _ 0 1546 13 h135 okM136
  have h137 : blkChk C E1.SL_e279.entry UB UBR lits 0 1575 = true := blkChk_join _ _ _ _ _ 0 1559 16 h136 okM137
  have h138 : blkChk C E1.SL_e279.entry UB UBR lits 0 1586 = true := blkChk_join _ _ _ _ _ 0 1575 11 h137 okM138
  have h139 : blkChk C E1.SL_e279.entry UB UBR lits 0 1594 = true := blkChk_join _ _ _ _ _ 0 1586 8 h138 okM139
  have h140 : blkChk C E1.SL_e279.entry UB UBR lits 0 1609 = true := blkChk_join _ _ _ _ _ 0 1594 15 h139 okM140
  have h141 : blkChk C E1.SL_e279.entry UB UBR lits 0 1620 = true := blkChk_join _ _ _ _ _ 0 1609 11 h140 okM141
  have h142 : blkChk C E1.SL_e279.entry UB UBR lits 0 1636 = true := blkChk_join _ _ _ _ _ 0 1620 16 h141 okM142
  have h143 : blkChk C E1.SL_e279.entry UB UBR lits 0 1646 = true := blkChk_join _ _ _ _ _ 0 1636 10 h142 okM143
  have h144 : blkChk C E1.SL_e279.entry UB UBR lits 0 1660 = true := blkChk_join _ _ _ _ _ 0 1646 14 h143 okM144
  have h145 : blkChk C E1.SL_e279.entry UB UBR lits 0 1676 = true := blkChk_join _ _ _ _ _ 0 1660 16 h144 okM145
  have h146 : blkChk C E1.SL_e279.entry UB UBR lits 0 1692 = true := blkChk_join _ _ _ _ _ 0 1676 16 h145 okM146
  have h147 : blkChk C E1.SL_e279.entry UB UBR lits 0 1708 = true := blkChk_join _ _ _ _ _ 0 1692 16 h146 okM147
  have h148 : blkChk C E1.SL_e279.entry UB UBR lits 0 1722 = true := blkChk_join _ _ _ _ _ 0 1708 14 h147 okM148
  have h149 : blkChk C E1.SL_e279.entry UB UBR lits 0 1735 = true := blkChk_join _ _ _ _ _ 0 1722 13 h148 okM149
  have h150 : blkChk C E1.SL_e279.entry UB UBR lits 0 1747 = true := blkChk_join _ _ _ _ _ 0 1735 12 h149 okM150
  exact h150
theorem len : lits.length = 1747 := by decide
theorem okGAll : glueChkR lits W 0 1747 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 32 = true := glueChkR_join _ _ 0 16 16 g0 okG1
  have g2 : glueChkR lits W 0 40 = true := glueChkR_join _ _ 0 32 8 g1 okG2
  have g3 : glueChkR lits W 0 53 = true := glueChkR_join _ _ 0 40 13 g2 okG3
  have g4 : glueChkR lits W 0 62 = true := glueChkR_join _ _ 0 53 9 g3 okG4
  have g5 : glueChkR lits W 0 68 = true := glueChkR_join _ _ 0 62 6 g4 okG5
  have g6 : glueChkR lits W 0 80 = true := glueChkR_join _ _ 0 68 12 g5 okG6
  have g7 : glueChkR lits W 0 91 = true := glueChkR_join _ _ 0 80 11 g6 okG7
  have g8 : glueChkR lits W 0 100 = true := glueChkR_join _ _ 0 91 9 g7 okG8
  have g9 : glueChkR lits W 0 109 = true := glueChkR_join _ _ 0 100 9 g8 okG9
  have g10 : glueChkR lits W 0 121 = true := glueChkR_join _ _ 0 109 12 g9 okG10
  have g11 : glueChkR lits W 0 131 = true := glueChkR_join _ _ 0 121 10 g10 okG11
  have g12 : glueChkR lits W 0 144 = true := glueChkR_join _ _ 0 131 13 g11 okG12
  have g13 : glueChkR lits W 0 153 = true := glueChkR_join _ _ 0 144 9 g12 okG13
  have g14 : glueChkR lits W 0 161 = true := glueChkR_join _ _ 0 153 8 g13 okG14
  have g15 : glueChkR lits W 0 168 = true := glueChkR_join _ _ 0 161 7 g14 okG15
  have g16 : glueChkR lits W 0 179 = true := glueChkR_join _ _ 0 168 11 g15 okG16
  have g17 : glueChkR lits W 0 188 = true := glueChkR_join _ _ 0 179 9 g16 okG17
  have g18 : glueChkR lits W 0 198 = true := glueChkR_join _ _ 0 188 10 g17 okG18
  have g19 : glueChkR lits W 0 206 = true := glueChkR_join _ _ 0 198 8 g18 okG19
  have g20 : glueChkR lits W 0 218 = true := glueChkR_join _ _ 0 206 12 g19 okG20
  have g21 : glueChkR lits W 0 228 = true := glueChkR_join _ _ 0 218 10 g20 okG21
  have g22 : glueChkR lits W 0 237 = true := glueChkR_join _ _ 0 228 9 g21 okG22
  have g23 : glueChkR lits W 0 246 = true := glueChkR_join _ _ 0 237 9 g22 okG23
  have g24 : glueChkR lits W 0 256 = true := glueChkR_join _ _ 0 246 10 g23 okG24
  have g25 : glueChkR lits W 0 266 = true := glueChkR_join _ _ 0 256 10 g24 okG25
  have g26 : glueChkR lits W 0 274 = true := glueChkR_join _ _ 0 266 8 g25 okG26
  have g27 : glueChkR lits W 0 284 = true := glueChkR_join _ _ 0 274 10 g26 okG27
  have g28 : glueChkR lits W 0 291 = true := glueChkR_join _ _ 0 284 7 g27 okG28
  have g29 : glueChkR lits W 0 303 = true := glueChkR_join _ _ 0 291 12 g28 okG29
  have g30 : glueChkR lits W 0 313 = true := glueChkR_join _ _ 0 303 10 g29 okG30
  have g31 : glueChkR lits W 0 324 = true := glueChkR_join _ _ 0 313 11 g30 okG31
  have g32 : glueChkR lits W 0 336 = true := glueChkR_join _ _ 0 324 12 g31 okG32
  have g33 : glueChkR lits W 0 350 = true := glueChkR_join _ _ 0 336 14 g32 okG33
  have g34 : glueChkR lits W 0 363 = true := glueChkR_join _ _ 0 350 13 g33 okG34
  have g35 : glueChkR lits W 0 375 = true := glueChkR_join _ _ 0 363 12 g34 okG35
  have g36 : glueChkR lits W 0 391 = true := glueChkR_join _ _ 0 375 16 g35 okG36
  have g37 : glueChkR lits W 0 406 = true := glueChkR_join _ _ 0 391 15 g36 okG37
  have g38 : glueChkR lits W 0 417 = true := glueChkR_join _ _ 0 406 11 g37 okG38
  have g39 : glueChkR lits W 0 430 = true := glueChkR_join _ _ 0 417 13 g38 okG39
  have g40 : glueChkR lits W 0 446 = true := glueChkR_join _ _ 0 430 16 g39 okG40
  have g41 : glueChkR lits W 0 453 = true := glueChkR_join _ _ 0 446 7 g40 okG41
  have g42 : glueChkR lits W 0 460 = true := glueChkR_join _ _ 0 453 7 g41 okG42
  have g43 : glueChkR lits W 0 468 = true := glueChkR_join _ _ 0 460 8 g42 okG43
  have g44 : glueChkR lits W 0 475 = true := glueChkR_join _ _ 0 468 7 g43 okG44
  have g45 : glueChkR lits W 0 487 = true := glueChkR_join _ _ 0 475 12 g44 okG45
  have g46 : glueChkR lits W 0 497 = true := glueChkR_join _ _ 0 487 10 g45 okG46
  have g47 : glueChkR lits W 0 505 = true := glueChkR_join _ _ 0 497 8 g46 okG47
  have g48 : glueChkR lits W 0 515 = true := glueChkR_join _ _ 0 505 10 g47 okG48
  have g49 : glueChkR lits W 0 525 = true := glueChkR_join _ _ 0 515 10 g48 okG49
  have g50 : glueChkR lits W 0 536 = true := glueChkR_join _ _ 0 525 11 g49 okG50
  have g51 : glueChkR lits W 0 545 = true := glueChkR_join _ _ 0 536 9 g50 okG51
  have g52 : glueChkR lits W 0 557 = true := glueChkR_join _ _ 0 545 12 g51 okG52
  have g53 : glueChkR lits W 0 570 = true := glueChkR_join _ _ 0 557 13 g52 okG53
  have g54 : glueChkR lits W 0 582 = true := glueChkR_join _ _ 0 570 12 g53 okG54
  have g55 : glueChkR lits W 0 594 = true := glueChkR_join _ _ 0 582 12 g54 okG55
  have g56 : glueChkR lits W 0 601 = true := glueChkR_join _ _ 0 594 7 g55 okG56
  have g57 : glueChkR lits W 0 608 = true := glueChkR_join _ _ 0 601 7 g56 okG57
  have g58 : glueChkR lits W 0 616 = true := glueChkR_join _ _ 0 608 8 g57 okG58
  have g59 : glueChkR lits W 0 632 = true := glueChkR_join _ _ 0 616 16 g58 okG59
  have g60 : glueChkR lits W 0 646 = true := glueChkR_join _ _ 0 632 14 g59 okG60
  have g61 : glueChkR lits W 0 662 = true := glueChkR_join _ _ 0 646 16 g60 okG61
  have g62 : glueChkR lits W 0 676 = true := glueChkR_join _ _ 0 662 14 g61 okG62
  have g63 : glueChkR lits W 0 688 = true := glueChkR_join _ _ 0 676 12 g62 okG63
  have g64 : glueChkR lits W 0 698 = true := glueChkR_join _ _ 0 688 10 g63 okG64
  have g65 : glueChkR lits W 0 714 = true := glueChkR_join _ _ 0 698 16 g64 okG65
  have g66 : glueChkR lits W 0 725 = true := glueChkR_join _ _ 0 714 11 g65 okG66
  have g67 : glueChkR lits W 0 737 = true := glueChkR_join _ _ 0 725 12 g66 okG67
  have g68 : glueChkR lits W 0 753 = true := glueChkR_join _ _ 0 737 16 g67 okG68
  have g69 : glueChkR lits W 0 761 = true := glueChkR_join _ _ 0 753 8 g68 okG69
  have g70 : glueChkR lits W 0 771 = true := glueChkR_join _ _ 0 761 10 g69 okG70
  have g71 : glueChkR lits W 0 779 = true := glueChkR_join _ _ 0 771 8 g70 okG71
  have g72 : glueChkR lits W 0 789 = true := glueChkR_join _ _ 0 779 10 g71 okG72
  have g73 : glueChkR lits W 0 801 = true := glueChkR_join _ _ 0 789 12 g72 okG73
  have g74 : glueChkR lits W 0 814 = true := glueChkR_join _ _ 0 801 13 g73 okG74
  have g75 : glueChkR lits W 0 826 = true := glueChkR_join _ _ 0 814 12 g74 okG75
  have g76 : glueChkR lits W 0 837 = true := glueChkR_join _ _ 0 826 11 g75 okG76
  have g77 : glueChkR lits W 0 847 = true := glueChkR_join _ _ 0 837 10 g76 okG77
  have g78 : glueChkR lits W 0 857 = true := glueChkR_join _ _ 0 847 10 g77 okG78
  have g79 : glueChkR lits W 0 868 = true := glueChkR_join _ _ 0 857 11 g78 okG79
  have g80 : glueChkR lits W 0 884 = true := glueChkR_join _ _ 0 868 16 g79 okG80
  have g81 : glueChkR lits W 0 895 = true := glueChkR_join _ _ 0 884 11 g80 okG81
  have g82 : glueChkR lits W 0 906 = true := glueChkR_join _ _ 0 895 11 g81 okG82
  have g83 : glueChkR lits W 0 917 = true := glueChkR_join _ _ 0 906 11 g82 okG83
  have g84 : glueChkR lits W 0 926 = true := glueChkR_join _ _ 0 917 9 g83 okG84
  have g85 : glueChkR lits W 0 937 = true := glueChkR_join _ _ 0 926 11 g84 okG85
  have g86 : glueChkR lits W 0 950 = true := glueChkR_join _ _ 0 937 13 g85 okG86
  have g87 : glueChkR lits W 0 963 = true := glueChkR_join _ _ 0 950 13 g86 okG87
  have g88 : glueChkR lits W 0 974 = true := glueChkR_join _ _ 0 963 11 g87 okG88
  have g89 : glueChkR lits W 0 987 = true := glueChkR_join _ _ 0 974 13 g88 okG89
  have g90 : glueChkR lits W 0 1002 = true := glueChkR_join _ _ 0 987 15 g89 okG90
  have g91 : glueChkR lits W 0 1011 = true := glueChkR_join _ _ 0 1002 9 g90 okG91
  have g92 : glueChkR lits W 0 1018 = true := glueChkR_join _ _ 0 1011 7 g91 okG92
  have g93 : glueChkR lits W 0 1027 = true := glueChkR_join _ _ 0 1018 9 g92 okG93
  have g94 : glueChkR lits W 0 1033 = true := glueChkR_join _ _ 0 1027 6 g93 okG94
  have g95 : glueChkR lits W 0 1045 = true := glueChkR_join _ _ 0 1033 12 g94 okG95
  have g96 : glueChkR lits W 0 1059 = true := glueChkR_join _ _ 0 1045 14 g95 okG96
  have g97 : glueChkR lits W 0 1072 = true := glueChkR_join _ _ 0 1059 13 g96 okG97
  have g98 : glueChkR lits W 0 1085 = true := glueChkR_join _ _ 0 1072 13 g97 okG98
  have g99 : glueChkR lits W 0 1093 = true := glueChkR_join _ _ 0 1085 8 g98 okG99
  have g100 : glueChkR lits W 0 1101 = true := glueChkR_join _ _ 0 1093 8 g99 okG100
  have g101 : glueChkR lits W 0 1112 = true := glueChkR_join _ _ 0 1101 11 g100 okG101
  have g102 : glueChkR lits W 0 1123 = true := glueChkR_join _ _ 0 1112 11 g101 okG102
  have g103 : glueChkR lits W 0 1132 = true := glueChkR_join _ _ 0 1123 9 g102 okG103
  have g104 : glueChkR lits W 0 1145 = true := glueChkR_join _ _ 0 1132 13 g103 okG104
  have g105 : glueChkR lits W 0 1158 = true := glueChkR_join _ _ 0 1145 13 g104 okG105
  have g106 : glueChkR lits W 0 1172 = true := glueChkR_join _ _ 0 1158 14 g105 okG106
  have g107 : glueChkR lits W 0 1187 = true := glueChkR_join _ _ 0 1172 15 g106 okG107
  have g108 : glueChkR lits W 0 1199 = true := glueChkR_join _ _ 0 1187 12 g107 okG108
  have g109 : glueChkR lits W 0 1214 = true := glueChkR_join _ _ 0 1199 15 g108 okG109
  have g110 : glueChkR lits W 0 1222 = true := glueChkR_join _ _ 0 1214 8 g109 okG110
  have g111 : glueChkR lits W 0 1238 = true := glueChkR_join _ _ 0 1222 16 g110 okG111
  have g112 : glueChkR lits W 0 1249 = true := glueChkR_join _ _ 0 1238 11 g111 okG112
  have g113 : glueChkR lits W 0 1265 = true := glueChkR_join _ _ 0 1249 16 g112 okG113
  have g114 : glueChkR lits W 0 1277 = true := glueChkR_join _ _ 0 1265 12 g113 okG114
  have g115 : glueChkR lits W 0 1292 = true := glueChkR_join _ _ 0 1277 15 g114 okG115
  have g116 : glueChkR lits W 0 1303 = true := glueChkR_join _ _ 0 1292 11 g115 okG116
  have g117 : glueChkR lits W 0 1317 = true := glueChkR_join _ _ 0 1303 14 g116 okG117
  have g118 : glueChkR lits W 0 1322 = true := glueChkR_join _ _ 0 1317 5 g117 okG118
  have g119 : glueChkR lits W 0 1334 = true := glueChkR_join _ _ 0 1322 12 g118 okG119
  have g120 : glueChkR lits W 0 1350 = true := glueChkR_join _ _ 0 1334 16 g119 okG120
  have g121 : glueChkR lits W 0 1364 = true := glueChkR_join _ _ 0 1350 14 g120 okG121
  have g122 : glueChkR lits W 0 1377 = true := glueChkR_join _ _ 0 1364 13 g121 okG122
  have g123 : glueChkR lits W 0 1390 = true := glueChkR_join _ _ 0 1377 13 g122 okG123
  have g124 : glueChkR lits W 0 1401 = true := glueChkR_join _ _ 0 1390 11 g123 okG124
  have g125 : glueChkR lits W 0 1414 = true := glueChkR_join _ _ 0 1401 13 g124 okG125
  have g126 : glueChkR lits W 0 1427 = true := glueChkR_join _ _ 0 1414 13 g125 okG126
  have g127 : glueChkR lits W 0 1443 = true := glueChkR_join _ _ 0 1427 16 g126 okG127
  have g128 : glueChkR lits W 0 1459 = true := glueChkR_join _ _ 0 1443 16 g127 okG128
  have g129 : glueChkR lits W 0 1468 = true := glueChkR_join _ _ 0 1459 9 g128 okG129
  have g130 : glueChkR lits W 0 1478 = true := glueChkR_join _ _ 0 1468 10 g129 okG130
  have g131 : glueChkR lits W 0 1490 = true := glueChkR_join _ _ 0 1478 12 g130 okG131
  have g132 : glueChkR lits W 0 1505 = true := glueChkR_join _ _ 0 1490 15 g131 okG132
  have g133 : glueChkR lits W 0 1521 = true := glueChkR_join _ _ 0 1505 16 g132 okG133
  have g134 : glueChkR lits W 0 1534 = true := glueChkR_join _ _ 0 1521 13 g133 okG134
  have g135 : glueChkR lits W 0 1546 = true := glueChkR_join _ _ 0 1534 12 g134 okG135
  have g136 : glueChkR lits W 0 1559 = true := glueChkR_join _ _ 0 1546 13 g135 okG136
  have g137 : glueChkR lits W 0 1575 = true := glueChkR_join _ _ 0 1559 16 g136 okG137
  have g138 : glueChkR lits W 0 1586 = true := glueChkR_join _ _ 0 1575 11 g137 okG138
  have g139 : glueChkR lits W 0 1594 = true := glueChkR_join _ _ 0 1586 8 g138 okG139
  have g140 : glueChkR lits W 0 1609 = true := glueChkR_join _ _ 0 1594 15 g139 okG140
  have g141 : glueChkR lits W 0 1620 = true := glueChkR_join _ _ 0 1609 11 g140 okG141
  have g142 : glueChkR lits W 0 1636 = true := glueChkR_join _ _ 0 1620 16 g141 okG142
  have g143 : glueChkR lits W 0 1646 = true := glueChkR_join _ _ 0 1636 10 g142 okG143
  have g144 : glueChkR lits W 0 1660 = true := glueChkR_join _ _ 0 1646 14 g143 okG144
  have g145 : glueChkR lits W 0 1676 = true := glueChkR_join _ _ 0 1660 16 g144 okG145
  have g146 : glueChkR lits W 0 1692 = true := glueChkR_join _ _ 0 1676 16 g145 okG146
  have g147 : glueChkR lits W 0 1708 = true := glueChkR_join _ _ 0 1692 16 g146 okG147
  have g148 : glueChkR lits W 0 1722 = true := glueChkR_join _ _ 0 1708 14 g147 okG148
  have g149 : glueChkR lits W 0 1735 = true := glueChkR_join _ _ 0 1722 13 g148 okG149
  have g150 : glueChkR lits W 0 1747 = true := glueChkR_join _ _ 0 1735 12 g149 okG150
  exact g150
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e279.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e279.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e279.UB_eq E1.OK_e279.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C279X
