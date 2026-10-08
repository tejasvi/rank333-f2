module
public import R22Port.U_d41d8cd98f00
public import HCap.R487_B0
public import HCap.R487_B1
public import HCap.R487_B2
public import HCap.R487_B3
public import HCap.R487_B4
public import HCap.R487_B5
public import HCap.R487_B6
public import HCap.R487_B7
public import HCap.R487_B8
public import HCap.R487_B9
public import HCap.R487_B10
public import HCap.R487_B11
public import HCap.R487_B12
public import HCap.R487_B13
public import HCap.R487_B14
public import HCap.R487_B15
public import HCap.R487_B16
public import HCap.R487_B17
public import HCap.R487_B18
public import HCap.R487_B19
public import HCap.R487_B20
public import HCap.R487_B21
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The root level of `R487`: the top chain from the root, its frontier records glued to the 37363 jobs of the header table.
`root`: if every job is covered (`JobOK` of its header), no `x` with the global facts exists (the L479 glue's `EnumOK`). -/
namespace E1G.R487
open E1GS E1G.IP_h487
theorem okAll : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 339 = true := by
  have h0 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 16 = true := okB0
  have h1 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 32 = true := blkChk_join _ _ _ _ _ 0 16 16 h0 okB1
  have h2 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 48 = true := blkChk_join _ _ _ _ _ 0 32 16 h1 okB2
  have h3 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 64 = true := blkChk_join _ _ _ _ _ 0 48 16 h2 okB3
  have h4 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 80 = true := blkChk_join _ _ _ _ _ 0 64 16 h3 okB4
  have h5 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 96 = true := blkChk_join _ _ _ _ _ 0 80 16 h4 okB5
  have h6 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 112 = true := blkChk_join _ _ _ _ _ 0 96 16 h5 okB6
  have h7 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 128 = true := blkChk_join _ _ _ _ _ 0 112 16 h6 okB7
  have h8 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 144 = true := blkChk_join _ _ _ _ _ 0 128 16 h7 okB8
  have h9 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 160 = true := blkChk_join _ _ _ _ _ 0 144 16 h8 okB9
  have h10 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 176 = true := blkChk_join _ _ _ _ _ 0 160 16 h9 okB10
  have h11 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 192 = true := blkChk_join _ _ _ _ _ 0 176 16 h10 okB11
  have h12 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 208 = true := blkChk_join _ _ _ _ _ 0 192 16 h11 okB12
  have h13 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 224 = true := blkChk_join _ _ _ _ _ 0 208 16 h12 okB13
  have h14 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 240 = true := blkChk_join _ _ _ _ _ 0 224 16 h13 okB14
  have h15 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 256 = true := blkChk_join _ _ _ _ _ 0 240 16 h14 okB15
  have h16 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 272 = true := blkChk_join _ _ _ _ _ 0 256 16 h15 okB16
  have h17 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 288 = true := blkChk_join _ _ _ _ _ 0 272 16 h16 okB17
  have h18 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 304 = true := blkChk_join _ _ _ _ _ 0 288 16 h17 okB18
  have h19 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 320 = true := blkChk_join _ _ _ _ _ 0 304 16 h18 okB19
  have h20 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 336 = true := blkChk_join _ _ _ _ _ 0 320 16 h19 okB20
  have h21 : blkChk C (E1G.slc E1G.SL_h487.chunk) UB UBR lits 0 339 = true := blkChk_join _ _ _ _ _ 0 336 3 h20 okB21
  exact h21
theorem len : lits.length = 339 := by decide
theorem okGlue : glueChkW lits 37363 E1G.R487_HT.entry E1G.R487_Wf = true := by decide +kernel
theorem okRoot : lits.getD 0 0 % 2 ^ 13 = 0 := by decide +kernel
theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel
theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel
/-- **the root level**: the jobs' coverage gives the canonical-point statement -/
theorem root (hjobs : ∀ k < 37363, JobOK C (E1G.slc E1G.SL_h487.chunk) UB (E1G.R487_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_h487.chunk) i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False :=
  enum_of_chain_w C (E1G.slc E1G.SL_h487.chunk) UB UBR UB_eq UBR_eq (by decide +kernel) lits 37363 E1G.R487_HT.entry E1G.R487_Wf (by rw [len]; decide) okRoot
    (blkChk_spec _ _ _ _ _ _ (len ▸ okAll)) okGlue hjobs
end E1G.R487
