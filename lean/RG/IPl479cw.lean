module
public import R22Port.U_6dca46b8fe31
public import RG.Item
public import RG.Leaf
public import E1N.IP_l479cw
public import R22B.E1G_l479cw
public import E1G.IP_l479cw
public import E1G.SL_l479cw
public import E1G.R479
/-! # L479's line IP `l479cw`: `E1N.IP_l479cw.D` satisfies `IPRel` for hcls's constants, its item closure, and the root

* `D_eq`: `E1N.IP_l479cw.D` (module-land copies `R22D.E1G.*_l479cw`) is `mkIPD` of the kernel constants (infra's rfl bridges
  `R22B.R22D_E1G_*_eq`, native/infra/lib/bridge/R22B/E1G_l479cw.lean);
* `D_rel : IPRel E1N.IP_l479cw.D C (E1G.slc E1G.SL_l479cw.chunk) UB UBR`;
* `step`, `cov_sound`: `R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_l479cw.D) S → JobOK C sl UB S`;
* `root`: the closure of the 30,557 job keys `E1G.R479_HT.entry k` of hcls's kernel-checked root chain `E1G.R479` gives its
  canonical-point statement (`E1G.R479.root`, the L479 glue's `EnumOK`). -/
@[expose] public section
set_option maxRecDepth 100000
namespace E1NRG.IP_l479cw
open E1N E1GS E1G.IP_l479cw Finset RootSound Matrix

theorem D_eq : E1N.IP_l479cw.D =
    E1N.mkIPD 7 15 6 11 C.R C.N UB E1G.SL_l479cw.chunk C.GP (E1N.leafHookG C.VT C.DOM C.EXT) := by
  rw [show E1N.IP_l479cw.D = E1N.mkIPD 7 15 6 11 R22D.E1G.IP_l479cw.R R22D.E1G.IP_l479cw.N R22D.E1G.IP_l479cw.UB
    R22D.E1G.SL_l479cw.chunk R22D.E1G.GP_l479cw.entry
    (E1N.leafHookG R22D.E1G.IP_l479cw.VT R22D.E1G.IP_l479cw.DOM R22D.E1G.IP_l479cw.EXT) from rfl]
  rw [R22B.R22D_E1G_IP_l479cw_R_eq, R22B.R22D_E1G_IP_l479cw_N_eq, R22B.R22D_E1G_IP_l479cw_UB_eq,
    R22B.R22D_E1G_SL_l479cw_chunk_eq, R22B.R22D_E1G_GP_l479cw_entry_eq, R22B.R22D_E1G_IP_l479cw_VT_eq,
    R22B.R22D_E1G_IP_l479cw_DOM_eq, R22B.R22D_E1G_IP_l479cw_EXT_eq]
  rfl

theorem DOM_lt : C.DOM < 2 ^ 512 := by
  show DOM < 2 ^ 512
  decide +kernel

theorem UB_le : ∀ x < 127, E1G.fld UB x ≤ 2 ^ 32 := by decide +kernel

theorem UB_eq : UB = V (fun l => E1G.fld UB l) := by
  rw [show V (fun l => E1G.fld UB l) = pkL 128 (fun l => E1G.fld UB l) 127 from (pkL_eq _ _ _).symm]; decide +kernel

theorem UBR_eq : UBR = VR (fun l => E1G.fld UB l) := by
  rw [show VR (fun l => E1G.fld UB l) = pkL 128 (fun j => E1G.fld UB (126 - j)) 127 from (pkL_eq _ _ _).symm]; decide +kernel

/-- **the IP's native data** satisfy `IPRel` -/
theorem D_rel : IPRel E1N.IP_l479cw.D C (E1G.slc E1G.SL_l479cw.chunk) UB UBR := by
  rw [D_eq]
  exact mkIPD_rel_hookG C UB UBR E1G.SL_l479cw.chunk (by show N ≤ 127; decide) DOM_lt UB_eq UBR_eq UB_le

/-- the IP's item step (`R22N.covG_sound`'s `step`) -/
theorem step : ∀ k, E1N.Checked E1N.IP_l479cw.D k → (∀ c ∈ E1N.keyExt k, JobOK C (E1G.slc E1G.SL_l479cw.chunk) UB c) →
    JobOK C (E1G.slc E1G.SL_l479cw.chunk) UB (E1N.keyS k) :=
  checked_step D_rel

/-- the closure of checked items -/
theorem cov_sound {S : ℕ} (h : R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_l479cw.D) S) :
    JobOK C (E1G.slc E1G.SL_l479cw.chunk) UB S :=
  R22N.covG_sound _ step h

/-- **the L479 root level**: the closure of the 30,557 job keys of hcls's root chain `E1G.R479` gives its canonical-point
statement (`E1G.R479.root`) -/
theorem root (h : ∀ k < 30557, R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_l479cw.D) (E1G.R479_HT.entry k)) :
    ∀ x : ℕ → ℕ, Glob C x → (∀ i < 2 ^ 15, SlotV x ((E1G.slc E1G.SL_l479cw.chunk) i)) → (∀ l < 127, x l ≤ E1G.fld UB l) →
      (∃ l < 127, 0 < x l) → False :=
  E1G.R479.root (fun k hk => cov_sound (h k hk))

end E1NRG.IP_l479cw
