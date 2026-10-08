module
public import R22Port.U_d41d8cd98f00
public import RootSound.Terms
/-! # Soundness core of the per-term branching checker (`r22/lean/branch/BranchCheck5.lean`, model `bmodel4.py`)

The checker branches on one term at a time.  At a node the assigned terms `A` carry their `(b, c)`; for a functional `X`
the residual is `R(X) = T(X) + ∑_{s ∈ A, X(a_s) = 1} b_s c_sᵀ`.

* `resid_eq` (char 2): `R(X) = ∑_{s ∉ A, X(a_s) = 1} b_s c_sᵀ`, so Lemma R (`tight_fs`, `slack_fs`) applies to residuals:
  `tight_resid`, `slack_resid`.
* `delta_of_tight`: for a tight `M = ∑_{s ∈ S} β_s γ_sᵀ` (`rank M = #S`) and ANY map `x` that inverts `M` on its column
  space, `γ_s ⬝ x(β_t) = δ_st` for all `s, t ∈ S`.  This is why a tight record built at a node stays valid below it: a
  child that assigns `(b, c)` to a term through `X` keeps `lm &= perp(g(c))`, `rm &= perp(x(b))` with the SAME `x`
  (the elimination data of the node where the record was built), because the remaining terms satisfy
  `c ⬝ x(b_t) = 0` and `c_t ⬝ x(b) = 0`, and the branching term itself satisfies `c ⬝ x(b) = 1`.
* `linIndep_of_pivots`, `rank_ge_of_pivots`: vectors with distinct pivots (nonzero at the pivot, zero above it) in the
  column space bound the rank from below: the elimination's pivot rows certify `rank R(X) ≥ #pivots`. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

section general

variable {K : Type*} [Field K] {m n ι : Type*} [Fintype m] [Fintype n] [DecidableEq ι]

/-- `(facB S γ)ᵀ y` at `s` is `γ s ⬝ y` -/
theorem facB_transpose_mulVec (S : Finset ι) (γ : ι → n → K) (y : n → K) (s : S) :
    ((facB S γ)ᵀ.mulVec y) s = γ s.1 ⬝ᵥ y := by
  simp [facB, Matrix.mulVec, dotProduct, Matrix.transpose_apply]

/-- **Record invariant.**  A tight sum `M = ∑_{s ∈ S} β_s γ_sᵀ` and a map `x` with `M (x v) = v` on the column space
give `γ_s ⬝ x(β_t) = δ_st` on `S`. -/
theorem delta_of_tight (S : Finset ι) (β : ι → m → K) (γ : ι → n → K)
    (h : (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).rank = S.card)
    (x : (m → K) → (n → K))
    (hx : ∀ v ∈ LinearMap.range (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).mulVecLin,
      (∑ s ∈ S, Matrix.vecMulVec (β s) (γ s)).mulVec (x v) = v)
    (s t : ι) (hs : s ∈ S) (ht : t ∈ S) :
    γ s ⬝ᵥ x (β t) = if s = t then 1 else 0 := by
  have hmem := (tight_fs S β γ h t ht).1
  have hxt := hx (β t) hmem
  rw [sum_vecMulVec_eq] at h hxt
  rw [← Fintype.card_coe S] at h
  set B := facB S β
  set C := facB S γ
  have hB : B.rank = Fintype.card S :=
    le_antisymm (Matrix.rank_le_card_width B) (h ▸ Matrix.rank_mul_le_left B Cᵀ)
  have hinj := injective_of_rank_eq_card B hB
  have hcol : β t = B.mulVec (Pi.single ⟨t, ht⟩ 1) := by
    have := col_eq_mulVec B ⟨t, ht⟩
    rw [← this]; funext i; simp [col, B, facB]
  have key : Cᵀ.mulVec (x (β t)) = Pi.single ⟨t, ht⟩ 1 := by
    apply hinj
    rw [Matrix.mulVec_mulVec, hxt, ← hcol]
  have := congrFun key ⟨s, hs⟩
  rw [facB_transpose_mulVec] at this
  rw [this]
  by_cases hst : s = t
  · subst hst; simp
  · have : (⟨s, hs⟩ : S) ≠ ⟨t, ht⟩ := fun e => hst (congrArg Subtype.val e)
    simp [this, hst]

/-- vectors with distinct pivots (nonzero at the pivot, zero above it) are linearly independent -/
theorem linIndep_of_pivots {k : ℕ} {p : ℕ} (v : Fin k → Fin p → K) (piv : Fin k → Fin p)
    (hinj : Function.Injective piv) (hone : ∀ i, v i (piv i) ≠ 0) (habove : ∀ i j, piv i < j → v i j = 0) :
    LinearIndependent K v := by
  classical
  rw [Fintype.linearIndependent_iff]
  intro g hg
  by_contra hne
  push Not at hne
  obtain ⟨i0, hi0⟩ := hne
  have hne' : (Finset.univ.filter (fun i => g i ≠ 0)).Nonempty := ⟨i0, by simp [hi0]⟩
  obtain ⟨i, hi, hmax⟩ := Finset.exists_max_image _ piv hne'
  have hgi : g i ≠ 0 := by simpa using hi
  have hev := congrFun hg (piv i)
  simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hev
  rw [Finset.sum_eq_single i] at hev
  · exact mul_ne_zero hgi (hone i) hev
  · intro j _ hji
    by_cases hgj : g j = 0
    · rw [hgj, zero_mul]
    · have hle : piv j ≤ piv i := hmax j (by simp [hgj])
      have hlt : piv j < piv i := lt_of_le_of_ne hle (fun e => hji (hinj e))
      rw [habove j (piv i) hlt, mul_zero]
  · simp

/-- pivot vectors in the column space bound the rank from below -/
theorem rank_ge_of_pivots {p q : ℕ} (M : Matrix (Fin p) (Fin q) K) {k : ℕ} (v : Fin k → Fin p → K)
    (piv : Fin k → Fin p) (hinj : Function.Injective piv) (hone : ∀ i, v i (piv i) ≠ 0)
    (habove : ∀ i j, piv i < j → v i j = 0) (hmem : ∀ i, v i ∈ LinearMap.range M.mulVecLin) :
    k ≤ M.rank := by
  have hli := linIndep_of_pivots v piv hinj hone habove
  let w : Fin k → LinearMap.range M.mulVecLin := fun i => ⟨v i, hmem i⟩
  have hw : LinearIndependent K w := by
    apply LinearIndependent.of_comp (LinearMap.range M.mulVecLin).subtype
    exact hli
  have := hw.fintype_card_le_finrank
  simpa [Matrix.rank] using this

end general

section residual

variable {n : ℕ} {a b c : Fin n → M3}

theorem f2_add_self (x : F2) : x + x = 0 := by
  rcases zmod2_cases x with h | h <;> subst h <;> decide

/-- **Residual.**  For assigned terms `A`: `T(X) + ∑_{s ∈ hit ∩ A} b_s c_sᵀ = ∑_{s ∈ hit \ A} b_s c_sᵀ`. -/
theorem resid_eq (hd : IsDecomp a b c) (X : M3) (A : Finset (Fin n)) :
    TX X + (∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))) =
      ∑ s ∈ hitSet a X \ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s)) := by
  rw [TX_eq_sum hd X]
  rw [← Finset.sum_sdiff (Finset.inter_subset_left (s₁ := hitSet a X) (s₂ := A))]
  have hsd : hitSet a X \ (hitSet a X ∩ A) = hitSet a X \ A := by
    ext s; simp [Finset.mem_sdiff]
  rw [hsd, add_assoc]
  have h0 : (∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))) +
      (∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))) = 0 := by
    ext y z; simp [Matrix.add_apply, f2_add_self]
  rw [h0, add_zero]

/-- **Lemma R on a residual, tight case.** -/
theorem tight_resid (hd : IsDecomp a b c) (X : M3) (A : Finset (Fin n))
    (hX : (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).rank = (hitSet a X \ A).card)
    (t : Fin n) (ht : pair X (a t) = 1) (htA : t ∉ A) :
    vecB (b t) ∈ LinearMap.range (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).mulVecLin ∧
    vecC (c t) ∈ LinearMap.range (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s)))ᵀ.mulVecLin ∧
      ∀ x, (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).mulVec x = vecB (b t) →
        vecC (c t) ⬝ᵥ x = 1 := by
  rw [resid_eq hd X A] at hX ⊢
  exact tight_fs (hitSet a X \ A) (fun s => vecB (b s)) (fun s => vecC (c s)) hX t
    (by simp [hitSet, ht, htA])

/-- **Lemma R on a residual, slack-one case.** -/
theorem slack_resid (hd : IsDecomp a b c) (X : M3) (A : Finset (Fin n))
    (hX : (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).rank + 1 = (hitSet a X \ A).card)
    (t : Fin n) (ht : pair X (a t) = 1) (htA : t ∉ A) :
    vecB (b t) ∈ LinearMap.range (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).mulVecLin ∨
    vecC (c t) ∈ LinearMap.range (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s)))ᵀ.mulVecLin := by
  rw [resid_eq hd X A] at hX ⊢
  exact slack_fs (hitSet a X \ A) (fun s => vecB (b s)) (fun s => vecC (c s)) hX t (by simp [hitSet, ht, htA])

/-- the rank of a residual never exceeds the number of unassigned hit terms (the `over` leaves) -/
theorem resid_rank_le (hd : IsDecomp a b c) (X : M3) (A : Finset (Fin n)) :
    (TX X + ∑ s ∈ hitSet a X ∩ A, Matrix.vecMulVec (vecB (b s)) (vecC (c s))).rank ≤ (hitSet a X \ A).card := by
  rw [resid_eq hd X A, sum_vecMulVec_eq]
  calc (facB (hitSet a X \ A) (fun s => vecB (b s)) * (facB (hitSet a X \ A) (fun s => vecC (c s)))ᵀ).rank
      ≤ (facB (hitSet a X \ A) (fun s => vecB (b s))).rank := Matrix.rank_mul_le_left _ _
    _ ≤ Fintype.card ↥(hitSet a X \ A) := Matrix.rank_le_card_width _
    _ = (hitSet a X \ A).card := Fintype.card_coe _

end residual

end RootSound
