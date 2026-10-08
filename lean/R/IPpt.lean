module
public import R22Port.U_361acb33e928
public import R.Item
public import R.Leaf
public import E1N.IP_pt
public import R22B.E1P_pt
public import E1P.IP_pt
public import E1P.SL_pt
/-! # The point IP: `E1N.IP_pt.D` satisfies `IPRel` for the kernel track's point-IP constants, and its item closure

* `D_eq`: `E1N.IP_pt.D` (module-land copies `R22D.E1P.*_pt`) is `mkIPD` of the kernel constants (infra's rfl bridges
  `R22B.R22D_E1P_*_eq`, native/infra/lib/bridge/R22B/E1P_pt.lean);
* `D_rel : IPRel E1N.IP_pt.D C (E1P.slc E1P.SL_pt.chunk) UB UBR`;
* `step`, `cov_sound`: `R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_pt.D) S → JobOK C sl UB S`;
* `e1`: with the IP's `IPOK` (hcls), the closure of the root item key `0` gives the IP's E1 conclusion. -/
@[expose] public section
set_option maxRecDepth 100000
namespace E1NR.IP_pt
open E1N E1PS E1P.IP_pt Finset RootSound Matrix

theorem D_eq : E1N.IP_pt.D = E1N.mkIPD 8 19 6 11 C.R C.N UB E1P.SL_pt.chunk C.GP (E1N.leafHook C.VT C.DOM) := by
  rw [show E1N.IP_pt.D = E1N.mkIPD 8 19 6 11 R22D.E1P.IP_pt.R R22D.E1P.IP_pt.N R22D.E1P.IP_pt.UB R22D.E1P.SL_pt.chunk
    R22D.E1P.GP_pt.entry (E1N.leafHook R22D.E1P.IP_pt.VT R22D.E1P.IP_pt.DOM) from rfl]
  rw [R22B.R22D_E1P_IP_pt_R_eq, R22B.R22D_E1P_IP_pt_N_eq, R22B.R22D_E1P_IP_pt_UB_eq, R22B.R22D_E1P_SL_pt_chunk_eq,
    R22B.R22D_E1P_GP_pt_entry_eq, R22B.R22D_E1P_IP_pt_VT_eq, R22B.R22D_E1P_IP_pt_DOM_eq]
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
theorem D_rel : IPRel E1N.IP_pt.D C (E1P.slc E1P.SL_pt.chunk) UB UBR := by
  rw [D_eq]
  exact mkIPD_rel_hook C UB UBR E1P.SL_pt.chunk (by show N ≤ 255; decide) DOM_lt UB_eq UBR_eq UB_le

/-- the point IP's item step (`R22N.covG_sound`'s `step`) -/
theorem step : ∀ k, E1N.Checked E1N.IP_pt.D k → (∀ c ∈ E1N.keyExt k, JobOK C (E1P.slc E1P.SL_pt.chunk) UB c) →
    JobOK C (E1P.slc E1P.SL_pt.chunk) UB (E1N.keyS k) :=
  checked_step D_rel

/-- the closure of checked point-IP items -/
theorem cov_sound {S : ℕ} (h : R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_pt.D) S) :
    JobOK C (E1P.slc E1P.SL_pt.chunk) UB S :=
  R22N.covG_sound _ step h

/-- **E1 for the point IP** from the closure of the root key `0` and the IP's `IPOK` -/
theorem e1 (Em LB LBR Ntab nrows : ℕ) (tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (hIP : IPOK C Em LB LBR UB UBR Ntab nrows (E1P.slc E1P.SL_pt.chunk) tab GE)
    (hrow : ∀ i < Ntab, RT.Fact (RT.dualM (tab i)) (C.R - RT.eCap (tab i)))
    (h : R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_pt.D) 0) :
    ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
      (∀ s, b s ≠ 0 ∧ c s ≠ 0) → (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = C.R → False :=
  e1_sound_job C Em LB LBR UB UBR Ntab nrows _ tab GE hIP hrow (cov_sound h)

end E1NR.IP_pt
