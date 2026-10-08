module
public import R22Port.U_d41d8cd98f00
public import E1.C304X_B0
public import E1.C304X_B1
public import E1.C304X_B2
public import E1.C304X_B3
public import E1.C304X_B4
public import E1.C304X_B5
public import E1.C304X_B6
public import E1.C304X_B7
public import E1.C304X_B8
public import E1.C304X_B9
public import E1.C304X_B10
public import E1.C304X_B11
public import E1.C304X_B12
public import E1.C304X_B13
public import E1.C304X_B14
public import E1.C304X_B15
public import E1.C304X_B16
public import E1.C304X_B17
public import E1.C304X_B18
public import E1.C304X_B19
public import E1.C304X_B20
public import E1.C304X_B21
public import E1.C304X_B22
public import E1.C304X_B23
public import E1.C304X_B24
public import E1.C304X_B25
public import E1.C304X_B26
public import E1.C304X_B27
public import E1.C304X_B28
public import E1.C304X_B29
public import E1.C304X_B30
public import E1.C304X_B31
public import E1.C304X_B32
public import E1.C304X_B33
public import E1.C304X_B34
public import E1.C304X_B35
public import E1.C304X_B36
public import E1.OK_e304
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C304X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C304X
open E1S E1.IP_e304
theorem okAll : blkChk C E1.SL_e304.entry UB UBR lits 0 357 = true := by
  have h0 : blkChk C E1.SL_e304.entry UB UBR lits 0 9 = true := okM0
  have h1 : blkChk C E1.SL_e304.entry UB UBR lits 0 23 = true := blkChk_join _ _ _ _ _ 0 9 14 h0 okM1
  have h2 : blkChk C E1.SL_e304.entry UB UBR lits 0 31 = true := blkChk_join _ _ _ _ _ 0 23 8 h1 okM2
  have h3 : blkChk C E1.SL_e304.entry UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 31 9 h2 okM3
  have h4 : blkChk C E1.SL_e304.entry UB UBR lits 0 49 = true := blkChk_join _ _ _ _ _ 0 40 9 h3 okM4
  have h5 : blkChk C E1.SL_e304.entry UB UBR lits 0 58 = true := blkChk_join _ _ _ _ _ 0 49 9 h4 okM5
  have h6 : blkChk C E1.SL_e304.entry UB UBR lits 0 67 = true := blkChk_join _ _ _ _ _ 0 58 9 h5 okM6
  have h7 : blkChk C E1.SL_e304.entry UB UBR lits 0 78 = true := blkChk_join _ _ _ _ _ 0 67 11 h6 okM7
  have h8 : blkChk C E1.SL_e304.entry UB UBR lits 0 87 = true := blkChk_join _ _ _ _ _ 0 78 9 h7 okM8
  have h9 : blkChk C E1.SL_e304.entry UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 87 9 h8 okM9
  have h10 : blkChk C E1.SL_e304.entry UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 96 8 h9 okM10
  have h11 : blkChk C E1.SL_e304.entry UB UBR lits 0 113 = true := blkChk_join _ _ _ _ _ 0 104 9 h10 okM11
  have h12 : blkChk C E1.SL_e304.entry UB UBR lits 0 121 = true := blkChk_join _ _ _ _ _ 0 113 8 h11 okM12
  have h13 : blkChk C E1.SL_e304.entry UB UBR lits 0 134 = true := blkChk_join _ _ _ _ _ 0 121 13 h12 okM13
  have h14 : blkChk C E1.SL_e304.entry UB UBR lits 0 145 = true := blkChk_join _ _ _ _ _ 0 134 11 h13 okM14
  have h15 : blkChk C E1.SL_e304.entry UB UBR lits 0 156 = true := blkChk_join _ _ _ _ _ 0 145 11 h14 okM15
  have h16 : blkChk C E1.SL_e304.entry UB UBR lits 0 168 = true := blkChk_join _ _ _ _ _ 0 156 12 h15 okM16
  have h17 : blkChk C E1.SL_e304.entry UB UBR lits 0 178 = true := blkChk_join _ _ _ _ _ 0 168 10 h16 okM17
  have h18 : blkChk C E1.SL_e304.entry UB UBR lits 0 189 = true := blkChk_join _ _ _ _ _ 0 178 11 h17 okM18
  have h19 : blkChk C E1.SL_e304.entry UB UBR lits 0 199 = true := blkChk_join _ _ _ _ _ 0 189 10 h18 okM19
  have h20 : blkChk C E1.SL_e304.entry UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 199 9 h19 okM20
  have h21 : blkChk C E1.SL_e304.entry UB UBR lits 0 219 = true := blkChk_join _ _ _ _ _ 0 208 11 h20 okM21
  have h22 : blkChk C E1.SL_e304.entry UB UBR lits 0 229 = true := blkChk_join _ _ _ _ _ 0 219 10 h21 okM22
  have h23 : blkChk C E1.SL_e304.entry UB UBR lits 0 240 = true := blkChk_join _ _ _ _ _ 0 229 11 h22 okM23
  have h24 : blkChk C E1.SL_e304.entry UB UBR lits 0 253 = true := blkChk_join _ _ _ _ _ 0 240 13 h23 okM24
  have h25 : blkChk C E1.SL_e304.entry UB UBR lits 0 262 = true := blkChk_join _ _ _ _ _ 0 253 9 h24 okM25
  have h26 : blkChk C E1.SL_e304.entry UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 262 10 h25 okM26
  have h27 : blkChk C E1.SL_e304.entry UB UBR lits 0 280 = true := blkChk_join _ _ _ _ _ 0 272 8 h26 okM27
  have h28 : blkChk C E1.SL_e304.entry UB UBR lits 0 287 = true := blkChk_join _ _ _ _ _ 0 280 7 h27 okM28
  have h29 : blkChk C E1.SL_e304.entry UB UBR lits 0 297 = true := blkChk_join _ _ _ _ _ 0 287 10 h28 okM29
  have h30 : blkChk C E1.SL_e304.entry UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 297 7 h29 okM30
  have h31 : blkChk C E1.SL_e304.entry UB UBR lits 0 314 = true := blkChk_join _ _ _ _ _ 0 304 10 h30 okM31
  have h32 : blkChk C E1.SL_e304.entry UB UBR lits 0 324 = true := blkChk_join _ _ _ _ _ 0 314 10 h31 okM32
  have h33 : blkChk C E1.SL_e304.entry UB UBR lits 0 334 = true := blkChk_join _ _ _ _ _ 0 324 10 h32 okM33
  have h34 : blkChk C E1.SL_e304.entry UB UBR lits 0 347 = true := blkChk_join _ _ _ _ _ 0 334 13 h33 okM34
  have h35 : blkChk C E1.SL_e304.entry UB UBR lits 0 353 = true := blkChk_join _ _ _ _ _ 0 347 6 h34 okM35
  have h36 : blkChk C E1.SL_e304.entry UB UBR lits 0 357 = true := blkChk_join _ _ _ _ _ 0 353 4 h35 okM36
  exact h36
theorem len : lits.length = 357 := by decide
theorem okGAll : glueChkR lits W 0 357 = true := by
  have g0 : glueChkR lits W 0 9 = true := okG0
  have g1 : glueChkR lits W 0 23 = true := glueChkR_join _ _ 0 9 14 g0 okG1
  have g2 : glueChkR lits W 0 31 = true := glueChkR_join _ _ 0 23 8 g1 okG2
  have g3 : glueChkR lits W 0 40 = true := glueChkR_join _ _ 0 31 9 g2 okG3
  have g4 : glueChkR lits W 0 49 = true := glueChkR_join _ _ 0 40 9 g3 okG4
  have g5 : glueChkR lits W 0 58 = true := glueChkR_join _ _ 0 49 9 g4 okG5
  have g6 : glueChkR lits W 0 67 = true := glueChkR_join _ _ 0 58 9 g5 okG6
  have g7 : glueChkR lits W 0 78 = true := glueChkR_join _ _ 0 67 11 g6 okG7
  have g8 : glueChkR lits W 0 87 = true := glueChkR_join _ _ 0 78 9 g7 okG8
  have g9 : glueChkR lits W 0 96 = true := glueChkR_join _ _ 0 87 9 g8 okG9
  have g10 : glueChkR lits W 0 104 = true := glueChkR_join _ _ 0 96 8 g9 okG10
  have g11 : glueChkR lits W 0 113 = true := glueChkR_join _ _ 0 104 9 g10 okG11
  have g12 : glueChkR lits W 0 121 = true := glueChkR_join _ _ 0 113 8 g11 okG12
  have g13 : glueChkR lits W 0 134 = true := glueChkR_join _ _ 0 121 13 g12 okG13
  have g14 : glueChkR lits W 0 145 = true := glueChkR_join _ _ 0 134 11 g13 okG14
  have g15 : glueChkR lits W 0 156 = true := glueChkR_join _ _ 0 145 11 g14 okG15
  have g16 : glueChkR lits W 0 168 = true := glueChkR_join _ _ 0 156 12 g15 okG16
  have g17 : glueChkR lits W 0 178 = true := glueChkR_join _ _ 0 168 10 g16 okG17
  have g18 : glueChkR lits W 0 189 = true := glueChkR_join _ _ 0 178 11 g17 okG18
  have g19 : glueChkR lits W 0 199 = true := glueChkR_join _ _ 0 189 10 g18 okG19
  have g20 : glueChkR lits W 0 208 = true := glueChkR_join _ _ 0 199 9 g19 okG20
  have g21 : glueChkR lits W 0 219 = true := glueChkR_join _ _ 0 208 11 g20 okG21
  have g22 : glueChkR lits W 0 229 = true := glueChkR_join _ _ 0 219 10 g21 okG22
  have g23 : glueChkR lits W 0 240 = true := glueChkR_join _ _ 0 229 11 g22 okG23
  have g24 : glueChkR lits W 0 253 = true := glueChkR_join _ _ 0 240 13 g23 okG24
  have g25 : glueChkR lits W 0 262 = true := glueChkR_join _ _ 0 253 9 g24 okG25
  have g26 : glueChkR lits W 0 272 = true := glueChkR_join _ _ 0 262 10 g25 okG26
  have g27 : glueChkR lits W 0 280 = true := glueChkR_join _ _ 0 272 8 g26 okG27
  have g28 : glueChkR lits W 0 287 = true := glueChkR_join _ _ 0 280 7 g27 okG28
  have g29 : glueChkR lits W 0 297 = true := glueChkR_join _ _ 0 287 10 g28 okG29
  have g30 : glueChkR lits W 0 304 = true := glueChkR_join _ _ 0 297 7 g29 okG30
  have g31 : glueChkR lits W 0 314 = true := glueChkR_join _ _ 0 304 10 g30 okG31
  have g32 : glueChkR lits W 0 324 = true := glueChkR_join _ _ 0 314 10 g31 okG32
  have g33 : glueChkR lits W 0 334 = true := glueChkR_join _ _ 0 324 10 g32 okG33
  have g34 : glueChkR lits W 0 347 = true := glueChkR_join _ _ 0 334 13 g33 okG34
  have g35 : glueChkR lits W 0 353 = true := glueChkR_join _ _ 0 347 6 g34 okG35
  have g36 : glueChkR lits W 0 357 = true := glueChkR_join _ _ 0 353 4 g35 okG36
  exact g36
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e304.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e304.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e304.UB_eq E1.OK_e304.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C304X
