module
public import R22Port.U_0eb471db7a46
public import RootSound.Sem
public import Mathlib.LinearAlgebra.Basis.Bilinear
/-! # `tr(Z_X b c)` on the range, and Lemma R for one functional in mask form -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace RootSound

theorem matOf_add (u v : Fin 9 → F2) : matOf (u + v) = matOf u + matOf v := by
  funext p q; simp [matOf]
theorem matOf_smul (r : F2) (u : Fin 9 → F2) : matOf (r • u) = r • matOf u := by
  funext p q; simp [matOf]
theorem trZ_add_left (Z b b' c : M3) : trZ Z (b + b') c = trZ Z b c + trZ Z b' c := by
  simp [trZ, Matrix.mul_add, Matrix.add_mul, Matrix.trace_add]
theorem trZ_add_right (Z b c c' : M3) : trZ Z b (c + c') = trZ Z b c + trZ Z b c' := by
  simp [trZ, Matrix.mul_add, Matrix.trace_add]
theorem trZ_smul_left (Z b c : M3) (r : F2) : trZ Z (r • b) c = r * trZ Z b c := by
  simp [trZ, Matrix.trace_smul]
theorem trZ_smul_right (Z b c : M3) (r : F2) : trZ Z b (r • c) = r * trZ Z b c := by
  simp [trZ, Matrix.trace_smul]

/-- the bilinear form `(x, y) ↦ tr(Z (M x) (Mᵀ y))` -/
def trForm (Z : M3) (M : Matrix (Fin 9) (Fin 9) F2) : (Fin 9 → F2) →ₗ[F2] (Fin 9 → F2) →ₗ[F2] F2 :=
  LinearMap.mk₂ F2 (fun x y => trZ Z (matOf (M *ᵥ x)) (matOf (Mᵀ *ᵥ y)))
    (fun x x' y => by dsimp only; rw [Matrix.mulVec_add, matOf_add, trZ_add_left])
    (fun r x y => by dsimp only; rw [Matrix.mulVec_smul, matOf_smul, trZ_smul_left, smul_eq_mul])
    (fun x y y' => by dsimp only; rw [Matrix.mulVec_add, matOf_add, trZ_add_right])
    (fun r x y => by dsimp only; rw [Matrix.mulVec_smul, matOf_smul, trZ_smul_right, smul_eq_mul])

/-- the bilinear form `(x, y) ↦ y ⬝ᵥ M x` -/
def dotForm (M : Matrix (Fin 9) (Fin 9) F2) : (Fin 9 → F2) →ₗ[F2] (Fin 9 → F2) →ₗ[F2] F2 :=
  LinearMap.mk₂ F2 (fun x y => y ⬝ᵥ (M *ᵥ x))
    (fun x x' y => by dsimp only; rw [Matrix.mulVec_add, dotProduct_add])
    (fun r x y => by dsimp only; rw [Matrix.mulVec_smul, dotProduct_smul])
    (fun x y y' => by dsimp only; rw [add_dotProduct])
    (fun r x y => by dsimp only; rw [smul_dotProduct])

theorem trZ_range (Z : M3) (M : Matrix (Fin 9) (Fin 9) F2)
    (hB : ∀ z w : Fin 9, trZ Z (matOf (fun y => M y z)) (matOf (fun z' => M w z')) = M w z)
    (x y : Fin 9 → F2) : trZ Z (matOf (M *ᵥ x)) (matOf (Mᵀ *ᵥ y)) = y ⬝ᵥ (M *ᵥ x) := by
  have : trForm Z M = dotForm M := by
    refine LinearMap.ext_basis (Pi.basisFun F2 (Fin 9)) (Pi.basisFun F2 (Fin 9)) (fun z w => ?_)
    simp only [trForm, dotForm, LinearMap.mk₂_apply, Pi.basisFun_apply]
    have e1 : M *ᵥ Pi.single z (1 : F2) = fun y => M y z := by
      funext y; simp [Matrix.mulVec, dotProduct, Pi.single_apply]
    have e2 : Mᵀ *ᵥ Pi.single w (1 : F2) = fun z' => M w z' := by
      funext z'; simp [Matrix.mulVec, dotProduct, Pi.single_apply, Matrix.transpose_apply]
    rw [e1, e2, hB]
    simp [dotProduct, Pi.single_apply]
  have h := congrArg (fun f => f x y) this
  simpa [trForm, dotForm] using h

theorem matOf_vecB (b : M3) : matOf (vecB b) = b := by
  funext p q; simp only [matOf, vecB, hi, lo]; congr 1 <;> ext <;> simp <;> omega
theorem matOf_vecC (c : M3) : matOf (vecC c) = c := by
  funext p q; simp only [matOf, vecC, hi, lo]; congr 1 <;> ext <;> simp <;> omega

variable {n : ℕ} {a b c : Fin n → M3}

/-- **Lemma R, tight `X`, mask form.** -/
theorem tight_mask (hd : IsDecomp a b c) (X : Nat) (hX : X < 512) (h0 : X ≠ 0)
    (hcard : (hitSet a (toM3 X)).card = 3 * rkOf X) (t : Fin n) (ht : pair (toM3 X) (a t) = 1) :
    (∀ k, memM (qxOf X) (colB (b t) k)) ∧ (∀ k, memM (pxOf X) (rowC (c t) k)) ∧
    trZ (toM3 (zxOf X)) (b t) (c t) = 1 := by
  have hr : (TX (toM3 X)).rank = (hitSet a (toM3 X)).card := by rw [rank_TX X hX h0, hcard]
  obtain ⟨h1, h2, h3⟩ := term_tight hd (toM3 X) hr t ht
  refine ⟨?_, ?_, ?_⟩
  · have := range_cols X hX h0 _ h1; rwa [matOf_vecB] at this
  · have := range_rows X hX h0 _ h2; rwa [matOf_vecC] at this
  · obtain ⟨x0, hx0⟩ := h1
    obtain ⟨y0, hy0⟩ := h2
    simp only [Matrix.mulVecLin_apply] at hx0 hy0
    have hc1 := h3 x0 hx0
    have F := perX_all X hX h0
    have key := trZ_range (toM3 (zxOf X)) (TX (toM3 X)) F.z_basis x0 y0
    rw [hx0, hy0, matOf_vecB, matOf_vecC] at key
    rw [key, ← hc1, ← hy0, ← hx0, Matrix.dotProduct_mulVec, Matrix.mulVec_transpose]

/-- **Lemma R, slack-one `X`, mask form.** -/
theorem slack_mask (hd : IsDecomp a b c) (X : Nat) (hX : X < 512) (h0 : X ≠ 0)
    (hcard : (hitSet a (toM3 X)).card = 3 * rkOf X + 1) (t : Fin n) (ht : pair (toM3 X) (a t) = 1) :
    (∀ k, memM (qxOf X) (colB (b t) k)) ∨ (∀ k, memM (pxOf X) (rowC (c t) k)) := by
  have hr : (TX (toM3 X)).rank + 1 = (hitSet a (toM3 X)).card := by rw [rank_TX X hX h0, hcard]
  rcases term_slack hd (toM3 X) hr t ht with h1 | h2
  · left; have := range_cols X hX h0 _ h1; rwa [matOf_vecB] at this
  · right; have := range_rows X hX h0 _ h2; rwa [matOf_vecC] at this

end RootSound
