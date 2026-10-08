module
public import R22Port.U_d41d8cd98f00
public import HCap.R454_B0
public import HCap.R454_B1
public import HCap.R454_B2
public import HCap.R454_B3
public import HCap.R454_B4
public import HCap.R454_B5
public import HCap.R454_B6
public import HCap.R454_B7
public import HCap.R454_B8
public import HCap.R454_B9
public import HCap.R454_B10
public import HCap.R454_B11
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The root level of `R454`: the top chain from the root, its frontier records glued to the 27623 jobs of the header table.
`root`: if every job is covered (`JobOK` of its header), no `x` with the global facts exists (the L479 glue's `EnumOK`). -/
namespace E1G.R454
open E1GS E1G.IP_h454
theorem okAll : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 188 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 16 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 16 16 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 32 16 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 48 16 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 64 16 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 80 16 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 96 16 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 112 16 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 128 16 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 144 16 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 160 16 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_h454.chunk) UB UBR lits 0 188 = true := blkChk_join _ _ _ _ _ 0 176 12 h10 okB11
  exact h11
theorem len : lits.length = 188 := by decide
theorem okGlue : glueChkW lits 27623 E1G.R454_HT.entry E1G.R454_Wf = true := by decide +kernel
theorem okRoot : lits.getD 0 0 % 2 ^ 13 = 0 := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- **the root level**: the jobs' coverage gives the canonical-point statement -/
theorem root (hjobs : ∀ k < 27623, JobOK C (E1G.slc E1G.SL_h454.chunk) UB (E1G.R454_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h454.chunk) i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False :=
  enum_of_chain_w C (E1G.slc E1G.SL_h454.chunk) UB UBR UB_eq UBR_eq (by decide +kernel) lits 27623 E1G.R454_HT.entry E1G.R454_Wf (by rw [len]; decide) okRoot
    (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) okGlue hjobs
end E1G.R454
