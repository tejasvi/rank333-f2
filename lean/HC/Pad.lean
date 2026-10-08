module
public import R22Port.U_d41d8cd98f00
public import RT.Sound
public import RootSound.Leaf
/-! # Padding: refuting "exactly `R` outside `E`" gives the bound `R + 1` (flag 2 of `leaf2/HCLS.md`)

An E1 instance (`E1S.e1_sound`, `E1S.e1_sound_ext`) concludes `E1Concl Em R`: no decomposition of `<3,3,3>` whose `b`, `c`
are all nonzero has exactly `R` first factors outside the point mask `Em`.

* `split_step`: a decomposition with all `b`, `c` nonzero and a term `(a, b, c)` outside `Em` becomes one with one more
  term outside `Em` and still all `b`, `c` nonzero: add the term `(a, b, y)` and replace `c` by `c + y`, for some `y ≠ 0`
  with `c + y ≠ 0`.
* `drop_zero`: dropping the terms with `b = 0` or `c = 0` keeps a decomposition and does not raise the count outside `Em`.
* **`pad`**: `E1Concl Em R → Fact Em 1 → Fact Em (R + 1)`.  From a decomposition with at most `R` terms outside `Em`:
  drop its zero terms (still at least one term outside, by `Fact Em 1`), then split terms up to exactly `R`.
* **`fact_one`**: `Fact Em 1` for every `Em` inside a hyperplane `X^⊥` (`X ≠ 0`): if every first factor were in `Em`,
  the contraction of `T` with `X` (`RootSound.contract`) would vanish, but `T(X) ≠ 0`.  `oneOK Em X` checks the
  hypotheses as one `Nat` operation. -/
@[expose] public section
namespace HC
open RT RootSound Matrix Finset BC4 BC5

/-- the conclusion of an E1 instance (exactly the statement of `E1S.e1_sound` / `E1S.e1_sound_ext`) -/
def E1Concl (m R : Nat) : Prop :=
  ∀ (n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3), (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c →
    (∀ s, b s ≠ 0 ∧ c s ≠ 0) → (univ.filter (fun s : Fin n => m.testBit (av s) = false)).card = R → False

/-! ## Splitting one term -/

theorem f2_add_eq_zero : ∀ x y : F2, x + y = 0 → x = y := by decide

theorem m3_add_eq_zero {x y : M3} (h : x + y = 0) : x = y := by
  ext i j
  exact f2_add_eq_zero _ _ (by simpa using congrFun (congrFun h i) j)

theorem toM3_1_00 : toM3 1 0 0 = 1 := by simp [toM3, bitF]
theorem toM3_2_00 : toM3 2 0 0 = 0 := by simp [toM3, bitF]

theorem pick (x : M3) : ∃ y : M3, y ≠ 0 ∧ x + y ≠ 0 := by
  have h1 : toM3 1 ≠ 0 := fun h => by
    have := congrFun (congrFun h 0) 0; rw [toM3_1_00] at this; exact absurd this (by decide)
  have h2 : toM3 2 ≠ 0 := fun h => by
    have := congrFun (congrFun h 0) 1
    simp only [toM3, bitF, Matrix.zero_apply] at this
    exact absurd this (by decide)
  have h12 : toM3 1 ≠ toM3 2 := fun h => by
    have := congrFun (congrFun h 0) 0; rw [toM3_1_00, toM3_2_00] at this; exact absurd this (by decide)
  by_cases hx : x = toM3 1
  · exact ⟨toM3 2, h2, fun h => h12 (hx ▸ m3_add_eq_zero h)⟩
  · exact ⟨toM3 1, h1, fun h => hx (m3_add_eq_zero h)⟩

theorem f2_cancel : ∀ x S : F2, x + (S + x) = S := by decide

theorem split_step {m : Nat} {n : ℕ} {av : Fin n → ℕ} {b c : Fin n → M3} (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) (hbc : ∀ s, b s ≠ 0 ∧ c s ≠ 0) (s0 : Fin n)
    (hs0 : m.testBit (av s0) = false) :
    ∃ (av' : Fin (n + 1) → ℕ) (b' c' : Fin (n + 1) → M3), (∀ s, av' s < 512) ∧
      IsDecomp (fun s => toM3 (av' s)) b' c' ∧ (∀ s, b' s ≠ 0 ∧ c' s ≠ 0) ∧
      (univ.filter (fun s => m.testBit (av' s) = false)).card =
        (univ.filter (fun s => m.testBit (av s) = false)).card + 1 := by
  obtain ⟨y, hy0, hy⟩ := pick (c s0)
  refine ⟨Fin.cons (av s0) av, Fin.cons (b s0) b, Fin.cons y (fun s => c s + if s = s0 then y else 0), ?_, ?_, ?_, ?_⟩
  · intro s
    refine Fin.cases ?_ (fun i => ?_) s
    · simp only [Fin.cons_zero]; exact hav s0
    · simp only [Fin.cons_succ]; exact hav i
  · intro i j j' k k' i'
    rw [Fin.sum_univ_succ]
    simp only [Fin.cons_zero, Fin.cons_succ, Matrix.add_apply]
    have e : ∀ s, toM3 (av s) i j * b s j' k * (c s k' i' + (if s = s0 then y else 0) k' i') =
        toM3 (av s) i j * b s j' k * c s k' i' + (if s = s0 then toM3 (av s0) i j * b s0 j' k * y k' i' else 0) := by
      intro s
      by_cases h : s = s0
      · subst h; simp only [if_true]; ring
      · simp only [h, if_false, Matrix.zero_apply, add_zero]
    simp only [e, Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, if_true]
    rw [← hd i j j' k k' i']
    exact f2_cancel _ _
  · intro s
    refine Fin.cases ⟨(hbc s0).1, hy0⟩ (fun i => ?_) s
    simp only [Fin.cons_succ]
    refine ⟨(hbc i).1, ?_⟩
    by_cases h : i = s0
    · subst h; simpa using hy
    · simpa [h] using (hbc i).2
  · rw [Fin.card_filter_univ_succ']
    simp only [Fin.cons_zero, Fin.cons_succ, hs0, if_true]
    omega

/-! ## Dropping zero terms -/

theorem drop_zero {m : Nat} {n : ℕ} {av : Fin n → ℕ} {b c : Fin n → M3} (hav : ∀ s, av s < 512)
    (hd : IsDecomp (fun s => toM3 (av s)) b c) :
    ∃ (n' : ℕ) (av' : Fin n' → ℕ) (b' c' : Fin n' → M3), (∀ s, av' s < 512) ∧
      IsDecomp (fun s => toM3 (av' s)) b' c' ∧ (∀ s, b' s ≠ 0 ∧ c' s ≠ 0) ∧
      (univ.filter (fun s => m.testBit (av' s) = false)).card ≤
        (univ.filter (fun s => m.testBit (av s) = false)).card := by
  classical
  let p : Fin n → Prop := fun s => b s ≠ 0 ∧ c s ≠ 0
  let e := (Fintype.equivFin {s // p s}).symm
  refine ⟨Fintype.card {s // p s}, fun i => av (e i).1, fun i => b (e i).1, fun i => c (e i).1,
    fun i => hav _, ?_, fun i => (e i).2, ?_⟩
  · intro i j j' k k' i'
    rw [← hd i j j' k k' i']
    rw [Equiv.sum_comp e (fun x : {s // p s} => toM3 (av x.1) i j * b x.1 j' k * c x.1 k' i')]
    rw [← Finset.sum_subtype (univ.filter p) (fun x => by simp) (fun s => toM3 (av s) i j * b s j' k * c s k' i')]
    rw [Finset.sum_filter]
    refine Finset.sum_congr rfl fun s _ => ?_
    by_cases h : p s
    · rw [if_pos h]
    · rw [if_neg h]
      simp only [p, not_and_or, not_not] at h
      rcases h with h | h <;> simp [h]
  · apply Finset.card_le_card_of_injOn (fun i => (e i).1)
    · intro i hi
      simp only [Finset.coe_filter, Finset.mem_univ, true_and, Set.mem_setOf_eq] at hi ⊢
      exact hi
    · intro i _ i' _ h
      exact e.injective (Subtype.ext h)

/-! ## Padding -/

theorem pad_up {m R : Nat} (hE : E1Concl m R) : ∀ (k n : ℕ) (av : Fin n → ℕ) (b c : Fin n → M3),
    (∀ s, av s < 512) → IsDecomp (fun s => toM3 (av s)) b c → (∀ s, b s ≠ 0 ∧ c s ≠ 0) →
    1 ≤ (univ.filter (fun s : Fin n => m.testBit (av s) = false)).card →
    (univ.filter (fun s : Fin n => m.testBit (av s) = false)).card + k = R → False := by
  intro k
  induction k with
  | zero => intro n av b c hav hd hbc _ hk; exact hE n av b c hav hd hbc (by simpa using hk)
  | succ k ih =>
    intro n av b c hav hd hbc h1 hk
    obtain ⟨s0, hs0⟩ : ∃ s0, m.testBit (av s0) = false := by
      obtain ⟨s0, hs⟩ := Finset.card_pos.mp h1
      exact ⟨s0, (Finset.mem_filter.mp hs).2⟩
    obtain ⟨av', b', c', hav', hd', hbc', hcnt⟩ := split_step hav hd hbc s0 hs0
    exact ih _ av' b' c' hav' hd' hbc' (by omega) (by omega)

/-- **Padding.** -/
theorem pad {m R : Nat} (hE : E1Concl m R) (h1 : Fact m 1) : Fact m (R + 1) := by
  intro n av b c hav hd
  by_contra hlt
  rw [not_le] at hlt
  obtain ⟨n', av', b', c', hav', hd', hbc', hle⟩ := drop_zero (m := m) hav hd
  have h1' := h1 n' av' b' c' hav' hd'
  exact pad_up hE (R - (univ.filter (fun s : Fin n' => m.testBit (av' s) = false)).card) n' av' b' c' hav' hd' hbc' h1'
    (by omega)

/-! ## `Fact Em 1` for a subspace inside a hyperplane -/

theorem par_tables : RootCheck.PAR = BC4.PAR := by decide

theorem hitsOne_par (X a : Nat) : RootCheck.hitsOne X a = par (a &&& X) := by
  unfold RootCheck.hitsOne par
  rw [par_tables, Nat.land_comm]
  rfl

theorem exists_bit {X : Nat} (hX0 : X ≠ 0) (hX : X < 512) : ∃ i j : Fin 3, X.testBit (3 * i.val + j.val) = true := by
  by_contra hno
  simp only [not_exists] at hno
  apply hX0
  apply Nat.eq_of_testBit_eq
  intro k
  rw [Nat.zero_testBit]
  by_cases hk : k < 9
  · have := hno ⟨k / 3, by omega⟩ ⟨k % 3, by omega⟩
    simp only at this
    rw [show 3 * (k / 3) + k % 3 = k by omega] at this
    simpa using this
  · exact Nat.testBit_lt_two_pow (lt_of_lt_of_le hX (by
      calc 512 = 2 ^ 9 := by norm_num
        _ ≤ 2 ^ k := Nat.pow_le_pow_right (by norm_num) (by omega)))

/-- **`Fact Em 1`** for `Em` inside the hyperplane `X^⊥`, `X ≠ 0`. -/
theorem fact_one {m X : Nat} (hX0 : X ≠ 0) (hX : X < 512)
    (hm : ∀ w < 512, m.testBit w = true → par (w &&& X) = false) : Fact m 1 := by
  intro n av b c hav hd
  rw [Nat.one_le_iff_ne_zero]
  intro h0
  rw [Finset.card_eq_zero, Finset.filter_eq_empty_iff] at h0
  have hall : ∀ s, pair (toM3 X) (toM3 (av s)) = 0 := by
    intro s
    have hin : m.testBit (av s) = true := by
      have := h0 (Finset.mem_univ s)
      simpa using this
    rw [pair_toM3 X (av s) hX (hav s), hitsOne_par, hm (av s) (hav s) hin]
    rfl
  obtain ⟨i, j, hij⟩ := exists_bit hX0 hX
  have hc := contract hd (toM3 X) ⟨3 * j.val, by omega⟩ ⟨i.val, by omega⟩
  simp only [hall, zero_mul, Finset.sum_const_zero] at hc
  have hlo : lo ⟨3 * j.val, by omega⟩ = hi ⟨i.val, by omega⟩ := by
    apply Fin.ext; simp only [lo, hi]; omega
  unfold TX at hc
  rw [if_pos hlo] at hc
  have e1 : lo ⟨i.val, by omega⟩ = i := by apply Fin.ext; simp only [lo]; omega
  have e2 : hi ⟨3 * j.val, by omega⟩ = j := by apply Fin.ext; simp only [hi]; omega
  rw [e1, e2] at hc
  simp only [toM3, bitF, hij, if_true] at hc
  exact absurd hc (by decide)

/-- the hypotheses of `fact_one` as one check: `X ≠ 0`, `X < 512`, `m ⊆ X^⊥` below 512 -/
def oneOK (m X : Nat) : Bool :=
  !(X == 0) && Nat.blt X 512 && (Nat.land (Nat.land m (Nat.xor M512 (perp X))) M512 == 0)

theorem fact_one' {m X : Nat} (h : oneOK m X = true) : Fact m 1 := by
  unfold oneOK at h
  simp only [Bool.and_eq_true, Bool.not_eq_true', beq_eq_false_iff_ne, ne_eq, Nat.blt_eq, beq_iff_eq] at h
  obtain ⟨⟨hX0, hX⟩, hsub⟩ := h
  refine fact_one hX0 hX (fun w hw hmw => ?_)
  have hb := congrArg (fun x => Nat.testBit x w) hsub
  simp only [Nat.zero_testBit] at hb
  have hM : M512.testBit w = true := by rw [RT.m512_bit]; simp [hw]
  change ((m &&& (M512 ^^^ perp X)) &&& M512).testBit w = false at hb
  rw [Nat.testBit_and, Nat.testBit_and, Nat.testBit_xor, hM, hmw, S5.perp_bit X w hX hw] at hb
  cases e : par (w &&& X)
  · rfl
  · rw [e] at hb; exact absurd hb (by decide)

end HC
