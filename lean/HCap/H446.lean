module
public import R22Port.U_d41d8cd98f00
public import HCap.H446_B0
public import HCap.H446_B1
public import HCap.H446_B2
public import HCap.H446_B3
public import HCap.H446_B4
public import HCap.H446_B5
public import HCap.H446_B6
public import HCap.H446_B7
public import HCap.H446_B8
public import HCap.H446_B9
public import HCap.H446_B10
public import HCap.H446_B11
public import HCap.H446_B12
public import HCap.H446_B13
public import HCap.H446_B14
public import HCap.H446_B15
public import HCap.H446_B16
public import HCap.H446_B17
public import HCap.H446_B18
public import HCap.H446_B19
public import HCap.H446_B20
public import HCap.H446_B21
public import HCap.H446_B22
public import HCap.H446_B23
public import HCap.H446_B24
public import HCap.H446_B25
public import HCap.H446_B26
public import HCap.H446_B27
public import HCap.H446_B28
public import HCap.H446_B29
public import HCap.H446_B30
public import HCap.H446_B31
public import HCap.H446_B32
public import HCap.H446_B33
public import HCap.H446_B34
public import HCap.H446_B35
public import HCap.H446_B36
public import HCap.H446_B37
public import HCap.H446_B38
public import HCap.H446_B39
public import HCap.H446_B40
public import HCap.H446_B41
public import HCap.H446_B42
public import HCap.H446_B43
public import HCap.H446_B44
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1G chain `H446`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1G.H446
open E1GS E1G.IP_h446
def W : List (List Nat) := [[1, 163], [2, 144], [3, 88], [4], [5], [6, 65, 87], [7, 62], [8, 53, 59], [9, 27, 50], [10], [11, 22, 26], [12, 14, 19], [13], [], [15, 18], [16, 17], [], [], [], [20, 21], [], [], [23, 25], [24], [], [], [], [28, 38, 40, 46, 48], [29, 31, 34, 37], [30], [], [32, 33], [], [], [35, 36], [], [], [], [39], [], [41, 44, 45], [42, 43], [], [], [], [], [47], [], [49], [], [51], [52], [], [54, 56, 58], [55], [], [57], [], [], [60], [61], [], [63], [64], [], [66, 84, 86], [67, 75, 81], [68, 73], [69, 70, 71], [], [], [72], [], [74], [], [76, 79], [77, 78], [], [], [80], [], [82], [83], [], [85], [], [], [], [89], [90, 133, 139], [91, 132], [92, 129, 130, 131], [93, 108, 119, 125, 128], [94], [95, 100, 104, 106], [96, 97, 99], [], [98], [], [], [101, 103], [102], [], [], [105], [], [107], [], [109, 113, 116, 118], [110, 111, 112], [], [], [], [114, 115], [], [], [117], [], [], [120, 123], [121, 122], [], [], [124], [], [126], [127], [], [], [], [], [], [], [134], [135, 137], [136], [], [138], [], [140, 143], [141], [142], [], [], [145], [146, 159], [147], [148], [149, 155, 156, 157], [150, 154], [151, 153], [152], [], [], [], [], [], [158], [], [160, 162], [161], [], [], [164], [165, 176], [166], [167], [168, 173], [169], [170, 172], [171], [], [], [174, 175], [], [], [177], []]
theorem okAll : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 178 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 4 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 4 4 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 12 = true := blkChk_join _ _ _ _ _ 0 8 4 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 12 4 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 20 = true := blkChk_join _ _ _ _ _ 0 16 4 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 20 4 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 24 4 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 28 4 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 32 4 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 36 4 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 40 4 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 44 4 h10 okB11
  have h12 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 48 4 h11 okB12
  have h13 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 52 4 h12 okB13
  have h14 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 60 = true := blkChk_join _ _ _ _ _ 0 56 4 h13 okB14
  have h15 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 60 4 h14 okB15
  have h16 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 68 = true := blkChk_join _ _ _ _ _ 0 64 4 h15 okB16
  have h17 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 68 4 h16 okB17
  have h18 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 76 = true := blkChk_join _ _ _ _ _ 0 72 4 h17 okB18
  have h19 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 76 4 h18 okB19
  have h20 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 80 4 h19 okB20
  have h21 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 84 4 h20 okB21
  have h22 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 92 = true := blkChk_join _ _ _ _ _ 0 88 4 h21 okB22
  have h23 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 92 4 h22 okB23
  have h24 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 100 = true := blkChk_join _ _ _ _ _ 0 96 4 h23 okB24
  have h25 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 100 4 h24 okB25
  have h26 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 108 = true := blkChk_join _ _ _ _ _ 0 104 4 h25 okB26
  have h27 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 108 4 h26 okB27
  have h28 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 116 = true := blkChk_join _ _ _ _ _ 0 112 4 h27 okB28
  have h29 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 116 4 h28 okB29
  have h30 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 124 = true := blkChk_join _ _ _ _ _ 0 120 4 h29 okB30
  have h31 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 124 4 h30 okB31
  have h32 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 132 = true := blkChk_join _ _ _ _ _ 0 128 4 h31 okB32
  have h33 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 132 4 h32 okB33
  have h34 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 140 = true := blkChk_join _ _ _ _ _ 0 136 4 h33 okB34
  have h35 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 140 4 h34 okB35
  have h36 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 148 = true := blkChk_join _ _ _ _ _ 0 144 4 h35 okB36
  have h37 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 148 4 h36 okB37
  have h38 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 152 4 h37 okB38
  have h39 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 156 4 h38 okB39
  have h40 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 164 = true := blkChk_join _ _ _ _ _ 0 160 4 h39 okB40
  have h41 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 164 4 h40 okB41
  have h42 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 172 = true := blkChk_join _ _ _ _ _ 0 168 4 h41 okB42
  have h43 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 172 4 h42 okB43
  have h44 : blkChk C (E1G.slc E1G.SL_h446.chunk) UB UBR lits 0 178 = true := blkChk_join _ _ _ _ _ 0 176 2 h43 okB44
  exact h44
theorem len : lits.length = 178 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h446.chunk) i))
    (hxub : ∀ l < 127, x l ≤ E1G.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1G.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1G.slc E1G.SL_h446.chunk) UB UBR (fun l => E1G.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1G.H446
