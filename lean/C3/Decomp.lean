module
public import R22Port.U_d41d8cd98f00
public import C3.Act
/-! # Every element of `G` maps decompositions of `<3,3,3>` to decompositions

`T = ∑ e_ij ⊗ e_jk ⊗ e_ki` (RootSound's `IsDecomp`).  For invertible `P, Q`:
* `(a, b, c) ↦ (P a, b, c P⁻¹)` (`isDecomp_left`) and `(a, b, c) ↦ (a Q, Q⁻¹ b, c)` (`isDecomp_mid`) keep decompositions,
  because `tr(P a b c P⁻¹) = tr(a b c)` and `tr(a Q Q⁻¹ b c) = tr(a b c)`;
* `(a, b, c) ↦ (aᵀ, cᵀ, bᵀ)` (`isDecomp_tr`) keeps decompositions.
So `actN t P Q` applied to the first factors comes with a decomposition (`isDecomp_actN`). -/
@[expose] public section
namespace C3
open RootSound Matrix

theorem isDecomp_left {n : ℕ} {a b c : Fin n → M3} (hd : IsDecomp a b c) (P P' : M3) (hP : P * P' = 1) :
    IsDecomp (fun s => P * a s) b (fun s => c s * P') := by
  intro i j j' k k' i'
  simp only [Matrix.mul_apply]
  have e1 : ∀ s, (∑ p, P i p * a s p j) * b s j' k * (∑ u, c s k' u * P' u i') =
      ∑ p, ∑ u, (P i p * P' u i') * (a s p j * b s j' k * c s k' u) := by
    intro s
    rw [Finset.sum_mul, Finset.sum_mul]
    refine Finset.sum_congr rfl (fun p _ => ?_)
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl (fun u _ => ?_)
    ring
  rw [Finset.sum_congr rfl (fun s _ => e1 s), Finset.sum_comm]
  have e2 : ∀ p, (∑ s, ∑ u, (P i p * P' u i') * (a s p j * b s j' k * c s k' u)) =
      ∑ u, (P i p * P' u i') * (if j = j' ∧ k = k' ∧ p = u then 1 else 0) := by
    intro p
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl (fun u _ => ?_)
    rw [← Finset.mul_sum, hd p j j' k k' u]
  rw [Finset.sum_congr rfl (fun p _ => e2 p)]
  have hPP := congrFun (congrFun hP i) i'
  rw [Matrix.mul_apply] at hPP
  by_cases h : j = j' ∧ k = k'
  · have e3 : ∀ p, (∑ u, (P i p * P' u i') * (if j = j' ∧ k = k' ∧ p = u then (1 : F2) else 0)) = P i p * P' p i' := by
      intro p
      rw [Finset.sum_eq_single p]
      · rw [if_pos ⟨h.1, h.2, rfl⟩, mul_one]
      · intro u _ hu; rw [if_neg (fun h' => hu h'.2.2.symm), mul_zero]
      · intro hp; exact absurd (Finset.mem_univ p) hp
    rw [Finset.sum_congr rfl (fun p _ => e3 p), hPP, Matrix.one_apply]
    by_cases hi : i = i'
    · rw [if_pos hi, if_pos ⟨h.1, h.2, hi⟩]
    · rw [if_neg hi, if_neg (fun h' => hi h'.2.2)]
  · have e3 : ∀ p, (∑ u, (P i p * P' u i') * (if j = j' ∧ k = k' ∧ p = u then (1 : F2) else 0)) = 0 := by
      intro p
      apply Finset.sum_eq_zero
      intro u _
      rw [if_neg (fun h' => h ⟨h'.1, h'.2.1⟩), mul_zero]
    rw [Finset.sum_congr rfl (fun p _ => e3 p), Finset.sum_const_zero, if_neg (fun h' => h ⟨h'.1, h'.2.1⟩)]

theorem isDecomp_mid {n : ℕ} {a b c : Fin n → M3} (hd : IsDecomp a b c) (Q Q' : M3) (hQ : Q' * Q = 1) :
    IsDecomp (fun s => a s * Q) (fun s => Q' * b s) c := by
  intro i j j' k k' i'
  simp only [Matrix.mul_apply]
  have e1 : ∀ s, (∑ q, a s i q * Q q j) * (∑ r, Q' j' r * b s r k) * c s k' i' =
      ∑ q, ∑ r, (Q q j * Q' j' r) * (a s i q * b s r k * c s k' i') := by
    intro s
    rw [Finset.sum_mul, Finset.sum_mul]
    refine Finset.sum_congr rfl (fun q _ => ?_)
    rw [Finset.mul_sum, Finset.sum_mul]
    refine Finset.sum_congr rfl (fun r _ => ?_)
    ring
  rw [Finset.sum_congr rfl (fun s _ => e1 s), Finset.sum_comm]
  have e2 : ∀ q, (∑ s, ∑ r, (Q q j * Q' j' r) * (a s i q * b s r k * c s k' i')) =
      ∑ r, (Q q j * Q' j' r) * (if q = r ∧ k = k' ∧ i = i' then 1 else 0) := by
    intro q
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl (fun r _ => ?_)
    rw [← Finset.mul_sum, hd i q r k k' i']
  rw [Finset.sum_congr rfl (fun q _ => e2 q)]
  have hQQ := congrFun (congrFun hQ j') j
  rw [Matrix.mul_apply] at hQQ
  by_cases h : k = k' ∧ i = i'
  · have e3 : ∀ q, (∑ r, (Q q j * Q' j' r) * (if q = r ∧ k = k' ∧ i = i' then (1 : F2) else 0)) = Q' j' q * Q q j := by
      intro q
      rw [Finset.sum_eq_single q]
      · rw [if_pos ⟨rfl, h.1, h.2⟩, mul_one, mul_comm]
      · intro r _ hr; rw [if_neg (fun h' => hr h'.1.symm), mul_zero]
      · intro hq; exact absurd (Finset.mem_univ q) hq
    rw [Finset.sum_congr rfl (fun q _ => e3 q), hQQ, Matrix.one_apply]
    by_cases hj : j' = j
    · rw [if_pos hj, if_pos ⟨hj.symm, h.1, h.2⟩]
    · rw [if_neg hj, if_neg (fun h' => hj h'.1.symm)]
  · have e3 : ∀ q, (∑ r, (Q q j * Q' j' r) * (if q = r ∧ k = k' ∧ i = i' then (1 : F2) else 0)) = 0 := by
      intro q
      apply Finset.sum_eq_zero
      intro r _
      rw [if_neg (fun h' => h ⟨h'.2.1, h'.2.2⟩), mul_zero]
    rw [Finset.sum_congr rfl (fun q _ => e3 q), Finset.sum_const_zero, if_neg (fun h' => h ⟨h'.2.1, h'.2.2⟩)]

theorem isDecomp_tr {n : ℕ} {a b c : Fin n → M3} (hd : IsDecomp a b c) :
    IsDecomp (fun s => (a s)ᵀ) (fun s => (c s)ᵀ) (fun s => (b s)ᵀ) := by
  intro i j j' k k' i'
  simp only [Matrix.transpose_apply]
  have e : (∑ s, a s j i * c s k j' * b s i' k') = ∑ s, a s j i * b s i' k' * c s k j' :=
    Finset.sum_congr rfl (fun s _ => by ring)
  rw [e, hd j i i' k' k j']
  by_cases h : j = j' ∧ k = k' ∧ i = i'
  · rw [if_pos h, if_pos ⟨h.2.2, h.2.1.symm, h.1⟩]
  · rw [if_neg h, if_neg (fun h' => h ⟨h'.2.2, h'.2.1.symm, h'.1⟩)]

/-- **Decomposition transport.** If the first factors `toM3 (av s)` belong to a decomposition, so do the first factors
`toM3 (actN t P Q (av s))`, for every element `(t, P, Q)` of `G`. -/
theorem isDecomp_actN {n : ℕ} {av : Fin n → ℕ} {b c : Fin n → M3} (hd : IsDecomp (fun s => toM3 (av s)) b c)
    {t : Bool} {P Q : Nat} (hP : isGL P = true) (hQ : isGL Q = true) :
    ∃ b' c' : Fin n → M3, IsDecomp (fun s => toM3 (actN t P Q (av s))) b' c' := by
  obtain ⟨hP1, -⟩ := gl_inv hP
  obtain ⟨-, hQ2⟩ := gl_inv hQ
  have key : ∀ {a : Fin n → M3} {b c : Fin n → M3}, IsDecomp a b c →
      IsDecomp (fun s => toM3 P * a s * toM3 Q) (fun s => toM3 (invN Q) * b s) (fun s => c s * toM3 (invN P)) := by
    intro a b c h
    exact isDecomp_mid (isDecomp_left h (toM3 P) (toM3 (invN P)) hP1) (toM3 Q) (toM3 (invN Q)) hQ2
  cases t
  · refine ⟨fun s => toM3 (invN Q) * b s, fun s => c s * toM3 (invN P), ?_⟩
    have h := key hd
    simp only [toM3_actN, cond_false]
    exact h
  · refine ⟨fun s => toM3 (invN Q) * (c s)ᵀ, fun s => (b s)ᵀ * toM3 (invN P), ?_⟩
    have h := key (isDecomp_tr hd)
    simp only [toM3_actN, cond_true]
    exact h

end C3
