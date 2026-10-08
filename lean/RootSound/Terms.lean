module
public import R22Port.U_d41d8cd98f00
public import RootSound.Tensor
/-! # Lemma R for one functional: tight and slack-one terms of a decomposition

For a decomposition `(a, b, c)` and a functional `X`, the terms with `X(a_s) = 1` give
`T(X) = ∑_{s hit} vecB (b s) ⊗ vecC (c s)`; `tight_fs` and `slack_fs` give the conditions of Lemma R. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

theorem zmod2_cases : ∀ x : F2, x = 0 ∨ x = 1 := by decide

variable {n : ℕ} {a b c : Fin n → M3}

/-- the terms hit by `X` -/
def hitSet (a : Fin n → M3) (X : M3) : Finset (Fin n) := Finset.univ.filter (fun s => pair X (a s) = 1)

theorem TX_eq_sum (hd : IsDecomp a b c) (X : M3) :
    TX X = ∑ s ∈ hitSet a X, Matrix.vecMulVec (vecB (b s)) (vecC (c s)) := by
  ext y z
  rw [contract hd X y z, Matrix.sum_apply]
  simp only [Matrix.vecMulVec_apply, hitSet]
  rw [Finset.sum_filter]
  refine Finset.sum_congr rfl (fun s _ => ?_)
  rcases zmod2_cases (pair X (a s)) with h | h <;> simp [h]

/-- **Tight `X`** (`#hit = rank T(X)`), for a hit term `t`: `vecB (b t)` lies in the range of `T(X)`, `vecC (c t)` in
the range of `T(X)ᵀ`, and `T(X) x = vecB (b t)` forces `vecC (c t) ⬝ᵥ x = 1`. -/
theorem term_tight (hd : IsDecomp a b c) (X : M3) (hX : (TX X).rank = (hitSet a X).card)
    (t : Fin n) (ht : pair X (a t) = 1) :
    vecB (b t) ∈ LinearMap.range (TX X).mulVecLin ∧
    vecC (c t) ∈ LinearMap.range (TX X)ᵀ.mulVecLin ∧
    ∀ x, (TX X).mulVec x = vecB (b t) → vecC (c t) ⬝ᵥ x = 1 := by
  rw [TX_eq_sum hd X] at hX ⊢
  exact tight_fs (hitSet a X) (fun s => vecB (b s)) (fun s => vecC (c s)) hX t
    (by simp [hitSet, ht])

/-- **Slack-one `X`** (`#hit = rank T(X) + 1`), for a hit term `t`: `vecB (b t)` lies in the range of `T(X)` or
`vecC (c t)` in the range of `T(X)ᵀ`. -/
theorem term_slack (hd : IsDecomp a b c) (X : M3) (hX : (TX X).rank + 1 = (hitSet a X).card)
    (t : Fin n) (ht : pair X (a t) = 1) :
    vecB (b t) ∈ LinearMap.range (TX X).mulVecLin ∨ vecC (c t) ∈ LinearMap.range (TX X)ᵀ.mulVecLin := by
  rw [TX_eq_sum hd X] at hX ⊢
  exact slack_fs (hitSet a X) (fun s => vecB (b s)) (fun s => vecC (c s)) hX t (by simp [hitSet, ht])

end RootSound
