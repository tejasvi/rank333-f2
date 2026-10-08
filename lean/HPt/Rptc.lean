module
public import R22Port.U_d41d8cd98f00
public import HPt.Rptc_B0
public import HPt.Rptc_B1
public import HPt.Rptc_B2
public import HPt.Rptc_B3
public import HPt.Rptc_B4
public import HPt.Rptc_B5
public import HPt.Rptc_B6
public import HPt.Rptc_B7
public import HPt.Rptc_B8
public import HPt.Rptc_B9
public import HPt.Rptc_B10
public import HPt.Rptc_B11
public import HPt.Rptc_B12
public import HPt.Rptc_B13
public import HPt.Rptc_B14
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The root level of `Rptc`: the top chain from the root, its frontier records glued to the 2352 jobs of the header table.
`root`: if every job is covered (`JobOK` of its header), no `x` with the global facts exists (the L479 glue's `EnumOK`). -/
namespace E1P.Rptc
open E1PS E1P.IP_ptc
theorem okAll : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 120 = true := by
  have h0 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 8 = true := okB0
  have h1 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 16 = true := blkChk_join _ _ _ _ _ 0 8 8 h0 okB1
  have h2 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 24 = true := blkChk_join _ _ _ _ _ 0 16 8 h1 okB2
  have h3 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 24 8 h2 okB3
  have h4 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 40 = true := blkChk_join _ _ _ _ _ 0 32 8 h3 okB4
  have h5 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 40 8 h4 okB5
  have h6 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 56 = true := blkChk_join _ _ _ _ _ 0 48 8 h5 okB6
  have h7 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 56 8 h6 okB7
  have h8 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 72 = true := blkChk_join _ _ _ _ _ 0 64 8 h7 okB8
  have h9 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 72 8 h8 okB9
  have h10 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 88 = true := blkChk_join _ _ _ _ _ 0 80 8 h9 okB10
  have h11 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 88 8 h10 okB11
  have h12 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 104 = true := blkChk_join _ _ _ _ _ 0 96 8 h11 okB12
  have h13 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 104 8 h12 okB13
  have h14 : blkChk C (E1P.slc E1P.SL_ptc.chunk) UB UBR lits 0 120 = true := blkChk_join _ _ _ _ _ 0 112 8 h13 okB14
  exact h14
theorem len : lits.length = 120 := by decide
theorem okGlue : glueChkW lits 2352 E1P.Rptc_HT.entry E1P.Rptc_Wf = true := by decide +kernel
theorem okRoot : lits.getD 0 0 % 2 ^ 14 = 0 := by decide +kernel
theorem UB_eq : UB = V (fun l => E1P.fld UB l) := by
  rw [show V (fun l => E1P.fld UB l) = pkL 256 (fun l => E1P.fld UB l) 255 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1P.fld UB l) := by
  rw [show VR (fun l => E1P.fld UB l) = pkL 256 (fun j => E1P.fld UB (254 - j)) 255 from (pkL_eq _ _ _).symm]; decide +kernel
/-- **the root level**: the jobs' coverage gives the canonical-point statement -/
theorem root (hjobs : ∀ k < 2352, JobOK C (E1P.slc E1P.SL_ptc.chunk) UB (E1P.Rptc_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 19, SlotV x ((E1P.slc E1P.SL_ptc.chunk) i)) → (∀ l < 255, x l ≤ E1P.fld UB l) →
      (∃ l < 255, 0 < x l) → False :=
  enum_of_chain_w C (E1P.slc E1P.SL_ptc.chunk) UB UBR UB_eq UBR_eq (by decide +kernel) lits 2352 E1P.Rptc_HT.entry E1P.Rptc_Wf (by rw [len]; decide) okRoot
    (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) okGlue hjobs
end E1P.Rptc
