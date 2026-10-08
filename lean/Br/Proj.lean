module
public import R22Port.U_d41d8cd98f00
public import RootSound.LemmaG
/-! # The local excess-d system (E) of a decomposition (bridge, part 1)

For a decomposition `T = ∑_s a_s ⊗ b_s ⊗ c_s` of `<3,3,3>` over `F2` (`RootSound.IsDecomp`, any number of terms) with
`∑_s rank a_s = 27 + d`:

* `excess_system`: there are `l_s, m_s ∈ F2^{3×d}` with `l_s ∈ col(a_s)`, `m_s ∈ col(a_sᵀ)` and, for all `t, s`,
  `a_t b_s c_t a_s = [t = s] a_t + l_t m_sᵀ`
  (the invariant form of `G_ts = δ_ts I + U_t V_sᵀ`).

Proof: factor `a_s = L_s R_s` through `Fin (rank a_s)` (`LemmaG.exists_factor`); `X Y = Pm` (`LemmaG.XY_eq`), so
`G = Y Pmᵀ X` is idempotent of rank 27 and `Π = 1 - G` has rank `N - 27 = d`; factor `Π = U W` through `Fin d`.
The `(t, s)` block of `G` is `R_t b_s c_t L_s` (`Gm_apply`).  Over `F2`, `G = 1 + U W`, so
`R_t b_s c_t L_s = δ_ts 1 + U_t W_s`; multiply by `L_t` on the left and `R_s` on the right, with `l_t = L_t U_t`,
`m_s = (W_s R_s)ᵀ`.  The column conditions come from one-sided inverses of the rank factors (`exists_right_inv`). -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace G.Br
open RootSound RootSound.LemmaG

section la
variable {K : Type*} [Field K]

/-- a matrix whose rank equals its number of rows has a right inverse -/
theorem exists_right_inv {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] (R : Matrix m n K)
    (h : R.rank = Fintype.card m) : ∃ S : Matrix n m K, R * S = 1 := by
  have htop : LinearMap.range R.mulVecLin = ⊤ := by
    apply Submodule.eq_top_of_finrank_eq
    rw [Module.finrank_fintype_fun_eq_card]
    exact h
  have hs : ∀ q : m, ∃ v : n → K, R.mulVecLin v = Pi.single q 1 := fun q => by
    have : (Pi.single q 1 : m → K) ∈ LinearMap.range R.mulVecLin := by rw [htop]; trivial
    exact this
  choose v hv using hs
  refine ⟨Matrix.of fun j q => v q j, ?_⟩
  ext i q
  have := congrFun (hv q) i
  simp only [Matrix.mulVecLin_apply, Matrix.mulVec, dotProduct] at this
  rw [Matrix.mul_apply]
  simp only [Matrix.of_apply]
  rw [this, Matrix.one_apply, Pi.single_apply]

/-- a matrix whose rank equals its number of columns has a left inverse -/
theorem exists_left_inv {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n] (L : Matrix m n K)
    (h : L.rank = Fintype.card n) : ∃ T : Matrix n m K, T * L = 1 := by
  obtain ⟨S, hS⟩ := exists_right_inv Lᵀ (by rw [Matrix.rank_transpose, h])
  refine ⟨Sᵀ, ?_⟩
  rw [← Matrix.transpose_transpose L, ← Matrix.transpose_mul, hS, Matrix.transpose_one]

/-- the factors of a rank factorization have one-sided inverses -/
theorem rank_factor_inv {m n : Type*} [Fintype m] [Fintype n] {r : ℕ} (A : Matrix m n K)
    (L : Matrix m (Fin r) K) (R : Matrix (Fin r) n K) (hLR : L * R = A) (hr : A.rank = r) :
    (∃ S : Matrix n (Fin r) K, R * S = 1) ∧ (∃ T : Matrix (Fin r) m K, T * L = 1) := by
  constructor
  · apply exists_right_inv
    apply le_antisymm
    · exact Matrix.rank_le_card_height R
    · rw [Fintype.card_fin]
      calc r = A.rank := hr.symm
        _ = (L * R).rank := by rw [hLR]
        _ ≤ R.rank := Matrix.rank_mul_le_right L R
  · apply exists_left_inv
    apply le_antisymm
    · exact Matrix.rank_le_card_width L
    · rw [Fintype.card_fin]
      calc r = A.rank := hr.symm
        _ = (L * R).rank := by rw [hLR]
        _ ≤ L.rank := Matrix.rank_mul_le_left L R

end la

theorem F2_neg (x : F2) : -x = x := by revert x; decide

theorem F2_sub (x y : F2) : x - y = x + y := by rw [sub_eq_add_neg, F2_neg]

section proj
variable {n : ℕ} {a b c : Fin n → M3}

/-- the `(t, s)` block of `G = Y Pmᵀ X` is `R_t b_s c_t L_s` -/
theorem Gm_apply {r : Fin n → ℕ} (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2) (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2)
    (t s : Fin n) (α : Fin (r t)) (β : Fin (r s)) :
    (Ym R c * Pmᵀ * Xm L b) ⟨t, α⟩ ⟨s, β⟩ = (R t * b s * c t * L s) α β := by
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Xm, Ym, Pm, mul_ite, mul_one, mul_zero, Finset.sum_ite_eq',
    Finset.mem_univ, if_true, Fintype.sum_prod_type, σ, Equiv.coe_fn_mk, Fin.sum_univ_three]
  ring

/-- (E) for any factorizations `a_s = L_s R_s` through `Fin (r s)` whose factors have one-sided inverses -/
theorem excess_core (hd : IsDecomp a b c) {r : Fin n → ℕ} (L : ∀ s, Matrix (Fin 3) (Fin (r s)) F2)
    (R : ∀ s, Matrix (Fin (r s)) (Fin 3) F2) (hLR : ∀ s, L s * R s = a s)
    (hS : ∀ s, ∃ S : Matrix (Fin 3) (Fin (r s)) F2, R s * S = 1)
    (hT : ∀ s, ∃ T : Matrix (Fin (r s)) (Fin 3) F2, T * L s = 1) (d : ℕ) (hsum : ∑ s, r s = 27 + d) :
    ∃ l m : Fin n → Matrix (Fin 3) (Fin d) F2,
      (∀ t s, a t * b s * c t * a s = (if t = s then a t else 0) + l t * (m s)ᵀ) ∧
      (∀ t, ∃ x : Matrix (Fin 3) (Fin d) F2, l t = a t * x) ∧
      (∀ t, ∃ y : Matrix (Fin 3) (Fin d) F2, m t = (a t)ᵀ * y) := by
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
  have hcard : Fintype.card (Σ s, Fin (r s)) = 27 + d := by
    rw [Fintype.card_sigma]; simp only [Fintype.card_fin]; exact hsum
  have hrkP : (1 - G).rank = d := by
    have h1 : (1 - G) * G = 0 := by rw [Matrix.sub_mul, Matrix.one_mul, hGG, sub_self]
    have h2 := Matrix.rank_add_rank_le_card_of_mul_eq_zero h1
    have h3 := rank_add_le' G (1 - G)
    rw [add_sub_cancel, Matrix.rank_one] at h3
    omega
  obtain ⟨Up, Wp, hUW⟩ := exists_factor (1 - G)
  let e : Fin (1 - G).rank ≃ Fin d := finCongr hrkP
  let U : Matrix (Σ s, Fin (r s)) (Fin d) F2 := Up.submatrix id e.symm
  let W : Matrix (Fin d) (Σ s, Fin (r s)) F2 := Wp.submatrix e.symm id
  have hUW' : U * W = 1 - G := by
    show Up.submatrix id e.symm * Wp.submatrix e.symm id = 1 - G
    rw [Matrix.submatrix_mul_equiv, hUW, Matrix.submatrix_id_id]
  -- the blocks of `G`
  have hG : ∀ t s (α : Fin (r t)) (β : Fin (r s)),
      (R t * b s * c t * L s) α β = (1 : Matrix (Σ s, Fin (r s)) (Σ s, Fin (r s)) F2) ⟨t, α⟩ ⟨s, β⟩ +
        ∑ x : Fin d, U ⟨t, α⟩ x * W x ⟨s, β⟩ := by
    intro t s α β
    rw [← Gm_apply L R t s α β]
    have : G = 1 - U * W := by rw [hUW', sub_sub_cancel]
    rw [show Ym R c * Pmᵀ * Xm L b = G from rfl, this, Matrix.sub_apply, F2_sub, Matrix.mul_apply]
  let Ub : ∀ t, Matrix (Fin (r t)) (Fin d) F2 := fun t α x => U ⟨t, α⟩ x
  let Wb : ∀ s, Matrix (Fin d) (Fin (r s)) F2 := fun s x β => W x ⟨s, β⟩
  have hblk_eq : ∀ t, R t * b t * c t * L t = 1 + Ub t * Wb t := by
    intro t
    ext α β
    rw [hG, Matrix.add_apply, Matrix.mul_apply]
    congr 1
    simp only [Matrix.one_apply, Sigma.mk.inj_iff, heq_eq_eq, true_and]
  have hblk_ne : ∀ t s, t ≠ s → R t * b s * c t * L s = Ub t * Wb s := by
    intro t s hts
    ext α β
    rw [hG, Matrix.mul_apply]
    simp only [Matrix.one_apply, Sigma.mk.inj_iff, hts, false_and, if_false, zero_add]
    rfl
  refine ⟨fun t => L t * Ub t, fun s => (Wb s * R s)ᵀ, ?_, ?_, ?_⟩
  · intro t s
    have e1 : a t * b s * c t * a s = L t * (R t * b s * c t * L s) * R s := by
      rw [← hLR t, ← hLR s]; simp only [Matrix.mul_assoc]
    rw [e1, Matrix.transpose_transpose]
    by_cases hts : t = s
    · subst hts
      rw [hblk_eq t, if_pos rfl, Matrix.mul_add, Matrix.add_mul, Matrix.mul_one, hLR]
      simp only [Matrix.mul_assoc]
    · rw [hblk_ne t s hts, if_neg hts, zero_add]
      simp only [Matrix.mul_assoc]
  · intro t
    obtain ⟨S, hS⟩ := hS t
    refine ⟨S * Ub t, ?_⟩
    show L t * Ub t = a t * (S * Ub t)
    rw [← hLR t, Matrix.mul_assoc, ← Matrix.mul_assoc (R t), hS, Matrix.one_mul]
  · intro t
    obtain ⟨T, hT⟩ := hT t
    refine ⟨Tᵀ * (Wb t)ᵀ, ?_⟩
    have hR : R t = T * a t := by rw [← hLR t, ← Matrix.mul_assoc, hT, Matrix.one_mul]
    show (Wb t * R t)ᵀ = (a t)ᵀ * (Tᵀ * (Wb t)ᵀ)
    rw [Matrix.transpose_mul, hR, Matrix.transpose_mul, Matrix.mul_assoc]

/-- **The local excess-d system (E)**, invariant form. -/
theorem excess_system (hd : IsDecomp a b c) (d : ℕ) (hsum : ∑ s, (a s).rank = 27 + d) :
    ∃ l m : Fin n → Matrix (Fin 3) (Fin d) F2,
      (∀ t s, a t * b s * c t * a s = (if t = s then a t else 0) + l t * (m s)ᵀ) ∧
      (∀ t, ∃ x : Matrix (Fin 3) (Fin d) F2, l t = a t * x) ∧
      (∀ t, ∃ y : Matrix (Fin 3) (Fin d) F2, m t = (a t)ᵀ * y) := by
  choose L R hLR using fun s => exists_factor (a s)
  exact excess_core hd L R hLR (fun s => (rank_factor_inv (a s) (L s) (R s) (hLR s) rfl).1)
    (fun s => (rank_factor_inv (a s) (L s) (R s) (hLR s) rfl).2) d hsum

end proj

end G.Br
