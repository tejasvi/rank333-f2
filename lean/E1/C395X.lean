module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_B0
public import E1.C395X_B1
public import E1.C395X_B2
public import E1.C395X_B3
public import E1.C395X_B4
public import E1.C395X_B5
public import E1.C395X_B6
public import E1.C395X_B7
public import E1.C395X_B8
public import E1.C395X_B9
public import E1.C395X_B10
public import E1.C395X_B11
public import E1.C395X_B12
public import E1.C395X_B13
public import E1.C395X_B14
public import E1.C395X_B15
public import E1.C395X_B16
public import E1.C395X_B17
public import E1.C395X_B18
public import E1.C395X_B19
public import E1.C395X_B20
public import E1.C395X_B21
public import E1.C395X_B22
public import E1.C395X_B23
public import E1.C395X_B24
public import E1.C395X_B25
public import E1.C395X_B26
public import E1.C395X_B27
public import E1.C395X_B28
public import E1.C395X_B29
public import E1.C395X_B30
public import E1.C395X_B31
public import E1.C395X_B32
public import E1.C395X_B33
public import E1.C395X_B34
public import E1.C395X_B35
public import E1.C395X_B36
public import E1.C395X_B37
public import E1.C395X_B38
public import E1.C395X_B39
public import E1.C395X_B40
public import E1.C395X_B41
public import E1.C395X_B42
public import E1.C395X_B43
public import E1.C395X_B44
public import E1.C395X_B45
public import E1.C395X_B46
public import E1.C395X_B47
public import E1.C395X_B48
public import E1.C395X_B49
public import E1.OK_e395
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C395X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C395X
open E1S E1.IP_e395
theorem okAll : blkChk C E1.SL_e395.entry UB UBR lits 0 575 = true := by
  have h0 : blkChk C E1.SL_e395.entry UB UBR lits 0 11 = true := okM0
  have h1 : blkChk C E1.SL_e395.entry UB UBR lits 0 22 = true := blkChk_join _ _ _ _ _ 0 11 11 h0 okM1
  have h2 : blkChk C E1.SL_e395.entry UB UBR lits 0 33 = true := blkChk_join _ _ _ _ _ 0 22 11 h1 okM2
  have h3 : blkChk C E1.SL_e395.entry UB UBR lits 0 44 = true := blkChk_join _ _ _ _ _ 0 33 11 h2 okM3
  have h4 : blkChk C E1.SL_e395.entry UB UBR lits 0 53 = true := blkChk_join _ _ _ _ _ 0 44 9 h3 okM4
  have h5 : blkChk C E1.SL_e395.entry UB UBR lits 0 66 = true := blkChk_join _ _ _ _ _ 0 53 13 h4 okM5
  have h6 : blkChk C E1.SL_e395.entry UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 66 14 h5 okM6
  have h7 : blkChk C E1.SL_e395.entry UB UBR lits 0 89 = true := blkChk_join _ _ _ _ _ 0 80 9 h6 okM7
  have h8 : blkChk C E1.SL_e395.entry UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 89 7 h7 okM8
  have h9 : blkChk C E1.SL_e395.entry UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 96 16 h8 okM9
  have h10 : blkChk C E1.SL_e395.entry UB UBR lits 0 127 = true := blkChk_join _ _ _ _ _ 0 112 15 h9 okM10
  have h11 : blkChk C E1.SL_e395.entry UB UBR lits 0 139 = true := blkChk_join _ _ _ _ _ 0 127 12 h10 okM11
  have h12 : blkChk C E1.SL_e395.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 139 10 h11 okM12
  have h13 : blkChk C E1.SL_e395.entry UB UBR lits 0 159 = true := blkChk_join _ _ _ _ _ 0 149 10 h12 okM13
  have h14 : blkChk C E1.SL_e395.entry UB UBR lits 0 166 = true := blkChk_join _ _ _ _ _ 0 159 7 h13 okM14
  have h15 : blkChk C E1.SL_e395.entry UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 166 10 h14 okM15
  have h16 : blkChk C E1.SL_e395.entry UB UBR lits 0 187 = true := blkChk_join _ _ _ _ _ 0 176 11 h15 okM16
  have h17 : blkChk C E1.SL_e395.entry UB UBR lits 0 203 = true := blkChk_join _ _ _ _ _ 0 187 16 h16 okM17
  have h18 : blkChk C E1.SL_e395.entry UB UBR lits 0 213 = true := blkChk_join _ _ _ _ _ 0 203 10 h17 okM18
  have h19 : blkChk C E1.SL_e395.entry UB UBR lits 0 223 = true := blkChk_join _ _ _ _ _ 0 213 10 h18 okM19
  have h20 : blkChk C E1.SL_e395.entry UB UBR lits 0 234 = true := blkChk_join _ _ _ _ _ 0 223 11 h19 okM20
  have h21 : blkChk C E1.SL_e395.entry UB UBR lits 0 242 = true := blkChk_join _ _ _ _ _ 0 234 8 h20 okM21
  have h22 : blkChk C E1.SL_e395.entry UB UBR lits 0 254 = true := blkChk_join _ _ _ _ _ 0 242 12 h21 okM22
  have h23 : blkChk C E1.SL_e395.entry UB UBR lits 0 265 = true := blkChk_join _ _ _ _ _ 0 254 11 h22 okM23
  have h24 : blkChk C E1.SL_e395.entry UB UBR lits 0 278 = true := blkChk_join _ _ _ _ _ 0 265 13 h23 okM24
  have h25 : blkChk C E1.SL_e395.entry UB UBR lits 0 290 = true := blkChk_join _ _ _ _ _ 0 278 12 h24 okM25
  have h26 : blkChk C E1.SL_e395.entry UB UBR lits 0 300 = true := blkChk_join _ _ _ _ _ 0 290 10 h25 okM26
  have h27 : blkChk C E1.SL_e395.entry UB UBR lits 0 309 = true := blkChk_join _ _ _ _ _ 0 300 9 h26 okM27
  have h28 : blkChk C E1.SL_e395.entry UB UBR lits 0 321 = true := blkChk_join _ _ _ _ _ 0 309 12 h27 okM28
  have h29 : blkChk C E1.SL_e395.entry UB UBR lits 0 335 = true := blkChk_join _ _ _ _ _ 0 321 14 h28 okM29
  have h30 : blkChk C E1.SL_e395.entry UB UBR lits 0 343 = true := blkChk_join _ _ _ _ _ 0 335 8 h29 okM30
  have h31 : blkChk C E1.SL_e395.entry UB UBR lits 0 354 = true := blkChk_join _ _ _ _ _ 0 343 11 h30 okM31
  have h32 : blkChk C E1.SL_e395.entry UB UBR lits 0 370 = true := blkChk_join _ _ _ _ _ 0 354 16 h31 okM32
  have h33 : blkChk C E1.SL_e395.entry UB UBR lits 0 383 = true := blkChk_join _ _ _ _ _ 0 370 13 h32 okM33
  have h34 : blkChk C E1.SL_e395.entry UB UBR lits 0 392 = true := blkChk_join _ _ _ _ _ 0 383 9 h33 okM34
  have h35 : blkChk C E1.SL_e395.entry UB UBR lits 0 407 = true := blkChk_join _ _ _ _ _ 0 392 15 h34 okM35
  have h36 : blkChk C E1.SL_e395.entry UB UBR lits 0 416 = true := blkChk_join _ _ _ _ _ 0 407 9 h35 okM36
  have h37 : blkChk C E1.SL_e395.entry UB UBR lits 0 427 = true := blkChk_join _ _ _ _ _ 0 416 11 h36 okM37
  have h38 : blkChk C E1.SL_e395.entry UB UBR lits 0 436 = true := blkChk_join _ _ _ _ _ 0 427 9 h37 okM38
  have h39 : blkChk C E1.SL_e395.entry UB UBR lits 0 444 = true := blkChk_join _ _ _ _ _ 0 436 8 h38 okM39
  have h40 : blkChk C E1.SL_e395.entry UB UBR lits 0 457 = true := blkChk_join _ _ _ _ _ 0 444 13 h39 okM40
  have h41 : blkChk C E1.SL_e395.entry UB UBR lits 0 472 = true := blkChk_join _ _ _ _ _ 0 457 15 h40 okM41
  have h42 : blkChk C E1.SL_e395.entry UB UBR lits 0 487 = true := blkChk_join _ _ _ _ _ 0 472 15 h41 okM42
  have h43 : blkChk C E1.SL_e395.entry UB UBR lits 0 501 = true := blkChk_join _ _ _ _ _ 0 487 14 h42 okM43
  have h44 : blkChk C E1.SL_e395.entry UB UBR lits 0 517 = true := blkChk_join _ _ _ _ _ 0 501 16 h43 okM44
  have h45 : blkChk C E1.SL_e395.entry UB UBR lits 0 533 = true := blkChk_join _ _ _ _ _ 0 517 16 h44 okM45
  have h46 : blkChk C E1.SL_e395.entry UB UBR lits 0 549 = true := blkChk_join _ _ _ _ _ 0 533 16 h45 okM46
  have h47 : blkChk C E1.SL_e395.entry UB UBR lits 0 562 = true := blkChk_join _ _ _ _ _ 0 549 13 h46 okM47
  have h48 : blkChk C E1.SL_e395.entry UB UBR lits 0 573 = true := blkChk_join _ _ _ _ _ 0 562 11 h47 okM48
  have h49 : blkChk C E1.SL_e395.entry UB UBR lits 0 575 = true := blkChk_join _ _ _ _ _ 0 573 2 h48 okM49
  exact h49
theorem len : lits.length = 575 := by decide
theorem okGAll : glueChkR lits W 0 575 = true := by
  have g0 : glueChkR lits W 0 11 = true := okG0
  have g1 : glueChkR lits W 0 22 = true := glueChkR_join _ _ 0 11 11 g0 okG1
  have g2 : glueChkR lits W 0 33 = true := glueChkR_join _ _ 0 22 11 g1 okG2
  have g3 : glueChkR lits W 0 44 = true := glueChkR_join _ _ 0 33 11 g2 okG3
  have g4 : glueChkR lits W 0 53 = true := glueChkR_join _ _ 0 44 9 g3 okG4
  have g5 : glueChkR lits W 0 66 = true := glueChkR_join _ _ 0 53 13 g4 okG5
  have g6 : glueChkR lits W 0 80 = true := glueChkR_join _ _ 0 66 14 g5 okG6
  have g7 : glueChkR lits W 0 89 = true := glueChkR_join _ _ 0 80 9 g6 okG7
  have g8 : glueChkR lits W 0 96 = true := glueChkR_join _ _ 0 89 7 g7 okG8
  have g9 : glueChkR lits W 0 112 = true := glueChkR_join _ _ 0 96 16 g8 okG9
  have g10 : glueChkR lits W 0 127 = true := glueChkR_join _ _ 0 112 15 g9 okG10
  have g11 : glueChkR lits W 0 139 = true := glueChkR_join _ _ 0 127 12 g10 okG11
  have g12 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 139 10 g11 okG12
  have g13 : glueChkR lits W 0 159 = true := glueChkR_join _ _ 0 149 10 g12 okG13
  have g14 : glueChkR lits W 0 166 = true := glueChkR_join _ _ 0 159 7 g13 okG14
  have g15 : glueChkR lits W 0 176 = true := glueChkR_join _ _ 0 166 10 g14 okG15
  have g16 : glueChkR lits W 0 187 = true := glueChkR_join _ _ 0 176 11 g15 okG16
  have g17 : glueChkR lits W 0 203 = true := glueChkR_join _ _ 0 187 16 g16 okG17
  have g18 : glueChkR lits W 0 213 = true := glueChkR_join _ _ 0 203 10 g17 okG18
  have g19 : glueChkR lits W 0 223 = true := glueChkR_join _ _ 0 213 10 g18 okG19
  have g20 : glueChkR lits W 0 234 = true := glueChkR_join _ _ 0 223 11 g19 okG20
  have g21 : glueChkR lits W 0 242 = true := glueChkR_join _ _ 0 234 8 g20 okG21
  have g22 : glueChkR lits W 0 254 = true := glueChkR_join _ _ 0 242 12 g21 okG22
  have g23 : glueChkR lits W 0 265 = true := glueChkR_join _ _ 0 254 11 g22 okG23
  have g24 : glueChkR lits W 0 278 = true := glueChkR_join _ _ 0 265 13 g23 okG24
  have g25 : glueChkR lits W 0 290 = true := glueChkR_join _ _ 0 278 12 g24 okG25
  have g26 : glueChkR lits W 0 300 = true := glueChkR_join _ _ 0 290 10 g25 okG26
  have g27 : glueChkR lits W 0 309 = true := glueChkR_join _ _ 0 300 9 g26 okG27
  have g28 : glueChkR lits W 0 321 = true := glueChkR_join _ _ 0 309 12 g27 okG28
  have g29 : glueChkR lits W 0 335 = true := glueChkR_join _ _ 0 321 14 g28 okG29
  have g30 : glueChkR lits W 0 343 = true := glueChkR_join _ _ 0 335 8 g29 okG30
  have g31 : glueChkR lits W 0 354 = true := glueChkR_join _ _ 0 343 11 g30 okG31
  have g32 : glueChkR lits W 0 370 = true := glueChkR_join _ _ 0 354 16 g31 okG32
  have g33 : glueChkR lits W 0 383 = true := glueChkR_join _ _ 0 370 13 g32 okG33
  have g34 : glueChkR lits W 0 392 = true := glueChkR_join _ _ 0 383 9 g33 okG34
  have g35 : glueChkR lits W 0 407 = true := glueChkR_join _ _ 0 392 15 g34 okG35
  have g36 : glueChkR lits W 0 416 = true := glueChkR_join _ _ 0 407 9 g35 okG36
  have g37 : glueChkR lits W 0 427 = true := glueChkR_join _ _ 0 416 11 g36 okG37
  have g38 : glueChkR lits W 0 436 = true := glueChkR_join _ _ 0 427 9 g37 okG38
  have g39 : glueChkR lits W 0 444 = true := glueChkR_join _ _ 0 436 8 g38 okG39
  have g40 : glueChkR lits W 0 457 = true := glueChkR_join _ _ 0 444 13 g39 okG40
  have g41 : glueChkR lits W 0 472 = true := glueChkR_join _ _ 0 457 15 g40 okG41
  have g42 : glueChkR lits W 0 487 = true := glueChkR_join _ _ 0 472 15 g41 okG42
  have g43 : glueChkR lits W 0 501 = true := glueChkR_join _ _ 0 487 14 g42 okG43
  have g44 : glueChkR lits W 0 517 = true := glueChkR_join _ _ 0 501 16 g43 okG44
  have g45 : glueChkR lits W 0 533 = true := glueChkR_join _ _ 0 517 16 g44 okG45
  have g46 : glueChkR lits W 0 549 = true := glueChkR_join _ _ 0 533 16 g45 okG46
  have g47 : glueChkR lits W 0 562 = true := glueChkR_join _ _ 0 549 13 g46 okG47
  have g48 : glueChkR lits W 0 573 = true := glueChkR_join _ _ 0 562 11 g47 okG48
  have g49 : glueChkR lits W 0 575 = true := glueChkR_join _ _ 0 573 2 g48 okG49
  exact g49
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e395.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e395.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e395.UB_eq E1.OK_e395.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C395X
