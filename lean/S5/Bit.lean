module
public import R22Port.U_d41d8cd98f00
public import S5.Base
/-! # Bit-level lemmas: sparse products, constant masks, lowest set bit -/
@[expose] public section
namespace S5
open BC4 BC5

/-- **Sparse product.** If `m` has bits only at multiples of `w` and `v < 2^w`, the copies `v · 2^(w k)` do not
overlap: bit `i` of `m * v` is bit `i mod w` of `v` when bit `w ⌊i/w⌋` of `m` is set. -/
theorem testBit_sparse_mul {w : Nat} (hw : 0 < w) (m : Nat) : ∀ (v : Nat), v < 2 ^ w →
    (∀ i, m.testBit i = true → i % w = 0) →
    ∀ i, (m * v).testBit i = (m.testBit (w * (i / w)) && v.testBit (i % w)) := by
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro v hv hm i
  rcases Nat.eq_zero_or_pos m with h0 | hpos
  · subst h0; simp
  have hr2 : m % 2 ^ w < 2 := by
    have : m % 2 ^ w < 2 ^ 1 := by
      apply Nat.lt_pow_two_of_testBit
      intro j hj
      rw [Nat.testBit_mod_two_pow]
      cases hjm : m.testBit j
      · simp
      · have := hm j hjm
        by_cases hjw : j < w
        · rw [Nat.mod_eq_of_lt hjw] at this; omega
        · simp [hjw]
    simpa using this
  have hb0 : (m % 2 ^ w).testBit 0 = m.testBit 0 := by
    rw [Nat.testBit_mod_two_pow]; simp [hw]
  have hr0 : m % 2 ^ w = (m.testBit 0).toNat := by
    rcases (by omega : m % 2 ^ w = 0 ∨ m % 2 ^ w = 1) with h | h
    · rw [h] at hb0 ⊢; rw [← hb0]; rfl
    · rw [h] at hb0 ⊢; rw [← hb0]; rfl
  have hrv : m % 2 ^ w * v < 2 ^ w := by
    rcases (by omega : m % 2 ^ w = 0 ∨ m % 2 ^ w = 1) with h | h
    · rw [h, Nat.zero_mul]; exact Nat.two_pow_pos w
    · rw [h, Nat.one_mul]; exact hv
  have hmv : m * v = 2 ^ w * (m / 2 ^ w * v) + m % 2 ^ w * v := by
    have := Nat.div_add_mod m (2 ^ w)
    calc m * v = (2 ^ w * (m / 2 ^ w) + m % 2 ^ w) * v := by rw [this]
      _ = 2 ^ w * (m / 2 ^ w * v) + m % 2 ^ w * v := by ring
  rw [hmv, Nat.testBit_two_pow_mul_add (m / 2 ^ w * v) hrv i]
  by_cases hiw : i < w
  · simp only [hiw, if_true]
    rw [Nat.div_eq_of_lt hiw, Nat.mod_eq_of_lt hiw, Nat.mul_zero, hr0]
    cases m.testBit 0 <;> simp
  · simp only [hiw, if_false]
    have h12 : 1 < 2 ^ w :=
      calc 1 < 2 ^ 1 := by norm_num
        _ ≤ 2 ^ w := Nat.pow_le_pow_right (by norm_num) hw
    have hqm : m / 2 ^ w < m := Nat.div_lt_self hpos h12
    have hqs : ∀ j, (m / 2 ^ w).testBit j = true → j % w = 0 := by
      intro j hj
      rw [Nat.testBit_div_two_pow] at hj
      have := hm _ hj
      rwa [Nat.add_mod_right] at this
    rw [ih _ hqm v hv hqs (i - w)]
    obtain ⟨k, rfl⟩ : ∃ k, i = k + w := ⟨i - w, by omega⟩
    rw [Nat.add_sub_cancel, Nat.testBit_div_two_pow, Nat.add_div_right k hw, Nat.add_mod_right, Nat.mul_add,
      Nat.mul_one]

/-- a constant's bits from a kernel check below `2^N` -/
theorem testBit_const {K N : Nat} (f : Nat → Bool) (hK : K < 2 ^ N)
    (hlow : allLT N (fun i => K.testBit i == f i) = true) (hhigh : ∀ i, N ≤ i → f i = false) :
    ∀ i, K.testBit i = f i := by
  intro i
  by_cases hi : i < N
  · have := allLT_spec hlow i hi
    simpa using this
  · rw [hhigh i (by omega), Nat.testBit_lt_two_pow (lt_of_lt_of_le hK (Nat.pow_le_pow_right (by norm_num) (by omega)))]

theorem rep18_bit : ∀ i, REP18.testBit i = decide (i % 18 = 0 ∧ i < 162) :=
  testBit_const (N := 162) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem left9_bit : ∀ i, LEFT9.testBit i = decide (i % 18 < 9 ∧ i < 162) :=
  testBit_const (N := 162) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem id18_bit : ∀ i, ID18.testBit i = decide (i < 162 ∧ 9 ≤ i % 18 ∧ i % 18 - 9 = i / 18) :=
  testBit_const (N := 162) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem hm_bit : ∀ i, HM.testBit i = decide (i < 162 ∧ i % 18 < 9 ∧ i / 18 < i % 18) :=
  testBit_const (N := 162) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem allnz_bit : ∀ i, ALLNZ.testBit i = decide (0 < i ∧ i < 512) :=
  testBit_const (N := 512) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem c17_bit : ∀ i, C17.testBit i = decide (i % 17 = 0 ∧ i < 153) :=
  testBit_const (N := 153) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem c31_bit : ∀ i, C31.testBit i = decide (i % 31 = 0 ∧ i < 279) :=
  testBit_const (N := 279) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem m32b_bit : ∀ i, M32B.testBit i = decide (i % 32 = 0 ∧ i < 288) :=
  testBit_const (N := 288) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem repr_bit : ∀ i, REPR.testBit i = decide (i % 18 = 9 ∧ i < 162) :=
  testBit_const (N := 162) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)
theorem rh9_bit : ∀ i, RH9.testBit i = decide (9 ≤ i ∧ i < 18) :=
  testBit_const (N := 18) _ (by decide +kernel) (by decide +kernel) (by intro i hi; simp; omega)

theorem m18_eq : M18 = 2 ^ 18 - 1 := by decide +kernel
theorem m162_eq : M162 = 2 ^ 162 - 1 := by decide +kernel
theorem m512_eq : M512 = 2 ^ 512 - 1 := by decide +kernel
theorem m32_eq : M32 = 2 ^ 32 - 1 := by decide +kernel

theorem rep18_sparse : ∀ i, REP18.testBit i = true → i % 18 = 0 := by
  intro i h; rw [rep18_bit] at h; simp at h; omega

/-- `spr18 c = ∑_{z ∈ c} 2^(18z)` -/
theorem spr18_bit (c : Nat) (hc : c < 512) (i : Nat) :
    (spr18 c).testBit i = (decide (i % 18 = 0 ∧ i < 162) && c.testBit (i / 18)) := by
  show (c * C17 &&& REP18).testBit i = _
  rw [Nat.testBit_and, Nat.mul_comm, testBit_sparse_mul (w := 17) (by norm_num) C17 c (by omega)
    (fun j hj => by rw [c17_bit] at hj; simp at hj; omega) i, c17_bit, rep18_bit]
  by_cases h : i % 18 = 0 ∧ i < 162
  · have e1 : i % 17 = i / 18 := by omega
    have e2 : 17 * (i / 17) % 17 = 0 ∧ 17 * (i / 17) < 153 := by omega
    simp [h, e1, e2]
  · simp [h]

theorem spr18_sparse (c : Nat) (hc : c < 512) : ∀ i, (spr18 c).testBit i = true → i % 18 = 0 := by
  intro i h; rw [spr18_bit c hc] at h; simp at h; omega

/-- `dep32 x = ∑_{i ∈ x} 2^(32i)` -/
theorem dep32_bit (x : Nat) (hx : x < 512) (i : Nat) :
    (dep32 x).testBit i = (decide (i % 32 = 0 ∧ i < 288) && x.testBit (i / 32)) := by
  show (x * C31 &&& M32B).testBit i = _
  rw [Nat.testBit_and, Nat.mul_comm, testBit_sparse_mul (w := 31) (by norm_num) C31 x (by omega)
    (fun j hj => by rw [c31_bit] at hj; simp at hj; omega) i, c31_bit, m32b_bit]
  by_cases h : i % 32 = 0 ∧ i < 288
  · have e1 : i % 31 = i / 32 := by omega
    have e2 : 31 * (i / 31) % 31 = 0 ∧ 31 * (i / 31) < 279 := by omega
    simp [h, e1, e2]
  · simp [h]

theorem exists_low_bit {m : Nat} (hm : m ≠ 0) : ∃ k, m.testBit k = true ∧ ∀ i < k, m.testBit i = false := by
  have hex : ∃ i, m.testBit i = true := by
    by_contra hne
    push_neg at hne
    apply hm
    apply Nat.eq_of_testBit_eq
    intro i; simpa using hne i
  classical
  refine ⟨Nat.find hex, Nat.find_spec hex, fun i hi => ?_⟩
  have := Nat.find_min hex hi
  simpa using this

/-- **Lowest set bit.** `m &&& (m - 1)` clears it and `m ^^^ (m &&& (m - 1))` is it. -/
theorem lowbit_spec {m k : Nat} (hk : m.testBit k = true) (hlow : ∀ i < k, m.testBit i = false) :
    (∀ i, (m &&& (m - 1)).testBit i = (m.testBit i && decide (i ≠ k))) ∧ m ^^^ (m &&& (m - 1)) = 2 ^ k := by
  have hmod : m % 2 ^ (k + 1) = 2 ^ k := by
    apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.testBit_mod_two_pow, Nat.testBit_two_pow]
    rcases lt_trichotomy i k with h | h | h
    · rw [hlow i h]; simp; omega
    · subst h; simp [hk]
    · have h1 : ¬ i < k + 1 := by omega
      have h2 : k ≠ i := by omega
      simp [h1, h2]
  have hpos : 0 < 2 ^ k := Nat.two_pow_pos k
  have hdec : m = 2 ^ (k + 1) * (m / 2 ^ (k + 1)) + 2 ^ k := by
    have := Nat.div_add_mod m (2 ^ (k + 1)); rw [hmod] at this; omega
  have hm1 : m - 1 = 2 ^ (k + 1) * (m / 2 ^ (k + 1)) + (2 ^ k - 1) := by omega
  have hlt1 : 2 ^ k - 1 < 2 ^ (k + 1) := by rw [Nat.pow_succ]; omega
  have hlt2 : 2 ^ k < 2 ^ (k + 1) := by rw [Nat.pow_succ]; omega
  have bm1 : ∀ i, (m - 1).testBit i =
      if i < k + 1 then decide (i < k) else (m / 2 ^ (k + 1)).testBit (i - (k + 1)) := by
    intro i; rw [hm1, Nat.testBit_two_pow_mul_add _ hlt1, Nat.testBit_two_pow_sub_one]
  have bm : ∀ i, m.testBit i =
      if i < k + 1 then decide (k = i) else (m / 2 ^ (k + 1)).testBit (i - (k + 1)) := by
    intro i; conv_lhs => rw [hdec]
    rw [Nat.testBit_two_pow_mul_add _ hlt2, Nat.testBit_two_pow]
  have h1 : ∀ i, (m &&& (m - 1)).testBit i = (m.testBit i && decide (i ≠ k)) := by
    intro i; rw [Nat.testBit_and, bm1 i, bm i]
    rcases lt_trichotomy i k with h | h | h
    · have h' : k ≠ i := by omega
      simp [show i < k + 1 by omega, h']
    · subst h; simp
    · have h' : ¬ i < k + 1 := by omega
      have h'' : i ≠ k := by omega
      simp [h', h'']
  refine ⟨h1, ?_⟩
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_xor, h1 i, Nat.testBit_two_pow]
  by_cases h : i = k
  · subst h; simp [hk]
  · have h' : k ≠ i := fun e => h e.symm
    cases m.testBit i <;> simp [h, h']

theorem mkB_bit (f : Nat → Bool) (k i : Nat) : (mkB f k).testBit i = (decide (i < k) && f i) := by
  induction k with
  | zero => simp [mkB]
  | succ k ih =>
    show (mkB f k ||| (bif f k then 2 ^ k else 0)).testBit i = _
    rw [Nat.testBit_or, ih]
    cases hf : f k
    · simp only [cond_false, Nat.zero_testBit, Bool.or_false]
      by_cases hik : i = k
      · subst hik; simp [hf]
      · have : (i < k + 1) ↔ i < k := by omega
        simp [this]
    · simp only [cond_true, Nat.testBit_two_pow]
      by_cases hik : i = k
      · subst hik; simp [hf]
      · have : (i < k + 1) ↔ i < k := by omega
        have h2 : k ≠ i := fun e => hik e.symm
        simp [this, h2]

theorem mkB_lt (f : Nat → Bool) (k : Nat) : mkB f k < 2 ^ k := by
  apply Nat.lt_pow_two_of_testBit
  intro i hi; rw [mkB_bit]; simp; omega

theorem lt_of_land_mask {x k : Nat} : x &&& (2 ^ k - 1) < 2 ^ k := by
  rw [Nat.and_two_pow_sub_one_eq_mod]; exact Nat.mod_lt _ (Nat.two_pow_pos k)

end S5
