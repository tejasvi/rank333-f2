module
public import R22Port.U_d41d8cd98f00
public import NLP.ElimOk
public import NLP.FirstPar
public import NLP.Enum
public import NLP.Trans
/-! # NLP.Rec: native claims and records refine the kernel's

`Rec.abs r = BC5.mkR r.X r.P.toNat r.PM r.lm.toNat r.rm.toNat`: the kernel record of a native one (the kernel's lazily built
tables `XL … GH` are functions of `P` through `mkR`).  `rank1`, `mkRec`, `mkSl`, `mkRec6`, `mkSl6`, `over6`, `mkRecs6`,
`mkSls6`, `updRecs`, `thru`, `app` and the mask folds compute the kernel's results on the abstractions. -/
@[expose] public section
namespace NL
open Nat S5

set_option maxRecDepth 20000

def Rec.abs (r : Rec) : BC5.Rec := BC5.mkR r.X r.P.toNat r.PM r.lm.toNat r.rm.toNat

def R1rel (q : R1) (k : BC6s.R1) : Prop :=
  k.rk = q.rk ∧ k.lm = q.lm.toNat ∧ k.rm = q.rm.toNat ∧ k.P = q.P.toNat ∧ k.ok = q.ok ∧ q.P.WF

theorem mbit (x : M8) (i : Nat) : x.bit i = BC5.bit x.toNat i := by rw [S5.bit_eq, M8.testBit_toNat]

theorem firstPar_lt (V w : Nat) : firstPar V w < 512 := by
  rw [firstPar_fpL]
  rcases fpL_spec [vi V 0, vi V 1, vi V 2, vi V 3, vi V 4, vi V 5] w with ⟨i0, hi0, -, -, h3⟩ | ⟨-, h2⟩
  · rw [h3]; simp only [List.length_cons, List.length_nil] at hi0
    interval_cases i0 <;> exact vi_lt _ _
  · rw [h2]; norm_num

theorem kfirstPar_kb (X w : Nat) (hX : X < 512) (hw : w < 512) :
    BC6s.firstPar (BC6s.kb18 X) w = firstPar (KBP.getD X 0) w := by
  rw [(kbp_fact X hX).1, kfirstPar_eq _ w hw]
theorem kfirstPar_lkb (X w : Nat) (hX : X < 512) (hw : w < 512) :
    BC6s.firstPar (BC6s.lkb18 X) w = firstPar (LKBP.getD X 0) w := by
  rw [(kbp_fact X hX).2, kfirstPar_eq _ w hw]

theorem npar_l (a b : Nat) (ha : a < 512) : npar (Nat.land a b) = BC5.par (Nat.land a b) :=
  npar_eq _ (lt_of_le_of_lt Nat.and_le_left ha)
theorem npar_r (a b : Nat) (hb : b < 512) : npar (Nat.land a b) = BC5.par (Nat.land a b) :=
  npar_eq _ (lt_of_le_of_lt Nat.and_le_right hb)

theorem toNat_andM (x : M8) (v : Nat) (hv : v < 512) : (x.and (nperpM v)).toNat = Nat.land x.toNat (BC5.nperp v) := by
  rw [M8.toNat_and, nperpM_fact v hv]; rfl

/-- **`rank1`** -/
theorem rank1_rel (X b0 c0 : Nat) (hX : X < 512) (hb : b0 < 512) (hc : c0 < 512) :
    R1rel (rank1 X b0 c0) (BC6s.rank1 X b0 c0) := by
  obtain ⟨hP, hPw⟩ := rootP_fact X hX
  have wP := S9.wf_of_wfb _ hPw
  have ey : xof (rootP X) b0 = BC5.xof (BC6s.rootP X) b0 := by rw [xof_eq _ wP b0 hb, hP]
  have eg : gof (rootP X) c0 = BC5.gof (BC6s.rootP X) c0 := by rw [gof_eq _ wP c0 hc, hP]
  have hy : BC5.xof (BC6s.rootP X) b0 < 512 := S5.xof_lt _ _
  have hg : BC5.gof (BC6s.rootP X) c0 < 512 := S5.gof_lt _ _
  have elm := rlm_fact X hX
  have erm := rrm_fact X hX
  have elb : (rlm X).bit b0 = BC5.bit (BC5.rlm X) b0 := by rw [mbit, elm]
  have erb : (rrm X).bit c0 = BC5.bit (BC5.rrm X) c0 := by rw [mbit, erm]
  have hk := firstPar_lt (KBP.getD X 0) c0
  have hl := firstPar_lt (LKBP.getD X 0) b0
  unfold rank1 BC6s.rank1
  simp only []
  rw [elb, erb, ey, eg, kfirstPar_kb X c0 hX hc, kfirstPar_lkb X b0 hX hb, rootRk_fact X hX]
  have ekm := kerm_fact X hX
  have elk := lkerm_fact X hX
  have ekb : (kerm X).bit (firstPar (KBP.getD X 0) c0) = BC5.bit (BC6s.kerm X) (firstPar (KBP.getD X 0) c0) := by
    rw [mbit, ekm]
  have elb2 : (lkerm X).bit (firstPar (LKBP.getD X 0) b0) = BC5.bit (BC6s.lkerm X) (firstPar (LKBP.getD X 0) b0) := by
    rw [mbit, elk]
  have cl : ∀ (c : Bool) (v : Nat), v < 512 → cond c v 0 < 512 := fun c v hv => by cases c <;> simp [hv]
  have cl2 : ∀ (c : Bool) (v : Nat), v < 512 → cond c 0 v < 512 := fun c v hv => by cases c <;> simp [hv]
  rw [ekb, elb2, npar_l _ c0 hk, npar_l _ b0 hl, npar_l _ b0 hg]
  cases BC5.bit (BC5.rlm X) b0 <;> cases BC5.bit (BC5.rrm X) c0
  · -- neither
    simp only [cond_false, cond_true]
    have hb1 : Nat.xor (BC5.xof (BC6s.rootP X) b0) (cond (BC5.par (Nat.land (BC5.gof (BC6s.rootP X) c0) b0)) 0
        (firstPar (KBP.getD X 0) c0)) < 512 := xor9_lt hy (cl2 _ _ hk)
    unfold R1rel; dsimp only
    refine ⟨rfl, ?_, ?_, ?_, rfl, ?_⟩
    · rw [M8.toNat_or, M8.toNat_trans _ _ hb, elm]; rfl
    · rw [M8.toNat_or, M8.toNat_trans _ _ hc, erm]; rfl
    · rw [corrP_eq _ (corrP_wf _ wP _ _ hb1) _ _ hg hk, corrP_eq _ wP _ _ hl hb1, hP]
    · exact corrP_wf _ (corrP_wf _ wP _ _ hb1) _ _ hk
  · -- inR only
    simp only [cond_false, cond_true]
    have hz : Nat.xor (BC5.gof (BC6s.rootP X) c0) (cond (BC5.par (Nat.land (BC5.gof (BC6s.rootP X) c0) b0))
        (firstPar (LKBP.getD X 0) b0) 0) < 512 := xor9_lt hg (cl _ _ hl)
    unfold R1rel; dsimp only
    refine ⟨rfl, ?_, erm.symm, ?_, rfl, corrP_wf _ wP _ _ hy⟩
    · rw [M8.toNat_or, andn_perp _ _ hg, M8.toNat_trans _ _ hb, toNat_andM _ _ hg, elm]; rfl
    · rw [corrP_eq _ wP _ _ hz hy, hP]
  · -- inC only
    rw [npar_l c0 _ hc]
    simp only [cond_false, cond_true]
    have hx0 : Nat.xor (BC5.xof (BC6s.rootP X) b0) (cond (BC5.par (Nat.land c0 (BC5.xof (BC6s.rootP X) b0)))
        (firstPar (KBP.getD X 0) c0) 0) < 512 := xor9_lt hy (cl _ _ hk)
    unfold R1rel; dsimp only
    refine ⟨rfl, elm.symm, ?_, ?_, rfl, corrP_wf _ wP _ _ hx0⟩
    · rw [M8.toNat_or, andn_perp _ _ hx0, M8.toNat_trans _ _ hc, toNat_andM _ _ hx0, erm]; rfl
    · rw [corrP_eq _ wP _ _ hg hx0, hP]
  · rw [npar_l c0 _ hc]
    cases BC5.par (Nat.land c0 (BC5.xof (BC6s.rootP X) b0))
    · simp only [cond_false, cond_true]
      unfold R1rel; dsimp only
      exact ⟨rfl, elm.symm, erm.symm, by rw [corrP_eq _ wP _ _ hg hy, hP], rfl, corrP_wf _ wP _ _ hy⟩
    · simp only [cond_true]
      unfold R1rel; dsimp only
      refine ⟨rfl, ?_, ?_, hP.symm, rfl, wP⟩
      · rw [andn_perp _ _ hg, elm]
      · rw [andn_perp _ _ hy, erm]

/-! ## Claims -/

/-- the assignment's entries are 9-bit -/
def AsgOK (asg : Asg) : Prop := ∀ e ∈ asg, e.1 < 512 ∧ e.2.1 < 512 ∧ e.2.2 < 512

theorem asgOK_bc (asg : Asg) (h : AsgOK asg) : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512 :=
  fun e he => ⟨(h e he).2.1, (h e he).2.2⟩

theorem thru1_eq (X : Nat) (hX : X < 512) (asg : Asg) : thru1 X asg = BC6s.thru1 X asg := by
  induction asg with
  | nil => rfl
  | cons e r ih =>
    show cond (npar (Nat.land e.1 X)) (cond (Nat.beq (thru1 X r).1 0) (1, e.2.1, e.2.2) (2, (thru1 X r).2.1, (thru1 X r).2.2))
      (thru1 X r) = cond (BC5.par (Nat.land e.1 X)) (cond (Nat.beq (BC6s.thru1 X r).1 0) (1, e.2.1, e.2.2)
      (2, (BC6s.thru1 X r).2.1, (BC6s.thru1 X r).2.2)) (BC6s.thru1 X r)
    rw [ih, npar_r _ _ hX]

theorem thru1_lt (X : Nat) (asg : Asg) (h : AsgOK asg) : (thru1 X asg).2.1 < 512 ∧ (thru1 X asg).2.2 < 512 := by
  induction asg with
  | nil => exact ⟨show 0 < 512 by norm_num, show 0 < 512 by norm_num⟩
  | cons e r ih =>
    have ih' := ih (fun e' he' => h e' (List.mem_cons_of_mem _ he'))
    have he := h e List.mem_cons_self
    show (cond (npar (Nat.land e.1 X)) (cond (Nat.beq (thru1 X r).1 0) (1, e.2.1, e.2.2) (2, (thru1 X r).2.1, (thru1 X r).2.2))
      (thru1 X r)).2.1 < 512 ∧ (cond (npar (Nat.land e.1 X)) (cond (Nat.beq (thru1 X r).1 0) (1, e.2.1, e.2.2)
      (2, (thru1 X r).2.1, (thru1 X r).2.2)) (thru1 X r)).2.2 < 512
    cases npar (Nat.land e.1 X)
    · exact ih'
    · cases Nat.beq (thru1 X r).1 0
      · exact ih'
      · exact ⟨he.2.1, he.2.2⟩

theorem noasg_eq (X : Nat) (hX : X < 512) (asg : Asg) : noasg X asg = BC5.noasg X asg := by
  induction asg with
  | nil => rfl
  | cons e r ih =>
    show (!(npar (Nat.land e.1 X)) && noasg X r) = (!(BC5.par (Nat.land e.1 X)) && BC5.noasg X r)
    rw [ih, npar_r _ _ hX]

/-- `u(X)` agrees (per leaf: the native `S` and the kernel's `SS` describe the same terms) -/
def UOK (S : S9) (SS : Nat) : Prop := ∀ ACT X, X < 512 → ucnt S ACT X = BC5.ucnt SS ACT X

theorem mkR_abs (X : Nat) (P : S9) (PM : Nat) (lm rm : M8) :
    (⟨X, P, PM, lm, rm⟩ : Rec).abs = BC5.mkR X P.toNat PM lm.toNat rm.toNat := rfl

/-- **v5 records** -/
theorem mkRec_rel (S : S9) (SS ACT : Nat) (asg : Asg) (X : Nat) (hU : UOK S SS) (hX : X < 512) (ha : AsgOK asg) :
    (mkRec S ACT asg X).1 = (BC5.mkRec SS ACT asg X).1 ∧ (mkRec S ACT asg X).2.abs = (BC5.mkRec SS ACT asg X).2 ∧
      (mkRec S ACT asg X).2.P.WF := by
  obtain ⟨hP, hPw⟩ := rootP_fact X hX
  unfold mkRec BC5.mkRec
  rw [noasg_eq X hX, hU ACT X hX]
  cases BC5.noasg X asg
  · simp only [cond_false]
    obtain ⟨er, wr⟩ := resC_eq X hX asg (asgOK_bc asg ha)
    obtain ⟨eP, ePM, erk, eM, wP, wM⟩ := elim_rel (resC X asg) wr
    have hpre := (S5.elim_spec (resC X asg).toNat).1
    rw [← er]
    refine ⟨?_, ?_, wP⟩
    · show (elimOk (elim (resC X asg)) && Nat.ble (BC5.ucnt SS ACT X) (elim (resC X asg)).rk) =
        (BC5.elimOk (BC5.elim (resC X asg).toNat) && Nat.ble (BC5.ucnt SS ACT X) (BC5.elim (resC X asg).toNat).rk)
      rw [elimOk_eq _ _ (elim_rel (resC X asg) wr) hpre, erk]
    · show BC5.mkR X (elim (resC X asg)).P.toNat (elim (resC X asg)).PM (lmC (elim (resC X asg)).P (elim (resC X asg)).PM).toNat
          (kerM (elim (resC X asg)).M).toNat = BC5.mkR X (BC5.elim (resC X asg).toNat).P (BC5.elim (resC X asg).toNat).PM
          (BC5.lmC (BC5.elim (resC X asg).toNat).P (BC5.elim (resC X asg).toNat).PM) (BC5.kerM (BC5.elim (resC X asg).toNat).M)
      rw [lmC_eq _ wP, kerM_eq _ wM, eP, ePM, eM]
  · simp only [cond_true]
    refine ⟨by rw [rootRk_fact X hX]; rfl, ?_, S9.wf_of_wfb _ hPw⟩
    rw [mkR_abs, hP, rpm_fact X hX, rlm_fact X hX, rrm_fact X hX]; rfl

/-- **v5 slack-one claims** -/
theorem mkSl_rel (S : S9) (SS ACT : Nat) (asg : Asg) (X : Nat) (hU : UOK S SS) (hX : X < 512) (ha : AsgOK asg) :
    (mkSl S ACT asg X).1 = (BC5.mkSl SS ACT asg X).1 ∧ (mkSl S ACT asg X).2.1.toNat = (BC5.mkSl SS ACT asg X).2.1 ∧
      (mkSl S ACT asg X).2.2.toNat = (BC5.mkSl SS ACT asg X).2.2 := by
  unfold mkSl BC5.mkSl
  rw [noasg_eq X hX, hU ACT X hX]
  cases BC5.noasg X asg
  · simp only [cond_false]
    obtain ⟨er, wr⟩ := resC_eq X hX asg (asgOK_bc asg ha)
    obtain ⟨er2, wr2⟩ := resR_eq X hX asg (asgOK_bc asg ha)
    have r1 := elim_rel (resC X asg) wr
    have r2 := elim_rel (resR X asg) wr2
    have hpre1 := (S5.elim_spec (resC X asg).toNat).1
    have hpre2 := (S5.elim_spec (resR X asg).toNat).1
    rw [← er, ← er2]
    refine ⟨?_, ?_, ?_⟩
    · show (elimOk (elim (resC X asg)) && elimOk (elim (resR X asg)) &&
          Nat.ble (BC5.ucnt SS ACT X) (Nat.succ (elim (resC X asg)).rk)) =
        (BC5.elimOk (BC5.elim (resC X asg).toNat) && BC5.elimOk (BC5.elim (resR X asg).toNat) &&
          Nat.ble (BC5.ucnt SS ACT X) (Nat.succ (BC5.elim (resC X asg).toNat).rk))
      rw [elimOk_eq _ _ r1 hpre1, elimOk_eq _ _ r2 hpre2, r1.2.2.1]
    · show (kerM (elim (resR X asg)).M).toNat = BC5.kerM (BC5.elim (resR X asg).toNat).M
      rw [kerM_eq _ r2.2.2.2.2.2, r2.2.2.2.1]
    · show (kerM (elim (resC X asg)).M).toNat = BC5.kerM (BC5.elim (resC X asg).toNat).M
      rw [kerM_eq _ r1.2.2.2.2.2, r1.2.2.2.1]
  · simp only [cond_true]
    exact ⟨by rw [rootRk_fact X hX]; rfl, rlm_fact X hX, rrm_fact X hX⟩

theorem th_lt (X : Nat) (asg : Asg) (ha : AsgOK asg) : (thru1 X asg).2.1 < 512 ∧ (thru1 X asg).2.2 < 512 :=
  thru1_lt X asg ha

/-- **v6 records** -/
theorem mkRec6_rel (S : S9) (SS ACT : Nat) (asg : Asg) (X : Nat) (hU : UOK S SS) (hX : X < 512) (ha : AsgOK asg) :
    (mkRec6 S ACT asg X).1 = (BC6s.mkRec6 SS ACT asg X).1 ∧ (mkRec6 S ACT asg X).2.abs = (BC6s.mkRec6 SS ACT asg X).2 ∧
      (mkRec6 S ACT asg X).2.P.WF := by
  unfold mkRec6 BC6s.mkRec6
  simp only []
  rw [thru1_eq X hX]
  have ht := th_lt X asg ha
  rw [thru1_eq X hX] at ht
  cases Nat.beq (BC6s.thru1 X asg).1 1
  · simp only [cond_false]; exact mkRec_rel S SS ACT asg X hU hX ha
  · simp only [cond_true]
    obtain ⟨erk, elm, erm, eP, eok, wP⟩ := rank1_rel X _ _ hX ht.1 ht.2
    refine ⟨by rw [hU ACT X hX, eok, erk], ?_, wP⟩
    rw [mkR_abs, ← elm, ← erm, ← eP]

/-- **v6 slack-one claims** -/
theorem mkSl6_rel (S : S9) (SS ACT : Nat) (asg : Asg) (X : Nat) (hU : UOK S SS) (hX : X < 512) (ha : AsgOK asg) :
    (mkSl6 S ACT asg X).1 = (BC6s.mkSl6 SS ACT asg X).1 ∧ (mkSl6 S ACT asg X).2.1.toNat = (BC6s.mkSl6 SS ACT asg X).2.1 ∧
      (mkSl6 S ACT asg X).2.2.toNat = (BC6s.mkSl6 SS ACT asg X).2.2 := by
  unfold mkSl6 BC6s.mkSl6
  simp only []
  rw [thru1_eq X hX]
  have ht := th_lt X asg ha
  rw [thru1_eq X hX] at ht
  cases Nat.beq (BC6s.thru1 X asg).1 1
  · simp only [cond_false]; exact mkSl_rel S SS ACT asg X hU hX ha
  · simp only [cond_true]
    obtain ⟨erk, elm, erm, eP, eok, wP⟩ := rank1_rel X _ _ hX ht.1 ht.2
    exact ⟨by rw [hU ACT X hX, eok, erk], elm.symm, erm.symm⟩

/-- **`over`** -/
theorem over6_eq (S : S9) (SS ACT : Nat) (asg : Asg) (X : Nat) (hU : UOK S SS) (hX : X < 512) (ha : AsgOK asg) :
    over6 S ACT asg X = BC6s.over6 SS ACT asg X := by
  unfold over6 BC6s.over6
  simp only []
  rw [thru1_eq X hX, hU ACT X hX]
  have ht := th_lt X asg ha
  rw [thru1_eq X hX] at ht
  cases Nat.beq (BC6s.thru1 X asg).1 1
  · simp only [cond_false]
    obtain ⟨er, wr⟩ := resC_eq X hX asg (asgOK_bc asg ha)
    have r1 := elim_rel (resC X asg) wr
    have hpre1 := (S5.elim_spec (resC X asg).toNat).1
    rw [← er, elimOk_eq _ _ r1 hpre1, r1.2.2.1]
  · simp only [cond_true]
    obtain ⟨erk, -, -, -, eok, -⟩ := rank1_rel X _ _ hX ht.1 ht.2
    rw [eok, erk]

end NL
