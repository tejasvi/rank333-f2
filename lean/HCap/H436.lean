module
public import R22Port.U_d41d8cd98f00
public import HCap.H436_B0
public import HCap.H436_B1
public import HCap.H436_B2
public import HCap.H436_B3
public import HCap.H436_B4
public import HCap.H436_B5
public import HCap.H436_B6
public import HCap.H436_B7
public import HCap.H436_B8
public import HCap.H436_B9
public import HCap.H436_B10
public import HCap.H436_B11
public import HCap.H436_B12
public import HCap.H436_B13
public import HCap.H436_B14
public import HCap.H436_B15
public import HCap.H436_B16
public import HCap.H436_B17
public import HCap.H436_B18
public import HCap.H436_B19
public import HCap.H436_B20
public import HCap.H436_B21
public import HCap.H436_B22
public import HCap.H436_B23
public import HCap.H436_B24
public import HCap.H436_B25
public import HCap.H436_B26
public import HCap.H436_B27
public import HCap.H436_B28
public import HCap.H436_B29
public import HCap.H436_B30
public import HCap.H436_B31
public import HCap.H436_B32
public import HCap.H436_B33
public import HCap.H436_B34
public import HCap.H436_B35
public import HCap.H436_B36
public import HCap.H436_B37
public import HCap.H436_B38
public import HCap.H436_B39
public import HCap.H436_B40
public import HCap.H436_B41
public import HCap.H436_B42
public import HCap.H436_B43
public import HCap.H436_B44
public import HCap.H436_B45
public import HCap.H436_B46
public import HCap.H436_B47
public import HCap.H436_B48
public import HCap.H436_B49
public import HCap.H436_B50
public import HCap.H436_B51
public import HCap.H436_B52
public import HCap.H436_B53
public import HCap.H436_B54
public import HCap.H436_B55
public import HCap.H436_B56
public import HCap.H436_B57
public import HCap.H436_B58
public import HCap.H436_B59
public import HCap.H436_B60
public import HCap.H436_B61
public import HCap.H436_B62
public import HCap.H436_B63
public import HCap.H436_B64
public import HCap.H436_B65
public import HCap.H436_B66
public import HCap.H436_B67
public import HCap.H436_B68
public import HCap.H436_B69
public import HCap.H436_B70
public import HCap.H436_B71
public import HCap.H436_B72
public import HCap.H436_B73
public import HCap.H436_B74
public import HCap.H436_B75
public import HCap.H436_B76
public import HCap.H436_B77
public import HCap.H436_B78
public import HCap.H436_B79
public import HCap.H436_B80
public import HCap.H436_B81
public import HCap.H436_B82
public import HCap.H436_B83
public import HCap.H436_B84
public import HCap.H436_B85
public import HCap.H436_B86
public import HCap.H436_B87
public import HCap.H436_B88
public import HCap.H436_B89
public import HCap.H436_B90
public import HCap.H436_B91
public import HCap.H436_B92
public import HCap.H436_B93
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1G chain `H436`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1G.H436
open E1GS E1G.IP_h436
def W : List (List Nat) := [[1, 312, 365], [2, 263], [3, 106, 256], [4, 101], [5, 71], [6, 68], [7, 45, 67], [8, 43], [9, 29, 33, 40], [10, 15, 26], [11, 14], [12], [13], [], [], [16, 20, 22, 24], [17, 19], [18], [], [], [21], [], [23], [], [25], [], [27], [28], [], [30, 32], [31], [], [], [34, 36, 38, 39], [35], [], [37], [], [], [], [41, 42], [], [], [44], [], [46, 58, 60, 64, 66], [47, 50, 57], [48], [49], [], [51, 56], [52, 53, 54], [], [], [55], [], [], [], [59], [], [61, 63], [62], [], [], [65], [], [], [], [69], [70], [], [72, 90, 99], [73, 87], [74, 86], [75, 77, 82], [76], [], [78, 80], [79], [], [81], [], [83, 85], [84], [], [], [], [88], [89], [], [91], [92, 93, 96, 97], [], [94], [95], [], [], [98], [], [100], [], [102], [103], [104], [105], [], [107, 205, 254], [108, 195], [109, 158, 191, 194], [110, 151, 155], [111, 130, 142, 150], [112, 121], [113], [114, 118, 119, 120], [115, 117], [116], [], [], [], [], [], [122, 126, 127, 129], [123, 125], [124], [], [], [], [128], [], [], [131, 140], [132, 136, 138, 139], [133, 135], [134], [], [], [137], [], [], [], [141], [], [143, 147, 149], [144], [145, 146], [], [], [148], [], [], [], [152], [153], [154], [], [156], [157], [], [159, 175, 186, 189], [160, 168, 174], [161, 167], [162, 166], [163, 164, 165], [], [], [], [], [], [169], [170, 172, 173], [171], [], [], [], [], [176, 181, 184], [177, 180], [178], [179], [], [], [182], [183], [], [185], [], [187], [188], [], [190], [], [192], [193], [], [], [196, 203], [197, 200], [198], [199], [], [201], [202], [], [204], [], [206, 238, 251], [207, 228, 237], [208, 221, 225, 227], [209, 215, 219], [210, 214], [211, 213], [212], [], [], [], [216, 218], [217], [], [], [220], [], [222, 224], [223], [], [], [226], [], [], [229, 234], [230, 233], [231, 232], [], [], [], [235], [236], [], [], [239, 249], [240, 245, 248], [241, 243, 244], [242], [], [], [], [246], [247], [], [], [250], [], [252], [253], [], [255], [], [257, 261], [258], [259], [260], [], [262], [], [264, 301, 311], [265, 297], [266, 285, 295], [267, 282], [268, 276, 281], [269, 273], [270], [271], [272], [], [274], [275], [], [277], [278, 280], [279], [], [], [], [283], [284], [], [286, 292], [287, 290], [288], [289], [], [291], [], [293], [294], [], [296], [], [298, 299], [], [300], [], [302, 310], [303, 307, 309], [304, 305], [], [306], [], [308], [], [], [], [], [313, 332], [314], [315, 328], [316], [317, 324], [318], [319, 323], [320], [321], [322], [], [], [325], [326], [327], [], [329], [330], [331], [], [333, 360], [334, 359], [335, 350], [336, 349], [337, 344, 347], [338, 341], [339], [340], [], [342], [343], [], [345], [346], [], [348], [], [], [351, 357], [352, 355], [353], [354], [], [356], [], [358], [], [], [361], [362, 364], [363], [], [], [366, 374], [367], [368, 373], [369], [370, 371], [], [372], [], [], [375], []]
theorem okAll : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 376 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 4 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 4 4 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 12 = true := blkChk_join _ _ _ _ _ 0 8 4 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 12 4 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 20 = true := blkChk_join _ _ _ _ _ 0 16 4 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 20 4 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 24 4 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 28 4 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 32 4 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 36 4 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 40 4 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 44 4 h10 okB11
  have h12 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 48 4 h11 okB12
  have h13 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 52 4 h12 okB13
  have h14 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 60 = true := blkChk_join _ _ _ _ _ 0 56 4 h13 okB14
  have h15 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 60 4 h14 okB15
  have h16 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 64 4 h15 okB16
  have h17 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 68 4 h16 okB17
  have h18 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 76 = true := blkChk_join _ _ _ _ _ 0 72 4 h17 okB18
  have h19 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 76 4 h18 okB19
  have h20 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 80 4 h19 okB20
  have h21 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 84 4 h20 okB21
  have h22 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 92 = true := blkChk_join _ _ _ _ _ 0 88 4 h21 okB22
  have h23 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 92 4 h22 okB23
  have h24 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 100 = true := blkChk_join _ _ _ _ _ 0 96 4 h23 okB24
  have h25 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 100 4 h24 okB25
  have h26 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 108 = true := blkChk_join _ _ _ _ _ 0 104 4 h25 okB26
  have h27 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 108 4 h26 okB27
  have h28 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 112 4 h27 okB28
  have h29 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 116 4 h28 okB29
  have h30 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 124 = true := blkChk_join _ _ _ _ _ 0 120 4 h29 okB30
  have h31 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 124 4 h30 okB31
  have h32 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 132 = true := blkChk_join _ _ _ _ _ 0 128 4 h31 okB32
  have h33 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 132 4 h32 okB33
  have h34 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 140 = true := blkChk_join _ _ _ _ _ 0 136 4 h33 okB34
  have h35 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 140 4 h34 okB35
  have h36 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 148 = true := blkChk_join _ _ _ _ _ 0 144 4 h35 okB36
  have h37 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 148 4 h36 okB37
  have h38 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 152 4 h37 okB38
  have h39 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 156 4 h38 okB39
  have h40 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 164 = true := blkChk_join _ _ _ _ _ 0 160 4 h39 okB40
  have h41 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 164 4 h40 okB41
  have h42 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 172 = true := blkChk_join _ _ _ _ _ 0 168 4 h41 okB42
  have h43 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 172 4 h42 okB43
  have h44 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 180 = true := blkChk_join _ _ _ _ _ 0 176 4 h43 okB44
  have h45 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 184 = true := blkChk_join _ _ _ _ _ 0 180 4 h44 okB45
  have h46 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 184 4 h45 okB46
  have h47 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 188 4 h46 okB47
  have h48 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 196 = true := blkChk_join _ _ _ _ _ 0 192 4 h47 okB48
  have h49 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 200 = true := blkChk_join _ _ _ _ _ 0 196 4 h48 okB49
  have h50 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 204 = true := blkChk_join _ _ _ _ _ 0 200 4 h49 okB50
  have h51 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 204 4 h50 okB51
  have h52 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 212 = true := blkChk_join _ _ _ _ _ 0 208 4 h51 okB52
  have h53 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 216 = true := blkChk_join _ _ _ _ _ 0 212 4 h52 okB53
  have h54 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 220 = true := blkChk_join _ _ _ _ _ 0 216 4 h53 okB54
  have h55 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 220 4 h54 okB55
  have h56 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 228 = true := blkChk_join _ _ _ _ _ 0 224 4 h55 okB56
  have h57 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 232 = true := blkChk_join _ _ _ _ _ 0 228 4 h56 okB57
  have h58 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 236 = true := blkChk_join _ _ _ _ _ 0 232 4 h57 okB58
  have h59 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 240 = true := blkChk_join _ _ _ _ _ 0 236 4 h58 okB59
  have h60 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 244 = true := blkChk_join _ _ _ _ _ 0 240 4 h59 okB60
  have h61 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 248 = true := blkChk_join _ _ _ _ _ 0 244 4 h60 okB61
  have h62 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 252 = true := blkChk_join _ _ _ _ _ 0 248 4 h61 okB62
  have h63 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 256 = true := blkChk_join _ _ _ _ _ 0 252 4 h62 okB63
  have h64 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 260 = true := blkChk_join _ _ _ _ _ 0 256 4 h63 okB64
  have h65 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 264 = true := blkChk_join _ _ _ _ _ 0 260 4 h64 okB65
  have h66 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 268 = true := blkChk_join _ _ _ _ _ 0 264 4 h65 okB66
  have h67 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 268 4 h66 okB67
  have h68 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 276 = true := blkChk_join _ _ _ _ _ 0 272 4 h67 okB68
  have h69 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 280 = true := blkChk_join _ _ _ _ _ 0 276 4 h68 okB69
  have h70 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 284 = true := blkChk_join _ _ _ _ _ 0 280 4 h69 okB70
  have h71 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 288 = true := blkChk_join _ _ _ _ _ 0 284 4 h70 okB71
  have h72 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 292 = true := blkChk_join _ _ _ _ _ 0 288 4 h71 okB72
  have h73 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 296 = true := blkChk_join _ _ _ _ _ 0 292 4 h72 okB73
  have h74 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 300 = true := blkChk_join _ _ _ _ _ 0 296 4 h73 okB74
  have h75 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 300 4 h74 okB75
  have h76 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 308 = true := blkChk_join _ _ _ _ _ 0 304 4 h75 okB76
  have h77 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 312 = true := blkChk_join _ _ _ _ _ 0 308 4 h76 okB77
  have h78 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 316 = true := blkChk_join _ _ _ _ _ 0 312 4 h77 okB78
  have h79 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 320 = true := blkChk_join _ _ _ _ _ 0 316 4 h78 okB79
  have h80 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 324 = true := blkChk_join _ _ _ _ _ 0 320 4 h79 okB80
  have h81 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 328 = true := blkChk_join _ _ _ _ _ 0 324 4 h80 okB81
  have h82 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 332 = true := blkChk_join _ _ _ _ _ 0 328 4 h81 okB82
  have h83 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 336 = true := blkChk_join _ _ _ _ _ 0 332 4 h82 okB83
  have h84 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 340 = true := blkChk_join _ _ _ _ _ 0 336 4 h83 okB84
  have h85 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 344 = true := blkChk_join _ _ _ _ _ 0 340 4 h84 okB85
  have h86 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 348 = true := blkChk_join _ _ _ _ _ 0 344 4 h85 okB86
  have h87 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 352 = true := blkChk_join _ _ _ _ _ 0 348 4 h86 okB87
  have h88 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 356 = true := blkChk_join _ _ _ _ _ 0 352 4 h87 okB88
  have h89 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 360 = true := blkChk_join _ _ _ _ _ 0 356 4 h88 okB89
  have h90 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 364 = true := blkChk_join _ _ _ _ _ 0 360 4 h89 okB90
  have h91 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 368 = true := blkChk_join _ _ _ _ _ 0 364 4 h90 okB91
  have h92 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 372 = true := blkChk_join _ _ _ _ _ 0 368 4 h91 okB92
  have h93 : blkChk C (E1G.slc E1G.SL_h436.chunk) UB UBR lits 0 376 = true := blkChk_join _ _ _ _ _ 0 372 4 h92 okB93
  exact h93
theorem len : lits.length = 376 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h436.chunk) i))
    (hxub : ∀ l < 127, x l ≤ E1G.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1G.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1G.slc E1G.SL_h436.chunk) UB UBR (fun l => E1G.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1G.H436
