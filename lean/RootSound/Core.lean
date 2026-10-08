module
public import R22Port.U_d41d8cd98f00
public import RootSound.Walk
/-! # Soundness of a root certificate (Lemma R), independent of how hits are counted

`core_sound`: a decomposition `(a, b, c)` with any number of terms, a term `t` with `b t, c t ≠ 0`, a list `TL` of
tight functionals through `a t` and a list `SL` of slack-one functionals through `a t` (as hit counts of the
decomposition), and an accepting `RootCheck.walk` give `False`.  With `TL ≠ []`, `b t, c t ≠ 0` are not needed
(`core_sound'`).  The point-profile checker `RootCheck.checkLeaf` is a corollary (module `RootSound.Leaf`). -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

variable {n : ℕ} {a b c : Fin n → M3}

theorem q0_mem (hd : IsDecomp a b c) (t : Fin n) : ∀ (TL : List Nat),
    (∀ X ∈ TL, X < 512 ∧ X ≠ 0) →
    (∀ X ∈ TL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X) →
    (∀ k, memM (RootCheck.q0 TL) (colB (b t) k)) ∧ (∀ k, memM (RootCheck.p0 TL) (rowC (c t) k)) ∧
    RootCheck.q0 TL < 256 ∧ RootCheck.p0 TL < 256 := by
  intro TL
  induction TL with
  | nil => intro _ _; exact ⟨fun k => memM_255 _, fun k => memM_255 _, by decide, by decide⟩
  | cons X Xs ih =>
    intro hv hT
    obtain ⟨iq, ip, iq8, ip8⟩ := ih (fun Y hY => hv Y (List.mem_cons_of_mem _ hY))
      (fun Y hY => hT Y (List.mem_cons_of_mem _ hY))
    obtain ⟨hX5, hX0⟩ := hv X (List.mem_cons_self ..)
    obtain ⟨hpX, hcX⟩ := hT X (List.mem_cons_self ..)
    obtain ⟨tq, tp, _⟩ := tight_mask hd X hX5 hX0 hcX t hpX
    simp only [RootCheck.q0, RootCheck.p0]
    cases Nat.blt (RootCheck.rk X) 3 <;> simp only [cond_true, cond_false]
    · exact ⟨iq, ip, iq8, ip8⟩
    · refine ⟨fun k => ?_, fun k => ?_, ?_, ?_⟩
      · rw [memM_land, qx_eq]; exact ⟨tq k, iq k⟩
      · rw [memM_land, px_eq]; exact ⟨tp k, ip k⟩
      · show Nat.land (RootCheck.qx X) (RootCheck.q0 Xs) < 256
        exact lt_of_le_of_lt Nat.and_le_left (by rw [qx_eq]; exact qxOf_lt _)
      · show Nat.land (RootCheck.px X) (RootCheck.p0 Xs) < 256
        exact lt_of_le_of_lt Nat.and_le_left (by rw [px_eq]; exact pxOf_lt _)

theorem getD_mem : ∀ (L : List Nat) (j : Nat), j < L.length → RootCheck.getD L j ∈ L
  | [], j, h => by simp at h
  | x :: xs, 0, _ => List.mem_cons_self ..
  | x :: xs, j+1, h => List.mem_cons_of_mem _ (getD_mem xs j (by simp at h; omega))

/-- **Root certificate soundness.** -/
theorem core_sound (hd : IsDecomp a b c) (t : Fin n) (hb : b t ≠ 0) (hc : c t ≠ 0)
    (nT : Nat) (TL SL : List Nat) (h2 : Nat)
    (hTv : ∀ X ∈ TL, X < 512 ∧ X ≠ 0) (hSv : ∀ X ∈ SL, X < 512 ∧ X ≠ 0)
    (hT : ∀ X ∈ TL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X)
    (hS : ∀ X ∈ SL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X + 1)
    (hw : RootCheck.walk nT TL SL 64 h2 (RootCheck.q0 TL) (RootCheck.p0 TL) 0 = true) : False := by
  obtain ⟨hQ, hP, hQ8, hP8⟩ := q0_mem hd t TL hTv hT
  have htr : ∀ X ∈ TL, trZ (toM3 (zxOf X)) (b t) (c t) = 1 := fun X hX =>
    (tight_mask hd X (hTv X hX).1 (hTv X hX).2 (hT X hX).2 t (hT X hX).1).2.2
  refine walk_sound nT TL SL hTv hSv (b t) (c t) hb hc htr 64 h2 _ _ 0 hQ8 hP8 hw hQ hP ?_
  intro j _ hj
  have hm := getD_mem SL j hj
  exact slack_mask hd _ (hSv _ hm).1 (hSv _ hm).2 (hS _ hm).2 t (hS _ hm).1

/-- With a tight functional in the certificate, the factors of the dead term are automatically nonzero. -/
theorem core_sound' (hd : IsDecomp a b c) (t : Fin n)
    (nT : Nat) (X0 : Nat) (TL SL : List Nat) (h2 : Nat)
    (hTv : ∀ X ∈ X0 :: TL, X < 512 ∧ X ≠ 0) (hSv : ∀ X ∈ SL, X < 512 ∧ X ≠ 0)
    (hT : ∀ X ∈ X0 :: TL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X)
    (hS : ∀ X ∈ SL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X + 1)
    (hw : RootCheck.walk nT (X0 :: TL) SL 64 h2 (RootCheck.q0 (X0 :: TL)) (RootCheck.p0 (X0 :: TL)) 0 = true) :
    False := by
  obtain ⟨hX5, hX0⟩ := hTv X0 (List.mem_cons_self ..)
  obtain ⟨hpX, hcX⟩ := hT X0 (List.mem_cons_self ..)
  have hr : (TX (toM3 X0)).rank = (hitSet a (toM3 X0)).card := by rw [rank_TX X0 hX5 hX0, hcX]
  obtain ⟨h1, _, h3⟩ := term_tight hd (toM3 X0) hr t hpX
  have hb : b t ≠ 0 := by
    intro hb0
    have := h3 0 (by rw [hb0]; funext y; simp [vecB, Matrix.mulVec, dotProduct])
    simp at this
  have hc : c t ≠ 0 := by
    intro hc0
    obtain ⟨x0, hx0⟩ := h1
    have := h3 x0 hx0
    rw [hc0] at this
    simp [vecC, dotProduct] at this
  exact core_sound hd t hb hc nT (X0 :: TL) SL h2 hTv hSv hT hS hw

end RootSound
