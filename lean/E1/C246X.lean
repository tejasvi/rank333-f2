module
public import R22Port.U_d41d8cd98f00
public import E1.C246X_B0
public import E1.C246X_B1
public import E1.C246X_B2
public import E1.C246X_B3
public import E1.C246X_B4
public import E1.C246X_B5
public import E1.C246X_B6
public import E1.C246X_B7
public import E1.C246X_B8
public import E1.C246X_B9
public import E1.C246X_B10
public import E1.OK_e246
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C246X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C246X
open E1S E1.IP_e246
theorem okAll : blkChk C E1.SL_e246.entry UB UBR lits 0 165 = true := by
  have h0 : blkChk C E1.SL_e246.entry UB UBR lits 0 13 = true := okM0
  have h1 : blkChk C E1.SL_e246.entry UB UBR lits 0 27 = true := blkChk_join _ _ _ _ _ 0 13 14 h0 okM1
  have h2 : blkChk C E1.SL_e246.entry UB UBR lits 0 43 = true := blkChk_join _ _ _ _ _ 0 27 16 h1 okM2
  have h3 : blkChk C E1.SL_e246.entry UB UBR lits 0 59 = true := blkChk_join _ _ _ _ _ 0 43 16 h2 okM3
  have h4 : blkChk C E1.SL_e246.entry UB UBR lits 0 75 = true := blkChk_join _ _ _ _ _ 0 59 16 h3 okM4
  have h5 : blkChk C E1.SL_e246.entry UB UBR lits 0 89 = true := blkChk_join _ _ _ _ _ 0 75 14 h4 okM5
  have h6 : blkChk C E1.SL_e246.entry UB UBR lits 0 102 = true := blkChk_join _ _ _ _ _ 0 89 13 h5 okM6
  have h7 : blkChk C E1.SL_e246.entry UB UBR lits 0 118 = true := blkChk_join _ _ _ _ _ 0 102 16 h6 okM7
  have h8 : blkChk C E1.SL_e246.entry UB UBR lits 0 133 = true := blkChk_join _ _ _ _ _ 0 118 15 h7 okM8
  have h9 : blkChk C E1.SL_e246.entry UB UBR lits 0 149 = true := blkChk_join _ _ _ _ _ 0 133 16 h8 okM9
  have h10 : blkChk C E1.SL_e246.entry UB UBR lits 0 165 = true := blkChk_join _ _ _ _ _ 0 149 16 h9 okM10
  exact h10
theorem len : lits.length = 165 := by decide
theorem okGAll : glueChkR lits W 0 165 = true := by
  have g0 : glueChkR lits W 0 13 = true := okG0
  have g1 : glueChkR lits W 0 27 = true := glueChkR_join _ _ 0 13 14 g0 okG1
  have g2 : glueChkR lits W 0 43 = true := glueChkR_join _ _ 0 27 16 g1 okG2
  have g3 : glueChkR lits W 0 59 = true := glueChkR_join _ _ 0 43 16 g2 okG3
  have g4 : glueChkR lits W 0 75 = true := glueChkR_join _ _ 0 59 16 g3 okG4
  have g5 : glueChkR lits W 0 89 = true := glueChkR_join _ _ 0 75 14 g4 okG5
  have g6 : glueChkR lits W 0 102 = true := glueChkR_join _ _ 0 89 13 g5 okG6
  have g7 : glueChkR lits W 0 118 = true := glueChkR_join _ _ 0 102 16 g6 okG7
  have g8 : glueChkR lits W 0 133 = true := glueChkR_join _ _ 0 118 15 g7 okG8
  have g9 : glueChkR lits W 0 149 = true := glueChkR_join _ _ 0 133 16 g8 okG9
  have g10 : glueChkR lits W 0 165 = true := glueChkR_join _ _ 0 149 16 g9 okG10
  exact g10
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e246.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e246.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e246.UB_eq E1.OK_e246.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C246X
