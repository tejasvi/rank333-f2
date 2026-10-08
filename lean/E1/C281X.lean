module
public import R22Port.U_d41d8cd98f00
public import E1.C281X_B0
public import E1.C281X_B1
public import E1.C281X_B2
public import E1.OK_e281
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C281X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C281X
open E1S E1.IP_e281
theorem okAll : blkChk C E1.SL_e281.entry UB UBR lits 0 35 = true := by
  have h0 : blkChk C E1.SL_e281.entry UB UBR lits 0 16 = true := okM0
  have h1 : blkChk C E1.SL_e281.entry UB UBR lits 0 27 = true := blkChk_join _ _ _ _ _ 0 16 11 h0 okM1
  have h2 : blkChk C E1.SL_e281.entry UB UBR lits 0 35 = true := blkChk_join _ _ _ _ _ 0 27 8 h1 okM2
  exact h2
theorem len : lits.length = 35 := by decide
theorem okGAll : glueChkR lits W 0 35 = true := by
  have g0 : glueChkR lits W 0 16 = true := okG0
  have g1 : glueChkR lits W 0 27 = true := glueChkR_join _ _ 0 16 11 g0 okG1
  have g2 : glueChkR lits W 0 35 = true := glueChkR_join _ _ 0 27 8 g1 okG2
  exact g2
theorem okGlue : glueChk lits W = true := glueChkR_full _ _ (len ▸ okGAll)
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e281.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e281.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e281.UB_eq E1.OK_e281.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C281X
