module
public import R22Port.U_6d73af0793e7
public import RootSound.Tensor
public import Mathlib
/-! # Lemma G: rank alignment from the split flattening (soundness of the Lemma G step of BranchCheck v6)

For a decomposition `T = ∑_s a_s ⊗ b_s ⊗ c_s` of `<3,3,3>` over `F2` (`IsDecomp`, coordinates of Tensor.lean) and
`Δ_A = ∑_s rank a_s - 27`:

* `split_flattening`: `27 ≤ ∑_s rank a_s` (`Δ_A ≥ 0`); the checker refutes a full-`T` leaf whose first factors have
  rank sum `< 27` outright;
* `lemmaG`: `rank a_t + 27 ≤ ∑_s rank a_s + rank (b_t * c_t)`, so `rank b_t, rank c_t ≥ rank a_t - Δ_A`
  (`lemmaG_b`, `lemmaG_c`): the checker ANDs the candidate domains of term `t` with `RANKGE[rank a_t - Δ_A]`.

Proof (r22/thm3): the split flattening `P[(i, j', k), (j, k', i')] = T[ij, j'k, k'i']` is the permutation matrix of
`σ (i, j', k) = (j', k, i)`, hence invertible with `P⁻¹ = Pᵀ`.  Factor `a_s = L_s R_s` through `Fin (rank a_s)` and put
`X = [L_s ⊗ b_s]`, `Y = [R_s ⊗ c_s]` (blocks indexed by `Σ s, Fin (rank a_s)`), so `X Y = P`.  Then `G = Y Pᵀ X` is
idempotent of rank 27, so `rank (1 - G) ≤ ∑_s rank a_s - 27`; the `(t, t)` block of `1 - G` is `1 - G_tt` with
`G_tt = R_t (b_t c_t) L_t`, and `rank a_t ≤ rank G_tt + rank (1 - G)_tt`. -/
@[expose] public section
open Matrix Module

set_option linter.unusedSectionVars false

namespace RootSound.LemmaG

section general

variable {K : Type*} [Field K] {m n : Type*} [Fintype m] [Fintype n]

theorem rank_add_le' (A B : Matrix m n K) : (A + B).rank ≤ A.rank + B.rank := by
  have h : LinearMap.range (A + B).mulVecLin ≤ LinearMap.range A.mulVecLin ⊔ LinearMap.range B.mulVecLin := by
    rw [show (A + B).mulVecLin = A.mulVecLin + B.mulVecLin from LinearMap.ext (fun v => Matrix.add_mulVec A B v)]
    exact LinearMap.range_add_le _ _
  exact (Submodule.finrank_mono h).trans (Submodule.finrank_add_le_finrank_add_finrank _ _)

/-- rank factorization `A = L R` through `Fin (rank A)` -/
theorem exists_factor [DecidableEq n] (A : Matrix m n K) :
    ∃ (L : Matrix m (Fin A.rank) K) (R : Matrix (Fin A.rank) n K), L * R = A := by
  let V := LinearMap.range A.mulVecLin
  let bs : Basis (Fin A.rank) K V := Module.finBasis K V
  have hcol : ∀ k, (fun i => A i k) ∈ V := fun k =>
    ⟨Pi.single k 1, by funext i; simp [Matrix.mulVec_single]⟩
  refine ⟨fun i j => (bs j : m → K) i, fun j k => bs.repr ⟨fun i => A i k, hcol k⟩ j, ?_⟩
  ext i k
  have h := congrArg (fun v : V => (v : m → K) i) (bs.sum_repr ⟨fun i => A i k, hcol k⟩)
  simp only [Submodule.coe_sum, Submodule.coe_smul, Finset.sum_apply, Pi.smul_apply, smul_eq_mul] at h
  rw [Matrix.mul_apply, ← h]
  exact Finset.sum_congr rfl (fun j _ => mul_comm _ _)

end general

/-- index `(i, (j', k))` of the split flattening -/
abbrev I27 := Fin 3 × (Fin 3 × Fin 3)

/-- `σ (i, j', k) = (j', k, i)` -/
def σ : I27 ≃ I27 where
  toFun p := (p.2.1, (p.2.2, p.1))
  invFun q := (q.2.2, (q.1, q.2.1))
  left_inv _ := rfl
  right_inv _ := rfl

/-- the split flattening of `<3,3,3>`: `P[(i, j', k), (j, k', i')] = [j = j' ∧ k = k' ∧ i = i']` -/
def Pm : Matrix I27 I27 F2 := fun p q => if q = σ p then 1 else 0

theorem card_I27 : Fintype.card I27 = 27 := by simp [Fintype.card_prod]

theorem Pm_mul_transpose : Pm * Pmᵀ = 1 := by
  ext p p'
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Pm, Matrix.one_apply, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true, σ.injective.eq_iff]

theorem transpose_mul_Pm : Pmᵀ * Pm = 1 := by
  ext p p'
  have h : ∀ (x q : I27), (x = σ q) ↔ (q = σ.symm x) := fun x q => by
    rw [eq_comm, Equiv.apply_eq_iff_eq_symm_apply]
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Pm, Matrix.one_apply, h, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true, σ.symm.injective.eq_iff]

theorem rank_Pm : Pm.rank = 27 := by
  apply le_antisymm
  · exact (Matrix.rank_le_card_width Pm).trans card_I27.le
  · have h := Matrix.rank_mul_le_left Pm Pmᵀ
    rw [Pm_mul_transpose, Matrix.rank_one, card_I27] at h
    exact h

section core

variable {n : ℕ} {a b c : Fin n → M3} {r : Fin n → ℕ}

/-- `X = [L_s ⊗ b_s]`, rows `(i, (j', k))`, columns `⟨s, q⟩` -/
def Xm (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2) (b : Fin n → M3) : Matrix I27 (Σ s, Fin (r s)) F2 :=
  fun p sq => L sq.1 p.1 sq.2 * b sq.1 p.2.1 p.2.2

/-- `Y = [R_s ⊗ c_s]`, rows `⟨s, q⟩`, columns `(j, (k', i'))` -/
def Ym (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2) (c : Fin n → M3) : Matrix (Σ s, Fin (r s)) I27 F2 :=
  fun sq q => R sq.1 sq.2 q.1 * c sq.1 q.2.1 q.2.2

theorem XY_eq (hd : IsDecomp a b c) (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2) (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2)
    (hLR : ∀ s, L s * R s = a s) : Xm L b * Ym R c = Pm := by
  ext p q
  simp only [Matrix.mul_apply, Xm, Ym, Fintype.sum_sigma]
  have key : ∀ s, ∑ x : Fin (r s), L s p.1 x * b s p.2.1 p.2.2 * (R s x q.1 * c s q.2.1 q.2.2) =
      a s p.1 q.1 * b s p.2.1 p.2.2 * c s q.2.1 q.2.2 := by
    intro s
    rw [← hLR s, Matrix.mul_apply, Finset.sum_mul, Finset.sum_mul]
    exact Finset.sum_congr rfl (fun x _ => by ring)
  simp only [key]
  rw [hd p.1 q.1 p.2.1 p.2.2 q.2.1 q.2.2]
  simp only [Pm, σ, Equiv.coe_fn_mk]
  congr 1
  apply propext
  constructor
  · rintro ⟨h1, h2, h3⟩
    exact Prod.ext h1 (Prod.ext h2.symm h3.symm)
  · intro h
    rw [h]
    exact ⟨rfl, rfl, rfl⟩

/-- the split flattening bound for any factorization `a_s = L_s R_s` through `Fin (r s)` -/
theorem core_split (hd : IsDecomp a b c) (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2)
    (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2) (hLR : ∀ s, L s * R s = a s) : 27 ≤ ∑ s, r s := by
  have h := Matrix.rank_mul_le_left (Xm L b) (Ym R c)
  rw [XY_eq hd L R hLR, rank_Pm] at h
  exact h.trans ((Matrix.rank_le_card_width _).trans (by simp [Fintype.card_sigma]))

/-- the alignment bound for any factorization `a_s = L_s R_s` through `Fin (r s)` -/
theorem core_align (hd : IsDecomp a b c) (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2)
    (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2) (hLR : ∀ s, L s * R s = a s) (t : Fin n) :
    r t + 27 ≤ (∑ s, r s) + (b t * c t).rank := by
  classical
  set X := Xm L b with hXdef
  set Y := Ym R c with hYdef
  have hXY : X * Y = Pm := XY_eq hd L R hLR
  set G := Y * Pmᵀ * X with hGdef
  have hGG : G * G = G := by
    have : G * G = Y * (Pmᵀ * (X * Y) * Pmᵀ) * X := by simp only [hGdef, Matrix.mul_assoc]
    rw [this, hXY, transpose_mul_Pm, Matrix.one_mul]
  have hrkG : G.rank = 27 := by
    apply le_antisymm
    · calc G.rank = (Y * (Pmᵀ * X)).rank := by rw [hGdef, Matrix.mul_assoc]
        _ ≤ (Pmᵀ * X).rank := Matrix.rank_mul_le_right _ _
        _ ≤ 27 := (Matrix.rank_le_card_height _).trans card_I27.le
    · have h1 : X * G * Y = Pm := by
        have : X * G * Y = (X * Y) * Pmᵀ * (X * Y) := by simp only [hGdef, Matrix.mul_assoc]
        rw [this, hXY, Pm_mul_transpose, Matrix.one_mul]
      calc 27 = Pm.rank := rank_Pm.symm
        _ = (X * (G * Y)).rank := by rw [← h1, Matrix.mul_assoc]
        _ ≤ (G * Y).rank := Matrix.rank_mul_le_right _ _
        _ ≤ G.rank := Matrix.rank_mul_le_left _ _
  have hcomp : (1 - G) * G = 0 := by rw [Matrix.sub_mul, Matrix.one_mul, hGG, sub_self]
  have hsum : (1 - G).rank + G.rank ≤ Fintype.card (Σ s, Fin (r s)) :=
    Matrix.rank_add_rank_le_card_of_mul_eq_zero hcomp
  have hcard : Fintype.card (Σ s, Fin (r s)) = ∑ s, r s := by simp [Fintype.card_sigma]
  -- the (t, t) block
  let e : Fin (r t) → Σ s, Fin (r s) := fun q => ⟨t, q⟩
  have he : Function.Injective e := fun q q' h => eq_of_heq (Sigma.mk.inj_iff.1 h).2
  have hblock : G.submatrix e e = R t * (b t * c t) * L t := by
    ext p q
    simp only [Matrix.submatrix_apply, Matrix.mul_apply, Matrix.transpose_apply, hGdef, hXdef, hYdef, Xm, Ym, Pm, e,
      mul_ite, mul_one, mul_zero, Finset.sum_ite_eq', Finset.mem_univ, if_true, Fintype.sum_prod_type, σ,
      Equiv.coe_fn_mk, Finset.sum_mul, Finset.mul_sum]
    refine Finset.sum_congr rfl (fun i _ => ?_)
    refine Finset.sum_congr rfl (fun j _ => Finset.sum_congr rfl (fun k _ => by ring))
  have hsub : (1 - G).submatrix e e = 1 - G.submatrix e e := by
    ext i j
    simp only [Matrix.submatrix_apply, Matrix.sub_apply, Matrix.one_apply, he.eq_iff]
  have h1 : r t ≤ (G.submatrix e e).rank + ((1 - G).submatrix e e).rank := by
    have := rank_add_le' (G.submatrix e e) (1 - G.submatrix e e)
    rw [add_sub_cancel, Matrix.rank_one, Fintype.card_fin] at this
    rw [hsub]
    exact this
  have h2 : (G.submatrix e e).rank ≤ (b t * c t).rank := by
    rw [hblock]
    exact (Matrix.rank_mul_le_left _ _).trans (Matrix.rank_mul_le_right _ _)
  have h3 : ((1 - G).submatrix e e).rank ≤ (1 - G).rank := Matrix.rank_submatrix_le _ _ _
  omega

end core

variable {n : ℕ} {a b c : Fin n → M3}

/-- **Split flattening**: `27 ≤ ∑_s rank a_s`. -/
theorem split_flattening (hd : IsDecomp a b c) : 27 ≤ ∑ s, (a s).rank := by
  choose L R hLR using fun s => exists_factor (a s)
  exact core_split hd L R hLR

/-- **Lemma G**: `rank a_t + 27 ≤ ∑_s rank a_s + rank (b_t c_t)`. -/
theorem lemmaG (hd : IsDecomp a b c) (t : Fin n) :
    (a t).rank + 27 ≤ (∑ s, (a s).rank) + (b t * c t).rank := by
  choose L R hLR using fun s => exists_factor (a s)
  exact core_align hd L R hLR t

theorem lemmaG_b (hd : IsDecomp a b c) (t : Fin n) : (a t).rank + 27 ≤ (∑ s, (a s).rank) + (b t).rank := by
  have h1 := lemmaG hd t
  have h2 := Matrix.rank_mul_le_left (b t) (c t)
  omega

theorem lemmaG_c (hd : IsDecomp a b c) (t : Fin n) : (a t).rank + 27 ≤ (∑ s, (a s).rank) + (c t).rank := by
  have h1 := lemmaG hd t
  have h2 := Matrix.rank_mul_le_right (b t) (c t)
  omega

end RootSound.LemmaG
