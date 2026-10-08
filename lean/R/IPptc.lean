module
public import R22Port.U_cc16e4427242
public import R.Item
public import R.Leaf
public import E1N.IP_ptc
public import R22B.E1P_ptc
public import HPt.IP_ptc
public import HPt.SL_ptc
public import HPt.Rptc_HT
/-! # The certified point IP `ptc` (hpt/README.md): `E1N.IP_ptc.D` satisfies `IPRel` for the kernel constants `E1P.IP_ptc` /
`E1P.SL_ptc` (HPt.IP_ptc, HPt.SL_ptc), its item closure, and the root level `root`: the closure of the 2,352 job keys
`E1P.Rptc_HT.entry k` gives `HPt.C492.classLB`'s `hjobs`.  Adapted from R/IPpt.lean (the C3d point IP) by renaming.

* `D_eq`: `E1N.IP_ptc.D` (module-land copies `R22D.E1P.*_ptc`) is `mkIPD` of the kernel constants (infra's rfl bridges
  `R22B.R22D_E1P_*_eq`, native/infra/lib/bridge/R22B/E1P_ptc.lean);
* `D_rel : IPRel E1N.IP_ptc.D C (E1P.slc E1P.SL_ptc.chunk) UB UBR`;
* `step`, `cov_sound`: `R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_ptc.D) S → JobOK C sl UB S`;
* `e1`: with the IP's `IPOK` (hcls), the closure of the root item key `0` gives the IP's E1 conclusion. -/
@[expose] public section
set_option maxRecDepth 100000
namespace E1NR.IP_ptc
open E1N E1PS E1P.IP_ptc Finset RootSound Matrix

theorem D_eq : E1N.IP_ptc.D = E1N.mkIPD 8 19 6 11 C.R C.N UB E1P.SL_ptc.chunk C.GP (E1N.leafHook C.VT C.DOM) := by
  rw [show E1N.IP_ptc.D = E1N.mkIPD 8 19 6 11 R22D.E1P.IP_ptc.R R22D.E1P.IP_ptc.N R22D.E1P.IP_ptc.UB R22D.E1P.SL_ptc.chunk
    R22D.E1P.GP_ptc.entry (E1N.leafHook R22D.E1P.IP_ptc.VT R22D.E1P.IP_ptc.DOM) from rfl]
  rw [R22B.R22D_E1P_IP_ptc_R_eq, R22B.R22D_E1P_IP_ptc_N_eq, R22B.R22D_E1P_IP_ptc_UB_eq, R22B.R22D_E1P_SL_ptc_chunk_eq,
    R22B.R22D_E1P_GP_ptc_entry_eq, R22B.R22D_E1P_IP_ptc_VT_eq, R22B.R22D_E1P_IP_ptc_DOM_eq]
  rfl

theorem DOM_lt : C.DOM < 2 ^ 512 := by
  show DOM < 2 ^ 512
  decide +kernel

theorem UB_le : ∀ x < 255, E1P.fld UB x ≤ 2 ^ 32 := by decide +kernel

theorem UB_eq : UB = V (fun l => E1P.fld UB l) := by
  rw [show V (fun l => E1P.fld UB l) = pkL 256 (fun l => E1P.fld UB l) 255 from (pkL_eq _ _ _).symm]; decide +kernel

theorem UBR_eq : UBR = VR (fun l => E1P.fld UB l) := by
  rw [show VR (fun l => E1P.fld UB l) = pkL 256 (fun j => E1P.fld UB (254 - j)) 255 from (pkL_eq _ _ _).symm]; decide +kernel

/-- **the point IP's native data** satisfy `IPRel` -/
theorem D_rel : IPRel E1N.IP_ptc.D C (E1P.slc E1P.SL_ptc.chunk) UB UBR := by
  rw [D_eq]
  exact mkIPD_rel_hook C UB UBR E1P.SL_ptc.chunk (by show N ≤ 255; decide) DOM_lt UB_eq UBR_eq UB_le

/-- the point IP's item step (`R22N.covG_sound`'s `step`) -/
theorem step : ∀ k, E1N.Checked E1N.IP_ptc.D k → (∀ c ∈ E1N.keyExt k, JobOK C (E1P.slc E1P.SL_ptc.chunk) UB c) →
    JobOK C (E1P.slc E1P.SL_ptc.chunk) UB (E1N.keyS k) :=
  checked_step D_rel

/-- the closure of checked point-IP items -/
theorem cov_sound {S : ℕ} (h : R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_ptc.D) S) :
    JobOK C (E1P.slc E1P.SL_ptc.chunk) UB S :=
  R22N.covG_sound _ step h

/-- **the point tree's root level**: the closure of its 2,352 job keys gives `HPt.C492.classLB`'s `hjobs` -/
theorem root (h : ∀ k < 2352, R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_ptc.D) (E1P.Rptc_HT.entry k)) :
    ∀ k < 2352, E1PS.JobOK E1P.IP_ptc.C (E1P.slc E1P.SL_ptc.chunk) E1P.IP_ptc.UB (E1P.Rptc_HT.entry k) :=
  fun k hk => cov_sound (h k hk)

end E1NR.IP_ptc
