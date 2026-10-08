module
public import R22Port.U_d41d8cd98f00
public import Br.Sym
public import Br.Dec
/-! # From invariant states to the interface's `State` (bridge, part 4)

`encS σ x y` encodes an invariant state `σ = (a, B, C, l, m)` with column witnesses `l = a x`, `m = aᵀ y` in the FAC
factorization of `a`: `U = Rm a * x`, `V = (Lm a)ᵀ * y`, so `l = Lm a * U` and `m = (Rm a)ᵀ * V`.  Cancelling `Lm a` on
the left and `Rm a` on the right (one-sided inverses: `rank (toM3 a) = rk a`) turns the invariant pair conditions into
the interface's `gram`/`dirt` conditions:
* `encS_valid`: `Eq2 true σ σ` gives `Valid d (encS σ x y)`;
* `encS_compat`: `Eq2 false σ τ`, `Eq2 false τ σ` and `σ.a ≠ τ.a` give `Compat d`.
`encF` encodes a whole invariant family (witnesses by choice); `family_encF` / `count_encF` give `Family` for the anchor
followed by the other members, and the rank counts.  `eR_273_U`, `eR_273_V`: at `a = I` (FAC = identity) the encoded
dirt is the plain packing of `l`, `m`. -/
@[expose] public section
open Matrix

set_option linter.unusedSectionVars false

namespace G.Br
open RootSound

/-- the interface state of an invariant state, with witnesses `l = a x`, `m = aᵀ y` -/
def encS {d : ℕ} (σ : IS d) (x y : Matrix (Fin 3) (Fin d) F2) : State :=
  ⟨e3 σ.a, e3 σ.B, e3 σ.C, eR d (rk (e3 σ.a)) (Rm (e3 σ.a) * x), eR d (rk (e3 σ.a)) ((Lm (e3 σ.a))ᵀ * y)⟩

section conv
variable {d : ℕ}

theorem code_facts {M : M3} (h : M ≠ 0) :
    0 < e3 M ∧ e3 M < 512 ∧ M = Lm (e3 M) * Rm (e3 M) ∧ M.rank = rk (e3 M) := by
  have h0 : 0 < e3 M := Nat.pos_of_ne_zero (e3_ne_zero h)
  have h1 := e3_lt M
  refine ⟨h0, h1, ?_, ?_⟩
  · conv_lhs => rw [← toM3_e3 M]
    exact toM3_fac _ h0 h1
  · conv_lhs => rw [← toM3_e3 M]
    exact (rk_rank _ h0 h1).symm

/-- one-sided inverses of the FAC factors of a nonzero matrix -/
theorem fac_inv {M : M3} (h : M ≠ 0) :
    (∃ S : Matrix (Fin 3) (Fin (rk (e3 M))) F2, Rm (e3 M) * S = 1) ∧
    (∃ T : Matrix (Fin (rk (e3 M))) (Fin 3) F2, T * Lm (e3 M) = 1) := by
  obtain ⟨_, _, hf, hr⟩ := code_facts h
  exact rank_factor_inv M (Lm (e3 M)) (Rm (e3 M)) hf.symm hr

theorem block_off (σ τ : IS d) (hσ : σ.a ≠ 0) (hτ : τ.a ≠ 0) {x y' : Matrix (Fin 3) (Fin d) F2}
    (hx : σ.l = σ.a * x) (hy' : τ.m = τ.aᵀ * y') (H : Eq2 false σ τ) :
    Rm (e3 σ.a) * τ.B * σ.C * Lm (e3 τ.a) = (Rm (e3 σ.a) * x) * ((Lm (e3 τ.a))ᵀ * y')ᵀ := by
  obtain ⟨_, _, hfσ, _⟩ := code_facts hσ
  obtain ⟨_, _, hfτ, _⟩ := code_facts hτ
  obtain ⟨_, ⟨T, hT⟩⟩ := fac_inv hσ
  obtain ⟨⟨S, hS⟩, _⟩ := fac_inv hτ
  unfold Eq2 at H
  simp only [Bool.false_eq_true, if_false, zero_add] at H
  have key : ∀ Z : Matrix (Fin (rk (e3 σ.a))) (Fin (rk (e3 τ.a))) F2,
      T * (Lm (e3 σ.a) * Z * Rm (e3 τ.a)) * S = Z := fun Z => by
    simp only [← Matrix.mul_assoc, hT, Matrix.one_mul]
    rw [Matrix.mul_assoc, hS, Matrix.mul_one]
  rw [← key (Rm (e3 σ.a) * τ.B * σ.C * Lm (e3 τ.a)), ← key ((Rm (e3 σ.a) * x) * ((Lm (e3 τ.a))ᵀ * y')ᵀ)]
  congr 2
  have e1 : Lm (e3 σ.a) * (Rm (e3 σ.a) * τ.B * σ.C * Lm (e3 τ.a)) * Rm (e3 τ.a) = σ.a * τ.B * σ.C * τ.a := by
    conv_rhs => rw [hfσ, hfτ]
    simp only [Matrix.mul_assoc]
  have e2 : Lm (e3 σ.a) * (Rm (e3 σ.a) * x * ((Lm (e3 τ.a))ᵀ * y')ᵀ) * Rm (e3 τ.a) = σ.l * τ.mᵀ := by
    rw [hx, hy', Matrix.transpose_mul, Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.transpose_transpose]
    conv_rhs => rw [hfσ, hfτ]
    simp only [Matrix.mul_assoc]
  rw [e1, e2, H]

theorem block_diag (σ : IS d) (hσ : σ.a ≠ 0) {x y : Matrix (Fin 3) (Fin d) F2}
    (hx : σ.l = σ.a * x) (hy : σ.m = σ.aᵀ * y) (H : Eq2 true σ σ) :
    Rm (e3 σ.a) * σ.B * σ.C * Lm (e3 σ.a) = 1 + (Rm (e3 σ.a) * x) * ((Lm (e3 σ.a))ᵀ * y)ᵀ := by
  obtain ⟨_, _, hf, _⟩ := code_facts hσ
  obtain ⟨⟨S, hS⟩, ⟨T, hT⟩⟩ := fac_inv hσ
  unfold Eq2 at H
  simp only [if_true] at H
  have key : ∀ Z : Matrix (Fin (rk (e3 σ.a))) (Fin (rk (e3 σ.a))) F2,
      T * (Lm (e3 σ.a) * Z * Rm (e3 σ.a)) * S = Z := fun Z => by
    simp only [← Matrix.mul_assoc, hT, Matrix.one_mul]
    rw [Matrix.mul_assoc, hS, Matrix.mul_one]
  rw [← key (Rm (e3 σ.a) * σ.B * σ.C * Lm (e3 σ.a)), ← key (1 + (Rm (e3 σ.a) * x) * ((Lm (e3 σ.a))ᵀ * y)ᵀ)]
  congr 2
  have e1 : Lm (e3 σ.a) * (Rm (e3 σ.a) * σ.B * σ.C * Lm (e3 σ.a)) * Rm (e3 σ.a) = σ.a * σ.B * σ.C * σ.a := by
    conv_rhs => rw [hf]
    simp only [Matrix.mul_assoc]
  have e2 : Lm (e3 σ.a) * (1 + Rm (e3 σ.a) * x * ((Lm (e3 σ.a))ᵀ * y)ᵀ) * Rm (e3 σ.a) = σ.a + σ.l * σ.mᵀ := by
    rw [hx, hy, Matrix.transpose_mul, Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.transpose_transpose,
      Matrix.mul_add, Matrix.add_mul, Matrix.mul_one]
    conv_rhs => rw [hf]
    simp only [Matrix.mul_assoc]
  rw [e1, e2, H]

theorem bF_beq (al be : ℕ) : bF (al == be) = if al = be then 1 else 0 := by
  by_cases h : al = be <;> simp [h, bF]

theorem encS_valid (σ : IS d) (hσ : σ.a ≠ 0) {x y : Matrix (Fin 3) (Fin d) F2}
    (hx : σ.l = σ.a * x) (hy : σ.m = σ.aᵀ * y) (H : Eq2 true σ σ) : Valid d (encS σ x y) := by
  obtain ⟨h0, h1, _, _⟩ := code_facts hσ
  refine ⟨h0, h1, e3_lt _, e3_lt _, eR_lt _ _ _, eR_lt _ _ _, ?_⟩
  intro al hal be hbe
  apply bF_inj
  have hg := gram_mat (encS σ x y) (encS σ x y) ⟨al, hal⟩ ⟨be, hbe⟩
  have hd := dirt_mat d (encS σ x y) (encS σ x y) ⟨al, hal⟩ ⟨be, hbe⟩
  rw [bF_xor, hg, hd]
  simp only [encS, toM3_e3, Um_eR]
  refine (congrFun (congrFun (block_diag σ hσ hx hy H) ⟨al, hal⟩) ⟨be, hbe⟩).trans ?_
  rw [Matrix.add_apply, Matrix.one_apply, bF_beq]
  simp only [Fin.mk.injEq]
  rfl

theorem encS_compat (σ τ : IS d) (hσ : σ.a ≠ 0) (hτ : τ.a ≠ 0) (hne : σ.a ≠ τ.a)
    {x y x' y' : Matrix (Fin 3) (Fin d) F2} (hx : σ.l = σ.a * x) (hy : σ.m = σ.aᵀ * y)
    (hx' : τ.l = τ.a * x') (hy' : τ.m = τ.aᵀ * y') (H1 : Eq2 false σ τ) (H2 : Eq2 false τ σ) :
    Compat d (encS σ x y) (encS τ x' y') := by
  refine ⟨fun e => hne (e3_inj e), ?_, ?_⟩
  · intro al hal be hbe
    apply bF_inj
    have hg := gram_mat (encS σ x y) (encS τ x' y') ⟨al, hal⟩ ⟨be, hbe⟩
    have hd := dirt_mat d (encS σ x y) (encS τ x' y') ⟨al, hal⟩ ⟨be, hbe⟩
    rw [hg, hd]
    simp only [encS, toM3_e3, Um_eR]
    exact congrFun (congrFun (block_off σ τ hσ hτ hx hy' H1) ⟨al, hal⟩) ⟨be, hbe⟩
  · intro al hal be hbe
    apply bF_inj
    have hg := gram_mat (encS τ x' y') (encS σ x y) ⟨al, hal⟩ ⟨be, hbe⟩
    have hd := dirt_mat d (encS τ x' y') (encS σ x y) ⟨al, hal⟩ ⟨be, hbe⟩
    rw [hg, hd]
    simp only [encS, toM3_e3, Um_eR]
    exact congrFun (congrFun (block_off τ σ hτ hσ hx' hy H2) ⟨al, hal⟩) ⟨be, hbe⟩

/-- the encoded field `a` of `encS` -/
theorem encS_a (σ : IS d) (x y : Matrix (Fin 3) (Fin d) F2) : (encS σ x y).a = e3 σ.a := rfl

/-- the encoded dirt with the first factor's code named -/
theorem encS_U_of (σ : IS d) (x y : Matrix (Fin 3) (Fin d) F2) (a : ℕ) (ha : e3 σ.a = a) :
    (encS σ x y).U = eR d (rk a) (Rm a * x) := by subst ha; rfl

theorem encS_V_of (σ : IS d) (x y : Matrix (Fin 3) (Fin d) F2) (a : ℕ) (ha : e3 σ.a = a) :
    (encS σ x y).V = eR d (rk a) ((Lm a)ᵀ * y) := by subst ha; rfl

/-! ## the identity anchor `a = 273` -/

theorem rk_273 : rk 273 = 3 := by decide

theorem Um_eR_cast (r r' : ℕ) (h : r = r') (M : Matrix (Fin r) (Fin d) F2) (q : Fin r') (x : Fin d) :
    Um d r' (eR d r M) q x = M (Fin.cast h.symm q) x := by
  subst h; rw [Um_eR]; rfl

theorem Rc_273 (q j : Fin 3) : bitF (Rc 273 q.val) j.val = if q = j then 1 else 0 := by
  fin_cases q <;> fin_cases j <;> decide

theorem Lc_273 (q j : Fin 3) : bitF (Lc 273 q.val) j.val = if j = q then 1 else 0 := by
  fin_cases q <;> fin_cases j <;> decide

theorem eR_273_U (x : Matrix (Fin 3) (Fin d) F2) : eR d (rk 273) (Rm 273 * x) = eR d 3 x := by
  have hb : eR d (rk 273) (Rm 273 * x) < 2 ^ (d * 3) := by
    calc _ < 2 ^ (d * rk 273) := eR_lt d (rk 273) (Rm 273 * x)
      _ = 2 ^ (d * 3) := by rw [rk_273]
  apply eq_of_Um hb (eR_lt _ _ _)
  ext q z
  rw [Um_eR_cast (rk 273) 3 rk_273, Um_eR, Matrix.mul_apply]
  simp only [Rm, Fin.val_cast]
  have : ∀ j : Fin 3, bitF (Rc 273 q.val) j.val * x j z = if q = j then x j z else 0 := fun j => by
    rw [Rc_273]; split_ifs <;> simp
  simp only [this, Finset.sum_ite_eq, Finset.mem_univ, if_true]

theorem eR_273_V (y : Matrix (Fin 3) (Fin d) F2) : eR d (rk 273) ((Lm 273)ᵀ * y) = eR d 3 y := by
  have hb : eR d (rk 273) ((Lm 273)ᵀ * y) < 2 ^ (d * 3) := by
    calc _ < 2 ^ (d * rk 273) := eR_lt d (rk 273) ((Lm 273)ᵀ * y)
      _ = 2 ^ (d * 3) := by rw [rk_273]
  apply eq_of_Um hb (eR_lt _ _ _)
  ext q z
  rw [Um_eR_cast (rk 273) 3 rk_273, Um_eR, Matrix.mul_apply]
  simp only [Matrix.transpose_apply, Lm, Fin.val_cast]
  have : ∀ j : Fin 3, bitF (Lc 273 q.val) j.val * y j z = if q = j then y j z else 0 := fun j => by
    rw [Lc_273]
    by_cases h : q = j
    · subst h; simp
    · simp [h, Ne.symm h]
  simp only [this, Finset.sum_ite_eq, Finset.mem_univ, if_true]

theorem eR_zero (r : ℕ) (M : Matrix (Fin r) (Fin 0) F2) : eR 0 r M = 0 := by
  have := eR_lt 0 r M
  rw [Nat.zero_mul, pow_zero] at this
  omega

/-! ## encoding a family -/

/-- the encoded family (column witnesses by choice) -/
noncomputable def encF {n : ℕ} (σ : Fin n → IS d) (h : ∀ s, ColOK (σ s)) (s : Fin n) : State :=
  encS (σ s) (h s).1.choose (h s).2.choose

theorem encF_valid {n : ℕ} {σ : Fin n → IS d} (hσ : IFam σ) (s : Fin n) (h0 : (σ s).a ≠ 0) :
    Valid d (encF σ hσ.2 s) := by
  have H := hσ.1 s s
  simp only [decide_true] at H
  exact encS_valid (σ s) h0 (hσ.2 s).1.choose_spec (hσ.2 s).2.choose_spec H

theorem encF_compat {n : ℕ} {σ : Fin n → IS d} (hσ : IFam σ) {s t : Fin n} (hst : s ≠ t)
    (h0 : ∀ u, (σ u).a ≠ 0) (hne : (σ s).a ≠ (σ t).a) : Compat d (encF σ hσ.2 s) (encF σ hσ.2 t) := by
  have H1 := hσ.1 s t
  have H2 := hσ.1 t s
  simp only [hst, Ne.symm hst, decide_false] at H1 H2
  exact encS_compat (σ s) (σ t) (h0 s) (h0 t) hne (hσ.2 s).1.choose_spec (hσ.2 s).2.choose_spec
    (hσ.2 t).1.choose_spec (hσ.2 t).2.choose_spec H1 H2

/-- the other members, in index order -/
noncomputable def others {n : ℕ} (σ : Fin n → IS d) (h : ∀ s, ColOK (σ s)) (t0 : Fin n) : List State :=
  ((List.finRange n).filter (fun s => decide (s ≠ t0))).map (encF σ h)

theorem family_encF {n : ℕ} {σ : Fin n → IS d} (hσ : IFam σ) (t0 : Fin n) (h0 : ∀ u, (σ u).a ≠ 0)
    (hinj : ∀ s t, s ≠ t → (σ s).a ≠ (σ t).a) :
    Family d (encF σ hσ.2 t0 :: others σ hσ.2 t0) := by
  refine ⟨?_, ?_⟩
  · intro st hst
    rcases List.mem_cons.mp hst with e | e
    · rw [e]; exact encF_valid hσ t0 (h0 t0)
    · obtain ⟨s, _, rfl⟩ := List.mem_map.mp e
      exact encF_valid hσ s (h0 s)
  · rw [List.pairwise_cons]
    refine ⟨?_, ?_⟩
    · intro st hst
      obtain ⟨s, hs, rfl⟩ := List.mem_map.mp hst
      have hs' : s ≠ t0 := by simpa using (List.mem_filter.mp hs).2
      exact encF_compat hσ (Ne.symm hs') h0 (hinj t0 s (Ne.symm hs'))
    · unfold others
      rw [List.pairwise_map]
      have hnd : ((List.finRange n).filter (fun s => decide (s ≠ t0))).Nodup := (List.nodup_finRange n).filter _
      exact hnd.imp (fun {s t} hst => encF_compat hσ hst h0 (hinj s t hst))

theorem length_filter_finRange {n : ℕ} (p : Fin n → Bool) :
    ((List.finRange n).filter p).length = (Finset.univ.filter (fun s => p s = true)).card := by
  rw [← List.toFinset_card_of_nodup ((List.nodup_finRange n).filter p)]
  congr 1
  ext s
  simp

theorem count_encF {n : ℕ} {σ : Fin n → IS d} (hσ : IFam σ) (t0 : Fin n) (h0 : ∀ u, (σ u).a ≠ 0) (r : ℕ) :
    count r (others σ hσ.2 t0) = (Finset.univ.filter (fun s => s ≠ t0 ∧ (σ s).a.rank = r)).card := by
  unfold count others
  rw [List.filter_map, List.length_map, List.filter_filter, length_filter_finRange]
  congr 1
  ext s
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, Bool.and_eq_true, decide_eq_true_eq,
    Function.comp_apply, beq_iff_eq]
  have : rk (encF σ hσ.2 s).a = (σ s).a.rank := (code_facts (h0 s)).2.2.2.symm
  rw [this]
  exact and_comm

end conv

end G.Br
