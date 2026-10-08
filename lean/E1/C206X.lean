module
public import R22Port.U_d41d8cd98f00
public import E1.C206X_B0
public import E1.C206X_B1
public import E1.C206X_B2
public import E1.C206X_B3
public import E1.C206X_B4
public import E1.C206X_B5
public import E1.C206X_B6
public import E1.C206X_B7
public import E1.C206X_B8
public import E1.C206X_B9
public import E1.C206X_B10
public import E1.C206X_B11
public import E1.C206X_B12
public import E1.C206X_B13
public import E1.C206X_B14
public import E1.C206X_B15
public import E1.C206X_B16
public import E1.C206X_B17
public import E1.C206X_B18
public import E1.C206X_B19
public import E1.C206X_B20
public import E1.OK_e206
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C206X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C206X
open E1S E1.IP_e206
theorem okAll : blkChk C E1.SL_e206.entry UB UBR lits 0 271 = true := by
  have h0 : blkChk C E1.SL_e206.entry UB UBR lits 0 13 = true := okM0
  have h1 : blkChk C E1.SL_e206.entry UB UBR lits 0 21 = true := blkChk_join _ _ _ _ _ 0 13 8 h0 okM1
  have h2 : blkChk C E1.SL_e206.entry UB UBR lits 0 33 = true := blkChk_join _ _ _ _ _ 0 21 12 h1 okM2
  have h3 : blkChk C E1.SL_e206.entry UB UBR lits 0 43 = true := blkChk_join _ _ _ _ _ 0 33 10 h2 okM3
  have h4 : blkChk C E1.SL_e206.entry UB UBR lits 0 59 = true := blkChk_join _ _ _ _ _ 0 43 16 h3 okM4
  have h5 : blkChk C E1.SL_e206.entry UB UBR lits 0 75 = true := blkChk_join _ _ _ _ _ 0 59 16 h4 okM5
  have h6 : blkChk C E1.SL_e206.entry UB UBR lits 0 89 = true := blkChk_join _ _ _ _ _ 0 75 14 h5 okM6
  have h7 : blkChk C E1.SL_e206.entry UB UBR lits 0 99 = true := blkChk_join _ _ _ _ _ 0 89 10 h6 okM7
  have h8 : blkChk C E1.SL_e206.entry UB UBR lits 0 110 = true := blkChk_join _ _ _ _ _ 0 99 11 h7 okM8
  have h9 : blkChk C E1.SL_e206.entry UB UBR lits 0 121 = true := blkChk_join _ _ _ _ _ 0 110 11 h8 okM9
  have h10 : blkChk C E1.SL_e206.entry UB UBR lits 0 137 = true := blkChk_join _ _ _ _ _ 0 121 16 h9 okM10
  have h11 : blkChk C E1.SL_e206.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 137 12 h10 okM11
  have h12 : blkChk C E1.SL_e206.entry UB UBR lits 0 165 = true := blkChk_join _ _ _ _ _ 0 149 16 h11 okM12
  have h13 : blkChk C E1.SL_e206.entry UB UBR lits 0 180 = true := blkChk_join _ _ _ _ _ 0 165 15 h12 okM13
  have h14 : blkChk C E1.SL_e206.entry UB UBR lits 0 196 = true := blkChk_join _ _ _ _ _ 0 180 16 h13 okM14
  have h15 : blkChk C E1.SL_e206.entry UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 196 12 h14 okM15
  have h16 : blkChk C E1.SL_e206.entry UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 208 16 h15 okM16
  have h17 : blkChk C E1.SL_e206.entry UB UBR lits 0 239 = true := blkChk_join _ _ _ _ _ 0 224 15 h16 okM17
  have h18 : blkChk C E1.SL_e206.entry UB UBR lits 0 252 = true := blkChk_join _ _ _ _ _ 0 239 13 h17 okM18
  have h19 : blkChk C E1.SL_e206.entry UB UBR lits 0 268 = true := blkChk_join _ _ _ _ _ 0 252 16 h18 okM19
  have h20 : blkChk C E1.SL_e206.entry UB UBR lits 0 271 = true := blkChk_join _ _ _ _ _ 0 268 3 h19 okM20
  exact h20
theorem len : lits.length = 271 := by decide
theorem okGAll : glueChkR lits W 0 271 = true := by
  have g0 : glueChkR lits W 0 13 = true := okG0
  have g1 : glueChkR lits W 0 21 = true := glueChkR_join _ _ 0 13 8 g0 okG1
  have g2 : glueChkR lits W 0 33 = true := glueChkR_join _ _ 0 21 12 g1 okG2
  have g3 : glueChkR lits W 0 43 = true := glueChkR_join _ _ 0 33 10 g2 okG3
  have g4 : glueChkR lits W 0 59 = true := glueChkR_join _ _ 0 43 16 g3 okG4
  have g5 : glueChkR lits W 0 75 = true := glueChkR_join _ _ 0 59 16 g4 okG5
  have g6 : glueChkR lits W 0 89 = true := glueChkR_join _ _ 0 75 14 g5 okG6
  have g7 : glueChkR lits W 0 99 = true := glueChkR_join _ _ 0 89 10 g6 okG7
  have g8 : glueChkR lits W 0 110 = true := glueChkR_join _ _ 0 99 11 g7 okG8
  have g9 : glueChkR lits W 0 121 = true := glueChkR_join _ _ 0 110 11 g8 okG9
  have g10 : glueChkR lits W 0 137 = true := glueChkR_join _ _ 0 121 16 g9 okG10
  have g11 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 137 12 g10 okG11
  have g12 : glueChkR lits W 0 165 = true := glueChkR_join _ _ 0 149 16 g11 okG12
  have g13 : glueChkR lits W 0 180 = true := glueChkR_join _ _ 0 165 15 g12 okG13
  have g14 : glueChkR lits W 0 196 = true := glueChkR_join _ _ 0 180 16 g13 okG14
  have g15 : glueChkR lits W 0 208 = true := glueChkR_join _ _ 0 196 12 g14 okG15
  have g16 : glueChkR lits W 0 224 = true := glueChkR_join _ _ 0 208 16 g15 okG16
  have g17 : glueChkR lits W 0 239 = true := glueChkR_join _ _ 0 224 15 g16 okG17
  have g18 : glueChkR lits W 0 252 = true := glueChkR_join _ _ 0 239 13 g17 okG18
  have g19 : glueChkR lits W 0 268 = true := glueChkR_join _ _ 0 252 16 g18 okG19
  have g20 : glueChkR lits W 0 271 = true := glueChkR_join _ _ 0 268 3 g19 okG20
  exact g20
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e206.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e206.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e206.UB_eq E1.OK_e206.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C206X
