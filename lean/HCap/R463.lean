module
public import R22Port.U_d41d8cd98f00
public import HCap.R463_B0
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The root level of `R463`: the top chain from the root, its frontier records glued to the 1667 jobs of the header table.
`root`: if every job is covered (`JobOK` of its header), no `x` with the global facts exists (the L479 glue's `EnumOK`). -/
namespace E1G.R463
open E1GS E1G.IP_h463
theorem okAll : blkChk C (E1G.slc E1G.SL_h463.chunk) UB UBR lits 0 9 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h463.chunk) UB UBR lits 0 9 = true := okB0
  exact h0
theorem len : lits.length = 9 := by decide
theorem okGlue : glueChkW lits 1667 E1G.R463_HT.entry E1G.R463_Wf = true := by decide +kernel
theorem okRoot : lits.getD 0 0 % 2 ^ 13 = 0 := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- **the root level**: the jobs' coverage gives the canonical-point statement -/
theorem root (hjobs : ∀ k < 1667, JobOK C (E1G.slc E1G.SL_h463.chunk) UB (E1G.R463_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h463.chunk) i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False :=
  enum_of_chain_w C (E1G.slc E1G.SL_h463.chunk) UB UBR UB_eq UBR_eq (by decide +kernel) lits 1667 E1G.R463_HT.entry E1G.R463_Wf (by rw [len]; decide) okRoot
    (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) okGlue hjobs
end E1G.R463
