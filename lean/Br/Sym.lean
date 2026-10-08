module
public import R22Port.U_d41d8cd98f00
public import Br.Proj
public import S6.LG
/-! # Invariant term states and the symmetry action (bridge, part 2)

An *invariant state* at excess `d` is `(a, B, C, l, m)` with `l = L U`, `m = R V` (`3 × d`), independent of the
factorization of `a`.  The pair condition of (E) is `Eq2`: `a_t B_s C_t a_s = [diag] a_t + l_t m_sᵀ`; `ColOK` says
`l ∈ col(a)`, `m ∈ col(aᵀ)`.

The group `(P, Q, h, γ)` acts by `(a, B, C, l, m) ↦ (P a Q⁻¹, Q B h⁻¹, h C P⁻¹, P l γ, Q⁻ᵀ m γ⁻ᵀ)` (`act`, inverses given
explicitly); it preserves `Eq2` and `ColOK` (`act_Eq2`, `act_ColOK`), ranks and distinctness of first factors.
`normal_form`: every 9-bit code `v` has `P a Q⁻¹ = dmat (rank a)` (`dmat 2 = 17`, `dmat 3 = 273`), from the kernel-checked
GL3 certificates `S6.rkc_fact`. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace G.Br
open RootSound

/-- an invariant state at excess `d` -/
structure IS (d : ℕ) where
  a : M3
  B : M3
  C : M3
  l : Matrix (Fin 3) (Fin d) F2
  m : Matrix (Fin 3) (Fin d) F2

/-- the pair condition of (E) for `(σ, τ)`, `σ` in the row role (`dg`: the diagonal block) -/
def Eq2 {d : ℕ} (dg : Bool) (σ τ : IS d) : Prop :=
  σ.a * τ.B * σ.C * τ.a = (if dg then σ.a else 0) + σ.l * τ.mᵀ

/-- `l ∈ col(a)` and `m ∈ col(aᵀ)` -/
def ColOK {d : ℕ} (σ : IS d) : Prop :=
  (∃ x : Matrix (Fin 3) (Fin d) F2, σ.l = σ.a * x) ∧ (∃ y : Matrix (Fin 3) (Fin d) F2, σ.m = σ.aᵀ * y)

/-- an invariant family: all pair conditions, and the column conditions -/
def IFam {n d : ℕ} (f : Fin n → IS d) : Prop := (∀ t s, Eq2 (decide (t = s)) (f t) (f s)) ∧ ∀ t, ColOK (f t)

/-- the symmetry action (`P' = P⁻¹`, `Q' = Q⁻¹`, `h' = h⁻¹`, `γ' = γ⁻¹`) -/
def act {d : ℕ} (P P' Q Q' h h' : M3) (γ γ' : Matrix (Fin d) (Fin d) F2) (σ : IS d) : IS d :=
  ⟨P * σ.a * Q', Q * σ.B * h', h * σ.C * P', P * σ.l * γ, Q'ᵀ * σ.m * γ'ᵀ⟩

section act
variable {d : ℕ} {P P' Q Q' h h' : M3} {γ γ' : Matrix (Fin d) (Fin d) F2}

theorem act_Eq2 (hP : P * P' = 1) (hQ : Q * Q' = 1) (hh : h * h' = 1) (hγ : γ * γ' = 1) {dg : Bool} {σ τ : IS d}
    (H : Eq2 dg σ τ) : Eq2 dg (act P P' Q Q' h h' γ γ' σ) (act P P' Q Q' h h' γ γ' τ) := by
  have hP' : P' * P = 1 := mul_eq_one_comm.mp hP
  have hQ' : Q' * Q = 1 := mul_eq_one_comm.mp hQ
  have hh' : h' * h = 1 := mul_eq_one_comm.mp hh
  have cP : ∀ Z : M3, P' * (P * Z) = Z := fun Z => by rw [← Matrix.mul_assoc, hP', Matrix.one_mul]
  have cQ : ∀ Z : M3, Q' * (Q * Z) = Z := fun Z => by rw [← Matrix.mul_assoc, hQ', Matrix.one_mul]
  have ch : ∀ Z : M3, h' * (h * Z) = Z := fun Z => by rw [← Matrix.mul_assoc, hh', Matrix.one_mul]
  have cγ : ∀ Z : Matrix (Fin d) (Fin 3) F2, γ * (γ' * Z) = Z := fun Z => by
    rw [← Matrix.mul_assoc, hγ, Matrix.one_mul]
  unfold Eq2 at H ⊢
  simp only [act]
  have key : P * σ.a * Q' * (Q * τ.B * h') * (h * σ.C * P') * (P * τ.a * Q') = P * (σ.a * τ.B * σ.C * τ.a) * Q' := by
    simp only [Matrix.mul_assoc, cP, cQ, ch]
  rw [key, H, Matrix.transpose_mul, Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.transpose_transpose]
  have e2 : P * σ.l * γ * (γ' * (τ.mᵀ * Q')) = P * (σ.l * τ.mᵀ) * Q' := by
    simp only [Matrix.mul_assoc, cγ]
  rw [e2]
  cases dg
  · simp only [Bool.false_eq_true, if_false, zero_add]
  · simp only [if_true, Matrix.mul_add, Matrix.add_mul]

theorem act_ColOK (hP : P * P' = 1) (hQ : Q * Q' = 1) {σ : IS d} (H : ColOK σ) :
    ColOK (act P P' Q Q' h h' γ γ' σ) := by
  have hP' : P' * P = 1 := mul_eq_one_comm.mp hP
  have hQ' : Q' * Q = 1 := mul_eq_one_comm.mp hQ
  obtain ⟨⟨x, hx⟩, ⟨y, hy⟩⟩ := H
  refine ⟨⟨Q * x * γ, ?_⟩, ⟨P'ᵀ * y * γ'ᵀ, ?_⟩⟩
  · simp only [act, hx, Matrix.mul_assoc]
    rw [← Matrix.mul_assoc Q' Q, hQ', Matrix.one_mul]
  · simp only [act, hy, Matrix.transpose_mul, Matrix.mul_assoc]
    rw [← Matrix.mul_assoc Pᵀ P'ᵀ, ← Matrix.transpose_mul, hP', Matrix.transpose_one, Matrix.one_mul]

theorem act_IFam {n : ℕ} (hP : P * P' = 1) (hQ : Q * Q' = 1) (hh : h * h' = 1) (hγ : γ * γ' = 1) {f : Fin n → IS d}
    (H : IFam f) : IFam (fun s => act P P' Q Q' h h' γ γ' (f s)) :=
  ⟨fun t s => act_Eq2 hP hQ hh hγ (H.1 t s), fun t => act_ColOK hP hQ (H.2 t)⟩

theorem rank_act (hP : P * P' = 1) (hQ : Q * Q' = 1) (σ : IS d) :
    (act P P' Q Q' h h' γ γ' σ).a.rank = σ.a.rank := by
  have hQ' : Q' * Q = 1 := mul_eq_one_comm.mp hQ
  show (P * σ.a * Q').rank = σ.a.rank
  rw [Matrix.rank_mul_eq_left_of_isUnit_det Q' _ (Matrix.isUnit_det_of_right_inverse hQ'),
    Matrix.rank_mul_eq_right_of_isUnit_det P _ (Matrix.isUnit_det_of_right_inverse hP)]

theorem act_a_inj (hP : P * P' = 1) (hQ : Q * Q' = 1) {σ τ : IS d}
    (H : (act P P' Q Q' h h' γ γ' σ).a = (act P P' Q Q' h h' γ γ' τ).a) : σ.a = τ.a := by
  have hP' : P' * P = 1 := mul_eq_one_comm.mp hP
  have hQ' : Q' * Q = 1 := mul_eq_one_comm.mp hQ
  have e : ∀ Z : M3, P' * (P * Z * Q') * Q = Z := fun Z => by
    rw [Matrix.mul_assoc, Matrix.mul_assoc, hQ', Matrix.mul_one, ← Matrix.mul_assoc, hP', Matrix.one_mul]
  have := congrArg (fun Z => P' * Z * Q) H
  simp only [act] at this
  rwa [e, e] at this

end act

/-! ## Normal forms of first factors (GL3 certificates) -/

/-- every code `v < 512` has `P (toM3 v) Q⁻¹ = toM3 (dmat (rk3 v))` -/
theorem normal_form (v : ℕ) (hv : v < 512) : ∃ P P' Q Q' : M3, P * P' = 1 ∧ Q * Q' = 1 ∧
    P * toM3 v * Q' = toM3 (S6.dmat (BC6s.rk3 v)) := by
  have h := S5.allLT_spec S6.rkc_fact v hv
  unfold S6.rkcOK at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  refine ⟨toM3 (((S6.RKC >>> (36 * v)) % 2 ^ 36) % 512), toM3 (((((S6.RKC >>> (36 * v)) % 2 ^ 36)) >>> 9) % 512),
    toM3 (((((S6.RKC >>> (36 * v)) % 2 ^ 36)) >>> 27) % 512), toM3 (((((S6.RKC >>> (36 * v)) % 2 ^ 36)) >>> 18) % 512),
    ?_, ?_, ?_⟩
  · rw [← S5.toM3_mul3, h1, S5.toM3_273]
  · rw [mul_eq_one_comm, ← S5.toM3_mul3, h2, S5.toM3_273]
  · rw [← h3, S5.toM3_mul3, S5.toM3_mul3]

theorem normal_form3 (v : ℕ) (hv : v < 512) (h3 : (toM3 v).rank = 3) : ∃ P P' Q Q' : M3, P * P' = 1 ∧ Q * Q' = 1 ∧
    P * toM3 v * Q' = toM3 273 := by
  obtain ⟨P, P', Q, Q', hP, hQ, e⟩ := normal_form v hv
  rw [S6.rk3_rank v hv, h3] at e
  exact ⟨P, P', Q, Q', hP, hQ, e⟩

theorem normal_form2 (v : ℕ) (hv : v < 512) (h2 : (toM3 v).rank = 2) : ∃ P P' Q Q' : M3, P * P' = 1 ∧ Q * Q' = 1 ∧
    P * toM3 v * Q' = toM3 17 := by
  obtain ⟨P, P', Q, Q', hP, hQ, e⟩ := normal_form v hv
  rw [S6.rk3_rank v hv, h2] at e
  exact ⟨P, P', Q, Q', hP, hQ, e⟩

end G.Br
