module
public import R22Port.U_d41d8cd98f00
public import E1.C150X_B0
public import E1.C150X_B1
public import E1.C150X_B2
public import E1.C150X_B3
public import E1.C150X_B4
public import E1.C150X_B5
public import E1.OK_e150
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The chain `C150X`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1.C150X
open E1S E1.IP_e150
def W : List (List Nat) := [[1], [2], [3], [4], [5], []]
theorem okAll : blkChk C E1.SL_e150.entry UB UBR lits 0 6 = true := by
  have h0 : blkChk C E1.SL_e150.entry UB UBR lits 0 1 = true := okB0
  have h1 : blkChk C E1.SL_e150.entry UB UBR lits 0 2 = true := blkChk_join _ _ _ _ _ 0 1 1 h0 okB1
  have h2 : blkChk C E1.SL_e150.entry UB UBR lits 0 3 = true := blkChk_join _ _ _ _ _ 0 2 1 h1 okB2
  have h3 : blkChk C E1.SL_e150.entry UB UBR lits 0 4 = true := blkChk_join _ _ _ _ _ 0 3 1 h2 okB3
  have h4 : blkChk C E1.SL_e150.entry UB UBR lits 0 5 = true := blkChk_join _ _ _ _ _ 0 4 1 h3 okB4
  have h5 : blkChk C E1.SL_e150.entry UB UBR lits 0 6 = true := blkChk_join _ _ _ _ _ 0 5 1 h4 okB5
  exact h5
theorem len : lits.length = 6 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x (E1.SL_e150.entry i))
    (hxub : ∀ l < 127, x l ≤ E1.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1.fld UB l) (lits.getD 0 0) :=
  chain_sound C E1.SL_e150.entry UB UBR (fun l => E1.fld UB l) x hg hsl E1.OK_e150.UB_eq E1.OK_e150.UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1.C150X
