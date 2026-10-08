module
public import R22Port.U_d41d8cd98f00
public import E1P.J582K_B0
public import E1P.J582K_B1
public import E1P.J582K_B2
public import E1P.J582K_B3
public import E1P.J582K_B4
public import E1P.J582K_B5
public import E1P.J582K_B6
public import E1P.J582K_B7
public import E1P.J582K_B8
public import E1P.J582K_B9
public import E1P.J582K_B10
public import E1P.J582K_B11
public import E1P.J582K_B12
public import E1P.J582K_B13
public import E1P.J582K_B14
public import E1P.J582K_B15
public import E1P.J582K_B16
public import E1P.J582K_B17
public import E1P.J582K_B18
public import E1P.J582K_B19
public import E1P.J582K_B20
public import E1P.J582K_B21
public import E1P.J582K_B22
public import E1P.J582K_B23
public import E1P.J582K_B24
public import E1P.J582K_B25
public import E1P.J582K_B26
public import E1P.J582K_B27
public import E1P.J582K_B28
public import E1P.J582K_B29
public import E1P.J582K_B30
public import E1P.J582K_B31
public import E1P.J582K_B32
public import E1P.J582K_B33
public import E1P.J582K_B34
public import E1P.J582K_B35
public import E1P.J582K_B36
public import E1P.J582K_B37
public import E1P.J582K_B38
public import E1P.J582K_B39
public import E1P.J582K_B40
public import E1P.J582K_B41
public import E1P.J582K_B42
public import E1P.J582K_B43
public import E1P.J582K_B44
public import E1P.J582K_B45
public import E1P.J582K_B46
public import E1P.J582K_B47
public import E1P.J582K_B48
public import E1P.J582K_B49
public import E1P.J582K_B50
public import E1P.J582K_B51
public import E1P.J582K_B52
public import E1P.J582K_B53
public import E1P.J582K_B54
public import E1P.J582K_B55
public import E1P.J582K_B56
public import E1P.J582K_B57
public import E1P.J582K_B58
public import E1P.J582K_B59
public import E1P.J582K_B60
public import E1P.J582K_B61
public import E1P.J582K_B62
public import E1P.J582K_B63
public import E1P.J582K_B64
public import E1P.J582K_B65
public import E1P.J582K_B66
public import E1P.J582K_B67
public import E1P.J582K_B68
public import E1P.J582K_B69
public import E1P.J582K_B70
public import E1P.J582K_B71
public import E1P.J582K_B72
public import E1P.J582K_B73
public import E1P.J582K_B74
public import E1P.J582K_B75
public import E1P.J582K_B76
public import E1P.J582K_B77
public import E1P.J582K_B78
public import E1P.J582K_B79
public import E1P.J582K_B80
public import E1P.J582K_B81
public import E1P.J582K_B82
public import E1P.J582K_B83
public import E1P.J582K_B84
public import E1P.J582K_B85
public import E1P.J582K_B86
public import E1P.J582K_B87
public import E1P.J582K_B88
public import E1P.J582K_B89
public import E1P.J582K_B90
public import E1P.J582K_B91
public import E1P.J582K_B92
public import E1P.J582K_B93
public import E1P.J582K_B94
public import E1P.J582K_B95
public import E1P.J582K_B96
public import E1P.J582K_B97
public import E1P.J582K_B98
public import E1P.J582K_B99
public import E1P.J582K_B100
public import E1P.J582K_B101
public import E1P.J582K_B102
public import E1P.J582K_B103
public import E1P.J582K_B104
public import E1P.J582K_B105
public import E1P.J582K_B106
public import E1P.J582K_B107
public import E1P.J582K_B108
public import E1P.J582K_B109
public import E1P.J582K_B110
public import E1P.J582K_B111
public import E1P.J582K_B112
public import E1P.J582K_B113
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1P chain `J582K`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1P.J582K
open E1PS E1P.IP_pt
def W : List (List Nat) := [[1, 253, 341, 390, 583, 661, 769, 830, 886, 902, 908], [2, 54, 141, 218, 249], [3, 6, 11, 22, 36, 46, 52], [4], [5], [], [7, 8, 10], [], [9], [], [], [12, 17, 20], [13, 15], [14], [], [16], [], [18], [19], [], [21], [], [23, 25, 31, 35], [24], [], [26, 29], [27], [28], [], [30], [], [32, 34], [33], [], [], [], [37, 43, 45], [38, 40, 41, 42], [39], [], [], [], [], [44], [], [], [47, 50, 51], [48, 49], [], [], [], [], [53], [], [55, 68, 74, 104, 129, 138, 140], [56, 58, 66], [57], [], [59, 62, 64, 65], [60], [61], [], [63], [], [], [], [67], [], [69, 72], [70], [71], [], [73], [], [75, 96, 101, 103], [76, 86, 90, 93, 94, 95], [77, 81, 83, 84, 85], [78, 80], [79], [], [], [82], [], [], [], [], [87, 89], [88], [], [], [91, 92], [], [], [], [], [], [97, 99, 100], [98], [], [], [], [102], [], [], [105, 116, 122, 126, 127, 128], [106, 111, 113, 114, 115], [107, 109, 110], [108], [], [], [], [112], [], [], [], [], [117, 119, 120, 121], [118], [], [], [], [], [123, 124, 125], [], [], [], [], [], [], [130, 135, 137], [131, 133, 134], [132], [], [], [], [136], [], [], [139], [], [], [142, 167, 200, 213, 217], [143, 165], [144, 153, 160, 163, 164], [145, 151, 152], [146, 148, 149, 150], [147], [], [], [], [], [], [], [154, 157, 158, 159], [155, 156], [], [], [], [], [], [161, 162], [], [], [], [], [166], [], [168, 184, 192, 196, 198, 199], [169, 176, 179, 181, 183], [170, 173, 174, 175], [171, 172], [], [], [], [], [], [177, 178], [], [], [180], [], [182], [], [], [185, 189, 190, 191], [186, 187, 188], [], [], [], [], [], [], [193, 194, 195], [], [], [], [197], [], [], [], [201, 206, 209, 210, 212], [202, 204, 205], [203], [], [], [], [207, 208], [], [], [], [211], [], [], [214, 216], [215], [], [], [], [219, 232, 240, 245, 246, 248], [220, 229, 231], [221, 223, 226, 228], [222], [], [224, 225], [], [], [227], [], [], [230], [], [], [233, 237, 238, 239], [234, 235, 236], [], [], [], [], [], [], [241, 242, 243, 244], [], [], [], [], [], [247], [], [], [250, 252], [251], [], [], [254, 310, 320, 339], [255, 269, 273, 280, 302, 307, 309], [256, 258, 264, 268], [257], [], [259, 261, 263], [260], [], [262], [], [], [265, 267], [266], [], [], [], [270], [271], [272], [], [274, 279], [275, 277, 278], [276], [], [], [], [], [281, 291, 297, 300, 301], [282, 286, 288, 289, 290], [283, 285], [284], [], [], [287], [], [], [], [], [292, 294, 295, 296], [293], [], [], [], [], [298, 299], [], [], [], [], [303, 305, 306], [304], [], [], [], [308], [], [], [311, 315, 319], [312, 314], [313], [], [], [316, 318], [317], [], [], [], [321, 333, 335, 338], [322, 327, 330, 331, 332], [323, 325, 326], [324], [], [], [], [328, 329], [], [], [], [], [], [334], [], [336, 337], [], [], [], [340], [], [342, 373, 377, 389], [343, 346, 353, 367, 370, 372], [344], [345], [], [347], [348, 351, 352], [349, 350], [], [], [], [], [354, 360, 363, 365, 366], [355, 357, 359], [356], [], [358], [], [], [361], [362], [], [364], [], [], [], [368, 369], [], [], [371], [], [], [374, 376], [375], [], [], [378, 385, 387], [379, 381, 383, 384], [380], [], [382], [], [], [], [386], [], [388], [], [], [391, 440, 463, 520, 563, 576, 581], [392, 401, 405, 429, 437, 439], [393, 398, 400], [394, 396], [395], [], [397], [], [399], [], [], [402], [403, 404], [], [], [406, 416, 422, 426, 427, 428], [407, 411, 413, 414, 415], [408, 410], [409], [], [], [412], [], [], [], [], [417, 419, 420, 421], [418], [], [], [], [], [423, 424, 425], [], [], [], [], [], [], [430, 435, 436], [431, 433, 434], [432], [], [], [], [], [], [438], [], [], [441, 453, 460, 462], [442, 449, 451], [443, 446, 448], [444, 445], [], [], [447], [], [], [450], [], [452], [], [454, 457, 459], [455, 456], [], [], [458], [], [], [461], [], [], [464, 502, 514, 518], [465, 482, 490, 496, 497, 499, 501], [466, 472, 477, 479, 480, 481], [467, 469, 470, 471], [468], [], [], [], [], [473, 474, 475, 476], [], [], [], [], [478], [], [], [], [], [483, 487, 488, 489], [484, 485, 486], [], [], [], [], [], [], [491, 493, 494, 495], [492], [], [], [], [], [], [498], [], [500], [], [], [503, 508, 512, 513], [504, 506, 507], [505], [], [], [], [509, 510, 511], [], [], [], [], [], [515], [516, 517], [], [], [519], [], [521, 541, 551, 557, 558, 560, 562], [522, 530, 535, 537, 539, 540], [523, 526, 528, 529], [524, 525], [], [], [527], [], [], [], [531, 532, 533, 534], [], [], [], [], [536], [], [538], [], [], [], [542, 547, 548, 549, 550], [543, 545, 546], [544], [], [], [], [], [], [], [], [552, 554, 555, 556], [553], [], [], [], [], [], [559], [], [561], [], [], [564, 569, 573, 575], [565, 567, 568], [566], [], [], [], [570, 571, 572], [], [], [], [574], [], [], [577, 580], [578, 579], [], [], [], [582], [], [584, 618, 621, 647, 658, 660], [585, 588, 607, 615, 617], [586, 587], [], [], [589, 599, 604, 605, 606], [590, 594, 596, 597, 598], [591, 593], [592], [], [], [595], [], [], [], [], [600, 602, 603], [601], [], [], [], [], [], [], [608, 613, 614], [609, 611, 612], [610], [], [], [], [], [], [616], [], [], [619, 620], [], [], [622, 635, 640, 644, 645, 646], [623, 629, 632, 633, 634], [624, 626, 627, 628], [625], [], [], [], [], [630, 631], [], [], [], [], [], [636, 638, 639], [637], [], [], [], [641, 642, 643], [], [], [], [], [], [], [648, 653, 656, 657], [649, 651, 652], [650], [], [], [], [654, 655], [], [], [], [], [659], [], [], [662, 711, 750, 763, 768], [663, 695, 706, 709], [664, 678, 685, 690, 692, 694], [665, 672, 675, 676, 677], [666, 669, 670, 671], [667, 668], [], [], [], [], [], [673, 674], [], [], [], [], [], [679, 682, 683, 684], [680, 681], [], [], [], [], [], [686, 687, 688, 689], [], [], [], [], [691], [], [693], [], [], [696, 701, 704, 705], [697, 699, 700], [698], [], [], [], [702, 703], [], [], [], [], [707], [708], [], [710], [], [712, 730, 739, 744, 745, 747, 749], [713, 720, 724, 726, 728, 729], [714, 717, 718, 719], [715, 716], [], [], [], [], [], [721, 722, 723], [], [], [], [725], [], [727], [], [], [], [731, 735, 736, 738], [732, 733, 734], [], [], [], [], [737], [], [], [740, 741, 742, 743], [], [], [], [], [], [746], [], [748], [], [], [751, 757, 760, 762], [752, 755, 756], [753, 754], [], [], [], [], [758, 759], [], [], [761], [], [], [764, 766, 767], [765], [], [], [], [], [770, 810, 823, 828], [771, 790, 798, 804, 805, 807, 809], [772, 779, 784, 786, 788, 789], [773, 776, 777, 778], [774, 775], [], [], [], [], [], [780, 781, 782, 783], [], [], [], [], [785], [], [787], [], [], [], [791, 795, 796, 797], [792, 793, 794], [], [], [], [], [], [], [799, 801, 802, 803], [800], [], [], [], [], [], [806], [], [808], [], [], [811, 816, 820, 822], [812, 814, 815], [813], [], [], [], [817, 818, 819], [], [], [], [821], [], [], [824, 827], [825, 826], [], [], [], [829], [], [831, 859, 871, 879, 880, 883, 885], [832, 844, 851, 854, 856, 858], [833, 838, 841, 843], [834, 836, 837], [835], [], [], [], [839, 840], [], [], [842], [], [], [845, 848, 849, 850], [846, 847], [], [], [], [], [], [852, 853], [], [], [855], [], [857], [], [], [860, 866, 867, 869, 870], [861, 863, 864, 865], [862], [], [], [], [], [], [868], [], [], [], [872, 874, 876, 878], [873], [], [875], [], [877], [], [], [], [881, 882], [], [], [884], [], [], [887, 894, 898, 899, 901], [888, 891, 892, 893], [889, 890], [], [], [], [], [], [895, 896, 897], [], [], [], [], [900], [], [], [903, 906, 907], [904, 905], [], [], [], [], [909], []]
theorem okAll : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 910 = true := by
  have h0 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 8 = true := okB0
  have h1 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 8 8 h0 okB1
  have h2 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 16 8 h1 okB2
  have h3 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 24 8 h2 okB3
  have h4 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 32 8 h3 okB4
  have h5 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 40 8 h4 okB5
  have h6 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 48 8 h5 okB6
  have h7 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 56 8 h6 okB7
  have h8 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 64 8 h7 okB8
  have h9 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 72 8 h8 okB9
  have h10 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 80 8 h9 okB10
  have h11 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 88 8 h10 okB11
  have h12 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 96 8 h11 okB12
  have h13 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 104 8 h12 okB13
  have h14 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 112 8 h13 okB14
  have h15 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 120 8 h14 okB15
  have h16 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 128 8 h15 okB16
  have h17 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 136 8 h16 okB17
  have h18 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 144 8 h17 okB18
  have h19 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 152 8 h18 okB19
  have h20 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 160 8 h19 okB20
  have h21 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 168 8 h20 okB21
  have h22 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 184 = true := blkChk_join _ _ _ _ _ 0 176 8 h21 okB22
  have h23 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 184 8 h22 okB23
  have h24 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 200 = true := blkChk_join _ _ _ _ _ 0 192 8 h23 okB24
  have h25 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 200 8 h24 okB25
  have h26 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 216 = true := blkChk_join _ _ _ _ _ 0 208 8 h25 okB26
  have h27 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 216 8 h26 okB27
  have h28 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 232 = true := blkChk_join _ _ _ _ _ 0 224 8 h27 okB28
  have h29 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 240 = true := blkChk_join _ _ _ _ _ 0 232 8 h28 okB29
  have h30 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 248 = true := blkChk_join _ _ _ _ _ 0 240 8 h29 okB30
  have h31 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 256 = true := blkChk_join _ _ _ _ _ 0 248 8 h30 okB31
  have h32 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 264 = true := blkChk_join _ _ _ _ _ 0 256 8 h31 okB32
  have h33 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 264 8 h32 okB33
  have h34 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 280 = true := blkChk_join _ _ _ _ _ 0 272 8 h33 okB34
  have h35 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 288 = true := blkChk_join _ _ _ _ _ 0 280 8 h34 okB35
  have h36 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 296 = true := blkChk_join _ _ _ _ _ 0 288 8 h35 okB36
  have h37 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 296 8 h36 okB37
  have h38 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 312 = true := blkChk_join _ _ _ _ _ 0 304 8 h37 okB38
  have h39 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 320 = true := blkChk_join _ _ _ _ _ 0 312 8 h38 okB39
  have h40 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 328 = true := blkChk_join _ _ _ _ _ 0 320 8 h39 okB40
  have h41 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 336 = true := blkChk_join _ _ _ _ _ 0 328 8 h40 okB41
  have h42 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 344 = true := blkChk_join _ _ _ _ _ 0 336 8 h41 okB42
  have h43 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 352 = true := blkChk_join _ _ _ _ _ 0 344 8 h42 okB43
  have h44 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 360 = true := blkChk_join _ _ _ _ _ 0 352 8 h43 okB44
  have h45 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 368 = true := blkChk_join _ _ _ _ _ 0 360 8 h44 okB45
  have h46 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 376 = true := blkChk_join _ _ _ _ _ 0 368 8 h45 okB46
  have h47 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 384 = true := blkChk_join _ _ _ _ _ 0 376 8 h46 okB47
  have h48 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 392 = true := blkChk_join _ _ _ _ _ 0 384 8 h47 okB48
  have h49 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 400 = true := blkChk_join _ _ _ _ _ 0 392 8 h48 okB49
  have h50 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 408 = true := blkChk_join _ _ _ _ _ 0 400 8 h49 okB50
  have h51 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 416 = true := blkChk_join _ _ _ _ _ 0 408 8 h50 okB51
  have h52 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 424 = true := blkChk_join _ _ _ _ _ 0 416 8 h51 okB52
  have h53 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 432 = true := blkChk_join _ _ _ _ _ 0 424 8 h52 okB53
  have h54 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 440 = true := blkChk_join _ _ _ _ _ 0 432 8 h53 okB54
  have h55 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 448 = true := blkChk_join _ _ _ _ _ 0 440 8 h54 okB55
  have h56 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 456 = true := blkChk_join _ _ _ _ _ 0 448 8 h55 okB56
  have h57 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 464 = true := blkChk_join _ _ _ _ _ 0 456 8 h56 okB57
  have h58 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 472 = true := blkChk_join _ _ _ _ _ 0 464 8 h57 okB58
  have h59 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 480 = true := blkChk_join _ _ _ _ _ 0 472 8 h58 okB59
  have h60 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 488 = true := blkChk_join _ _ _ _ _ 0 480 8 h59 okB60
  have h61 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 496 = true := blkChk_join _ _ _ _ _ 0 488 8 h60 okB61
  have h62 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 504 = true := blkChk_join _ _ _ _ _ 0 496 8 h61 okB62
  have h63 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 512 = true := blkChk_join _ _ _ _ _ 0 504 8 h62 okB63
  have h64 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 520 = true := blkChk_join _ _ _ _ _ 0 512 8 h63 okB64
  have h65 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 528 = true := blkChk_join _ _ _ _ _ 0 520 8 h64 okB65
  have h66 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 536 = true := blkChk_join _ _ _ _ _ 0 528 8 h65 okB66
  have h67 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 544 = true := blkChk_join _ _ _ _ _ 0 536 8 h66 okB67
  have h68 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 552 = true := blkChk_join _ _ _ _ _ 0 544 8 h67 okB68
  have h69 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 560 = true := blkChk_join _ _ _ _ _ 0 552 8 h68 okB69
  have h70 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 568 = true := blkChk_join _ _ _ _ _ 0 560 8 h69 okB70
  have h71 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 576 = true := blkChk_join _ _ _ _ _ 0 568 8 h70 okB71
  have h72 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 584 = true := blkChk_join _ _ _ _ _ 0 576 8 h71 okB72
  have h73 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 592 = true := blkChk_join _ _ _ _ _ 0 584 8 h72 okB73
  have h74 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 600 = true := blkChk_join _ _ _ _ _ 0 592 8 h73 okB74
  have h75 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 608 = true := blkChk_join _ _ _ _ _ 0 600 8 h74 okB75
  have h76 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 616 = true := blkChk_join _ _ _ _ _ 0 608 8 h75 okB76
  have h77 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 624 = true := blkChk_join _ _ _ _ _ 0 616 8 h76 okB77
  have h78 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 632 = true := blkChk_join _ _ _ _ _ 0 624 8 h77 okB78
  have h79 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 640 = true := blkChk_join _ _ _ _ _ 0 632 8 h78 okB79
  have h80 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 648 = true := blkChk_join _ _ _ _ _ 0 640 8 h79 okB80
  have h81 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 656 = true := blkChk_join _ _ _ _ _ 0 648 8 h80 okB81
  have h82 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 664 = true := blkChk_join _ _ _ _ _ 0 656 8 h81 okB82
  have h83 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 672 = true := blkChk_join _ _ _ _ _ 0 664 8 h82 okB83
  have h84 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 680 = true := blkChk_join _ _ _ _ _ 0 672 8 h83 okB84
  have h85 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 688 = true := blkChk_join _ _ _ _ _ 0 680 8 h84 okB85
  have h86 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 696 = true := blkChk_join _ _ _ _ _ 0 688 8 h85 okB86
  have h87 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 704 = true := blkChk_join _ _ _ _ _ 0 696 8 h86 okB87
  have h88 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 712 = true := blkChk_join _ _ _ _ _ 0 704 8 h87 okB88
  have h89 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 720 = true := blkChk_join _ _ _ _ _ 0 712 8 h88 okB89
  have h90 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 728 = true := blkChk_join _ _ _ _ _ 0 720 8 h89 okB90
  have h91 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 736 = true := blkChk_join _ _ _ _ _ 0 728 8 h90 okB91
  have h92 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 744 = true := blkChk_join _ _ _ _ _ 0 736 8 h91 okB92
  have h93 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 752 = true := blkChk_join _ _ _ _ _ 0 744 8 h92 okB93
  have h94 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 760 = true := blkChk_join _ _ _ _ _ 0 752 8 h93 okB94
  have h95 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 768 = true := blkChk_join _ _ _ _ _ 0 760 8 h94 okB95
  have h96 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 776 = true := blkChk_join _ _ _ _ _ 0 768 8 h95 okB96
  have h97 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 784 = true := blkChk_join _ _ _ _ _ 0 776 8 h96 okB97
  have h98 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 792 = true := blkChk_join _ _ _ _ _ 0 784 8 h97 okB98
  have h99 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 800 = true := blkChk_join _ _ _ _ _ 0 792 8 h98 okB99
  have h100 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 808 = true := blkChk_join _ _ _ _ _ 0 800 8 h99 okB100
  have h101 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 816 = true := blkChk_join _ _ _ _ _ 0 808 8 h100 okB101
  have h102 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 824 = true := blkChk_join _ _ _ _ _ 0 816 8 h101 okB102
  have h103 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 832 = true := blkChk_join _ _ _ _ _ 0 824 8 h102 okB103
  have h104 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 840 = true := blkChk_join _ _ _ _ _ 0 832 8 h103 okB104
  have h105 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 848 = true := blkChk_join _ _ _ _ _ 0 840 8 h104 okB105
  have h106 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 856 = true := blkChk_join _ _ _ _ _ 0 848 8 h105 okB106
  have h107 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 864 = true := blkChk_join _ _ _ _ _ 0 856 8 h106 okB107
  have h108 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 872 = true := blkChk_join _ _ _ _ _ 0 864 8 h107 okB108
  have h109 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 880 = true := blkChk_join _ _ _ _ _ 0 872 8 h108 okB109
  have h110 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 888 = true := blkChk_join _ _ _ _ _ 0 880 8 h109 okB110
  have h111 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 896 = true := blkChk_join _ _ _ _ _ 0 888 8 h110 okB111
  have h112 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 904 = true := blkChk_join _ _ _ _ _ 0 896 8 h111 okB112
  have h113 : blkChk C (E1P.slc E1P.SL_pt.chunk) UB UBR lits 0 910 = true := blkChk_join _ _ _ _ _ 0 904 6 h112 okB113
  exact h113
theorem len : lits.length = 910 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1P.fld UB l) := by
  rw [show V (fun l => E1P.fld UB l) = pkL 256 (fun l => E1P.fld UB l) 255 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1P.fld UB l) := by
  rw [show VR (fun l => E1P.fld UB l) = pkL 256 (fun j => E1P.fld UB (254 - j)) 255 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 19, SlotV x ((E1P.slc E1P.SL_pt.chunk) i))
    (hxub : ∀ l < 255, x l ≤ E1P.fld UB l) (hx : ∃ l < 255, 0 < x l) :
    ¬ StartOK x (fun l => E1P.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1P.slc E1P.SL_pt.chunk) UB UBR (fun l => E1P.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1P.J582K
