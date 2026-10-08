module
public import R22Port.U_d41d8cd98f00
public import HCap.H443_B0
public import HCap.H443_B1
public import HCap.H443_B2
public import HCap.H443_B3
public import HCap.H443_B4
public import HCap.H443_B5
public import HCap.H443_B6
public import HCap.H443_B7
public import HCap.H443_B8
public import HCap.H443_B9
public import HCap.H443_B10
public import HCap.H443_B11
public import HCap.H443_B12
public import HCap.H443_B13
public import HCap.H443_B14
public import HCap.H443_B15
public import HCap.H443_B16
public import HCap.H443_B17
public import HCap.H443_B18
public import HCap.H443_B19
public import HCap.H443_B20
public import HCap.H443_B21
public import HCap.H443_B22
public import HCap.H443_B23
public import HCap.H443_B24
public import HCap.H443_B25
public import HCap.H443_B26
public import HCap.H443_B27
public import HCap.H443_B28
public import HCap.H443_B29
public import HCap.H443_B30
public import HCap.H443_B31
public import HCap.H443_B32
public import HCap.H443_B33
public import HCap.H443_B34
public import HCap.H443_B35
public import HCap.H443_B36
public import HCap.H443_B37
public import HCap.H443_B38
public import HCap.H443_B39
public import HCap.H443_B40
public import HCap.H443_B41
public import HCap.H443_B42
public import HCap.H443_B43
public import HCap.H443_B44
public import HCap.H443_B45
public import HCap.H443_B46
public import HCap.H443_B47
public import HCap.H443_B48
public import HCap.H443_B49
public import HCap.H443_B50
public import HCap.H443_B51
public import HCap.H443_B52
public import HCap.H443_B53
public import HCap.H443_B54
public import HCap.H443_B55
public import HCap.H443_B56
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1G chain `H443`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1G.H443
open E1GS E1G.IP_h443
def W : List (List Nat) := [[1, 193], [2, 179, 190], [3, 77, 150, 172], [4, 59, 73], [5, 47, 54], [6, 31, 43], [7, 26], [8, 22], [9, 20], [10, 18], [11, 17], [12, 15, 16], [13, 14], [], [], [], [], [], [19], [], [21], [], [23], [24], [25], [], [27], [28], [29], [30], [], [32, 41], [33, 40], [34, 39], [35, 38], [36, 37], [], [], [], [], [], [42], [], [44], [45], [46], [], [48], [49], [50], [51], [52], [53], [], [55], [56], [57], [58], [], [60, 68], [61, 67], [62], [63], [64], [65], [66], [], [], [69], [70], [71], [72], [], [74], [75], [76], [], [78, 127, 146], [79, 115, 125], [80, 108, 113], [81, 101, 107], [82, 97], [83, 94], [84, 92], [85, 89, 91], [86, 88], [87], [], [], [90], [], [], [93], [], [95], [96], [], [98], [99], [100], [], [102], [103, 106], [104], [105], [], [], [], [109], [110], [111], [112], [], [114], [], [116, 123], [117], [118], [119, 122], [120], [121], [], [], [124], [], [126], [], [128, 143], [129, 140], [130, 139], [131, 137], [132, 136], [133], [134], [135], [], [], [138], [], [], [141], [142], [], [144], [145], [], [147], [148], [149], [], [151, 168], [152, 166], [153, 163], [154], [155, 161], [156, 160], [157], [158, 159], [], [], [], [162], [], [164], [165], [], [167], [], [169], [170], [171], [], [173], [174], [175], [176], [177], [178], [], [180, 188], [181], [182], [183], [184], [185], [186], [187], [], [189], [], [191], [192], [], [194, 206, 221], [195], [196], [197, 202], [198], [199], [200], [201], [], [203], [204], [205], [], [207, 218], [208, 216], [209], [210, 215], [211], [212], [213], [214], [], [], [217], [], [219], [220], [], [222], [223], [224], []]
theorem okAll : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 225 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 4 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 4 4 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 12 = true := blkChk_join _ _ _ _ _ 0 8 4 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 12 4 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 20 = true := blkChk_join _ _ _ _ _ 0 16 4 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 20 4 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 24 4 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 28 4 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 32 4 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 36 4 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 40 4 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 44 4 h10 okB11
  have h12 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 48 4 h11 okB12
  have h13 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 52 4 h12 okB13
  have h14 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 60 = true := blkChk_join _ _ _ _ _ 0 56 4 h13 okB14
  have h15 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 60 4 h14 okB15
  have h16 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 64 4 h15 okB16
  have h17 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 68 4 h16 okB17
  have h18 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 76 = true := blkChk_join _ _ _ _ _ 0 72 4 h17 okB18
  have h19 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 76 4 h18 okB19
  have h20 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 80 4 h19 okB20
  have h21 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 84 4 h20 okB21
  have h22 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 92 = true := blkChk_join _ _ _ _ _ 0 88 4 h21 okB22
  have h23 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 92 4 h22 okB23
  have h24 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 100 = true := blkChk_join _ _ _ _ _ 0 96 4 h23 okB24
  have h25 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 100 4 h24 okB25
  have h26 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 108 = true := blkChk_join _ _ _ _ _ 0 104 4 h25 okB26
  have h27 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 108 4 h26 okB27
  have h28 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 112 4 h27 okB28
  have h29 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 116 4 h28 okB29
  have h30 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 124 = true := blkChk_join _ _ _ _ _ 0 120 4 h29 okB30
  have h31 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 124 4 h30 okB31
  have h32 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 132 = true := blkChk_join _ _ _ _ _ 0 128 4 h31 okB32
  have h33 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 132 4 h32 okB33
  have h34 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 140 = true := blkChk_join _ _ _ _ _ 0 136 4 h33 okB34
  have h35 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 140 4 h34 okB35
  have h36 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 148 = true := blkChk_join _ _ _ _ _ 0 144 4 h35 okB36
  have h37 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 148 4 h36 okB37
  have h38 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 152 4 h37 okB38
  have h39 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 156 4 h38 okB39
  have h40 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 164 = true := blkChk_join _ _ _ _ _ 0 160 4 h39 okB40
  have h41 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 164 4 h40 okB41
  have h42 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 172 = true := blkChk_join _ _ _ _ _ 0 168 4 h41 okB42
  have h43 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 172 4 h42 okB43
  have h44 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 180 = true := blkChk_join _ _ _ _ _ 0 176 4 h43 okB44
  have h45 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 184 = true := blkChk_join _ _ _ _ _ 0 180 4 h44 okB45
  have h46 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 184 4 h45 okB46
  have h47 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 188 4 h46 okB47
  have h48 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 196 = true := blkChk_join _ _ _ _ _ 0 192 4 h47 okB48
  have h49 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 200 = true := blkChk_join _ _ _ _ _ 0 196 4 h48 okB49
  have h50 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 204 = true := blkChk_join _ _ _ _ _ 0 200 4 h49 okB50
  have h51 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 204 4 h50 okB51
  have h52 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 212 = true := blkChk_join _ _ _ _ _ 0 208 4 h51 okB52
  have h53 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 216 = true := blkChk_join _ _ _ _ _ 0 212 4 h52 okB53
  have h54 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 220 = true := blkChk_join _ _ _ _ _ 0 216 4 h53 okB54
  have h55 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 220 4 h54 okB55
  have h56 : blkChk C (E1G.slc E1G.SL_h443.chunk) UB UBR lits 0 225 = true := blkChk_join _ _ _ _ _ 0 224 1 h55 okB56
  exact h56
theorem len : lits.length = 225 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h443.chunk) i))
    (hxub : ∀ l < 127, x l ≤ E1G.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1G.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1G.slc E1G.SL_h443.chunk) UB UBR (fun l => E1G.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1G.H443
