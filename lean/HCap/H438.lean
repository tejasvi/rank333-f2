module
public import R22Port.U_d41d8cd98f00
public import HCap.H438_B0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The E1G chain `H438`: every block accepted, every header record glued (witness table `W`), so no `x` satisfying
the global facts completes the chain's first start state -/
namespace E1G.H438
open E1GS E1G.IP_h438
def W : List (List Nat) := [[]]
theorem okAll : blkChk C (E1G.slc E1G.SL_h438.chunk) UB UBR lits 0 1 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h438.chunk) UB UBR lits 0 1 = true := okB0
  exact h0
theorem len : lits.length = 1 := by decide
theorem okGlue : glueChk lits W = true := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- no `x` with the global facts completes the start state of the chain's first block -/
theorem no_start (x : ℕ → ℕ) (hg : Glob C x) (hsl : ∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h438.chunk) i))
    (hxub : ∀ l < 127, x l ≤ E1G.fld UB l) (hx : ∃ l < 127, 0 < x l) :
    ¬ StartOK x (fun l => E1G.fld UB l) (lits.getD 0 0) :=
  chain_sound C (E1G.slc E1G.SL_h438.chunk) UB UBR (fun l => E1G.fld UB l) x hg hsl UB_eq UBR_eq (by decide +kernel)
    hxub hx lits (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) (glueChk_spec _ _ okGlue) 0 (by rw [len]; decide)
end E1G.H438
