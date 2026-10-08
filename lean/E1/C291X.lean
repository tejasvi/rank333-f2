module
public import R22Port.U_d41d8cd98f00
public import E1.C291X_B0
public import E1.C291X_B1
public import E1.C291X_B2
public import E1.C291X_B3
public import E1.C291X_B4
public import E1.C291X_B5
public import E1.C291X_B6
public import E1.C291X_B7
public import E1.C291X_B8
public import E1.C291X_B9
public import E1.C291X_B10
public import E1.C291X_B11
public import E1.C291X_B12
public import E1.C291X_B13
public import E1.C291X_B14
public import E1.C291X_B15
public import E1.C291X_B16
public import E1.C291X_B17
public import E1.C291X_B18
public import E1.C291X_B19
public import E1.C291X_B20
public import E1.C291X_B21
public import E1.C291X_B22
public import E1.C291X_B23
public import E1.C291X_B24
public import E1.C291X_B25
public import E1.C291X_B26
public import E1.C291X_B27
public import E1.C291X_B28
public import E1.C291X_B29
public import E1.C291X_B30
public import E1.C291X_B31
public import E1.C291X_B32
public import E1.C291X_B33
public import E1.C291X_B34
public import E1.C291X_B35
public import E1.C291X_B36
public import E1.C291X_B37
public import E1.C291X_B38
public import E1.C291X_B39
public import E1.C291X_B40
public import E1.C291X_B41
public import E1.C291X_B42
public import E1.C291X_B43
public import E1.C291X_B44
public import E1.C291X_B45
public import E1.C291X_B46
public import E1.C291X_B47
public import E1.C291X_B48
public import E1.C291X_B49
public import E1.C291X_B50
public import E1.OK_e291
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C291X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C291X
open E1S E1.IP_e291
theorem okAll : blkChk C E1.SL_e291.entry UB UBR lits 0 549 = true := by
  have h0 : blkChk C E1.SL_e291.entry UB UBR lits 0 11 = true := okM0
  have h1 : blkChk C E1.SL_e291.entry UB UBR lits 0 22 = true := blkChk_join _ _ _ _ _ 0 11 11 h0 okM1
  have h2 : blkChk C E1.SL_e291.entry UB UBR lits 0 30 = true := blkChk_join _ _ _ _ _ 0 22 8 h1 okM2
  have h3 : blkChk C E1.SL_e291.entry UB UBR lits 0 42 = true := blkChk_join _ _ _ _ _ 0 30 12 h2 okM3
  have h4 : blkChk C E1.SL_e291.entry UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 42 10 h3 okM4
  have h5 : blkChk C E1.SL_e291.entry UB UBR lits 0 65 = true := blkChk_join _ _ _ _ _ 0 52 13 h4 okM5
  have h6 : blkChk C E1.SL_e291.entry UB UBR lits 0 73 = true := blkChk_join _ _ _ _ _ 0 65 8 h5 okM6
  have h7 : blkChk C E1.SL_e291.entry UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 73 11 h6 okM7
  have h8 : blkChk C E1.SL_e291.entry UB UBR lits 0 95 = true := blkChk_join _ _ _ _ _ 0 84 11 h7 okM8
  have h9 : blkChk C E1.SL_e291.entry UB UBR lits 0 106 = true := blkChk_join _ _ _ _ _ 0 95 11 h8 okM9
  have h10 : blkChk C E1.SL_e291.entry UB UBR lits 0 119 = true := blkChk_join _ _ _ _ _ 0 106 13 h9 okM10
  have h11 : blkChk C E1.SL_e291.entry UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 119 9 h10 okM11
  have h12 : blkChk C E1.SL_e291.entry UB UBR lits 0 136 = true := blkChk_join _ _ _ _ _ 0 128 8 h11 okM12
  have h13 : blkChk C E1.SL_e291.entry UB UBR lits 0 152 = true := blkChk_join _ _ _ _ _ 0 136 16 h12 okM13
  have h14 : blkChk C E1.SL_e291.entry UB UBR lits 0 159 = true := blkChk_join _ _ _ _ _ 0 152 7 h13 okM14
  have h15 : blkChk C E1.SL_e291.entry UB UBR lits 0 170 = true := blkChk_join _ _ _ _ _ 0 159 11 h14 okM15
  have h16 : blkChk C E1.SL_e291.entry UB UBR lits 0 180 = true := blkChk_join _ _ _ _ _ 0 170 10 h15 okM16
  have h17 : blkChk C E1.SL_e291.entry UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 180 12 h16 okM17
  have h18 : blkChk C E1.SL_e291.entry UB UBR lits 0 203 = true := blkChk_join _ _ _ _ _ 0 192 11 h17 okM18
  have h19 : blkChk C E1.SL_e291.entry UB UBR lits 0 215 = true := blkChk_join _ _ _ _ _ 0 203 12 h18 okM19
  have h20 : blkChk C E1.SL_e291.entry UB UBR lits 0 225 = true := blkChk_join _ _ _ _ _ 0 215 10 h19 okM20
  have h21 : blkChk C E1.SL_e291.entry UB UBR lits 0 238 = true := blkChk_join _ _ _ _ _ 0 225 13 h20 okM21
  have h22 : blkChk C E1.SL_e291.entry UB UBR lits 0 248 = true := blkChk_join _ _ _ _ _ 0 238 10 h21 okM22
  have h23 : blkChk C E1.SL_e291.entry UB UBR lits 0 259 = true := blkChk_join _ _ _ _ _ 0 248 11 h22 okM23
  have h24 : blkChk C E1.SL_e291.entry UB UBR lits 0 270 = true := blkChk_join _ _ _ _ _ 0 259 11 h23 okM24
  have h25 : blkChk C E1.SL_e291.entry UB UBR lits 0 283 = true := blkChk_join _ _ _ _ _ 0 270 13 h24 okM25
  have h26 : blkChk C E1.SL_e291.entry UB UBR lits 0 292 = true := blkChk_join _ _ _ _ _ 0 283 9 h25 okM26
  have h27 : blkChk C E1.SL_e291.entry UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 292 12 h26 okM27
  have h28 : blkChk C E1.SL_e291.entry UB UBR lits 0 313 = true := blkChk_join _ _ _ _ _ 0 304 9 h27 okM28
  have h29 : blkChk C E1.SL_e291.entry UB UBR lits 0 321 = true := blkChk_join _ _ _ _ _ 0 313 8 h28 okM29
  have h30 : blkChk C E1.SL_e291.entry UB UBR lits 0 330 = true := blkChk_join _ _ _ _ _ 0 321 9 h29 okM30
  have h31 : blkChk C E1.SL_e291.entry UB UBR lits 0 340 = true := blkChk_join _ _ _ _ _ 0 330 10 h30 okM31
  have h32 : blkChk C E1.SL_e291.entry UB UBR lits 0 350 = true := blkChk_join _ _ _ _ _ 0 340 10 h31 okM32
  have h33 : blkChk C E1.SL_e291.entry UB UBR lits 0 366 = true := blkChk_join _ _ _ _ _ 0 350 16 h32 okM33
  have h34 : blkChk C E1.SL_e291.entry UB UBR lits 0 378 = true := blkChk_join _ _ _ _ _ 0 366 12 h33 okM34
  have h35 : blkChk C E1.SL_e291.entry UB UBR lits 0 385 = true := blkChk_join _ _ _ _ _ 0 378 7 h34 okM35
  have h36 : blkChk C E1.SL_e291.entry UB UBR lits 0 400 = true := blkChk_join _ _ _ _ _ 0 385 15 h35 okM36
  have h37 : blkChk C E1.SL_e291.entry UB UBR lits 0 408 = true := blkChk_join _ _ _ _ _ 0 400 8 h36 okM37
  have h38 : blkChk C E1.SL_e291.entry UB UBR lits 0 424 = true := blkChk_join _ _ _ _ _ 0 408 16 h37 okM38
  have h39 : blkChk C E1.SL_e291.entry UB UBR lits 0 434 = true := blkChk_join _ _ _ _ _ 0 424 10 h38 okM39
  have h40 : blkChk C E1.SL_e291.entry UB UBR lits 0 449 = true := blkChk_join _ _ _ _ _ 0 434 15 h39 okM40
  have h41 : blkChk C E1.SL_e291.entry UB UBR lits 0 459 = true := blkChk_join _ _ _ _ _ 0 449 10 h40 okM41
  have h42 : blkChk C E1.SL_e291.entry UB UBR lits 0 470 = true := blkChk_join _ _ _ _ _ 0 459 11 h41 okM42
  have h43 : blkChk C E1.SL_e291.entry UB UBR lits 0 480 = true := blkChk_join _ _ _ _ _ 0 470 10 h42 okM43
  have h44 : blkChk C E1.SL_e291.entry UB UBR lits 0 489 = true := blkChk_join _ _ _ _ _ 0 480 9 h43 okM44
  have h45 : blkChk C E1.SL_e291.entry UB UBR lits 0 499 = true := blkChk_join _ _ _ _ _ 0 489 10 h44 okM45
  have h46 : blkChk C E1.SL_e291.entry UB UBR lits 0 509 = true := blkChk_join _ _ _ _ _ 0 499 10 h45 okM46
  have h47 : blkChk C E1.SL_e291.entry UB UBR lits 0 523 = true := blkChk_join _ _ _ _ _ 0 509 14 h46 okM47
  have h48 : blkChk C E1.SL_e291.entry UB UBR lits 0 535 = true := blkChk_join _ _ _ _ _ 0 523 12 h47 okM48
  have h49 : blkChk C E1.SL_e291.entry UB UBR lits 0 545 = true := blkChk_join _ _ _ _ _ 0 535 10 h48 okM49
  have h50 : blkChk C E1.SL_e291.entry UB UBR lits 0 549 = true := blkChk_join _ _ _ _ _ 0 545 4 h49 okM50
  exact h50
theorem len : lits.length = 549 := by decide
theorem okGAll : glueChkR lits W 0 549 = true := by
  have g0 : glueChkR lits W 0 11 = true := okG0
  have g1 : glueChkR lits W 0 22 = true := glueChkR_join _ _ 0 11 11 g0 okG1
  have g2 : glueChkR lits W 0 30 = true := glueChkR_join _ _ 0 22 8 g1 okG2
  have g3 : glueChkR lits W 0 42 = true := glueChkR_join _ _ 0 30 12 g2 okG3
  have g4 : glueChkR lits W 0 52 = true := glueChkR_join _ _ 0 42 10 g3 okG4
  have g5 : glueChkR lits W 0 65 = true := glueChkR_join _ _ 0 52 13 g4 okG5
  have g6 : glueChkR lits W 0 73 = true := glueChkR_join _ _ 0 65 8 g5 okG6
  have g7 : glueChkR lits W 0 84 = true := glueChkR_join _ _ 0 73 11 g6 okG7
  have g8 : glueChkR lits W 0 95 = true := glueChkR_join _ _ 0 84 11 g7 okG8
  have g9 : glueChkR lits W 0 106 = true := glueChkR_join _ _ 0 95 11 g8 okG9
  have g10 : glueChkR lits W 0 119 = true := glueChkR_join _ _ 0 106 13 g9 okG10
  have g11 : glueChkR lits W 0 128 = true := glueChkR_join _ _ 0 119 9 g10 okG11
  have g12 : glueChkR lits W 0 136 = true := glueChkR_join _ _ 0 128 8 g11 okG12
  have g13 : glueChkR lits W 0 152 = true := glueChkR_join _ _ 0 136 16 g12 okG13
  have g14 : glueChkR lits W 0 159 = true := glueChkR_join _ _ 0 152 7 g13 okG14
  have g15 : glueChkR lits W 0 170 = true := glueChkR_join _ _ 0 159 11 g14 okG15
  have g16 : glueChkR lits W 0 180 = true := glueChkR_join _ _ 0 170 10 g15 okG16
  have g17 : glueChkR lits W 0 192 = true := glueChkR_join _ _ 0 180 12 g16 okG17
  have g18 : glueChkR lits W 0 203 = true := glueChkR_join _ _ 0 192 11 g17 okG18
  have g19 : glueChkR lits W 0 215 = true := glueChkR_join _ _ 0 203 12 g18 okG19
  have g20 : glueChkR lits W 0 225 = true := glueChkR_join _ _ 0 215 10 g19 okG20
  have g21 : glueChkR lits W 0 238 = true := glueChkR_join _ _ 0 225 13 g20 okG21
  have g22 : glueChkR lits W 0 248 = true := glueChkR_join _ _ 0 238 10 g21 okG22
  have g23 : glueChkR lits W 0 259 = true := glueChkR_join _ _ 0 248 11 g22 okG23
  have g24 : glueChkR lits W 0 270 = true := glueChkR_join _ _ 0 259 11 g23 okG24
  have g25 : glueChkR lits W 0 283 = true := glueChkR_join _ _ 0 270 13 g24 okG25
  have g26 : glueChkR lits W 0 292 = true := glueChkR_join _ _ 0 283 9 g25 okG26
  have g27 : glueChkR lits W 0 304 = true := glueChkR_join _ _ 0 292 12 g26 okG27
  have g28 : glueChkR lits W 0 313 = true := glueChkR_join _ _ 0 304 9 g27 okG28
  have g29 : glueChkR lits W 0 321 = true := glueChkR_join _ _ 0 313 8 g28 okG29
  have g30 : glueChkR lits W 0 330 = true := glueChkR_join _ _ 0 321 9 g29 okG30
  have g31 : glueChkR lits W 0 340 = true := glueChkR_join _ _ 0 330 10 g30 okG31
  have g32 : glueChkR lits W 0 350 = true := glueChkR_join _ _ 0 340 10 g31 okG32
  have g33 : glueChkR lits W 0 366 = true := glueChkR_join _ _ 0 350 16 g32 okG33
  have g34 : glueChkR lits W 0 378 = true := glueChkR_join _ _ 0 366 12 g33 okG34
  have g35 : glueChkR lits W 0 385 = true := glueChkR_join _ _ 0 378 7 g34 okG35
  have g36 : glueChkR lits W 0 400 = true := glueChkR_join _ _ 0 385 15 g35 okG36
  have g37 : glueChkR lits W 0 408 = true := glueChkR_join _ _ 0 400 8 g36 okG37
  have g38 : glueChkR lits W 0 424 = true := glueChkR_join _ _ 0 408 16 g37 okG38
  have g39 : glueChkR lits W 0 434 = true := glueChkR_join _ _ 0 424 10 g38 okG39
  have g40 : glueChkR lits W 0 449 = true := glueChkR_join _ _ 0 434 15 g39 okG40
  have g41 : glueChkR lits W 0 459 = true := glueChkR_join _ _ 0 449 10 g40 okG41
  have g42 : glueChkR lits W 0 470 = true := glueChkR_join _ _ 0 459 11 g41 okG42
  have g43 : glueChkR lits W 0 480 = true := glueChkR_join _ _ 0 470 10 g42 okG43
  have g44 : glueChkR lits W 0 489 = true := glueChkR_join _ _ 0 480 9 g43 okG44
  have g45 : glueChkR lits W 0 499 = true := glueChkR_join _ _ 0 489 10 g44 okG45
  have g46 : glueChkR lits W 0 509 = true := glueChkR_join _ _ 0 499 10 g45 okG46
  have g47 : glueChkR lits W 0 523 = true := glueChkR_join _ _ 0 509 14 g46 okG47
  have g48 : glueChkR lits W 0 535 = true := glueChkR_join _ _ 0 523 12 g47 okG48
  have g49 : glueChkR lits W 0 545 = true := glueChkR_join _ _ 0 535 10 g48 okG49
  have g50 : glueChkR lits W 0 549 = true := glueChkR_join _ _ 0 545 4 g49 okG50
  exact g50
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e291.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e291.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e291.UB_eq E1.OK_e291.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C291X
