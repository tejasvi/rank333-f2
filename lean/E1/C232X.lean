module
public import R22Port.U_d41d8cd98f00
public import E1.C232X_B0
public import E1.C232X_B1
public import E1.C232X_B2
public import E1.C232X_B3
public import E1.C232X_B4
public import E1.OK_e232
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C232X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C232X
open E1S E1.IP_e232
theorem okAll : blkChk C E1.SL_e232.entry UB UBR lits 0 52 = true := by
  have h0 : blkChk C E1.SL_e232.entry UB UBR lits 0 10 = true := okM0
  have h1 : blkChk C E1.SL_e232.entry UB UBR lits 0 22 = true := blkChk_join _ _ _ _ _ 0 10 12 h0 okM1
  have h2 : blkChk C E1.SL_e232.entry UB UBR lits 0 35 = true := blkChk_join _ _ _ _ _ 0 22 13 h1 okM2
  have h3 : blkChk C E1.SL_e232.entry UB UBR lits 0 45 = true := blkChk_join _ _ _ _ _ 0 35 10 h2 okM3
  have h4 : blkChk C E1.SL_e232.entry UB UBR lits 0 52 = true := blkChk_join _ _ _ _ _ 0 45 7 h3 okM4
  exact h4
theorem len : lits.length = 52 := by decide
theorem okGAll : glueChkR lits W 0 52 = true := by
  have g0 : glueChkR lits W 0 10 = true := okG0
  have g1 : glueChkR lits W 0 22 = true := glueChkR_join _ _ 0 10 12 g0 okG1
  have g2 : glueChkR lits W 0 35 = true := glueChkR_join _ _ 0 22 13 g1 okG2
  have g3 : glueChkR lits W 0 45 = true := glueChkR_join _ _ 0 35 10 g2 okG3
  have g4 : glueChkR lits W 0 52 = true := glueChkR_join _ _ 0 45 7 g3 okG4
  exact g4
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e232.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e232.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e232.UB_eq E1.OK_e232.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C232X
