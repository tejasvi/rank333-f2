module
public import R22Port.U_d41d8cd98f00
public import E1.C336X_B0
public import E1.OK_e336
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C336X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C336X
open E1S E1.IP_e336
theorem okAll : blkChk C E1.SL_e336.entry UB UBR lits 0 11 = true := by
  have h0 : blkChk C E1.SL_e336.entry UB UBR lits 0 11 = true := okM0
  exact h0
theorem len : lits.length = 11 := by decide
theorem okGAll : glueChkR lits W 0 11 = true := by
  have g0 : glueChkR lits W 0 11 = true := okG0
  exact g0
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e336.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e336.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e336.UB_eq E1.OK_e336.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C336X
