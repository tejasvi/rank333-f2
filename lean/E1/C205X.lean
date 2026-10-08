module
public import R22Port.U_d41d8cd98f00
public import E1.C205X_B0
public import E1.C205X_B1
public import E1.C205X_B2
public import E1.C205X_B3
public import E1.C205X_B4
public import E1.C205X_B5
public import E1.C205X_B6
public import E1.C205X_B7
public import E1.C205X_B8
public import E1.C205X_B9
public import E1.C205X_B10
public import E1.C205X_B11
public import E1.C205X_B12
public import E1.C205X_B13
public import E1.C205X_B14
public import E1.C205X_B15
public import E1.C205X_B16
public import E1.C205X_B17
public import E1.C205X_B18
public import E1.C205X_B19
public import E1.C205X_B20
public import E1.C205X_B21
public import E1.C205X_B22
public import E1.C205X_B23
public import E1.C205X_B24
public import E1.C205X_B25
public import E1.C205X_B26
public import E1.OK_e205
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C205X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C205X
open E1S E1.IP_e205
theorem okAll : blkChk C E1.SL_e205.entry UB UBR lits 0 340 = true := by
  have h0 : blkChk C E1.SL_e205.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e205.entry UB UBR lits 0 25 = true := blkChk_join _ _ _ _ _ 0 16 9 h0 okM1
  have h2 : blkChk C E1.SL_e205.entry UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 25 11 h1 okM2
  have h3 : blkChk C E1.SL_e205.entry UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 36 12 h2 okM3
  have h4 : blkChk C E1.SL_e205.entry UB UBR lits 0 59 = true := blkChk_join _ _ _ _ _ 0 48 11 h3 okM4
  have h5 : blkChk C E1.SL_e205.entry UB UBR lits 0 70 = true := blkChk_join _ _ _ _ _ 0 59 11 h4 okM5
  have h6 : blkChk C E1.SL_e205.entry UB UBR lits 0 83 = true := blkChk_join _ _ _ _ _ 0 70 13 h5 okM6
  have h7 : blkChk C E1.SL_e205.entry UB UBR lits 0 94 = true := blkChk_join _ _ _ _ _ 0 83 11 h6 okM7
  have h8 : blkChk C E1.SL_e205.entry UB UBR lits 0 106 = true := blkChk_join _ _ _ _ _ 0 94 12 h7 okM8
  have h9 : blkChk C E1.SL_e205.entry UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 106 14 h8 okM9
  have h10 : blkChk C E1.SL_e205.entry UB UBR lits 0 134 = true := blkChk_join _ _ _ _ _ 0 120 14 h9 okM10
  have h11 : blkChk C E1.SL_e205.entry UB UBR lits 0 145 = true := blkChk_join _ _ _ _ _ 0 134 11 h10 okM11
  have h12 : blkChk C E1.SL_e205.entry UB UBR lits 0 155 = true := blkChk_join _ _ _ _ _ 0 145 10 h11 okM12
  have h13 : blkChk C E1.SL_e205.entry UB UBR lits 0 166 = true := blkChk_join _ _ _ _ _ 0 155 11 h12 okM13
  have h14 : blkChk C E1.SL_e205.entry UB UBR lits 0 181 = true := blkChk_join _ _ _ _ _ 0 166 15 h13 okM14
  have h15 : blkChk C E1.SL_e205.entry UB UBR lits 0 195 = true := blkChk_join _ _ _ _ _ 0 181 14 h14 okM15
  have h16 : blkChk C E1.SL_e205.entry UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 195 13 h15 okM16
  have h17 : blkChk C E1.SL_e205.entry UB UBR lits 0 223 = true := blkChk_join _ _ _ _ _ 0 208 15 h16 okM17
  have h18 : blkChk C E1.SL_e205.entry UB UBR lits 0 235 = true := blkChk_join _ _ _ _ _ 0 223 12 h17 okM18
  have h19 : blkChk C E1.SL_e205.entry UB UBR lits 0 251 = true := blkChk_join _ _ _ _ _ 0 235 16 h18 okM19
  have h20 : blkChk C E1.SL_e205.entry UB UBR lits 0 265 = true := blkChk_join _ _ _ _ _ 0 251 14 h19 okM20
  have h21 : blkChk C E1.SL_e205.entry UB UBR lits 0 281 = true := blkChk_join _ _ _ _ _ 0 265 16 h20 okM21
  have h22 : blkChk C E1.SL_e205.entry UB UBR lits 0 294 = true := blkChk_join _ _ _ _ _ 0 281 13 h21 okM22
  have h23 : blkChk C E1.SL_e205.entry UB UBR lits 0 306 = true := blkChk_join _ _ _ _ _ 0 294 12 h22 okM23
  have h24 : blkChk C E1.SL_e205.entry UB UBR lits 0 322 = true := blkChk_join _ _ _ _ _ 0 306 16 h23 okM24
  have h25 : blkChk C E1.SL_e205.entry UB UBR lits 0 333 = true := blkChk_join _ _ _ _ _ 0 322 11 h24 okM25
  have h26 : blkChk C E1.SL_e205.entry UB UBR lits 0 340 = true := blkChk_join _ _ _ _ _ 0 333 7 h25 okM26
  exact h26
theorem len : lits.length = 340 := by decide
theorem okGAll : glueChkR lits W 0 340 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 25 = true := glueChkR_join _ _ 0 16 9 g0 okG1
  have g2 : glueChkR lits W 0 36 = true := glueChkR_join _ _ 0 25 11 g1 okG2
  have g3 : glueChkR lits W 0 48 = true := glueChkR_join _ _ 0 36 12 g2 okG3
  have g4 : glueChkR lits W 0 59 = true := glueChkR_join _ _ 0 48 11 g3 okG4
  have g5 : glueChkR lits W 0 70 = true := glueChkR_join _ _ 0 59 11 g4 okG5
  have g6 : glueChkR lits W 0 83 = true := glueChkR_join _ _ 0 70 13 g5 okG6
  have g7 : glueChkR lits W 0 94 = true := glueChkR_join _ _ 0 83 11 g6 okG7
  have g8 : glueChkR lits W 0 106 = true := glueChkR_join _ _ 0 94 12 g7 okG8
  have g9 : glueChkR lits W 0 120 = true := glueChkR_join _ _ 0 106 14 g8 okG9
  have g10 : glueChkR lits W 0 134 = true := glueChkR_join _ _ 0 120 14 g9 okG10
  have g11 : glueChkR lits W 0 145 = true := glueChkR_join _ _ 0 134 11 g10 okG11
  have g12 : glueChkR lits W 0 155 = true := glueChkR_join _ _ 0 145 10 g11 okG12
  have g13 : glueChkR lits W 0 166 = true := glueChkR_join _ _ 0 155 11 g12 okG13
  have g14 : glueChkR lits W 0 181 = true := glueChkR_join _ _ 0 166 15 g13 okG14
  have g15 : glueChkR lits W 0 195 = true := glueChkR_join _ _ 0 181 14 g14 okG15
  have g16 : glueChkR lits W 0 208 = true := glueChkR_join _ _ 0 195 13 g15 okG16
  have g17 : glueChkR lits W 0 223 = true := glueChkR_join _ _ 0 208 15 g16 okG17
  have g18 : glueChkR lits W 0 235 = true := glueChkR_join _ _ 0 223 12 g17 okG18
  have g19 : glueChkR lits W 0 251 = true := glueChkR_join _ _ 0 235 16 g18 okG19
  have g20 : glueChkR lits W 0 265 = true := glueChkR_join _ _ 0 251 14 g19 okG20
  have g21 : glueChkR lits W 0 281 = true := glueChkR_join _ _ 0 265 16 g20 okG21
  have g22 : glueChkR lits W 0 294 = true := glueChkR_join _ _ 0 281 13 g21 okG22
  have g23 : glueChkR lits W 0 306 = true := glueChkR_join _ _ 0 294 12 g22 okG23
  have g24 : glueChkR lits W 0 322 = true := glueChkR_join _ _ 0 306 16 g23 okG24
  have g25 : glueChkR lits W 0 333 = true := glueChkR_join _ _ 0 322 11 g24 okG25
  have g26 : glueChkR lits W 0 340 = true := glueChkR_join _ _ 0 333 7 g25 okG26
  exact g26
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e205.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e205.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e205.UB_eq E1.OK_e205.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C205X
