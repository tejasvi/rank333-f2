module
public import R22Port.U_d41d8cd98f00
public import E1.C378X_B0
public import E1.C378X_B1
public import E1.C378X_B2
public import E1.C378X_B3
public import E1.C378X_B4
public import E1.C378X_B5
public import E1.C378X_B6
public import E1.C378X_B7
public import E1.C378X_B8
public import E1.C378X_B9
public import E1.C378X_B10
public import E1.C378X_B11
public import E1.C378X_B12
public import E1.C378X_B13
public import E1.C378X_B14
public import E1.C378X_B15
public import E1.C378X_B16
public import E1.C378X_B17
public import E1.C378X_B18
public import E1.C378X_B19
public import E1.C378X_B20
public import E1.C378X_B21
public import E1.C378X_B22
public import E1.C378X_B23
public import E1.C378X_B24
public import E1.C378X_B25
public import E1.C378X_B26
public import E1.C378X_B27
public import E1.C378X_B28
public import E1.C378X_B29
public import E1.C378X_B30
public import E1.C378X_B31
public import E1.C378X_B32
public import E1.OK_e378
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C378X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C378X
open E1S E1.IP_e378
theorem okAll : blkChk C E1.SL_e378.entry UB UBR lits 0 462 = true := by
  have h0 : blkChk C E1.SL_e378.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e378.entry UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 16 16 h0 okM1
  have h2 : blkChk C E1.SL_e378.entry UB UBR lits 0 47 = true := blkChk_join _ _ _ _ _ 0 32 15 h1 okM2
  have h3 : blkChk C E1.SL_e378.entry UB UBR lits 0 55 = true := blkChk_join _ _ _ _ _ 0 47 8 h2 okM3
  have h4 : blkChk C E1.SL_e378.entry UB UBR lits 0 66 = true := blkChk_join _ _ _ _ _ 0 55 11 h3 okM4
  have h5 : blkChk C E1.SL_e378.entry UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 66 14 h4 okM5
  have h6 : blkChk C E1.SL_e378.entry UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 80 16 h5 okM6
  have h7 : blkChk C E1.SL_e378.entry UB UBR lits 0 105 = true := blkChk_join _ _ _ _ _ 0 96 9 h6 okM7
  have h8 : blkChk C E1.SL_e378.entry UB UBR lits 0 118 = true := blkChk_join _ _ _ _ _ 0 105 13 h7 okM8
  have h9 : blkChk C E1.SL_e378.entry UB UBR lits 0 129 = true := blkChk_join _ _ _ _ _ 0 118 11 h8 okM9
  have h10 : blkChk C E1.SL_e378.entry UB UBR lits 0 141 = true := blkChk_join _ _ _ _ _ 0 129 12 h9 okM10
  have h11 : blkChk C E1.SL_e378.entry UB UBR lits 0 157 = true := blkChk_join _ _ _ _ _ 0 141 16 h10 okM11
  have h12 : blkChk C E1.SL_e378.entry UB UBR lits 0 171 = true := blkChk_join _ _ _ _ _ 0 157 14 h11 okM12
  have h13 : blkChk C E1.SL_e378.entry UB UBR lits 0 185 = true := blkChk_join _ _ _ _ _ 0 171 14 h12 okM13
  have h14 : blkChk C E1.SL_e378.entry UB UBR lits 0 201 = true := blkChk_join _ _ _ _ _ 0 185 16 h13 okM14
  have h15 : blkChk C E1.SL_e378.entry UB UBR lits 0 217 = true := blkChk_join _ _ _ _ _ 0 201 16 h14 okM15
  have h16 : blkChk C E1.SL_e378.entry UB UBR lits 0 233 = true := blkChk_join _ _ _ _ _ 0 217 16 h15 okM16
  have h17 : blkChk C E1.SL_e378.entry UB UBR lits 0 249 = true := blkChk_join _ _ _ _ _ 0 233 16 h16 okM17
  have h18 : blkChk C E1.SL_e378.entry UB UBR lits 0 259 = true := blkChk_join _ _ _ _ _ 0 249 10 h17 okM18
  have h19 : blkChk C E1.SL_e378.entry UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 259 13 h18 okM19
  have h20 : blkChk C E1.SL_e378.entry UB UBR lits 0 281 = true := blkChk_join _ _ _ _ _ 0 272 9 h19 okM20
  have h21 : blkChk C E1.SL_e378.entry UB UBR lits 0 293 = true := blkChk_join _ _ _ _ _ 0 281 12 h20 okM21
  have h22 : blkChk C E1.SL_e378.entry UB UBR lits 0 309 = true := blkChk_join _ _ _ _ _ 0 293 16 h21 okM22
  have h23 : blkChk C E1.SL_e378.entry UB UBR lits 0 325 = true := blkChk_join _ _ _ _ _ 0 309 16 h22 okM23
  have h24 : blkChk C E1.SL_e378.entry UB UBR lits 0 341 = true := blkChk_join _ _ _ _ _ 0 325 16 h23 okM24
  have h25 : blkChk C E1.SL_e378.entry UB UBR lits 0 357 = true := blkChk_join _ _ _ _ _ 0 341 16 h24 okM25
  have h26 : blkChk C E1.SL_e378.entry UB UBR lits 0 373 = true := blkChk_join _ _ _ _ _ 0 357 16 h25 okM26
  have h27 : blkChk C E1.SL_e378.entry UB UBR lits 0 389 = true := blkChk_join _ _ _ _ _ 0 373 16 h26 okM27
  have h28 : blkChk C E1.SL_e378.entry UB UBR lits 0 405 = true := blkChk_join _ _ _ _ _ 0 389 16 h27 okM28
  have h29 : blkChk C E1.SL_e378.entry UB UBR lits 0 419 = true := blkChk_join _ _ _ _ _ 0 405 14 h28 okM29
  have h30 : blkChk C E1.SL_e378.entry UB UBR lits 0 435 = true := blkChk_join _ _ _ _ _ 0 419 16 h29 okM30
  have h31 : blkChk C E1.SL_e378.entry UB UBR lits 0 451 = true := blkChk_join _ _ _ _ _ 0 435 16 h30 okM31
  have h32 : blkChk C E1.SL_e378.entry UB UBR lits 0 462 = true := blkChk_join _ _ _ _ _ 0 451 11 h31 okM32
  exact h32
theorem len : lits.length = 462 := by decide
theorem okGAll : glueChkR lits W 0 462 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 32 = true := glueChkR_join _ _ 0 16 16 g0 okG1
  have g2 : glueChkR lits W 0 47 = true := glueChkR_join _ _ 0 32 15 g1 okG2
  have g3 : glueChkR lits W 0 55 = true := glueChkR_join _ _ 0 47 8 g2 okG3
  have g4 : glueChkR lits W 0 66 = true := glueChkR_join _ _ 0 55 11 g3 okG4
  have g5 : glueChkR lits W 0 80 = true := glueChkR_join _ _ 0 66 14 g4 okG5
  have g6 : glueChkR lits W 0 96 = true := glueChkR_join _ _ 0 80 16 g5 okG6
  have g7 : glueChkR lits W 0 105 = true := glueChkR_join _ _ 0 96 9 g6 okG7
  have g8 : glueChkR lits W 0 118 = true := glueChkR_join _ _ 0 105 13 g7 okG8
  have g9 : glueChkR lits W 0 129 = true := glueChkR_join _ _ 0 118 11 g8 okG9
  have g10 : glueChkR lits W 0 141 = true := glueChkR_join _ _ 0 129 12 g9 okG10
  have g11 : glueChkR lits W 0 157 = true := glueChkR_join _ _ 0 141 16 g10 okG11
  have g12 : glueChkR lits W 0 171 = true := glueChkR_join _ _ 0 157 14 g11 okG12
  have g13 : glueChkR lits W 0 185 = true := glueChkR_join _ _ 0 171 14 g12 okG13
  have g14 : glueChkR lits W 0 201 = true := glueChkR_join _ _ 0 185 16 g13 okG14
  have g15 : glueChkR lits W 0 217 = true := glueChkR_join _ _ 0 201 16 g14 okG15
  have g16 : glueChkR lits W 0 233 = true := glueChkR_join _ _ 0 217 16 g15 okG16
  have g17 : glueChkR lits W 0 249 = true := glueChkR_join _ _ 0 233 16 g16 okG17
  have g18 : glueChkR lits W 0 259 = true := glueChkR_join _ _ 0 249 10 g17 okG18
  have g19 : glueChkR lits W 0 272 = true := glueChkR_join _ _ 0 259 13 g18 okG19
  have g20 : glueChkR lits W 0 281 = true := glueChkR_join _ _ 0 272 9 g19 okG20
  have g21 : glueChkR lits W 0 293 = true := glueChkR_join _ _ 0 281 12 g20 okG21
  have g22 : glueChkR lits W 0 309 = true := glueChkR_join _ _ 0 293 16 g21 okG22
  have g23 : glueChkR lits W 0 325 = true := glueChkR_join _ _ 0 309 16 g22 okG23
  have g24 : glueChkR lits W 0 341 = true := glueChkR_join _ _ 0 325 16 g23 okG24
  have g25 : glueChkR lits W 0 357 = true := glueChkR_join _ _ 0 341 16 g24 okG25
  have g26 : glueChkR lits W 0 373 = true := glueChkR_join _ _ 0 357 16 g25 okG26
  have g27 : glueChkR lits W 0 389 = true := glueChkR_join _ _ 0 373 16 g26 okG27
  have g28 : glueChkR lits W 0 405 = true := glueChkR_join _ _ 0 389 16 g27 okG28
  have g29 : glueChkR lits W 0 419 = true := glueChkR_join _ _ 0 405 14 g28 okG29
  have g30 : glueChkR lits W 0 435 = true := glueChkR_join _ _ 0 419 16 g29 okG30
  have g31 : glueChkR lits W 0 451 = true := glueChkR_join _ _ 0 435 16 g30 okG31
  have g32 : glueChkR lits W 0 462 = true := glueChkR_join _ _ 0 451 11 g31 okG32
  exact g32
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e378.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e378.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e378.UB_eq E1.OK_e378.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C378X
