module
public import R22Port.U_d41d8cd98f00
public import R6.Rec
/-! # v6 ⇒ v6s refinement, part 5: claims

v6 splits a claim on `X` three ways by the number of assigned terms through `X` (`thru1`, capped at 2): none = the root
record, one = the rank-1 path, two or more = elimination.  v6s takes the rank-1 path on one, else v5's claim, which
uses the root record exactly when no assigned term passes through `X` (`noasg`).  `over` in v6 reads the root rank
where v6s eliminates `T(X)`; S5's `root_fact` says they agree. -/
@[expose] public section
namespace R6
open BC4

theorem thru1_cases (X : Nat) : ∀ asg : List (Nat × Nat × Nat),
    ((BC6s.thru1 X asg).1 = 0 ∧ BC5.noasg X asg = true) ∨ ((BC6s.thru1 X asg).1 = 1 ∧ BC5.noasg X asg = false) ∨
      ((BC6s.thru1 X asg).1 = 2 ∧ BC5.noasg X asg = false)
  | [] => Or.inl ⟨rfl, rfl⟩
  | e :: l => by
    have e1 : BC6s.thru1 X (e :: l) = cond (BC5.par (Nat.land e.1 X))
        (cond (Nat.beq (BC6s.thru1 X l).1 0) (1, e.2.1, e.2.2) (2, (BC6s.thru1 X l).2.1, (BC6s.thru1 X l).2.2))
        (BC6s.thru1 X l) := rfl
    have e2 : BC5.noasg X (e :: l) = (!BC5.par (Nat.land e.1 X) && BC5.noasg X l) := rfl
    rw [e1, e2]
    cases BC5.par (Nat.land e.1 X)
    · rw [condF, Bool.not_false, Bool.true_and]; exact thru1_cases X l
    · rw [condT, Bool.not_true, Bool.false_and]
      cases Nat.beq (BC6s.thru1 X l).1 0
      · rw [condF]; exact Or.inr (Or.inr ⟨rfl, rfl⟩)
      · rw [condT]; exact Or.inr (Or.inl ⟨rfl, rfl⟩)

theorem resC_noasg (X : Nat) : ∀ asg : List (Nat × Nat × Nat), BC5.noasg X asg = true → BC5.resC X asg = BC5.resC X []
  | [], _ => rfl
  | e :: l, h => by
    have e1 : BC5.resC X (e :: l) = cond (BC5.par (Nat.land e.1 X))
        (Nat.xor (Nat.mul (BC5.spr18 e.2.2) e.2.1) (BC5.resC X l)) (BC5.resC X l) := rfl
    have e2 : BC5.noasg X (e :: l) = (!BC5.par (Nat.land e.1 X) && BC5.noasg X l) := rfl
    rw [e2] at h
    rw [e1]
    cases hp : BC5.par (Nat.land e.1 X)
    · rw [condF]; rw [hp, Bool.not_false, Bool.true_and] at h; exact resC_noasg X l h
    · rw [hp, Bool.not_true, Bool.false_and] at h; exact absurd h Bool.false_ne_true

theorem rootRk_def (X : Nat) : BC6.rootRk X = Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15 := id rfl
theorem rootP_def (X : Nat) : BC6.rootP X = Nat.land (BC5.rpt X) M162 := id rfl

/-- `T(X)`'s elimination is the root record (S5's kernel-checked `root_fact`) -/
theorem root_elim (X : Nat) (hX : X < 512) :
    BC5.elimOk (BC5.elim (BC5.resC X [])) = true ∧ (BC5.elim (BC5.resC X [])).rk = BC6.rootRk X := by
  have hroot := S5.allLT_spec S5.root_fact X hX
  simp only [S5.rootOK, Bool.and_eq_true, Nat.beq_eq] at hroot
  exact ⟨hroot.2, by rw [rootRk_def]; exact hroot.1.2.symm⟩

theorem r1s_ok (q : BC6.R1) : (r1s q).ok = q.ok := rfl
theorem r1s_rk (q : BC6.R1) : (r1s q).rk = q.rk := rfl
theorem r1s_P (q : BC6.R1) : (r1s q).P = q.P := rfl
theorem r1s_lm (q : BC6.R1) : (r1s q).lm = q.lm := rfl
theorem r1s_rm (q : BC6.R1) : (r1s q).rm = q.rm := rfl

theorem mkRec_rel (SS ACT : Nat) (asg : List (Nat × Nat × Nat)) (X : Nat) :
    (BC6.mkRec SS ACT asg X).1 = (BC6s.mkRec6 SS ACT asg X).1 ∧ RR (BC6.mkRec SS ACT asg X).2 (BC6s.mkRec6 SS ACT asg X).2 := by
  simp only [BC6.mkRec, BC6s.mkRec6, BC5.mkRec, thru1_eq]
  rcases thru1_cases X asg with ⟨h, hn⟩ | ⟨h, hn⟩ | ⟨h, hn⟩ <;>
    simp only [h, hn, beq00, beq01, beq10, beq11, beq20, beq21, brecT, brecF, condT, condF]
  · exact ⟨by rw [ucnt_eq, rootRk_def], by rw [rootP_def, rlm_eq, rrm_eq]; exact mkR_rel _ _ _ _ _⟩
  · rw [← rank1_eq, r1s_ok, r1s_rk, r1s_P, r1s_lm, r1s_rm, sel_eq, cond_and, ucnt_eq]
    exact ⟨rfl, mkR_rel _ _ _ _ _⟩
  · rw [sel_eq, cond_and, ucnt_eq, resC_eq, elimOk_elim, elim_rk, elim_P, elim_PM, elim_M, lmC_eq, kerM_eq]
    exact ⟨rfl, mkR_rel _ _ _ _ _⟩

theorem mkSl_eq (SS ACT : Nat) (asg : List (Nat × Nat × Nat)) (X : Nat) :
    BC6.mkSl SS ACT asg X = BC6s.mkSl6 SS ACT asg X := by
  simp only [BC6.mkSl, BC6s.mkSl6, BC5.mkSl, thru1_eq]
  rcases thru1_cases X asg with ⟨h, hn⟩ | ⟨h, hn⟩ | ⟨h, hn⟩ <;>
    simp only [h, hn, beq00, beq01, beq10, beq11, beq20, beq21, brecT, brecF, condT, condF]
  · rw [ucnt_eq, rootRk_def, rlm_eq, rrm_eq]
  · rw [← rank1_eq, r1s_ok, r1s_rk, r1s_lm, r1s_rm, sel_eq, cond_and, ucnt_eq]
  · rw [sel_eq, sel_eq, cond_and, cond_and, ucnt_eq, resC_eq, resR_eq, elimOk_elim, elimOk_elim, elim_rk, elim_M, elim_M,
      kerM_eq, kerM_eq, Bool.and_assoc]

theorem overOk_eq (SS ACT : Nat) (asg : List (Nat × Nat × Nat)) (X : Nat) (hX : X < 512) :
    BC6.overOk SS ACT asg X = BC6s.over6 SS ACT asg X := by
  simp only [BC6.overOk, BC6s.over6, thru1_eq]
  rcases thru1_cases X asg with ⟨h, hn⟩ | ⟨h, hn⟩ | ⟨h, hn⟩ <;>
    simp only [h, hn, beq00, beq01, beq10, beq11, beq20, beq21, brecT, brecF, condT, condF]
  · obtain ⟨hok, hrk⟩ := root_elim X hX
    rw [resC_noasg X asg hn, hok, hrk, Bool.true_and, ucnt_eq, blt_eq]
  · rw [← rank1_eq, r1s_ok, r1s_rk, sel_eq, cond_and, ucnt_eq, blt_eq]
  · rw [sel_eq, cond_and, ucnt_eq, blt_eq, resC_eq, elimOk_elim, elim_rk]

theorem mkRecs_rel (SS ACT : Nat) (asg : List (Nat × Nat × Nat)) : ∀ (nt : List Nat) {t6 : List BC6.Rec}
    {t5 : List BC5.Rec}, List.Forall₂ RR t6 t5 →
    (BC6.mkRecs SS ACT asg nt t6).1 = (BC6s.mkRecs6 SS ACT asg nt t5).1 ∧
      List.Forall₂ RR (BC6.mkRecs SS ACT asg nt t6).2 (BC6s.mkRecs6 SS ACT asg nt t5).2
  | [], _, _, ht => ⟨rfl, ht⟩
  | X :: nt, t6, t5, ht => by
    have e6 : BC6.mkRecs SS ACT asg (X :: nt) t6 = (@Bool.rec (fun _ => Bool) false (BC6.mkRecs SS ACT asg nt t6).1
        (BC6.mkRec SS ACT asg X).1, (BC6.mkRec SS ACT asg X).2 :: (BC6.mkRecs SS ACT asg nt t6).2) := rfl
    have e5 : BC6s.mkRecs6 SS ACT asg (X :: nt) t5 = ((BC6s.mkRec6 SS ACT asg X).1 && (BC6s.mkRecs6 SS ACT asg nt t5).1,
        (BC6s.mkRec6 SS ACT asg X).2 :: (BC6s.mkRecs6 SS ACT asg nt t5).2) := rfl
    obtain ⟨h1, h2⟩ := mkRec_rel SS ACT asg X
    obtain ⟨h3, h4⟩ := mkRecs_rel SS ACT asg nt ht
    rw [e6, e5, sel_eq, cond_and, h1, h3]
    exact ⟨rfl, List.Forall₂.cons h2 h4⟩

theorem mkSls_eq (SS ACT : Nat) (asg : List (Nat × Nat × Nat)) : ∀ sl : List Nat,
    BC6.mkSls SS ACT asg sl = BC6s.mkSls6 SS ACT asg sl
  | [] => rfl
  | X :: sl => by
    have e6 : BC6.mkSls SS ACT asg (X :: sl) = (@Bool.rec (fun _ => Bool) false (BC6.mkSls SS ACT asg sl).1
        (BC6.mkSl SS ACT asg X).1, BC6.mkSl SS ACT asg X :: (BC6.mkSls SS ACT asg sl).2) := rfl
    have e5 : BC6s.mkSls6 SS ACT asg (X :: sl) = ((BC6s.mkSl6 SS ACT asg X).1 && (BC6s.mkSls6 SS ACT asg sl).1,
        BC6s.mkSl6 SS ACT asg X :: (BC6s.mkSls6 SS ACT asg sl).2) := rfl
    rw [e6, e5, sel_eq, cond_and, mkSl_eq, mkSls_eq SS ACT asg sl]

end R6
