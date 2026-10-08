module
public import R22Port.U_d41d8cd98f00
public import E1.C401X_B0
public import E1.C401X_B1
public import E1.C401X_B2
public import E1.C401X_B3
public import E1.C401X_B4
public import E1.C401X_B5
public import E1.C401X_B6
public import E1.C401X_B7
public import E1.C401X_B8
public import E1.C401X_B9
public import E1.C401X_B10
public import E1.C401X_B11
public import E1.C401X_B12
public import E1.C401X_B13
public import E1.C401X_B14
public import E1.C401X_B15
public import E1.C401X_B16
public import E1.C401X_B17
public import E1.C401X_B18
public import E1.C401X_B19
public import E1.C401X_B20
public import E1.C401X_B21
public import E1.C401X_B22
public import E1.C401X_B23
public import E1.C401X_B24
public import E1.C401X_B25
public import E1.C401X_B26
public import E1.OK_e401
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C401X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C401X
open E1S E1.IP_e401
theorem okAll : blkChk C E1.SL_e401.entry UB UBR lits 0 309 = true := by
  have h0 : blkChk C E1.SL_e401.entry UB UBR lits 0 12 = true := okM0
  have h1 : blkChk C E1.SL_e401.entry UB UBR lits 0 28 = true := blkChk_join _ _ _ _ _ 0 12 16 h0 okM1
  have h2 : blkChk C E1.SL_e401.entry UB UBR lits 0 36 = true := blkChk_join _ _ _ _ _ 0 28 8 h1 okM2
  have h3 : blkChk C E1.SL_e401.entry UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 36 12 h2 okM3
  have h4 : blkChk C E1.SL_e401.entry UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 48 8 h3 okM4
  have h5 : blkChk C E1.SL_e401.entry UB UBR lits 0 66 = true := blkChk_join _ _ _ _ _ 0 56 10 h4 okM5
  have h6 : blkChk C E1.SL_e401.entry UB UBR lits 0 75 = true := blkChk_join _ _ _ _ _ 0 66 9 h5 okM6
  have h7 : blkChk C E1.SL_e401.entry UB UBR lits 0 86 = true := blkChk_join _ _ _ _ _ 0 75 11 h6 okM7
  have h8 : blkChk C E1.SL_e401.entry UB UBR lits 0 98 = true := blkChk_join _ _ _ _ _ 0 86 12 h7 okM8
  have h9 : blkChk C E1.SL_e401.entry UB UBR lits 0 110 = true := blkChk_join _ _ _ _ _ 0 98 12 h8 okM9
  have h10 : blkChk C E1.SL_e401.entry UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 110 10 h9 okM10
  have h11 : blkChk C E1.SL_e401.entry UB UBR lits 0 132 = true := blkChk_join _ _ _ _ _ 0 120 12 h10 okM11
  have h12 : blkChk C E1.SL_e401.entry UB UBR lits 0 142 = true := blkChk_join _ _ _ _ _ 0 132 10 h11 okM12
  have h13 : blkChk C E1.SL_e401.entry UB UBR lits 0 153 = true := blkChk_join _ _ _ _ _ 0 142 11 h12 okM13
  have h14 : blkChk C E1.SL_e401.entry UB UBR lits 0 167 = true := blkChk_join _ _ _ _ _ 0 153 14 h13 okM14
  have h15 : blkChk C E1.SL_e401.entry UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 167 9 h14 okM15
  have h16 : blkChk C E1.SL_e401.entry UB UBR lits 0 185 = true := blkChk_join _ _ _ _ _ 0 176 9 h15 okM16
  have h17 : blkChk C E1.SL_e401.entry UB UBR lits 0 195 = true := blkChk_join _ _ _ _ _ 0 185 10 h16 okM17
  have h18 : blkChk C E1.SL_e401.entry UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 195 13 h17 okM18
  have h19 : blkChk C E1.SL_e401.entry UB UBR lits 0 219 = true := blkChk_join _ _ _ _ _ 0 208 11 h18 okM19
  have h20 : blkChk C E1.SL_e401.entry UB UBR lits 0 232 = true := blkChk_join _ _ _ _ _ 0 219 13 h19 okM20
  have h21 : blkChk C E1.SL_e401.entry UB UBR lits 0 243 = true := blkChk_join _ _ _ _ _ 0 232 11 h20 okM21
  have h22 : blkChk C E1.SL_e401.entry UB UBR lits 0 259 = true := blkChk_join _ _ _ _ _ 0 243 16 h21 okM22
  have h23 : blkChk C E1.SL_e401.entry UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 259 13 h22 okM23
  have h24 : blkChk C E1.SL_e401.entry UB UBR lits 0 288 = true := blkChk_join _ _ _ _ _ 0 272 16 h23 okM24
  have h25 : blkChk C E1.SL_e401.entry UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 288 16 h24 okM25
  have h26 : blkChk C E1.SL_e401.entry UB UBR lits 0 309 = true := blkChk_join _ _ _ _ _ 0 304 5 h25 okM26
  exact h26
theorem len : lits.length = 309 := by decide
theorem okGAll : glueChkR lits W 0 309 = true := by
  have g0 : glueChkR lits W 0 12 = true := okG0
  have g1 : glueChkR lits W 0 28 = true := glueChkR_join _ _ 0 12 16 g0 okG1
  have g2 : glueChkR lits W 0 36 = true := glueChkR_join _ _ 0 28 8 g1 okG2
  have g3 : glueChkR lits W 0 48 = true := glueChkR_join _ _ 0 36 12 g2 okG3
  have g4 : glueChkR lits W 0 56 = true := glueChkR_join _ _ 0 48 8 g3 okG4
  have g5 : glueChkR lits W 0 66 = true := glueChkR_join _ _ 0 56 10 g4 okG5
  have g6 : glueChkR lits W 0 75 = true := glueChkR_join _ _ 0 66 9 g5 okG6
  have g7 : glueChkR lits W 0 86 = true := glueChkR_join _ _ 0 75 11 g6 okG7
  have g8 : glueChkR lits W 0 98 = true := glueChkR_join _ _ 0 86 12 g7 okG8
  have g9 : glueChkR lits W 0 110 = true := glueChkR_join _ _ 0 98 12 g8 okG9
  have g10 : glueChkR lits W 0 120 = true := glueChkR_join _ _ 0 110 10 g9 okG10
  have g11 : glueChkR lits W 0 132 = true := glueChkR_join _ _ 0 120 12 g10 okG11
  have g12 : glueChkR lits W 0 142 = true := glueChkR_join _ _ 0 132 10 g11 okG12
  have g13 : glueChkR lits W 0 153 = true := glueChkR_join _ _ 0 142 11 g12 okG13
  have g14 : glueChkR lits W 0 167 = true := glueChkR_join _ _ 0 153 14 g13 okG14
  have g15 : glueChkR lits W 0 176 = true := glueChkR_join _ _ 0 167 9 g14 okG15
  have g16 : glueChkR lits W 0 185 = true := glueChkR_join _ _ 0 176 9 g15 okG16
  have g17 : glueChkR lits W 0 195 = true := glueChkR_join _ _ 0 185 10 g16 okG17
  have g18 : glueChkR lits W 0 208 = true := glueChkR_join _ _ 0 195 13 g17 okG18
  have g19 : glueChkR lits W 0 219 = true := glueChkR_join _ _ 0 208 11 g18 okG19
  have g20 : glueChkR lits W 0 232 = true := glueChkR_join _ _ 0 219 13 g19 okG20
  have g21 : glueChkR lits W 0 243 = true := glueChkR_join _ _ 0 232 11 g20 okG21
  have g22 : glueChkR lits W 0 259 = true := glueChkR_join _ _ 0 243 16 g21 okG22
  have g23 : glueChkR lits W 0 272 = true := glueChkR_join _ _ 0 259 13 g22 okG23
  have g24 : glueChkR lits W 0 288 = true := glueChkR_join _ _ 0 272 16 g23 okG24
  have g25 : glueChkR lits W 0 304 = true := glueChkR_join _ _ 0 288 16 g24 okG25
  have g26 : glueChkR lits W 0 309 = true := glueChkR_join _ _ 0 304 5 g25 okG26
  exact g26
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e401.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e401.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e401.UB_eq E1.OK_e401.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C401X
