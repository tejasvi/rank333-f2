module
public import R22Port.U_d41d8cd98f00
public import GS.Spec
/-! # L0, part 4: compaction (`G/Base.lean` `cmask`, `compactL`, `cmasks`) and the slices (`G/A2.lean` `slicesOK`)

* `testBit_cmask`: `cmask n t` has bit `p` iff `p / (32·2^t) < n / 2^t + 1` and `p % (32·2^t) < 2^t`;
* `compactL_spec`: for `x` with bits only at `32k`, `k < n`, and `n ≤ 2^T`, bit `k` of `compactL (cmasks n T 0) 0 x` is bit
  `32k` of `x` (and `0` for `k ≥ n`);
* `slicesOK_spec`: an accepted `slicesOK S P n` makes `S` the 29 slices of the first `n` fields of `P` (`SlOKn`). -/
@[expose] public section
namespace GS
open G Finset

/-! ## geometric repetitions at any stride -/

/-- `∑_{g<m} 2^(S g)` -/
def repS (S m : ℕ) : ℕ := ∑ g ∈ range m, 2 ^ (S * g)

theorem repS_succ (S m : ℕ) : repS S (m + 1) = repS S m + 2 ^ (S * m) := by unfold repS; rw [Finset.sum_range_succ]

theorem repS_mul (S m : ℕ) : repS S m * (2 ^ S - 1) = 2 ^ (S * m) - 1 := by
  induction m with
  | zero => simp [repS]
  | succ m ih =>
    rw [repS_succ, Nat.add_mul, ih]
    have h1 : 1 ≤ 2 ^ (S * m) := Nat.one_le_two_pow
    have h2 : 1 ≤ 2 ^ S := Nat.one_le_two_pow
    have hp : 2 ^ (S * (m + 1)) = 2 ^ (S * m) * 2 ^ S := by rw [Nat.mul_succ, pow_add]
    rw [hp, Nat.mul_sub, Nat.mul_one]
    have : 2 ^ (S * m) ≤ 2 ^ (S * m) * 2 ^ S := Nat.le_mul_of_pos_right _ (by omega)
    omega

theorem repS_eq_div (S m : ℕ) (hS : 1 ≤ S) : (2 ^ (S * m) - 1) / (2 ^ S - 1) = repS S m := by
  have h2 : 2 ≤ 2 ^ S := by
    calc 2 = 2 ^ 1 := by norm_num
      _ ≤ 2 ^ S := Nat.pow_le_pow_right (by norm_num) hS
  rw [← repS_mul S m, Nat.mul_div_cancel _ (by omega)]

theorem mul_repS_lt (y S m : ℕ) (hy : y < 2 ^ S) : y * repS S m < 2 ^ (S * m) := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · simp [repS]
  have h1 := repS_mul S m
  have hpos : 1 ≤ 2 ^ (S * m) := Nat.one_le_two_pow
  calc y * repS S m ≤ (2 ^ S - 1) * repS S m := Nat.mul_le_mul_right _ (by omega)
    _ = 2 ^ (S * m) - 1 := by rw [Nat.mul_comm]; exact h1
    _ < 2 ^ (S * m) := by omega

/-- `p = S q + r`, `r < S` -/
theorem divmod_of {S q r p : ℕ} (hp : p = S * q + r) (hr : r < S) : p / S = q ∧ p % S = r := by
  subst hp
  have hS : 0 < S := by omega
  refine ⟨?_, ?_⟩
  · rw [Nat.add_comm, Nat.add_mul_div_left _ _ hS, Nat.div_eq_of_lt hr, Nat.zero_add]
  · rw [Nat.add_comm, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hr]

theorem testBit_mul_repS (y S m p : ℕ) (hS : 1 ≤ S) (hy : y < 2 ^ S) :
    (y * repS S m).testBit p = (decide (p / S < m) && y.testBit (p % S)) := by
  induction m generalizing p with
  | zero => simp [repS]
  | succ m ih =>
    have hlt := mul_repS_lt y S m hy
    have e : y * repS S (m + 1) = 2 ^ (S * m) * y + y * repS S m := by
      rw [repS_succ, Nat.mul_add, Nat.mul_comm y (2 ^ (S * m)), Nat.add_comm]
    rw [e, Nat.testBit_two_pow_mul_add y hlt]
    obtain ⟨hq, hr⟩ := divmod_of (S := S) (q := p / S) (r := p % S) (p := p) (Nat.div_add_mod p S).symm
      (Nat.mod_lt p (by omega))
    by_cases hp : p < S * m
    · rw [if_pos hp, ih]
      have h1 : p / S < m := Nat.div_lt_of_lt_mul hp
      simp [h1, show p / S < m + 1 by omega]
    · rw [if_neg hp]
      push Not at hp
      have hdm := Nat.div_add_mod p S
      have hge : m ≤ p / S := (Nat.le_div_iff_mul_le (by omega)).mpr (by rw [Nat.mul_comm]; exact hp)
      by_cases hq2 : p / S = m
      · have e2 : p - S * m = p % S := by rw [← hq2]; omega
        rw [e2]; simp [hq2]
      · have hgt : m + 1 ≤ p / S := by omega
        have e1 : ¬ (p / S < m + 1) := by omega
        have hb : S ≤ p - S * m := by
          have : S * (m + 1) ≤ S * (p / S) := Nat.mul_le_mul_left _ hgt
          rw [Nat.mul_succ] at this; omega
        rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) hb))]
        simp [e1]

/-! ## `cmask` -/

theorem cmask_eq (n t : ℕ) : cmask n t = repS (32 * 2 ^ t) (n / 2 ^ t + 1) * (2 ^ (2 ^ t) - 1) := by
  have hS : 1 ≤ 32 * 2 ^ t := by have := Nat.one_le_two_pow (n := t); omega
  rw [← repS_eq_div _ _ hS]
  have e1 : Nat.shiftLeft 1 t = 2 ^ t := shiftLeft_one t
  have e2 : Nat.shiftRight n t = n / 2 ^ t := Nat.shiftRight_eq_div_pow n t
  unfold cmask
  simp only [e1, e2, shiftLeft_one]
  rfl

theorem testBit_cmask (n t p : ℕ) :
    (cmask n t).testBit p = (decide (p / (32 * 2 ^ t) < n / 2 ^ t + 1) && decide (p % (32 * 2 ^ t) < 2 ^ t)) := by
  have hS : 1 ≤ 32 * 2 ^ t := by have := Nat.one_le_two_pow (n := t); omega
  have hy : 2 ^ (2 ^ t) - 1 < 2 ^ (32 * 2 ^ t) := by
    have : 2 ^ (2 ^ t) ≤ 2 ^ (32 * 2 ^ t) := Nat.pow_le_pow_right (by norm_num) (by omega)
    have := Nat.one_le_two_pow (n := 2 ^ t)
    omega
  rw [cmask_eq, Nat.mul_comm, testBit_mul_repS _ _ _ _ hS hy, Nat.testBit_two_pow_sub_one]

/-! ## the compaction invariant -/

/-- after step `t`: groups of `2^t` data bits at stride `32·2^t`; data bit `j` (`j < n`) is `b j` -/
def CInv (n t x : ℕ) (b : ℕ → Bool) : Prop :=
  ∀ p, x.testBit p = (decide (p % (32 * 2 ^ t) < 2 ^ t) &&
    decide (2 ^ t * (p / (32 * 2 ^ t)) + p % (32 * 2 ^ t) < n) && b (2 ^ t * (p / (32 * 2 ^ t)) + p % (32 * 2 ^ t)))

theorem cinv_step (n t x : ℕ) (b : ℕ → Bool) (h : CInv n t x b) :
    CInv n (t + 1) (Nat.land (Nat.lor x (Nat.shiftRight x (Nat.mul 31 (Nat.shiftLeft 1 t)))) (cmask n (t + 1))) b := by
  intro p
  set w := 2 ^ t with hw
  have hw1 : 1 ≤ w := Nat.one_le_two_pow
  have hw2 : 2 ^ (t + 1) = 2 * w := by rw [pow_succ]; ring
  have hS2 : 32 * 2 ^ (t + 1) = 2 * (32 * w) := by rw [hw2]; ring
  show ((x ||| (x >>> (31 * Nat.shiftLeft 1 t))) &&& cmask n (t + 1)).testBit p = _
  rw [shiftLeft_one, ← hw, Nat.testBit_and, Nat.testBit_or, Nat.testBit_shiftRight, testBit_cmask, hS2, hw2]
  -- p = 64 w g + i
  set g := p / (2 * (32 * w)) with hg
  set i := p % (2 * (32 * w)) with hi
  have hp : p = 2 * (32 * w) * g + i := (Nat.div_add_mod p _).symm
  have hi_lt : i < 2 * (32 * w) := Nat.mod_lt _ (by omega)
  rw [h p, h (31 * w + p)]
  simp only [← hw]
  by_cases h1 : i < w
  · -- the bit is a data bit of group `2g`; the shifted position is not a data bit
    obtain ⟨d1, m1⟩ := divmod_of (S := 32 * w) (q := 2 * g) (r := i) (p := p) (by rw [hp]; ring) (by omega)
    obtain ⟨d2, m2⟩ := divmod_of (S := 32 * w) (q := 2 * g) (r := i + 31 * w) (p := 31 * w + p) (by rw [hp]; ring)
      (by omega)
    rw [d1, m1, d2, m2]
    have e : w * (2 * g) + i = 2 * w * g + i := by ring
    rw [e]
    by_cases hn : 2 * w * g + i < n
    · have hg' : g < n / (2 * w) + 1 := by
        have : g ≤ n / (2 * w) := (Nat.le_div_iff_mul_le (by omega)).mpr (by nlinarith)
        omega
      simp [h1, hn, hg', show ¬ (i + 31 * w < w) from by omega, show i < 2 * w from by omega]
    · have hc : ¬ (i + 31 * w < w) := by omega
      simp [hn, hc]
  · by_cases h2 : i < 2 * w
    · -- not a data bit of group `2g`; the shifted position is data bit `i - w` of group `2g + 1`
      obtain ⟨d1, m1⟩ := divmod_of (S := 32 * w) (q := 2 * g) (r := i) (p := p) (by rw [hp]; ring) (by omega)
      obtain ⟨d2, m2⟩ := divmod_of (S := 32 * w) (q := 2 * g + 1) (r := i - w) (p := 31 * w + p)
        (by rw [hp]; have : i = (i - w) + w := by omega
            rw [this]; ring_nf; omega) (by omega)
      rw [d1, m1, d2, m2]
      have e : w * (2 * g + 1) + (i - w) = 2 * w * g + i := by
        have : i = (i - w) + w := by omega
        rw [this]; ring_nf; omega
      rw [e]
      by_cases hn : 2 * w * g + i < n
      · have hg' : g < n / (2 * w) + 1 := by
          have : g ≤ n / (2 * w) := (Nat.le_div_iff_mul_le (by omega)).mpr (by nlinarith)
          omega
        simp [h1, hn, hg', h2, show i - w < w from by omega]
      · simp [h1, hn]
    · -- outside the new groups: masked (cmask) and not a data bit (invariant at t + 1)
      have hm : ¬ (i < 2 * w) := h2
      simp only [hm, decide_false, Bool.and_false, Bool.false_and]

theorem cinv_compactL (n : ℕ) (b : ℕ → Bool) :
    ∀ (T t x : ℕ), CInv n t x b → CInv n (t + T) (compactL (cmasks n T t) t x) b
  | 0, t, x, h => by simpa [cmasks, compactL] using h
  | T + 1, t, x, h => by
    show CInv n (t + (T + 1)) (compactL (cmask n (Nat.succ t) :: cmasks n T (Nat.succ t)) t x) b
    show CInv n (t + (T + 1)) (compactL (cmasks n T (Nat.succ t)) (Nat.succ t)
      (Nat.land (Nat.lor x (Nat.shiftRight x (Nat.mul 31 (Nat.shiftLeft 1 t)))) (cmask n (Nat.succ t)))) b
    have := cinv_compactL n b T (t + 1) _ (cinv_step n t x b h)
    rw [show t + 1 + T = t + (T + 1) by omega] at this
    exact this

/-- **compaction** -/
theorem compactL_spec (n T x : ℕ) (hT : n ≤ 2 ^ T) (hx : ∀ p, x.testBit p = true → p % 32 = 0 ∧ p / 32 < n) (k : ℕ) :
    (compactL (cmasks n T 0) 0 x).testBit k = (decide (k < n) && x.testBit (32 * k)) := by
  have h0 : CInv n 0 x (fun j => x.testBit (32 * j)) := by
    intro p
    simp only [pow_zero, Nat.mul_one, Nat.one_mul]
    by_cases hp : p % 32 < 1
    · have hp0 : p % 32 = 0 := by omega
      have e : 32 * (p / 32 + p % 32) = p := by omega
      rw [e]
      by_cases hb : x.testBit p = true
      · have := (hx p hb).2; simp [hp, hb, this, hp0]
      · have : x.testBit p = false := by simpa using hb
        simp [this]
    · have : x.testBit p = false := by
        by_contra hc
        have := (hx p (by simpa using hc)).1; omega
      simp [this, hp]
  have hT' := cinv_compactL n _ T 0 x h0 k
  rw [Nat.zero_add] at hT'
  rw [hT']
  have hS : k < 32 * 2 ^ T ∨ 32 * 2 ^ T ≤ k := Nat.lt_or_ge _ _
  by_cases hk : k < 2 ^ T
  · obtain ⟨d1, m1⟩ := divmod_of (S := 32 * 2 ^ T) (q := 0) (r := k) (p := k) (by ring) (by omega)
    rw [d1, m1, Nat.mul_zero, Nat.zero_add]
    simp [hk]
  · -- `k ≥ 2^T ≥ n`: no data
    have hkn : ¬ (k < n) := by omega
    have : ¬ (2 ^ T * (k / (32 * 2 ^ T)) + k % (32 * 2 ^ T) < n) := by
      intro hc
      by_cases hq : k / (32 * 2 ^ T) = 0
      · rw [hq, Nat.mul_zero, Nat.zero_add] at hc
        have : k % (32 * 2 ^ T) = k := by
          have := Nat.div_add_mod k (32 * 2 ^ T); rw [hq, Nat.mul_zero, Nat.zero_add] at this; exact this
        omega
      · have : 2 ^ T ≤ 2 ^ T * (k / (32 * 2 ^ T)) := Nat.le_mul_of_pos_right _ (Nat.pos_of_ne_zero hq)
        omega
    simp [this, hkn]

/-! ## the slices -/

theorem testBit_shr_land_rep (P i n p : ℕ) (hi : i < 32) :
    ((P >>> i) &&& rep32 n).testBit p = (decide (p / 32 < n) && decide (p % 32 = 0) && P.testBit (i + p)) := by
  rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_rep32]
  cases P.testBit (i + p) <;> simp [Bool.and_comm, Bool.and_left_comm]

/-- **the slices of a stride-32 pack** -/
theorem slicesOK_spec (S : Sl29) (P n : ℕ) (h : G.A2.slicesOK S P n = true) : SlOKn S (fld P) n := by
  unfold G.A2.slicesOK at h
  simp only [Bool.and_eq_true, Nat.ble_eq, beq_iff_eq] at h
  have hT : Nat.shiftLeft 1 (steps n) ≥ n := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1
  have h0 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h1 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h2 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h3 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h4 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h5 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h6 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h7 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h8 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h9 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h10 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h11 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h12 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h13 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h14 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h15 := h.1.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h16 := h.1.1.1.1.1.1.1.1.1.1.1.1.2
  have h17 := h.1.1.1.1.1.1.1.1.1.1.1.2
  have h18 := h.1.1.1.1.1.1.1.1.1.1.2
  have h19 := h.1.1.1.1.1.1.1.1.1.2
  have h20 := h.1.1.1.1.1.1.1.1.2
  have h21 := h.1.1.1.1.1.1.1.2
  have h22 := h.1.1.1.1.1.1.2
  have h23 := h.1.1.1.1.1.2
  have h24 := h.1.1.1.1.2
  have h25 := h.1.1.1.2
  have h26 := h.1.1.2
  have h27 := h.1.2
  have h28 := h.2
  have hT2 : n ≤ 2 ^ steps n := by rw [← shiftLeft_one]; exact hT
  have key : ∀ i < 29, ∀ k, (G.A2.slice (cmasks n (steps n) 0) P (rep32 n) i).testBit k =
      (decide (k < n) && (fld P k).testBit i) := by
    intro i hi k
    unfold G.A2.slice
    have hx : ∀ p, ((P >>> i) &&& rep32 n).testBit p = true → p % 32 = 0 ∧ p / 32 < n := by
      intro p hp
      rw [testBit_shr_land_rep P i n p (by omega)] at hp
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hp
      exact ⟨hp.1.2, hp.1.1⟩
    show (compactL (cmasks n (steps n) 0) 0 (Nat.land (Nat.shiftRight P i) (rep32 n))).testBit k = _
    rw [show Nat.land (Nat.shiftRight P i) (rep32 n) = (P >>> i) &&& rep32 n from rfl,
      compactL_spec n (steps n) _ hT2 hx k, testBit_shr_land_rep P i n _ (by omega), testBit_fld]
    by_cases hk : k < n
    · have e1 : 32 * k / 32 = k := by omega
      have e2 : 32 * k % 32 = 0 := by omega
      rw [e1, e2, show i + 32 * k = 32 * k + i by ring]
      simp [hk, show i < 32 by omega]
    · simp [hk]
  intro i hi k
  rw [← key i hi k]
  interval_cases i
  · show S.s0.testBit k = _
    rw [Nat.eq_of_beq_eq_true h0]
  · show S.s1.testBit k = _
    rw [Nat.eq_of_beq_eq_true h1]
  · show S.s2.testBit k = _
    rw [Nat.eq_of_beq_eq_true h2]
  · show S.s3.testBit k = _
    rw [Nat.eq_of_beq_eq_true h3]
  · show S.s4.testBit k = _
    rw [Nat.eq_of_beq_eq_true h4]
  · show S.s5.testBit k = _
    rw [Nat.eq_of_beq_eq_true h5]
  · show S.s6.testBit k = _
    rw [Nat.eq_of_beq_eq_true h6]
  · show S.s7.testBit k = _
    rw [Nat.eq_of_beq_eq_true h7]
  · show S.s8.testBit k = _
    rw [Nat.eq_of_beq_eq_true h8]
  · show S.s9.testBit k = _
    rw [Nat.eq_of_beq_eq_true h9]
  · show S.s10.testBit k = _
    rw [Nat.eq_of_beq_eq_true h10]
  · show S.s11.testBit k = _
    rw [Nat.eq_of_beq_eq_true h11]
  · show S.s12.testBit k = _
    rw [Nat.eq_of_beq_eq_true h12]
  · show S.s13.testBit k = _
    rw [Nat.eq_of_beq_eq_true h13]
  · show S.s14.testBit k = _
    rw [Nat.eq_of_beq_eq_true h14]
  · show S.s15.testBit k = _
    rw [Nat.eq_of_beq_eq_true h15]
  · show S.s16.testBit k = _
    rw [Nat.eq_of_beq_eq_true h16]
  · show S.s17.testBit k = _
    rw [Nat.eq_of_beq_eq_true h17]
  · show S.s18.testBit k = _
    rw [Nat.eq_of_beq_eq_true h18]
  · show S.s19.testBit k = _
    rw [Nat.eq_of_beq_eq_true h19]
  · show S.s20.testBit k = _
    rw [Nat.eq_of_beq_eq_true h20]
  · show S.s21.testBit k = _
    rw [Nat.eq_of_beq_eq_true h21]
  · show S.s22.testBit k = _
    rw [Nat.eq_of_beq_eq_true h22]
  · show S.s23.testBit k = _
    rw [Nat.eq_of_beq_eq_true h23]
  · show S.s24.testBit k = _
    rw [Nat.eq_of_beq_eq_true h24]
  · show S.s25.testBit k = _
    rw [Nat.eq_of_beq_eq_true h25]
  · show S.s26.testBit k = _
    rw [Nat.eq_of_beq_eq_true h26]
  · show S.s27.testBit k = _
    rw [Nat.eq_of_beq_eq_true h27]
  · show S.s28.testBit k = _
    rw [Nat.eq_of_beq_eq_true h28]

end GS

#print axioms GS.compactL_spec
#print axioms GS.slicesOK_spec
