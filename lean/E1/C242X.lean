module
public import R22Port.U_d41d8cd98f00
public import E1.C242X_B0
public import E1.C242X_B1
public import E1.C242X_B2
public import E1.C242X_B3
public import E1.C242X_B4
public import E1.C242X_B5
public import E1.OK_e242
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C242X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C242X
open E1S E1.IP_e242
theorem okAll : blkChk C E1.SL_e242.entry UB UBR lits 0 84 = true := by
  have h0 : blkChk C E1.SL_e242.entry UB UBR lits 0 14 = true := okM0
  have h1 : blkChk C E1.SL_e242.entry UB UBR lits 0 29 = true := blkChk_join _ _ _ _ _ 0 14 15 h0 okM1
  have h2 : blkChk C E1.SL_e242.entry UB UBR lits 0 41 = true := blkChk_join _ _ _ _ _ 0 29 12 h1 okM2
  have h3 : blkChk C E1.SL_e242.entry UB UBR lits 0 57 = true := blkChk_join _ _ _ _ _ 0 41 16 h2 okM3
  have h4 : blkChk C E1.SL_e242.entry UB UBR lits 0 73 = true := blkChk_join _ _ _ _ _ 0 57 16 h3 okM4
  have h5 : blkChk C E1.SL_e242.entry UB UBR lits 0 84 = true := blkChk_join _ _ _ _ _ 0 73 11 h4 okM5
  exact h5
theorem len : lits.length = 84 := by decide
theorem okGAll : glueChkR lits W 0 84 = true := by
  have g0 : glueChkR lits W 0 14 = true := okG0
  have g1 : glueChkR lits W 0 29 = true := glueChkR_join _ _ 0 14 15 g0 okG1
  have g2 : glueChkR lits W 0 41 = true := glueChkR_join _ _ 0 29 12 g1 okG2
  have g3 : glueChkR lits W 0 57 = true := glueChkR_join _ _ 0 41 16 g2 okG3
  have g4 : glueChkR lits W 0 73 = true := glueChkR_join _ _ 0 57 16 g3 okG4
  have g5 : glueChkR lits W 0 84 = true := glueChkR_join _ _ 0 73 11 g4 okG5
  exact g5
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e242.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e242.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e242.UB_eq E1.OK_e242.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C242X
