module
public import R22Port.U_d41d8cd98f00
public import Br.Conv
public import KD.Types
/-! # The bridge from a 22-term decomposition to the Gram-level families of `G.Interface` (bridge, part 5)

* `dec_family`: a `Dec22` with `∑ rank a_t = 27 + d` gives an invariant family (all pair conditions of (E)).
* `bridge_inv` (`d` arbitrary; used at `d = 1, 2`): with `OrbitComplete3 d` and an invertible first factor, there are an
  anchor representative `t0 ∈ reps d` and a list `F` with `Family d (t0 :: F)` and at least `n1, n2, n3 - 1` members of
  ranks 1, 2, 3.
* `bridge_r2` (`d = 0`): with `OrbitComplete2` and a rank-2 first factor, the same with `t0 ∈ reps0` and `n1, n2 - 1, n3`.
* `hand_d0`: at `d = 0` there is no invertible first factor (the hand proof of THM_TYPES / REQUESTS 11a).

Normalization: the anchor `t0` is moved to `a = I` (resp. `17`) by the GL3 certificates (`normal_form3`/`normal_form2`),
its encoded state is mapped into the representative list by the checker's orbit completeness, and the same group element
is applied to every term (`act`, which preserves (E)); the encoding of the transformed anchor equals `act3 … st0`
(resp. `act2 … st0`) by the decoding lemmas. -/
@[expose] public section
open Matrix

namespace G.Br
open RootSound R3RT.Spec

theorem dec_family (A : Dec22) (d : ℕ) (hs : KD.rankSum A = 27 + d) :
    ∃ σ : Fin 22 → IS d, IFam σ ∧ ∀ s, (σ s).a = toM3 (A.av s) := by
  obtain ⟨l, m, hE, hl, hm⟩ := excess_system A.dec d hs
  refine ⟨fun s => ⟨toM3 (A.av s), A.b s, A.c s, l s, m s⟩, ⟨?_, ?_⟩, fun s => rfl⟩
  · intro t s
    unfold Eq2
    rw [hE t s]
    by_cases h : t = s <;> simp [h]
  · intro t
    exact ⟨hl t, hm t⟩

theorem dec_ne_zero (A : Dec22) (s : Fin 22) : toM3 (A.av s) ≠ 0 := KD.toM3_ne_zero (A.lt s) (A.ne s)

theorem dec_inj (A : Dec22) {s t : Fin 22} (h : s ≠ t) : toM3 (A.av s) ≠ toM3 (A.av t) :=
  fun e => h (A.inj (eq_of_toM3 (A.lt s) (A.lt t) e))

theorem exists_rank (A : Dec22) (r : ℕ) (h : 1 ≤ KD.nType A r) : ∃ t0, (toM3 (A.av t0)).rank = r := by
  unfold KD.nType at h
  obtain ⟨t0, ht0⟩ := Finset.card_pos.mp (by omega : 0 < (Finset.univ.filter
    (fun s : Fin 22 => (toM3 (A.av s)).rank = r)).card)
  exact ⟨t0, (Finset.mem_filter.mp ht0).2⟩

/-- the counts of the members other than the anchor -/
theorem count_others (A : Dec22) (t0 : Fin 22) (r : ℕ) (rk : Fin 22 → ℕ) (hrk : ∀ s, rk s = (toM3 (A.av s)).rank) :
    KD.nType A r - (if (toM3 (A.av t0)).rank = r then 1 else 0) ≤
      (Finset.univ.filter (fun s => s ≠ t0 ∧ rk s = r)).card := by
  unfold KD.nType
  have e : Finset.univ.filter (fun s => s ≠ t0 ∧ rk s = r) =
      (Finset.univ.filter (fun s : Fin 22 => (toM3 (A.av s)).rank = r)).erase t0 := by
    ext s; simp [hrk]
  rw [e]
  split_ifs with h
  · rw [Finset.card_erase_of_mem (by simp [h])]
  · rw [Finset.erase_eq_of_notMem (by simp [h])]; omega

/-! ## invertible anchors (`d ≥ 1` types) -/

theorem act_ne_zero {d : ℕ} {P P' Q Q' h h' : M3} {γ γ' : Matrix (Fin d) (Fin d) F2} (hP : P * P' = 1)
    (hQ : Q * Q' = 1) {σ : IS d} (h0 : σ.a ≠ 0) : (act P P' Q Q' h h' γ γ' σ).a ≠ 0 := by
  intro e
  have := rank_act (h := h) (h' := h') (γ := γ) (γ' := γ') hP hQ σ
  rw [e, Matrix.rank_zero] at this
  apply h0
  by_contra hne
  have := KD.rank_pos_of_ne_zero _ hne
  omega

/-- a state record is determined by its fields -/
theorem state_eq {s1 s2 : State} (h1 : s1.a = s2.a) (h2 : s1.B = s2.B) (h3 : s1.C = s2.C) (h4 : s1.U = s2.U)
    (h5 : s1.V = s2.V) : s1 = s2 := by
  cases s1; cases s2; simp_all

/-- the encoding of the transformed identity anchor is `act3 … st0` -/
theorem anchor_inv {d : ℕ} (σ1 σ2 : IS d) (x1 y1 x2 y2 : Matrix (Fin 3) (Fin d) F2) (g h γ : ℕ)
    (ha1 : σ1.a = 1) (ha2 : σ2.a = 1) (hB : σ2.B = toM3 g * σ1.B * toM3 (inv3 h))
    (hC : σ2.C = toM3 h * σ1.C * toM3 (inv3 g)) (hl : σ2.l = toM3 g * σ1.l * Dm d γ)
    (hm : σ2.m = (toM3 (inv3 g))ᵀ * σ1.m * (Dm d (invD d γ))ᵀ)
    (hx1 : σ1.l = σ1.a * x1) (hy1 : σ1.m = σ1.aᵀ * y1) (hx2 : σ2.l = σ2.a * x2) (hy2 : σ2.m = σ2.aᵀ * y2) :
    encS σ2 x2 y2 = act3 d g h γ (encS σ1 x1 y1) := by
  rw [ha1, Matrix.one_mul] at hx1
  rw [ha1, Matrix.transpose_one, Matrix.one_mul] at hy1
  rw [ha2, Matrix.one_mul] at hx2
  rw [ha2, Matrix.transpose_one, Matrix.one_mul] at hy2
  have he1 : e3 σ1.a = 273 := by rw [ha1, ← S5.toM3_273, e3_toM3 (by norm_num)]
  have he2 : e3 σ2.a = 273 := by rw [ha2, ← S5.toM3_273, e3_toM3 (by norm_num)]
  apply state_eq
  · show e3 σ2.a = I3; rw [he2]; rfl
  · show e3 σ2.B = mul3 (mul3 g (e3 σ1.B)) (inv3 h)
    rw [← e3_toM3 (mul3_lt _ _), toM3_mul3, toM3_mul3, toM3_e3, hB]
  · show e3 σ2.C = mul3 (mul3 h (e3 σ1.C)) (inv3 g)
    rw [← e3_toM3 (mul3_lt _ _), toM3_mul3, toM3_mul3, toM3_e3, hC]
  · show (encS σ2 x2 y2).U = xformRows d g γ (encS σ1 x1 y1).U
    rw [encS_U_of _ _ _ 273 he2, encS_U_of _ _ _ 273 he1, eR_273_U, eR_273_U, ← hx2, ← hx1]
    apply eq_of_Um (eR_lt _ _ _) (xformRows_lt _ _ _ _)
    rw [Um_eR, Um_xformRows, Um_eR, hl]
  · show (encS σ2 x2 y2).V = xformRows d (tr3 (inv3 g)) (trD d (invD d γ)) (encS σ1 x1 y1).V
    rw [encS_V_of _ _ _ 273 he2, encS_V_of _ _ _ 273 he1, eR_273_V, eR_273_V, ← hy2, ← hy1]
    apply eq_of_Um (eR_lt _ _ _) (xformRows_lt _ _ _ _)
    rw [Um_eR, Um_xformRows, Um_eR, toM3_tr3, Dm_trD, hm]

/-- the encoding of the transformed rank-2 anchor is `act2 … st0` (`d = 0`) -/
theorem anchor_r2 (σ1 σ2 : IS 0) (x1 y1 x2 y2 : Matrix (Fin 3) (Fin 0) F2) (P Q h : ℕ)
    (ha1 : σ1.a = toM3 17) (hfix : mul3 (mul3 P 17) (inv3 Q) = 17)
    (ha2 : σ2.a = toM3 P * σ1.a * toM3 (inv3 Q)) (hB : σ2.B = toM3 Q * σ1.B * toM3 (inv3 h))
    (hC : σ2.C = toM3 h * σ1.C * toM3 (inv3 P)) :
    encS σ2 x2 y2 = act2 P Q h (encS σ1 x1 y1) := by
  apply state_eq
  · show e3 σ2.a = 17
    rw [ha2, ha1, ← toM3_mul3, ← toM3_mul3, hfix, e3_toM3 (by norm_num)]
  · show e3 σ2.B = mul3 (mul3 Q (e3 σ1.B)) (inv3 h)
    rw [← e3_toM3 (mul3_lt _ _), toM3_mul3, toM3_mul3, toM3_e3, hB]
  · show e3 σ2.C = mul3 (mul3 h (e3 σ1.C)) (inv3 P)
    rw [← e3_toM3 (mul3_lt _ _), toM3_mul3, toM3_mul3, toM3_e3, hC]
  · exact eR_zero _ _
  · exact eR_zero _ _

/-- the counts of `others` against the decomposition's type -/
theorem counts_of {d : ℕ} (A : Dec22) (σ : Fin 22 → IS d) (hσ : IFam σ) (t0 : Fin 22) (h0 : ∀ u, (σ u).a ≠ 0)
    (hrk : ∀ s, (σ s).a.rank = (toM3 (A.av s)).rank) (r : ℕ) :
    KD.nType A r - (if (toM3 (A.av t0)).rank = r then 1 else 0) ≤ count r (others σ hσ.2 t0) := by
  rw [count_encF hσ t0 h0]
  exact count_others A t0 r (fun s => (σ s).a.rank) hrk

theorem bridge_inv (d : ℕ) (hoc : OrbitComplete3 d) (A : Dec22) (h3 : 1 ≤ KD.nType A 3)
    (hs : KD.rankSum A = 27 + d) :
    ∃ t0 ∈ reps d, ∃ F : List State, Family d (t0 :: F) ∧
      KD.nType A 1 ≤ count 1 F ∧ KD.nType A 2 ≤ count 2 F ∧ KD.nType A 3 - 1 ≤ count 3 F := by
  classical
  obtain ⟨σ, hσ, ha⟩ := dec_family A d hs
  obtain ⟨t0, hr0⟩ := exists_rank A 3 h3
  obtain ⟨P, P', Q, Q', hP, hQ, hPQ⟩ := normal_form3 (A.av t0) (A.lt t0) hr0
  have h11 : (1 : M3) * 1 = 1 := Matrix.one_mul 1
  have hγ1 : (1 : Matrix (Fin d) (Fin d) F2) * 1 = 1 := Matrix.one_mul 1
  have hz : ∀ s, (σ s).a ≠ 0 := fun s => by rw [ha s]; exact dec_ne_zero A s
  -- step 1: the anchor to `a = I`
  obtain ⟨σ1, hσ1d⟩ : ∃ σ1 : Fin 22 → IS d, σ1 = fun s => act P P' Q Q' 1 1 1 1 (σ s) := ⟨_, rfl⟩
  have hσ1 : IFam σ1 := by rw [hσ1d]; exact act_IFam hP hQ h11 hγ1 hσ
  have ha1 : (σ1 t0).a = 1 := by
    rw [hσ1d]; show P * (σ t0).a * Q' = _; rw [ha t0, hPQ, S5.toM3_273]
  have hz1 : ∀ s, (σ1 s).a ≠ 0 := fun s => by rw [hσ1d]; exact act_ne_zero hP hQ (hz s)
  have hrk1 : ∀ s, (σ1 s).a.rank = (toM3 (A.av s)).rank := fun s => by
    rw [hσ1d]; show (act _ _ _ _ _ _ _ _ (σ s)).a.rank = _; rw [rank_act hP hQ, ha s]
  have hinj1 : ∀ s t, s ≠ t → (σ1 s).a ≠ (σ1 t).a := by
    intro s t hst e
    rw [hσ1d] at e
    have e2 := act_a_inj hP hQ e
    rw [ha s, ha t] at e2
    exact dec_inj A hst e2
  have hst0a : (encF σ1 hσ1.2 t0).a = 273 := by
    show e3 (σ1 t0).a = 273; rw [ha1, ← S5.toM3_273, e3_toM3 (by norm_num)]
  have hv0 : Valid d (encF σ1 hσ1.2 t0) := encF_valid hσ1 t0 (hz1 t0)
  -- step 2: orbit completeness for the anchor, and the same group element on every term
  obtain ⟨g, h, γ, hg, hh, hγ, hmem⟩ := hoc (encF σ1 hσ1.2 t0) hst0a hv0
  have hgi := GL3_inv hg
  have hhi := GL3_inv hh
  have hγi := GLd_inv hγ
  obtain ⟨σ2, hσ2d⟩ : ∃ σ2 : Fin 22 → IS d, σ2 = fun s => act (toM3 g) (toM3 (inv3 g)) (toM3 g) (toM3 (inv3 g))
      (toM3 h) (toM3 (inv3 h)) (Dm d γ) (Dm d (invD d γ)) (σ1 s) := ⟨_, rfl⟩
  have hσ2 : IFam σ2 := by rw [hσ2d]; exact act_IFam hgi hgi hhi hγi hσ1
  have hz2 : ∀ s, (σ2 s).a ≠ 0 := fun s => by rw [hσ2d]; exact act_ne_zero hgi hgi (hz1 s)
  have hinj2 : ∀ s t, s ≠ t → (σ2 s).a ≠ (σ2 t).a := by
    intro s t hst e
    rw [hσ2d] at e
    exact hinj1 s t hst (act_a_inj hgi hgi e)
  have hrk2 : ∀ s, (σ2 s).a.rank = (toM3 (A.av s)).rank := fun s => by
    rw [hσ2d]; show (act _ _ _ _ _ _ _ _ (σ1 s)).a.rank = _; rw [rank_act hgi hgi, hrk1 s]
  have hanchor : encF σ2 hσ2.2 t0 = act3 d g h γ (encF σ1 hσ1.2 t0) := by
    apply anchor_inv (σ1 t0) (σ2 t0) _ _ _ _ g h γ ha1
    · rw [hσ2d]; show toM3 g * (σ1 t0).a * toM3 (inv3 g) = 1; rw [ha1, Matrix.mul_one, hgi]
    · rw [hσ2d]; rfl
    · rw [hσ2d]; rfl
    · rw [hσ2d]; rfl
    · rw [hσ2d]; rfl
    · exact (hσ1.2 t0).1.choose_spec
    · exact (hσ1.2 t0).2.choose_spec
    · exact (hσ2.2 t0).1.choose_spec
    · exact (hσ2.2 t0).2.choose_spec
  refine ⟨encF σ2 hσ2.2 t0, by rw [hanchor]; exact hmem, others σ2 hσ2.2 t0,
    family_encF hσ2 t0 hz2 hinj2, ?_, ?_, ?_⟩
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 1
    simpa [hr0] using this
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 2
    simpa [hr0] using this
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 3
    simpa [hr0] using this

/-! ## rank-2 anchors (`d = 0`) -/

theorem bridge_r2 (hoc : OrbitComplete2) (A : Dec22) (h2 : 1 ≤ KD.nType A 2) (hs : KD.rankSum A = 27) :
    ∃ t0 ∈ reps0, ∃ F : List State, Family 0 (t0 :: F) ∧
      KD.nType A 1 ≤ count 1 F ∧ KD.nType A 2 - 1 ≤ count 2 F ∧ KD.nType A 3 ≤ count 3 F := by
  classical
  obtain ⟨σ, hσ, ha⟩ := dec_family A 0 hs
  obtain ⟨t0, hr0⟩ := exists_rank A 2 h2
  obtain ⟨P, P', Q, Q', hP, hQ, hPQ⟩ := normal_form2 (A.av t0) (A.lt t0) hr0
  have h11 : (1 : M3) * 1 = 1 := Matrix.one_mul 1
  have hγ1 : (1 : Matrix (Fin 0) (Fin 0) F2) * 1 = 1 := Matrix.one_mul 1
  have hz : ∀ s, (σ s).a ≠ 0 := fun s => by rw [ha s]; exact dec_ne_zero A s
  obtain ⟨σ1, hσ1d⟩ : ∃ σ1 : Fin 22 → IS 0, σ1 = fun s => act P P' Q Q' 1 1 1 1 (σ s) := ⟨_, rfl⟩
  have hσ1 : IFam σ1 := by rw [hσ1d]; exact act_IFam hP hQ h11 hγ1 hσ
  have ha1 : (σ1 t0).a = toM3 17 := by
    rw [hσ1d]; show P * (σ t0).a * Q' = _; rw [ha t0, hPQ]
  have hz1 : ∀ s, (σ1 s).a ≠ 0 := fun s => by rw [hσ1d]; exact act_ne_zero hP hQ (hz s)
  have hrk1 : ∀ s, (σ1 s).a.rank = (toM3 (A.av s)).rank := fun s => by
    rw [hσ1d]; show (act _ _ _ _ _ _ _ _ (σ s)).a.rank = _; rw [rank_act hP hQ, ha s]
  have hinj1 : ∀ s t, s ≠ t → (σ1 s).a ≠ (σ1 t).a := by
    intro s t hst e
    rw [hσ1d] at e
    have e2 := act_a_inj hP hQ e
    rw [ha s, ha t] at e2
    exact dec_inj A hst e2
  have hst0a : (encF σ1 hσ1.2 t0).a = 17 := by
    show e3 (σ1 t0).a = 17; rw [ha1, e3_toM3 (by norm_num)]
  have hv0 : Valid 0 (encF σ1 hσ1.2 t0) := encF_valid hσ1 t0 (hz1 t0)
  obtain ⟨P2, Q2, h, hP2, hQ2, hh, hfix, hmem⟩ := hoc (encF σ1 hσ1.2 t0) hst0a hv0
  have hPi := GL3_inv hP2
  have hQi := GL3_inv hQ2
  have hhi := GL3_inv hh
  obtain ⟨σ2, hσ2d⟩ : ∃ σ2 : Fin 22 → IS 0, σ2 = fun s => act (toM3 P2) (toM3 (inv3 P2)) (toM3 Q2)
      (toM3 (inv3 Q2)) (toM3 h) (toM3 (inv3 h)) 1 1 (σ1 s) := ⟨_, rfl⟩
  have hσ2 : IFam σ2 := by rw [hσ2d]; exact act_IFam hPi hQi hhi hγ1 hσ1
  have hz2 : ∀ s, (σ2 s).a ≠ 0 := fun s => by rw [hσ2d]; exact act_ne_zero hPi hQi (hz1 s)
  have hinj2 : ∀ s t, s ≠ t → (σ2 s).a ≠ (σ2 t).a := by
    intro s t hst e
    rw [hσ2d] at e
    exact hinj1 s t hst (act_a_inj hPi hQi e)
  have hrk2 : ∀ s, (σ2 s).a.rank = (toM3 (A.av s)).rank := fun s => by
    rw [hσ2d]; show (act _ _ _ _ _ _ _ _ (σ1 s)).a.rank = _; rw [rank_act hPi hQi, hrk1 s]
  have hanchor : encF σ2 hσ2.2 t0 = act2 P2 Q2 h (encF σ1 hσ1.2 t0) := by
    apply anchor_r2 (σ1 t0) (σ2 t0) _ _ _ _ P2 Q2 h ha1 hfix
    · rw [hσ2d]; rfl
    · rw [hσ2d]; rfl
    · rw [hσ2d]; rfl
  refine ⟨encF σ2 hσ2.2 t0, by rw [hanchor]; exact hmem, others σ2 hσ2.2 t0,
    family_encF hσ2 t0 hz2 hinj2, ?_, ?_, ?_⟩
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 1
    simpa [hr0] using this
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 2
    simpa [hr0] using this
  · have := counts_of A σ2 hσ2 t0 hz2 hrk2 3
    simpa [hr0] using this

/-! ## the hand proof at `d = 0` -/

/-- **At `Δ = 0` no first factor is invertible**: `G = I` gives `b_s c_0 a_s = 0` (`s ≠ 0`) with `c_0` invertible, so
`rank b_s ≤ 3 - rank a_s`, while `a_s b_s c_s a_s = a_s` gives `rank a_s ≤ rank b_s`; hence every other term has rank 1
and `∑ rank = 3 + 21 = 24 ≠ 27`. -/
theorem hand_d0 (A : Dec22) (hs : KD.rankSum A = 27) (h3 : 1 ≤ KD.nType A 3) : False := by
  classical
  obtain ⟨l, m, hE, -, -⟩ := excess_system A.dec 0 hs
  set a : Fin 22 → M3 := fun s => toM3 (A.av s) with hadef
  have hE0 : ∀ t s, a t * A.b s * A.c t * a s = if t = s then a t else 0 := by
    intro t s
    have hl : l t = 0 := Subsingleton.elim _ _
    have := hE t s
    rw [hl, Matrix.zero_mul, add_zero] at this
    exact this
  obtain ⟨t0, hr0⟩ := exists_rank A 3 h3
  obtain ⟨P, P', Q, Q', hP, hQ, hPQ⟩ := normal_form3 (A.av t0) (A.lt t0) hr0
  rw [S5.toM3_273] at hPQ
  -- `a t0` is invertible with inverse `Q' P`
  have hP' : P' * P = 1 := mul_eq_one_comm.mp hP
  have hQ' : Q' * Q = 1 := mul_eq_one_comm.mp hQ
  have ha0 : a t0 = P' * Q := by
    calc a t0 = (P' * P) * a t0 * (Q' * Q) := by rw [hP', hQ', Matrix.one_mul, Matrix.mul_one]
      _ = P' * (P * a t0 * Q') * Q := by simp only [Matrix.mul_assoc]
      _ = P' * Q := by rw [hPQ, Matrix.mul_one]
  have hai : (Q' * P) * a t0 = 1 := by
    rw [ha0, Matrix.mul_assoc, ← Matrix.mul_assoc P P' Q, hP, Matrix.one_mul, hQ']
  -- cancel `a t0` on the left
  have canc : ∀ X Y : M3, a t0 * X = a t0 * Y → X = Y := fun X Y h => by
    have := congrArg (fun Z => (Q' * P) * Z) h
    simp only [← Matrix.mul_assoc, hai, Matrix.one_mul] at this
    exact this
  have h00 : A.b t0 * A.c t0 * a t0 = 1 := by
    apply canc
    have := hE0 t0 t0
    rw [if_pos rfl] at this
    rw [Matrix.mul_one]
    simpa only [Matrix.mul_assoc] using this
  -- `c t0` is invertible
  have hc0 : A.c t0 * (a t0 * A.b t0) = 1 := by
    have h1 : A.b t0 * (A.c t0 * a t0) = 1 := by rw [← Matrix.mul_assoc]; exact h00
    have h2 := mul_eq_one_comm.mp h1
    rw [Matrix.mul_assoc] at h2
    exact h2
  -- every other term has rank 1
  have hle : ∀ s, s ≠ t0 → (a s).rank ≤ 1 := by
    intro s hst
    have hz : A.b s * (A.c t0 * a s) = 0 := by
      apply canc
      have := hE0 t0 s
      rw [if_neg (Ne.symm hst)] at this
      rw [Matrix.mul_zero]
      simpa only [Matrix.mul_assoc] using this
    have h1 := Matrix.rank_add_rank_le_card_of_mul_eq_zero hz
    rw [Matrix.rank_mul_eq_right_of_isUnit_det (A.c t0) (a s) (Matrix.isUnit_det_of_right_inverse hc0),
      Fintype.card_fin] at h1
    have h2 : (a s).rank ≤ (A.b s).rank := by
      have := hE0 s s
      rw [if_pos rfl] at this
      calc (a s).rank = (a s * A.b s * (A.c s * a s)).rank := by rw [← Matrix.mul_assoc, this]
        _ ≤ (a s * A.b s).rank := Matrix.rank_mul_le_left _ _
        _ ≤ (A.b s).rank := Matrix.rank_mul_le_right _ _
    omega
  -- so the rank sum is at most 3 + 21 = 24
  have hsum : KD.rankSum A ≤ 24 := by
    show ∑ s, (a s).rank ≤ 24
    calc ∑ s, (a s).rank ≤ ∑ s : Fin 22, (if s = t0 then 3 else 1) := by
          apply Finset.sum_le_sum
          intro s _
          split_ifs with h
          · exact (Matrix.rank_le_card_width _).trans (by simp)
          · exact hle s h
      _ = 24 := by
          rw [Finset.sum_ite, Finset.sum_const, Finset.sum_const, Finset.filter_eq', Finset.filter_ne']
          simp
  omega

end G.Br
