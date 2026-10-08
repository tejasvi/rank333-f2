module
public import R22Port.U_d41d8cd98f00
public import E1.C408X_B0
public import E1.C408X_B1
public import E1.C408X_B2
public import E1.C408X_B3
public import E1.C408X_B4
public import E1.C408X_B5
public import E1.C408X_B6
public import E1.C408X_B7
public import E1.C408X_B8
public import E1.C408X_B9
public import E1.C408X_B10
public import E1.C408X_B11
public import E1.C408X_B12
public import E1.C408X_B13
public import E1.OK_e408
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C408X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C408X
open E1S E1.IP_e408
theorem okAll : blkChk C E1.SL_e408.entry UB UBR lits 0 188 = true := by
  have h0 : blkChk C E1.SL_e408.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e408.entry UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 16 16 h0 okM1
  have h2 : blkChk C E1.SL_e408.entry UB UBR lits 0 46 = true := blkChk_join _ _ _ _ _ 0 32 14 h1 okM2
  have h3 : blkChk C E1.SL_e408.entry UB UBR lits 0 59 = true := blkChk_join _ _ _ _ _ 0 46 13 h2 okM3
  have h4 : blkChk C E1.SL_e408.entry UB UBR lits 0 69 = true := blkChk_join _ _ _ _ _ 0 59 10 h3 okM4
  have h5 : blkChk C E1.SL_e408.entry UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 69 15 h4 okM5
  have h6 : blkChk C E1.SL_e408.entry UB UBR lits 0 98 = true := blkChk_join _ _ _ _ _ 0 84 14 h5 okM6
  have h7 : blkChk C E1.SL_e408.entry UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 98 14 h6 okM7
  have h8 : blkChk C E1.SL_e408.entry UB UBR lits 0 125 = true := blkChk_join _ _ _ _ _ 0 112 13 h7 okM8
  have h9 : blkChk C E1.SL_e408.entry UB UBR lits 0 138 = true := blkChk_join _ _ _ _ _ 0 125 13 h8 okM9
  have h10 : blkChk C E1.SL_e408.entry UB UBR lits 0 154 = true := blkChk_join _ _ _ _ _ 0 138 16 h9 okM10
  have h11 : blkChk C E1.SL_e408.entry UB UBR lits 0 166 = true := blkChk_join _ _ _ _ _ 0 154 12 h10 okM11
  have h12 : blkChk C E1.SL_e408.entry UB UBR lits 0 182 = true := blkChk_join _ _ _ _ _ 0 166 16 h11 okM12
  have h13 : blkChk C E1.SL_e408.entry UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 182 6 h12 okM13
  exact h13
theorem len : lits.length = 188 := by decide
theorem okGAll : glueChkR lits W 0 188 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 32 = true := glueChkR_join _ _ 0 16 16 g0 okG1
  have g2 : glueChkR lits W 0 46 = true := glueChkR_join _ _ 0 32 14 g1 okG2
  have g3 : glueChkR lits W 0 59 = true := glueChkR_join _ _ 0 46 13 g2 okG3
  have g4 : glueChkR lits W 0 69 = true := glueChkR_join _ _ 0 59 10 g3 okG4
  have g5 : glueChkR lits W 0 84 = true := glueChkR_join _ _ 0 69 15 g4 okG5
  have g6 : glueChkR lits W 0 98 = true := glueChkR_join _ _ 0 84 14 g5 okG6
  have g7 : glueChkR lits W 0 112 = true := glueChkR_join _ _ 0 98 14 g6 okG7
  have g8 : glueChkR lits W 0 125 = true := glueChkR_join _ _ 0 112 13 g7 okG8
  have g9 : glueChkR lits W 0 138 = true := glueChkR_join _ _ 0 125 13 g8 okG9
  have g10 : glueChkR lits W 0 154 = true := glueChkR_join _ _ 0 138 16 g9 okG10
  have g11 : glueChkR lits W 0 166 = true := glueChkR_join _ _ 0 154 12 g10 okG11
  have g12 : glueChkR lits W 0 182 = true := glueChkR_join _ _ 0 166 16 g11 okG12
  have g13 : glueChkR lits W 0 188 = true := glueChkR_join _ _ 0 182 6 g12 okG13
  exact g13
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e408.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e408.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e408.UB_eq E1.OK_e408.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C408X
