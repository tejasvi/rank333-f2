module
public import R22Port.U_d41d8cd98f00
public import E1.C204X_B0
public import E1.C204X_B1
public import E1.C204X_B2
public import E1.C204X_B3
public import E1.C204X_B4
public import E1.C204X_B5
public import E1.C204X_B6
public import E1.C204X_B7
public import E1.C204X_B8
public import E1.C204X_B9
public import E1.C204X_B10
public import E1.C204X_B11
public import E1.C204X_B12
public import E1.C204X_B13
public import E1.C204X_B14
public import E1.C204X_B15
public import E1.C204X_B16
public import E1.C204X_B17
public import E1.C204X_B18
public import E1.C204X_B19
public import E1.C204X_B20
public import E1.C204X_B21
public import E1.C204X_B22
public import E1.C204X_B23
public import E1.C204X_B24
public import E1.C204X_B25
public import E1.C204X_B26
public import E1.C204X_B27
public import E1.C204X_B28
public import E1.C204X_B29
public import E1.C204X_B30
public import E1.C204X_B31
public import E1.C204X_B32
public import E1.OK_e204
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C204X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C204X
open E1S E1.IP_e204
theorem okAll : blkChk C E1.SL_e204.entry UB UBR lits 0 442 = true := by
  have h0 : blkChk C E1.SL_e204.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e204.entry UB UBR lits 0 29 = true := blkChk_join _ _ _ _ _ 0 16 13 h0 okM1
  have h2 : blkChk C E1.SL_e204.entry UB UBR lits 0 45 = true := blkChk_join _ _ _ _ _ 0 29 16 h1 okM2
  have h3 : blkChk C E1.SL_e204.entry UB UBR lits 0 61 = true := blkChk_join _ _ _ _ _ 0 45 16 h2 okM3
  have h4 : blkChk C E1.SL_e204.entry UB UBR lits 0 77 = true := blkChk_join _ _ _ _ _ 0 61 16 h3 okM4
  have h5 : blkChk C E1.SL_e204.entry UB UBR lits 0 91 = true := blkChk_join _ _ _ _ _ 0 77 14 h4 okM5
  have h6 : blkChk C E1.SL_e204.entry UB UBR lits 0 107 = true := blkChk_join _ _ _ _ _ 0 91 16 h5 okM6
  have h7 : blkChk C E1.SL_e204.entry UB UBR lits 0 122 = true := blkChk_join _ _ _ _ _ 0 107 15 h6 okM7
  have h8 : blkChk C E1.SL_e204.entry UB UBR lits 0 131 = true := blkChk_join _ _ _ _ _ 0 122 9 h7 okM8
  have h9 : blkChk C E1.SL_e204.entry UB UBR lits 0 141 = true := blkChk_join _ _ _ _ _ 0 131 10 h8 okM9
  have h10 : blkChk C E1.SL_e204.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 141 8 h9 okM10
  have h11 : blkChk C E1.SL_e204.entry UB UBR lits 0 161 = true := blkChk_join _ _ _ _ _ 0 149 12 h10 okM11
  have h12 : blkChk C E1.SL_e204.entry UB UBR lits 0 170 = true := blkChk_join _ _ _ _ _ 0 161 9 h11 okM12
  have h13 : blkChk C E1.SL_e204.entry UB UBR lits 0 185 = true := blkChk_join _ _ _ _ _ 0 170 15 h12 okM13
  have h14 : blkChk C E1.SL_e204.entry UB UBR lits 0 195 = true := blkChk_join _ _ _ _ _ 0 185 10 h13 okM14
  have h15 : blkChk C E1.SL_e204.entry UB UBR lits 0 211 = true := blkChk_join _ _ _ _ _ 0 195 16 h14 okM15
  have h16 : blkChk C E1.SL_e204.entry UB UBR lits 0 221 = true := blkChk_join _ _ _ _ _ 0 211 10 h15 okM16
  have h17 : blkChk C E1.SL_e204.entry UB UBR lits 0 228 = true := blkChk_join _ _ _ _ _ 0 221 7 h16 okM17
  have h18 : blkChk C E1.SL_e204.entry UB UBR lits 0 239 = true := blkChk_join _ _ _ _ _ 0 228 11 h17 okM18
  have h19 : blkChk C E1.SL_e204.entry UB UBR lits 0 250 = true := blkChk_join _ _ _ _ _ 0 239 11 h18 okM19
  have h20 : blkChk C E1.SL_e204.entry UB UBR lits 0 265 = true := blkChk_join _ _ _ _ _ 0 250 15 h19 okM20
  have h21 : blkChk C E1.SL_e204.entry UB UBR lits 0 281 = true := blkChk_join _ _ _ _ _ 0 265 16 h20 okM21
  have h22 : blkChk C E1.SL_e204.entry UB UBR lits 0 297 = true := blkChk_join _ _ _ _ _ 0 281 16 h21 okM22
  have h23 : blkChk C E1.SL_e204.entry UB UBR lits 0 313 = true := blkChk_join _ _ _ _ _ 0 297 16 h22 okM23
  have h24 : blkChk C E1.SL_e204.entry UB UBR lits 0 329 = true := blkChk_join _ _ _ _ _ 0 313 16 h23 okM24
  have h25 : blkChk C E1.SL_e204.entry UB UBR lits 0 345 = true := blkChk_join _ _ _ _ _ 0 329 16 h24 okM25
  have h26 : blkChk C E1.SL_e204.entry UB UBR lits 0 361 = true := blkChk_join _ _ _ _ _ 0 345 16 h25 okM26
  have h27 : blkChk C E1.SL_e204.entry UB UBR lits 0 376 = true := blkChk_join _ _ _ _ _ 0 361 15 h26 okM27
  have h28 : blkChk C E1.SL_e204.entry UB UBR lits 0 392 = true := blkChk_join _ _ _ _ _ 0 376 16 h27 okM28
  have h29 : blkChk C E1.SL_e204.entry UB UBR lits 0 408 = true := blkChk_join _ _ _ _ _ 0 392 16 h28 okM29
  have h30 : blkChk C E1.SL_e204.entry UB UBR lits 0 424 = true := blkChk_join _ _ _ _ _ 0 408 16 h29 okM30
  have h31 : blkChk C E1.SL_e204.entry UB UBR lits 0 440 = true := blkChk_join _ _ _ _ _ 0 424 16 h30 okM31
  have h32 : blkChk C E1.SL_e204.entry UB UBR lits 0 442 = true := blkChk_join _ _ _ _ _ 0 440 2 h31 okM32
  exact h32
theorem len : lits.length = 442 := by decide
theorem okGAll : glueChkR lits W 0 442 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 29 = true := glueChkR_join _ _ 0 16 13 g0 okG1
  have g2 : glueChkR lits W 0 45 = true := glueChkR_join _ _ 0 29 16 g1 okG2
  have g3 : glueChkR lits W 0 61 = true := glueChkR_join _ _ 0 45 16 g2 okG3
  have g4 : glueChkR lits W 0 77 = true := glueChkR_join _ _ 0 61 16 g3 okG4
  have g5 : glueChkR lits W 0 91 = true := glueChkR_join _ _ 0 77 14 g4 okG5
  have g6 : glueChkR lits W 0 107 = true := glueChkR_join _ _ 0 91 16 g5 okG6
  have g7 : glueChkR lits W 0 122 = true := glueChkR_join _ _ 0 107 15 g6 okG7
  have g8 : glueChkR lits W 0 131 = true := glueChkR_join _ _ 0 122 9 g7 okG8
  have g9 : glueChkR lits W 0 141 = true := glueChkR_join _ _ 0 131 10 g8 okG9
  have g10 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 141 8 g9 okG10
  have g11 : glueChkR lits W 0 161 = true := glueChkR_join _ _ 0 149 12 g10 okG11
  have g12 : glueChkR lits W 0 170 = true := glueChkR_join _ _ 0 161 9 g11 okG12
  have g13 : glueChkR lits W 0 185 = true := glueChkR_join _ _ 0 170 15 g12 okG13
  have g14 : glueChkR lits W 0 195 = true := glueChkR_join _ _ 0 185 10 g13 okG14
  have g15 : glueChkR lits W 0 211 = true := glueChkR_join _ _ 0 195 16 g14 okG15
  have g16 : glueChkR lits W 0 221 = true := glueChkR_join _ _ 0 211 10 g15 okG16
  have g17 : glueChkR lits W 0 228 = true := glueChkR_join _ _ 0 221 7 g16 okG17
  have g18 : glueChkR lits W 0 239 = true := glueChkR_join _ _ 0 228 11 g17 okG18
  have g19 : glueChkR lits W 0 250 = true := glueChkR_join _ _ 0 239 11 g18 okG19
  have g20 : glueChkR lits W 0 265 = true := glueChkR_join _ _ 0 250 15 g19 okG20
  have g21 : glueChkR lits W 0 281 = true := glueChkR_join _ _ 0 265 16 g20 okG21
  have g22 : glueChkR lits W 0 297 = true := glueChkR_join _ _ 0 281 16 g21 okG22
  have g23 : glueChkR lits W 0 313 = true := glueChkR_join _ _ 0 297 16 g22 okG23
  have g24 : glueChkR lits W 0 329 = true := glueChkR_join _ _ 0 313 16 g23 okG24
  have g25 : glueChkR lits W 0 345 = true := glueChkR_join _ _ 0 329 16 g24 okG25
  have g26 : glueChkR lits W 0 361 = true := glueChkR_join _ _ 0 345 16 g25 okG26
  have g27 : glueChkR lits W 0 376 = true := glueChkR_join _ _ 0 361 15 g26 okG27
  have g28 : glueChkR lits W 0 392 = true := glueChkR_join _ _ 0 376 16 g27 okG28
  have g29 : glueChkR lits W 0 408 = true := glueChkR_join _ _ 0 392 16 g28 okG29
  have g30 : glueChkR lits W 0 424 = true := glueChkR_join _ _ 0 408 16 g29 okG30
  have g31 : glueChkR lits W 0 440 = true := glueChkR_join _ _ 0 424 16 g30 okG31
  have g32 : glueChkR lits W 0 442 = true := glueChkR_join _ _ 0 440 2 g31 okG32
  exact g32
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e204.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e204.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e204.UB_eq E1.OK_e204.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C204X
