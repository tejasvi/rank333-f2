module
public import R22Port.U_d41d8cd98f00
public import E1.C237X_B0
public import E1.C237X_B1
public import E1.C237X_B2
public import E1.C237X_B3
public import E1.C237X_B4
public import E1.C237X_B5
public import E1.C237X_B6
public import E1.C237X_B7
public import E1.C237X_B8
public import E1.C237X_B9
public import E1.C237X_B10
public import E1.C237X_B11
public import E1.C237X_B12
public import E1.C237X_B13
public import E1.C237X_B14
public import E1.C237X_B15
public import E1.C237X_B16
public import E1.C237X_B17
public import E1.C237X_B18
public import E1.C237X_B19
public import E1.C237X_B20
public import E1.C237X_B21
public import E1.C237X_B22
public import E1.C237X_B23
public import E1.C237X_B24
public import E1.C237X_B25
public import E1.C237X_B26
public import E1.C237X_B27
public import E1.C237X_B28
public import E1.C237X_B29
public import E1.C237X_B30
public import E1.C237X_B31
public import E1.C237X_B32
public import E1.C237X_B33
public import E1.C237X_B34
public import E1.C237X_B35
public import E1.C237X_B36
public import E1.C237X_B37
public import E1.C237X_B38
public import E1.C237X_B39
public import E1.C237X_B40
public import E1.C237X_B41
public import E1.C237X_B42
public import E1.C237X_B43
public import E1.C237X_B44
public import E1.C237X_B45
public import E1.C237X_B46
public import E1.C237X_B47
public import E1.C237X_B48
public import E1.C237X_B49
public import E1.C237X_B50
public import E1.C237X_B51
public import E1.C237X_B52
public import E1.C237X_B53
public import E1.C237X_B54
public import E1.C237X_B55
public import E1.C237X_B56
public import E1.C237X_B57
public import E1.C237X_B58
public import E1.C237X_B59
public import E1.C237X_B60
public import E1.C237X_B61
public import E1.C237X_B62
public import E1.C237X_B63
public import E1.C237X_B64
public import E1.C237X_B65
public import E1.C237X_B66
public import E1.C237X_B67
public import E1.C237X_B68
public import E1.C237X_B69
public import E1.C237X_B70
public import E1.C237X_B71
public import E1.C237X_B72
public import E1.C237X_B73
public import E1.C237X_B74
public import E1.C237X_B75
public import E1.C237X_B76
public import E1.C237X_B77
public import E1.C237X_B78
public import E1.C237X_B79
public import E1.C237X_B80
public import E1.C237X_B81
public import E1.C237X_B82
public import E1.C237X_B83
public import E1.C237X_B84
public import E1.C237X_B85
public import E1.C237X_B86
public import E1.C237X_B87
public import E1.C237X_B88
public import E1.C237X_B89
public import E1.C237X_B90
public import E1.C237X_B91
public import E1.C237X_B92
public import E1.C237X_B93
public import E1.C237X_B94
public import E1.C237X_B95
public import E1.C237X_B96
public import E1.C237X_B97
public import E1.C237X_B98
public import E1.C237X_B99
public import E1.C237X_B100
public import E1.C237X_B101
public import E1.C237X_B102
public import E1.C237X_B103
public import E1.C237X_B104
public import E1.C237X_B105
public import E1.C237X_B106
public import E1.C237X_B107
public import E1.C237X_B108
public import E1.C237X_B109
public import E1.C237X_B110
public import E1.C237X_B111
public import E1.C237X_B112
public import E1.C237X_B113
public import E1.C237X_B114
public import E1.C237X_B115
public import E1.C237X_B116
public import E1.C237X_B117
public import E1.C237X_B118
public import E1.C237X_B119
public import E1.C237X_B120
public import E1.C237X_B121
public import E1.C237X_B122
public import E1.C237X_B123
public import E1.C237X_B124
public import E1.C237X_B125
public import E1.C237X_B126
public import E1.C237X_B127
public import E1.C237X_B128
public import E1.C237X_B129
public import E1.C237X_B130
public import E1.C237X_B131
public import E1.C237X_B132
public import E1.C237X_B133
public import E1.C237X_B134
public import E1.C237X_B135
public import E1.C237X_B136
public import E1.C237X_B137
public import E1.OK_e237
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C237X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C237X
open E1S E1.IP_e237
theorem okAll : blkChk C E1.SL_e237.entry UB UBR lits 0 1502 = true := by
  have h0 : blkChk C E1.SL_e237.entry UB UBR lits 0 11 = true := okM0
  have h1 : blkChk C E1.SL_e237.entry UB UBR lits 0 22 = true := blkChk_join _ _ _ _ _ 0 11 11 h0 okM1
  have h2 : blkChk C E1.SL_e237.entry UB UBR lits 0 35 = true := blkChk_join _ _ _ _ _ 0 22 13 h1 okM2
  have h3 : blkChk C E1.SL_e237.entry UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 35 9 h2 okM3
  have h4 : blkChk C E1.SL_e237.entry UB UBR lits 0 57 = true := blkChk_join _ _ _ _ _ 0 44 13 h3 okM4
  have h5 : blkChk C E1.SL_e237.entry UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 57 11 h4 okM5
  have h6 : blkChk C E1.SL_e237.entry UB UBR lits 0 76 = true := blkChk_join _ _ _ _ _ 0 68 8 h5 okM6
  have h7 : blkChk C E1.SL_e237.entry UB UBR lits 0 86 = true := blkChk_join _ _ _ _ _ 0 76 10 h6 okM7
  have h8 : blkChk C E1.SL_e237.entry UB UBR lits 0 94 = true := blkChk_join _ _ _ _ _ 0 86 8 h7 okM8
  have h9 : blkChk C E1.SL_e237.entry UB UBR lits 0 107 = true := blkChk_join _ _ _ _ _ 0 94 13 h8 okM9
  have h10 : blkChk C E1.SL_e237.entry UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 107 13 h9 okM10
  have h11 : blkChk C E1.SL_e237.entry UB UBR lits 0 134 = true := blkChk_join _ _ _ _ _ 0 120 14 h10 okM11
  have h12 : blkChk C E1.SL_e237.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 134 15 h11 okM12
  have h13 : blkChk C E1.SL_e237.entry UB UBR lits 0 158 = true := blkChk_join _ _ _ _ _ 0 149 9 h12 okM13
  have h14 : blkChk C E1.SL_e237.entry UB UBR lits 0 170 = true := blkChk_join _ _ _ _ _ 0 158 12 h13 okM14
  have h15 : blkChk C E1.SL_e237.entry UB UBR lits 0 183 = true := blkChk_join _ _ _ _ _ 0 170 13 h14 okM15
  have h16 : blkChk C E1.SL_e237.entry UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 183 9 h15 okM16
  have h17 : blkChk C E1.SL_e237.entry UB UBR lits 0 202 = true := blkChk_join _ _ _ _ _ 0 192 10 h16 okM17
  have h18 : blkChk C E1.SL_e237.entry UB UBR lits 0 212 = true := blkChk_join _ _ _ _ _ 0 202 10 h17 okM18
  have h19 : blkChk C E1.SL_e237.entry UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 212 12 h18 okM19
  have h20 : blkChk C E1.SL_e237.entry UB UBR lits 0 240 = true := blkChk_join _ _ _ _ _ 0 224 16 h19 okM20
  have h21 : blkChk C E1.SL_e237.entry UB UBR lits 0 253 = true := blkChk_join _ _ _ _ _ 0 240 13 h20 okM21
  have h22 : blkChk C E1.SL_e237.entry UB UBR lits 0 269 = true := blkChk_join _ _ _ _ _ 0 253 16 h21 okM22
  have h23 : blkChk C E1.SL_e237.entry UB UBR lits 0 281 = true := blkChk_join _ _ _ _ _ 0 269 12 h22 okM23
  have h24 : blkChk C E1.SL_e237.entry UB UBR lits 0 292 = true := blkChk_join _ _ _ _ _ 0 281 11 h23 okM24
  have h25 : blkChk C E1.SL_e237.entry UB UBR lits 0 299 = true := blkChk_join _ _ _ _ _ 0 292 7 h24 okM25
  have h26 : blkChk C E1.SL_e237.entry UB UBR lits 0 309 = true := blkChk_join _ _ _ _ _ 0 299 10 h25 okM26
  have h27 : blkChk C E1.SL_e237.entry UB UBR lits 0 317 = true := blkChk_join _ _ _ _ _ 0 309 8 h26 okM27
  have h28 : blkChk C E1.SL_e237.entry UB UBR lits 0 327 = true := blkChk_join _ _ _ _ _ 0 317 10 h27 okM28
  have h29 : blkChk C E1.SL_e237.entry UB UBR lits 0 339 = true := blkChk_join _ _ _ _ _ 0 327 12 h28 okM29
  have h30 : blkChk C E1.SL_e237.entry UB UBR lits 0 347 = true := blkChk_join _ _ _ _ _ 0 339 8 h29 okM30
  have h31 : blkChk C E1.SL_e237.entry UB UBR lits 0 358 = true := blkChk_join _ _ _ _ _ 0 347 11 h30 okM31
  have h32 : blkChk C E1.SL_e237.entry UB UBR lits 0 371 = true := blkChk_join _ _ _ _ _ 0 358 13 h31 okM32
  have h33 : blkChk C E1.SL_e237.entry UB UBR lits 0 377 = true := blkChk_join _ _ _ _ _ 0 371 6 h32 okM33
  have h34 : blkChk C E1.SL_e237.entry UB UBR lits 0 390 = true := blkChk_join _ _ _ _ _ 0 377 13 h33 okM34
  have h35 : blkChk C E1.SL_e237.entry UB UBR lits 0 405 = true := blkChk_join _ _ _ _ _ 0 390 15 h34 okM35
  have h36 : blkChk C E1.SL_e237.entry UB UBR lits 0 415 = true := blkChk_join _ _ _ _ _ 0 405 10 h35 okM36
  have h37 : blkChk C E1.SL_e237.entry UB UBR lits 0 422 = true := blkChk_join _ _ _ _ _ 0 415 7 h36 okM37
  have h38 : blkChk C E1.SL_e237.entry UB UBR lits 0 432 = true := blkChk_join _ _ _ _ _ 0 422 10 h37 okM38
  have h39 : blkChk C E1.SL_e237.entry UB UBR lits 0 437 = true := blkChk_join _ _ _ _ _ 0 432 5 h38 okM39
  have h40 : blkChk C E1.SL_e237.entry UB UBR lits 0 444 = true := blkChk_join _ _ _ _ _ 0 437 7 h39 okM40
  have h41 : blkChk C E1.SL_e237.entry UB UBR lits 0 453 = true := blkChk_join _ _ _ _ _ 0 444 9 h40 okM41
  have h42 : blkChk C E1.SL_e237.entry UB UBR lits 0 462 = true := blkChk_join _ _ _ _ _ 0 453 9 h41 okM42
  have h43 : blkChk C E1.SL_e237.entry UB UBR lits 0 471 = true := blkChk_join _ _ _ _ _ 0 462 9 h42 okM43
  have h44 : blkChk C E1.SL_e237.entry UB UBR lits 0 480 = true := blkChk_join _ _ _ _ _ 0 471 9 h43 okM44
  have h45 : blkChk C E1.SL_e237.entry UB UBR lits 0 492 = true := blkChk_join _ _ _ _ _ 0 480 12 h44 okM45
  have h46 : blkChk C E1.SL_e237.entry UB UBR lits 0 506 = true := blkChk_join _ _ _ _ _ 0 492 14 h45 okM46
  have h47 : blkChk C E1.SL_e237.entry UB UBR lits 0 520 = true := blkChk_join _ _ _ _ _ 0 506 14 h46 okM47
  have h48 : blkChk C E1.SL_e237.entry UB UBR lits 0 531 = true := blkChk_join _ _ _ _ _ 0 520 11 h47 okM48
  have h49 : blkChk C E1.SL_e237.entry UB UBR lits 0 538 = true := blkChk_join _ _ _ _ _ 0 531 7 h48 okM49
  have h50 : blkChk C E1.SL_e237.entry UB UBR lits 0 546 = true := blkChk_join _ _ _ _ _ 0 538 8 h49 okM50
  have h51 : blkChk C E1.SL_e237.entry UB UBR lits 0 555 = true := blkChk_join _ _ _ _ _ 0 546 9 h50 okM51
  have h52 : blkChk C E1.SL_e237.entry UB UBR lits 0 570 = true := blkChk_join _ _ _ _ _ 0 555 15 h51 okM52
  have h53 : blkChk C E1.SL_e237.entry UB UBR lits 0 582 = true := blkChk_join _ _ _ _ _ 0 570 12 h52 okM53
  have h54 : blkChk C E1.SL_e237.entry UB UBR lits 0 589 = true := blkChk_join _ _ _ _ _ 0 582 7 h53 okM54
  have h55 : blkChk C E1.SL_e237.entry UB UBR lits 0 600 = true := blkChk_join _ _ _ _ _ 0 589 11 h54 okM55
  have h56 : blkChk C E1.SL_e237.entry UB UBR lits 0 614 = true := blkChk_join _ _ _ _ _ 0 600 14 h55 okM56
  have h57 : blkChk C E1.SL_e237.entry UB UBR lits 0 630 = true := blkChk_join _ _ _ _ _ 0 614 16 h56 okM57
  have h58 : blkChk C E1.SL_e237.entry UB UBR lits 0 639 = true := blkChk_join _ _ _ _ _ 0 630 9 h57 okM58
  have h59 : blkChk C E1.SL_e237.entry UB UBR lits 0 647 = true := blkChk_join _ _ _ _ _ 0 639 8 h58 okM59
  have h60 : blkChk C E1.SL_e237.entry UB UBR lits 0 654 = true := blkChk_join _ _ _ _ _ 0 647 7 h59 okM60
  have h61 : blkChk C E1.SL_e237.entry UB UBR lits 0 661 = true := blkChk_join _ _ _ _ _ 0 654 7 h60 okM61
  have h62 : blkChk C E1.SL_e237.entry UB UBR lits 0 669 = true := blkChk_join _ _ _ _ _ 0 661 8 h61 okM62
  have h63 : blkChk C E1.SL_e237.entry UB UBR lits 0 677 = true := blkChk_join _ _ _ _ _ 0 669 8 h62 okM63
  have h64 : blkChk C E1.SL_e237.entry UB UBR lits 0 688 = true := blkChk_join _ _ _ _ _ 0 677 11 h63 okM64
  have h65 : blkChk C E1.SL_e237.entry UB UBR lits 0 697 = true := blkChk_join _ _ _ _ _ 0 688 9 h64 okM65
  have h66 : blkChk C E1.SL_e237.entry UB UBR lits 0 706 = true := blkChk_join _ _ _ _ _ 0 697 9 h65 okM66
  have h67 : blkChk C E1.SL_e237.entry UB UBR lits 0 720 = true := blkChk_join _ _ _ _ _ 0 706 14 h66 okM67
  have h68 : blkChk C E1.SL_e237.entry UB UBR lits 0 732 = true := blkChk_join _ _ _ _ _ 0 720 12 h67 okM68
  have h69 : blkChk C E1.SL_e237.entry UB UBR lits 0 741 = true := blkChk_join _ _ _ _ _ 0 732 9 h68 okM69
  have h70 : blkChk C E1.SL_e237.entry UB UBR lits 0 749 = true := blkChk_join _ _ _ _ _ 0 741 8 h69 okM70
  have h71 : blkChk C E1.SL_e237.entry UB UBR lits 0 756 = true := blkChk_join _ _ _ _ _ 0 749 7 h70 okM71
  have h72 : blkChk C E1.SL_e237.entry UB UBR lits 0 765 = true := blkChk_join _ _ _ _ _ 0 756 9 h71 okM72
  have h73 : blkChk C E1.SL_e237.entry UB UBR lits 0 774 = true := blkChk_join _ _ _ _ _ 0 765 9 h72 okM73
  have h74 : blkChk C E1.SL_e237.entry UB UBR lits 0 784 = true := blkChk_join _ _ _ _ _ 0 774 10 h73 okM74
  have h75 : blkChk C E1.SL_e237.entry UB UBR lits 0 795 = true := blkChk_join _ _ _ _ _ 0 784 11 h74 okM75
  have h76 : blkChk C E1.SL_e237.entry UB UBR lits 0 805 = true := blkChk_join _ _ _ _ _ 0 795 10 h75 okM76
  have h77 : blkChk C E1.SL_e237.entry UB UBR lits 0 821 = true := blkChk_join _ _ _ _ _ 0 805 16 h76 okM77
  have h78 : blkChk C E1.SL_e237.entry UB UBR lits 0 829 = true := blkChk_join _ _ _ _ _ 0 821 8 h77 okM78
  have h79 : blkChk C E1.SL_e237.entry UB UBR lits 0 844 = true := blkChk_join _ _ _ _ _ 0 829 15 h78 okM79
  have h80 : blkChk C E1.SL_e237.entry UB UBR lits 0 856 = true := blkChk_join _ _ _ _ _ 0 844 12 h79 okM80
  have h81 : blkChk C E1.SL_e237.entry UB UBR lits 0 864 = true := blkChk_join _ _ _ _ _ 0 856 8 h80 okM81
  have h82 : blkChk C E1.SL_e237.entry UB UBR lits 0 876 = true := blkChk_join _ _ _ _ _ 0 864 12 h81 okM82
  have h83 : blkChk C E1.SL_e237.entry UB UBR lits 0 886 = true := blkChk_join _ _ _ _ _ 0 876 10 h82 okM83
  have h84 : blkChk C E1.SL_e237.entry UB UBR lits 0 894 = true := blkChk_join _ _ _ _ _ 0 886 8 h83 okM84
  have h85 : blkChk C E1.SL_e237.entry UB UBR lits 0 903 = true := blkChk_join _ _ _ _ _ 0 894 9 h84 okM85
  have h86 : blkChk C E1.SL_e237.entry UB UBR lits 0 918 = true := blkChk_join _ _ _ _ _ 0 903 15 h85 okM86
  have h87 : blkChk C E1.SL_e237.entry UB UBR lits 0 927 = true := blkChk_join _ _ _ _ _ 0 918 9 h86 okM87
  have h88 : blkChk C E1.SL_e237.entry UB UBR lits 0 940 = true := blkChk_join _ _ _ _ _ 0 927 13 h87 okM88
  have h89 : blkChk C E1.SL_e237.entry UB UBR lits 0 948 = true := blkChk_join _ _ _ _ _ 0 940 8 h88 okM89
  have h90 : blkChk C E1.SL_e237.entry UB UBR lits 0 956 = true := blkChk_join _ _ _ _ _ 0 948 8 h89 okM90
  have h91 : blkChk C E1.SL_e237.entry UB UBR lits 0 966 = true := blkChk_join _ _ _ _ _ 0 956 10 h90 okM91
  have h92 : blkChk C E1.SL_e237.entry UB UBR lits 0 975 = true := blkChk_join _ _ _ _ _ 0 966 9 h91 okM92
  have h93 : blkChk C E1.SL_e237.entry UB UBR lits 0 987 = true := blkChk_join _ _ _ _ _ 0 975 12 h92 okM93
  have h94 : blkChk C E1.SL_e237.entry UB UBR lits 0 999 = true := blkChk_join _ _ _ _ _ 0 987 12 h93 okM94
  have h95 : blkChk C E1.SL_e237.entry UB UBR lits 0 1008 = true := blkChk_join _ _ _ _ _ 0 999 9 h94 okM95
  have h96 : blkChk C E1.SL_e237.entry UB UBR lits 0 1022 = true := blkChk_join _ _ _ _ _ 0 1008 14 h95 okM96
  have h97 : blkChk C E1.SL_e237.entry UB UBR lits 0 1035 = true := blkChk_join _ _ _ _ _ 0 1022 13 h96 okM97
  have h98 : blkChk C E1.SL_e237.entry UB UBR lits 0 1042 = true := blkChk_join _ _ _ _ _ 0 1035 7 h97 okM98
  have h99 : blkChk C E1.SL_e237.entry UB UBR lits 0 1052 = true := blkChk_join _ _ _ _ _ 0 1042 10 h98 okM99
  have h100 : blkChk C E1.SL_e237.entry UB UBR lits 0 1063 = true := blkChk_join _ _ _ _ _ 0 1052 11 h99 okM100
  have h101 : blkChk C E1.SL_e237.entry UB UBR lits 0 1073 = true := blkChk_join _ _ _ _ _ 0 1063 10 h100 okM101
  have h102 : blkChk C E1.SL_e237.entry UB UBR lits 0 1084 = true := blkChk_join _ _ _ _ _ 0 1073 11 h101 okM102
  have h103 : blkChk C E1.SL_e237.entry UB UBR lits 0 1094 = true := blkChk_join _ _ _ _ _ 0 1084 10 h102 okM103
  have h104 : blkChk C E1.SL_e237.entry UB UBR lits 0 1104 = true := blkChk_join _ _ _ _ _ 0 1094 10 h103 okM104
  have h105 : blkChk C E1.SL_e237.entry UB UBR lits 0 1111 = true := blkChk_join _ _ _ _ _ 0 1104 7 h104 okM105
  have h106 : blkChk C E1.SL_e237.entry UB UBR lits 0 1121 = true := blkChk_join _ _ _ _ _ 0 1111 10 h105 okM106
  have h107 : blkChk C E1.SL_e237.entry UB UBR lits 0 1136 = true := blkChk_join _ _ _ _ _ 0 1121 15 h106 okM107
  have h108 : blkChk C E1.SL_e237.entry UB UBR lits 0 1147 = true := blkChk_join _ _ _ _ _ 0 1136 11 h107 okM108
  have h109 : blkChk C E1.SL_e237.entry UB UBR lits 0 1154 = true := blkChk_join _ _ _ _ _ 0 1147 7 h108 okM109
  have h110 : blkChk C E1.SL_e237.entry UB UBR lits 0 1161 = true := blkChk_join _ _ _ _ _ 0 1154 7 h109 okM110
  have h111 : blkChk C E1.SL_e237.entry UB UBR lits 0 1175 = true := blkChk_join _ _ _ _ _ 0 1161 14 h110 okM111
  have h112 : blkChk C E1.SL_e237.entry UB UBR lits 0 1185 = true := blkChk_join _ _ _ _ _ 0 1175 10 h111 okM112
  have h113 : blkChk C E1.SL_e237.entry UB UBR lits 0 1201 = true := blkChk_join _ _ _ _ _ 0 1185 16 h112 okM113
  have h114 : blkChk C E1.SL_e237.entry UB UBR lits 0 1212 = true := blkChk_join _ _ _ _ _ 0 1201 11 h113 okM114
  have h115 : blkChk C E1.SL_e237.entry UB UBR lits 0 1226 = true := blkChk_join _ _ _ _ _ 0 1212 14 h114 okM115
  have h116 : blkChk C E1.SL_e237.entry UB UBR lits 0 1242 = true := blkChk_join _ _ _ _ _ 0 1226 16 h115 okM116
  have h117 : blkChk C E1.SL_e237.entry UB UBR lits 0 1255 = true := blkChk_join _ _ _ _ _ 0 1242 13 h116 okM117
  have h118 : blkChk C E1.SL_e237.entry UB UBR lits 0 1270 = true := blkChk_join _ _ _ _ _ 0 1255 15 h117 okM118
  have h119 : blkChk C E1.SL_e237.entry UB UBR lits 0 1285 = true := blkChk_join _ _ _ _ _ 0 1270 15 h118 okM119
  have h120 : blkChk C E1.SL_e237.entry UB UBR lits 0 1293 = true := blkChk_join _ _ _ _ _ 0 1285 8 h119 okM120
  have h121 : blkChk C E1.SL_e237.entry UB UBR lits 0 1308 = true := blkChk_join _ _ _ _ _ 0 1293 15 h120 okM121
  have h122 : blkChk C E1.SL_e237.entry UB UBR lits 0 1320 = true := blkChk_join _ _ _ _ _ 0 1308 12 h121 okM122
  have h123 : blkChk C E1.SL_e237.entry UB UBR lits 0 1336 = true := blkChk_join _ _ _ _ _ 0 1320 16 h122 okM123
  have h124 : blkChk C E1.SL_e237.entry UB UBR lits 0 1352 = true := blkChk_join _ _ _ _ _ 0 1336 16 h123 okM124
  have h125 : blkChk C E1.SL_e237.entry UB UBR lits 0 1366 = true := blkChk_join _ _ _ _ _ 0 1352 14 h124 okM125
  have h126 : blkChk C E1.SL_e237.entry UB UBR lits 0 1382 = true := blkChk_join _ _ _ _ _ 0 1366 16 h125 okM126
  have h127 : blkChk C E1.SL_e237.entry UB UBR lits 0 1396 = true := blkChk_join _ _ _ _ _ 0 1382 14 h126 okM127
  have h128 : blkChk C E1.SL_e237.entry UB UBR lits 0 1402 = true := blkChk_join _ _ _ _ _ 0 1396 6 h127 okM128
  have h129 : blkChk C E1.SL_e237.entry UB UBR lits 0 1418 = true := blkChk_join _ _ _ _ _ 0 1402 16 h128 okM129
  have h130 : blkChk C E1.SL_e237.entry UB UBR lits 0 1430 = true := blkChk_join _ _ _ _ _ 0 1418 12 h129 okM130
  have h131 : blkChk C E1.SL_e237.entry UB UBR lits 0 1441 = true := blkChk_join _ _ _ _ _ 0 1430 11 h130 okM131
  have h132 : blkChk C E1.SL_e237.entry UB UBR lits 0 1455 = true := blkChk_join _ _ _ _ _ 0 1441 14 h131 okM132
  have h133 : blkChk C E1.SL_e237.entry UB UBR lits 0 1469 = true := blkChk_join _ _ _ _ _ 0 1455 14 h132 okM133
  have h134 : blkChk C E1.SL_e237.entry UB UBR lits 0 1476 = true := blkChk_join _ _ _ _ _ 0 1469 7 h133 okM134
  have h135 : blkChk C E1.SL_e237.entry UB UBR lits 0 1488 = true := blkChk_join _ _ _ _ _ 0 1476 12 h134 okM135
  have h136 : blkChk C E1.SL_e237.entry UB UBR lits 0 1499 = true := blkChk_join _ _ _ _ _ 0 1488 11 h135 okM136
  have h137 : blkChk C E1.SL_e237.entry UB UBR lits 0 1502 = true := blkChk_join _ _ _ _ _ 0 1499 3 h136 okM137
  exact h137
theorem len : lits.length = 1502 := by decide
theorem okGAll : glueChkR lits W 0 1502 = true := by
  have g0 : glueChkR lits W 0 11 = true := okG0
  have g1 : glueChkR lits W 0 22 = true := glueChkR_join _ _ 0 11 11 g0 okG1
  have g2 : glueChkR lits W 0 35 = true := glueChkR_join _ _ 0 22 13 g1 okG2
  have g3 : glueChkR lits W 0 44 = true := glueChkR_join _ _ 0 35 9 g2 okG3
  have g4 : glueChkR lits W 0 57 = true := glueChkR_join _ _ 0 44 13 g3 okG4
  have g5 : glueChkR lits W 0 68 = true := glueChkR_join _ _ 0 57 11 g4 okG5
  have g6 : glueChkR lits W 0 76 = true := glueChkR_join _ _ 0 68 8 g5 okG6
  have g7 : glueChkR lits W 0 86 = true := glueChkR_join _ _ 0 76 10 g6 okG7
  have g8 : glueChkR lits W 0 94 = true := glueChkR_join _ _ 0 86 8 g7 okG8
  have g9 : glueChkR lits W 0 107 = true := glueChkR_join _ _ 0 94 13 g8 okG9
  have g10 : glueChkR lits W 0 120 = true := glueChkR_join _ _ 0 107 13 g9 okG10
  have g11 : glueChkR lits W 0 134 = true := glueChkR_join _ _ 0 120 14 g10 okG11
  have g12 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 134 15 g11 okG12
  have g13 : glueChkR lits W 0 158 = true := glueChkR_join _ _ 0 149 9 g12 okG13
  have g14 : glueChkR lits W 0 170 = true := glueChkR_join _ _ 0 158 12 g13 okG14
  have g15 : glueChkR lits W 0 183 = true := glueChkR_join _ _ 0 170 13 g14 okG15
  have g16 : glueChkR lits W 0 192 = true := glueChkR_join _ _ 0 183 9 g15 okG16
  have g17 : glueChkR lits W 0 202 = true := glueChkR_join _ _ 0 192 10 g16 okG17
  have g18 : glueChkR lits W 0 212 = true := glueChkR_join _ _ 0 202 10 g17 okG18
  have g19 : glueChkR lits W 0 224 = true := glueChkR_join _ _ 0 212 12 g18 okG19
  have g20 : glueChkR lits W 0 240 = true := glueChkR_join _ _ 0 224 16 g19 okG20
  have g21 : glueChkR lits W 0 253 = true := glueChkR_join _ _ 0 240 13 g20 okG21
  have g22 : glueChkR lits W 0 269 = true := glueChkR_join _ _ 0 253 16 g21 okG22
  have g23 : glueChkR lits W 0 281 = true := glueChkR_join _ _ 0 269 12 g22 okG23
  have g24 : glueChkR lits W 0 292 = true := glueChkR_join _ _ 0 281 11 g23 okG24
  have g25 : glueChkR lits W 0 299 = true := glueChkR_join _ _ 0 292 7 g24 okG25
  have g26 : glueChkR lits W 0 309 = true := glueChkR_join _ _ 0 299 10 g25 okG26
  have g27 : glueChkR lits W 0 317 = true := glueChkR_join _ _ 0 309 8 g26 okG27
  have g28 : glueChkR lits W 0 327 = true := glueChkR_join _ _ 0 317 10 g27 okG28
  have g29 : glueChkR lits W 0 339 = true := glueChkR_join _ _ 0 327 12 g28 okG29
  have g30 : glueChkR lits W 0 347 = true := glueChkR_join _ _ 0 339 8 g29 okG30
  have g31 : glueChkR lits W 0 358 = true := glueChkR_join _ _ 0 347 11 g30 okG31
  have g32 : glueChkR lits W 0 371 = true := glueChkR_join _ _ 0 358 13 g31 okG32
  have g33 : glueChkR lits W 0 377 = true := glueChkR_join _ _ 0 371 6 g32 okG33
  have g34 : glueChkR lits W 0 390 = true := glueChkR_join _ _ 0 377 13 g33 okG34
  have g35 : glueChkR lits W 0 405 = true := glueChkR_join _ _ 0 390 15 g34 okG35
  have g36 : glueChkR lits W 0 415 = true := glueChkR_join _ _ 0 405 10 g35 okG36
  have g37 : glueChkR lits W 0 422 = true := glueChkR_join _ _ 0 415 7 g36 okG37
  have g38 : glueChkR lits W 0 432 = true := glueChkR_join _ _ 0 422 10 g37 okG38
  have g39 : glueChkR lits W 0 437 = true := glueChkR_join _ _ 0 432 5 g38 okG39
  have g40 : glueChkR lits W 0 444 = true := glueChkR_join _ _ 0 437 7 g39 okG40
  have g41 : glueChkR lits W 0 453 = true := glueChkR_join _ _ 0 444 9 g40 okG41
  have g42 : glueChkR lits W 0 462 = true := glueChkR_join _ _ 0 453 9 g41 okG42
  have g43 : glueChkR lits W 0 471 = true := glueChkR_join _ _ 0 462 9 g42 okG43
  have g44 : glueChkR lits W 0 480 = true := glueChkR_join _ _ 0 471 9 g43 okG44
  have g45 : glueChkR lits W 0 492 = true := glueChkR_join _ _ 0 480 12 g44 okG45
  have g46 : glueChkR lits W 0 506 = true := glueChkR_join _ _ 0 492 14 g45 okG46
  have g47 : glueChkR lits W 0 520 = true := glueChkR_join _ _ 0 506 14 g46 okG47
  have g48 : glueChkR lits W 0 531 = true := glueChkR_join _ _ 0 520 11 g47 okG48
  have g49 : glueChkR lits W 0 538 = true := glueChkR_join _ _ 0 531 7 g48 okG49
  have g50 : glueChkR lits W 0 546 = true := glueChkR_join _ _ 0 538 8 g49 okG50
  have g51 : glueChkR lits W 0 555 = true := glueChkR_join _ _ 0 546 9 g50 okG51
  have g52 : glueChkR lits W 0 570 = true := glueChkR_join _ _ 0 555 15 g51 okG52
  have g53 : glueChkR lits W 0 582 = true := glueChkR_join _ _ 0 570 12 g52 okG53
  have g54 : glueChkR lits W 0 589 = true := glueChkR_join _ _ 0 582 7 g53 okG54
  have g55 : glueChkR lits W 0 600 = true := glueChkR_join _ _ 0 589 11 g54 okG55
  have g56 : glueChkR lits W 0 614 = true := glueChkR_join _ _ 0 600 14 g55 okG56
  have g57 : glueChkR lits W 0 630 = true := glueChkR_join _ _ 0 614 16 g56 okG57
  have g58 : glueChkR lits W 0 639 = true := glueChkR_join _ _ 0 630 9 g57 okG58
  have g59 : glueChkR lits W 0 647 = true := glueChkR_join _ _ 0 639 8 g58 okG59
  have g60 : glueChkR lits W 0 654 = true := glueChkR_join _ _ 0 647 7 g59 okG60
  have g61 : glueChkR lits W 0 661 = true := glueChkR_join _ _ 0 654 7 g60 okG61
  have g62 : glueChkR lits W 0 669 = true := glueChkR_join _ _ 0 661 8 g61 okG62
  have g63 : glueChkR lits W 0 677 = true := glueChkR_join _ _ 0 669 8 g62 okG63
  have g64 : glueChkR lits W 0 688 = true := glueChkR_join _ _ 0 677 11 g63 okG64
  have g65 : glueChkR lits W 0 697 = true := glueChkR_join _ _ 0 688 9 g64 okG65
  have g66 : glueChkR lits W 0 706 = true := glueChkR_join _ _ 0 697 9 g65 okG66
  have g67 : glueChkR lits W 0 720 = true := glueChkR_join _ _ 0 706 14 g66 okG67
  have g68 : glueChkR lits W 0 732 = true := glueChkR_join _ _ 0 720 12 g67 okG68
  have g69 : glueChkR lits W 0 741 = true := glueChkR_join _ _ 0 732 9 g68 okG69
  have g70 : glueChkR lits W 0 749 = true := glueChkR_join _ _ 0 741 8 g69 okG70
  have g71 : glueChkR lits W 0 756 = true := glueChkR_join _ _ 0 749 7 g70 okG71
  have g72 : glueChkR lits W 0 765 = true := glueChkR_join _ _ 0 756 9 g71 okG72
  have g73 : glueChkR lits W 0 774 = true := glueChkR_join _ _ 0 765 9 g72 okG73
  have g74 : glueChkR lits W 0 784 = true := glueChkR_join _ _ 0 774 10 g73 okG74
  have g75 : glueChkR lits W 0 795 = true := glueChkR_join _ _ 0 784 11 g74 okG75
  have g76 : glueChkR lits W 0 805 = true := glueChkR_join _ _ 0 795 10 g75 okG76
  have g77 : glueChkR lits W 0 821 = true := glueChkR_join _ _ 0 805 16 g76 okG77
  have g78 : glueChkR lits W 0 829 = true := glueChkR_join _ _ 0 821 8 g77 okG78
  have g79 : glueChkR lits W 0 844 = true := glueChkR_join _ _ 0 829 15 g78 okG79
  have g80 : glueChkR lits W 0 856 = true := glueChkR_join _ _ 0 844 12 g79 okG80
  have g81 : glueChkR lits W 0 864 = true := glueChkR_join _ _ 0 856 8 g80 okG81
  have g82 : glueChkR lits W 0 876 = true := glueChkR_join _ _ 0 864 12 g81 okG82
  have g83 : glueChkR lits W 0 886 = true := glueChkR_join _ _ 0 876 10 g82 okG83
  have g84 : glueChkR lits W 0 894 = true := glueChkR_join _ _ 0 886 8 g83 okG84
  have g85 : glueChkR lits W 0 903 = true := glueChkR_join _ _ 0 894 9 g84 okG85
  have g86 : glueChkR lits W 0 918 = true := glueChkR_join _ _ 0 903 15 g85 okG86
  have g87 : glueChkR lits W 0 927 = true := glueChkR_join _ _ 0 918 9 g86 okG87
  have g88 : glueChkR lits W 0 940 = true := glueChkR_join _ _ 0 927 13 g87 okG88
  have g89 : glueChkR lits W 0 948 = true := glueChkR_join _ _ 0 940 8 g88 okG89
  have g90 : glueChkR lits W 0 956 = true := glueChkR_join _ _ 0 948 8 g89 okG90
  have g91 : glueChkR lits W 0 966 = true := glueChkR_join _ _ 0 956 10 g90 okG91
  have g92 : glueChkR lits W 0 975 = true := glueChkR_join _ _ 0 966 9 g91 okG92
  have g93 : glueChkR lits W 0 987 = true := glueChkR_join _ _ 0 975 12 g92 okG93
  have g94 : glueChkR lits W 0 999 = true := glueChkR_join _ _ 0 987 12 g93 okG94
  have g95 : glueChkR lits W 0 1008 = true := glueChkR_join _ _ 0 999 9 g94 okG95
  have g96 : glueChkR lits W 0 1022 = true := glueChkR_join _ _ 0 1008 14 g95 okG96
  have g97 : glueChkR lits W 0 1035 = true := glueChkR_join _ _ 0 1022 13 g96 okG97
  have g98 : glueChkR lits W 0 1042 = true := glueChkR_join _ _ 0 1035 7 g97 okG98
  have g99 : glueChkR lits W 0 1052 = true := glueChkR_join _ _ 0 1042 10 g98 okG99
  have g100 : glueChkR lits W 0 1063 = true := glueChkR_join _ _ 0 1052 11 g99 okG100
  have g101 : glueChkR lits W 0 1073 = true := glueChkR_join _ _ 0 1063 10 g100 okG101
  have g102 : glueChkR lits W 0 1084 = true := glueChkR_join _ _ 0 1073 11 g101 okG102
  have g103 : glueChkR lits W 0 1094 = true := glueChkR_join _ _ 0 1084 10 g102 okG103
  have g104 : glueChkR lits W 0 1104 = true := glueChkR_join _ _ 0 1094 10 g103 okG104
  have g105 : glueChkR lits W 0 1111 = true := glueChkR_join _ _ 0 1104 7 g104 okG105
  have g106 : glueChkR lits W 0 1121 = true := glueChkR_join _ _ 0 1111 10 g105 okG106
  have g107 : glueChkR lits W 0 1136 = true := glueChkR_join _ _ 0 1121 15 g106 okG107
  have g108 : glueChkR lits W 0 1147 = true := glueChkR_join _ _ 0 1136 11 g107 okG108
  have g109 : glueChkR lits W 0 1154 = true := glueChkR_join _ _ 0 1147 7 g108 okG109
  have g110 : glueChkR lits W 0 1161 = true := glueChkR_join _ _ 0 1154 7 g109 okG110
  have g111 : glueChkR lits W 0 1175 = true := glueChkR_join _ _ 0 1161 14 g110 okG111
  have g112 : glueChkR lits W 0 1185 = true := glueChkR_join _ _ 0 1175 10 g111 okG112
  have g113 : glueChkR lits W 0 1201 = true := glueChkR_join _ _ 0 1185 16 g112 okG113
  have g114 : glueChkR lits W 0 1212 = true := glueChkR_join _ _ 0 1201 11 g113 okG114
  have g115 : glueChkR lits W 0 1226 = true := glueChkR_join _ _ 0 1212 14 g114 okG115
  have g116 : glueChkR lits W 0 1242 = true := glueChkR_join _ _ 0 1226 16 g115 okG116
  have g117 : glueChkR lits W 0 1255 = true := glueChkR_join _ _ 0 1242 13 g116 okG117
  have g118 : glueChkR lits W 0 1270 = true := glueChkR_join _ _ 0 1255 15 g117 okG118
  have g119 : glueChkR lits W 0 1285 = true := glueChkR_join _ _ 0 1270 15 g118 okG119
  have g120 : glueChkR lits W 0 1293 = true := glueChkR_join _ _ 0 1285 8 g119 okG120
  have g121 : glueChkR lits W 0 1308 = true := glueChkR_join _ _ 0 1293 15 g120 okG121
  have g122 : glueChkR lits W 0 1320 = true := glueChkR_join _ _ 0 1308 12 g121 okG122
  have g123 : glueChkR lits W 0 1336 = true := glueChkR_join _ _ 0 1320 16 g122 okG123
  have g124 : glueChkR lits W 0 1352 = true := glueChkR_join _ _ 0 1336 16 g123 okG124
  have g125 : glueChkR lits W 0 1366 = true := glueChkR_join _ _ 0 1352 14 g124 okG125
  have g126 : glueChkR lits W 0 1382 = true := glueChkR_join _ _ 0 1366 16 g125 okG126
  have g127 : glueChkR lits W 0 1396 = true := glueChkR_join _ _ 0 1382 14 g126 okG127
  have g128 : glueChkR lits W 0 1402 = true := glueChkR_join _ _ 0 1396 6 g127 okG128
  have g129 : glueChkR lits W 0 1418 = true := glueChkR_join _ _ 0 1402 16 g128 okG129
  have g130 : glueChkR lits W 0 1430 = true := glueChkR_join _ _ 0 1418 12 g129 okG130
  have g131 : glueChkR lits W 0 1441 = true := glueChkR_join _ _ 0 1430 11 g130 okG131
  have g132 : glueChkR lits W 0 1455 = true := glueChkR_join _ _ 0 1441 14 g131 okG132
  have g133 : glueChkR lits W 0 1469 = true := glueChkR_join _ _ 0 1455 14 g132 okG133
  have g134 : glueChkR lits W 0 1476 = true := glueChkR_join _ _ 0 1469 7 g133 okG134
  have g135 : glueChkR lits W 0 1488 = true := glueChkR_join _ _ 0 1476 12 g134 okG135
  have g136 : glueChkR lits W 0 1499 = true := glueChkR_join _ _ 0 1488 11 g135 okG136
  have g137 : glueChkR lits W 0 1502 = true := glueChkR_join _ _ 0 1499 3 g136 okG137
  exact g137
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e237.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e237.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e237.UB_eq E1.OK_e237.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C237X
