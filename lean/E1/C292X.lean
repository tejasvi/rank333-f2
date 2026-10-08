module
public import R22Port.U_d41d8cd98f00
public import E1.C292X_B0
public import E1.C292X_B1
public import E1.OK_e292
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C292X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C292X
open E1S E1.IP_e292
theorem okAll : blkChk C E1.SL_e292.entry UB UBR lits 0 16 = true := by
  have h0 : blkChk C E1.SL_e292.entry UB UBR lits 0 12 = true := okM0
  have h1 : blkChk C E1.SL_e292.entry UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 12 4 h0 okM1
  exact h1
theorem len : lits.length = 16 := by decide
theorem okGAll : glueChkR lits W 0 16 = true := by
  have g0 : glueChkR lits W 0 12 = true := okG0
  have g1 : glueChkR lits W 0 16 = true := glueChkR_join _ _ 0 12 4 g0 okG1
  exact g1
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e292.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e292.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e292.UB_eq E1.OK_e292.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C292X
