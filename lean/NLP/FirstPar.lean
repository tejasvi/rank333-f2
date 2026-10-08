module
public import R22Port.U_d41d8cd98f00
public import NLP.S9
/-! # NLP.FirstPar: the native `firstPar` on six packed vectors is the kernel's SWAR `BC6s.firstPar` on `kb18 X`

`enc18 V` puts vector `i` of `V` (9 bits at `9i`) in the high half of 18-bit slot `i`.  The kernel's fold gives the
parity of slot `i` against `w` at bit `18i + 9`; the lowest such bit selects the first vector with odd parity. -/
@[expose] public section
namespace NL
open Nat S5

/-- vector `i` of a packed `V` -/
def vi (V i : Nat) : Nat := Nat.land (Nat.shiftRight V (9 * i)) 511

theorem vi_bit (V i j : Nat) (hj : j < 9) : (vi V i).testBit j = V.testBit (9 * i + j) := by
  unfold vi
  rw [Nat.land_eq, Nat.shiftRight_eq', Nat.testBit_and, Nat.testBit_shiftRight,
    show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]
  simp [hj]

theorem vi_lt (V i : Nat) : vi V i < 512 := by
  unfold vi; exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem enc18_horner (V : Nat) : enc18 V = 2 ^ 9 * (vi V 0 + 2 ^ 18 * (vi V 1 + 2 ^ 18 * (vi V 2 + 2 ^ 18 * (vi V 3 +
    2 ^ 18 * (vi V 4 + 2 ^ 18 * vi V 5))))) := by
  unfold enc18 vi
  simp only [Nat.mul_zero, Nat.shiftRight_eq', Nat.shiftRight_zero, Nat.mul_one]
  ring

theorem tb9A {a b j : Nat} (ha : a < 2 ^ 18) (hj : j < 18) : (a + 2 ^ 18 * b).testBit j = a.testBit j := tb18A ha hj
theorem vi_lt18 (V i : Nat) : vi V i < 2 ^ 18 := lt_of_lt_of_le (vi_lt V i) (by norm_num)

/-- the bits of `enc18 V`: bit `18i + 9 + j` (`i < 6`, `j < 9`) is bit `j` of vector `i`; there are no others -/
theorem enc18_bit (V b : Nat) : (enc18 V).testBit b =
    (decide (b < 108 ∧ 9 ≤ b % 18) && (vi V (b / 18)).testBit (b % 18 - 9)) := by
  rw [enc18_horner, Nat.testBit_two_pow_mul]
  by_cases h9 : b ≥ 9
  · simp only [h9, decide_true, Bool.true_and]
    have h := fun i => vi_lt18 V i
    -- peel the slots
    have key : ∀ m, (vi V 0 + 2 ^ 18 * (vi V 1 + 2 ^ 18 * (vi V 2 + 2 ^ 18 * (vi V 3 + 2 ^ 18 * (vi V 4 +
        2 ^ 18 * vi V 5))))).testBit m = (decide (m < 108) && (vi V (m / 18)).testBit (m % 18)) := by
      intro m
      have hv := fun i (t : Nat) (ht : ¬ t < 9) => Nat.testBit_lt_two_pow (lt_of_lt_of_le (vi_lt V i)
        (show 512 ≤ 2 ^ t from le_trans (by norm_num) (Nat.pow_le_pow_right (by norm_num) (show 9 ≤ t by omega))))
      rw [Nat.add_comm, Nat.testBit_two_pow_mul_add _ (h 0)]
      by_cases m0 : m < 18
      · simp [m0, show m < 108 by omega, show m / 18 = 0 by omega, show m % 18 = m by omega]
      rw [if_neg m0, Nat.add_comm, Nat.testBit_two_pow_mul_add _ (h 1)]
      by_cases m1 : m - 18 < 18
      · simp [m1, show m < 108 by omega, show m / 18 = 1 by omega, show m % 18 = m - 18 by omega]
      rw [if_neg m1, Nat.add_comm, Nat.testBit_two_pow_mul_add _ (h 2)]
      by_cases m2 : m - 18 - 18 < 18
      · simp [m2, show m < 108 by omega, show m / 18 = 2 by omega, show m % 18 = m - 18 - 18 by omega]
      rw [if_neg m2, Nat.add_comm, Nat.testBit_two_pow_mul_add _ (h 3)]
      by_cases m3 : m - 18 - 18 - 18 < 18
      · simp [m3, show m < 108 by omega, show m / 18 = 3 by omega, show m % 18 = m - 18 - 18 - 18 by omega]
      rw [if_neg m3, Nat.add_comm, Nat.testBit_two_pow_mul_add _ (h 4)]
      by_cases m4 : m - 18 - 18 - 18 - 18 < 18
      · simp [m4, show m < 108 by omega, show m / 18 = 4 by omega, show m % 18 = m - 18 - 18 - 18 - 18 by omega]
      rw [if_neg m4]
      by_cases m5 : m < 108
      · simp [m5, show m / 18 = 5 by omega, show m % 18 = m - 18 - 18 - 18 - 18 - 18 by omega]
      · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (vi_lt V 5) (le_trans (show 512 ≤ 2 ^ 9 by norm_num)
          (Nat.pow_le_pow_right (by norm_num) (by omega))))]
        simp [m5]
    rw [key]
    by_cases hb : b - 9 < 108
    · have e1 : (b - 9) / 18 = b / 18 ∨ True := Or.inr trivial
      by_cases hm : 9 ≤ b % 18
      · rw [show (b - 9) / 18 = b / 18 by omega, show (b - 9) % 18 = b % 18 - 9 by omega]
        simp [hm, hb, show b < 108 by omega]
      · -- (b - 9) % 18 ≥ 9: a low half bit of slot (b-9)/18 is a bit ≥ 9 of the vector, so 0
        have hge : ¬ (b - 9) % 18 < 9 := by omega
        rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (vi_lt V _) (le_trans (show 512 ≤ 2 ^ 9 by norm_num)
          (Nat.pow_le_pow_right (by norm_num) (by omega))))]
        simp [hm]
    · simp [hb, show ¬ b < 108 by omega]
  · simp [h9, show ¬ 9 ≤ b % 18 by omega]

/-- the kernel's parity fold: bit `b` of the fold is the XOR of bits `b .. b+8` of `q` -/
theorem fold_bf (q b : Nat) :
    bf ((Nat.xor (Nat.xor (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q (Nat.shiftRight q 1)) 2))
      (Nat.shiftRight (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q (Nat.shiftRight q 1)) 2)) 4))
      (Nat.shiftRight q 8)).testBit b) = ∑ t ∈ Finset.range 9, bf (q.testBit (b + t)) := by
  simp only [Nat.xor_eq, Nat.shiftRight_eq', Nat.testBit_xor, Nat.testBit_shiftRight, bf_xor, Finset.sum_range_succ,
    Finset.sum_range_zero]
  ring_nf

/-- the first vector of the list with odd parity against `w`, else 0 -/
def fpL : List Nat → Nat → Nat
  | [], _ => 0
  | v :: vs, w => cond (npar (Nat.land v w)) v (fpL vs w)

theorem firstPar_fpL (V w : Nat) : firstPar V w = fpL [vi V 0, vi V 1, vi V 2, vi V 3, vi V 4, vi V 5] w := rfl

theorem fpL_spec (l : List Nat) (w : Nat) :
    (∃ i0, i0 < l.length ∧ npar (Nat.land (l.getD i0 0) w) = true ∧ (∀ i < i0, npar (Nat.land (l.getD i 0) w) = false) ∧
      fpL l w = l.getD i0 0) ∨ ((∀ i < l.length, npar (Nat.land (l.getD i 0) w) = false) ∧ fpL l w = 0) := by
  induction l with
  | nil => right; exact ⟨fun i hi => absurd hi (by simp), rfl⟩
  | cons v vs ih =>
    cases hv : npar (Nat.land v w)
    · rcases ih with ⟨i0, hi0, h1, h2, h3⟩ | ⟨h1, h2⟩
      · left
        refine ⟨i0 + 1, by simp; omega, by simpa using h1, fun i hi => ?_, ?_⟩
        · cases i with
          | zero => simpa using hv
          | succ i => simpa using h2 i (by omega)
        · show cond (npar (Nat.land v w)) v (fpL vs w) = _; rw [hv, cond_false, h3]; simp
      · right
        refine ⟨fun i hi => ?_, ?_⟩
        · cases i with
          | zero => simpa using hv
          | succ i => simpa using h1 i (by simp at hi; omega)
        · show cond (npar (Nat.land v w)) v (fpL vs w) = _; rw [hv, cond_false, h2]
    · left
      exact ⟨0, by simp, by simpa using hv, fun i hi => absurd hi (by omega),
        by show cond (npar (Nat.land v w)) v (fpL vs w) = _; rw [hv, cond_true]; simp⟩

theorem vi_par (V i w : Nat) (hw : w < 512) : npar (Nat.land (vi V i) w) = BC5.par (Nat.land (vi V i) w) :=
  npar_eq _ (lt_of_le_of_lt Nat.and_le_left (vi_lt V i))

/-- **the kernel's `firstPar` on `enc18 V` is the native one** -/
theorem kfirstPar_eq (V w : Nat) (hw : w < 512) : BC6s.firstPar (enc18 V) w = firstPar V w := by
  -- bits of q
  have hq : ∀ b, (Nat.land (enc18 V) (Nat.mul w BC4.REPR)).testBit b =
      (decide (b < 108 ∧ 9 ≤ b % 18) && (vi V (b / 18)).testBit (b % 18 - 9) && w.testBit (b % 18 - 9)) := by
    intro b
    rw [Nat.land_eq, Nat.testBit_and, enc18_bit, Nat.mul_eq, cREPR_bit w b hw]
    by_cases h : b < 108 ∧ 9 ≤ b % 18
    · simp [h, show b < 162 by omega]
    · simp [h]
  -- bits of the parity mask
  set q := Nat.land (enc18 V) (Nat.mul w BC4.REPR) with hqdef
  have hpm : ∀ b, (Nat.land (Nat.xor (Nat.xor (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q
      (Nat.shiftRight q 1)) 2)) (Nat.shiftRight (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q
      (Nat.shiftRight q 1)) 2)) 4)) (Nat.shiftRight q 8)) BC4.REPR).testBit b =
      (decide (b % 18 = 9 ∧ b < 108) && BC5.par (Nat.land (vi V (b / 18)) w)) := by
    intro b
    rw [Nat.land_eq, Nat.testBit_and, repr_bit]
    by_cases hb : b % 18 = 9 ∧ b < 162
    · rw [decide_eq_true hb, Bool.and_true]
      apply bf_inj
      rw [fold_bf]
      by_cases h6 : b < 108
      · rw [decide_eq_true (show b % 18 = 9 ∧ b < 108 from ⟨hb.1, h6⟩), Bool.true_and,
          S5.par_eq (Nat.land (vi V (b / 18)) w) (lt_of_le_of_lt Nat.and_le_left (vi_lt V _)), S5.bf_xorBits]
        apply Finset.sum_congr rfl; intro t ht
        have ht9 : t < 9 := Finset.mem_range.mp ht
        rw [hq, Nat.land_eq, Nat.testBit_and, S5.bf_and,
          show (b + t) % 18 = 9 + t by omega, show (b + t) / 18 = b / 18 by omega, show 9 + t - 9 = t by omega]
        simp [show b + t < 108 by omega, show 9 ≤ 9 + t by omega, S5.bf_and]
      · rw [decide_eq_false (show ¬ (b % 18 = 9 ∧ b < 108) by omega), Bool.false_and, bf_false]
        apply Finset.sum_eq_zero; intro t ht
        rw [hq]; simp [show ¬ (b + t < 108) by omega, bf_false]
    · simp [hb, show ¬ (b % 18 = 9 ∧ b < 108) by omega]
  set pm := Nat.land (Nat.xor (Nat.xor (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q
      (Nat.shiftRight q 1)) 2)) (Nat.shiftRight (Nat.xor (Nat.xor q (Nat.shiftRight q 1)) (Nat.shiftRight (Nat.xor q
      (Nat.shiftRight q 1)) 2)) 4)) (Nat.shiftRight q 8)) BC4.REPR with hpmdef
  have hk : BC6s.firstPar (enc18 V) w = Nat.div (Nat.land (enc18 V) (Nat.mul (Nat.xor pm (Nat.land pm (Nat.sub pm 1))) 511))
      (Nat.xor pm (Nat.land pm (Nat.sub pm 1))) := rfl
  rw [hk, firstPar_fpL]
  rcases fpL_spec [vi V 0, vi V 1, vi V 2, vi V 3, vi V 4, vi V 5] w with ⟨i0, hi0, h1, h2, h3⟩ | ⟨h1, h2⟩
  · simp only [List.length_cons, List.length_nil] at hi0
    have hgi : ∀ i < 6, [vi V 0, vi V 1, vi V 2, vi V 3, vi V 4, vi V 5].getD i 0 = vi V i := by
      intro i hi; interval_cases i <;> rfl
    rw [h3, hgi i0 hi0]
    rw [hgi i0 hi0, vi_par V i0 w hw] at h1
    -- the lowest set bit of pm is 18 i0 + 9
    have hlb1 : pm.testBit (18 * i0 + 9) = true := by
      rw [hpm, show (18 * i0 + 9) / 18 = i0 by omega, h1,
        decide_eq_true (show (18 * i0 + 9) % 18 = 9 ∧ 18 * i0 + 9 < 108 by omega)]
      rfl
    have hlb2 : ∀ b < 18 * i0 + 9, pm.testBit b = false := by
      intro b hb
      rw [hpm]
      by_cases hm : b % 18 = 9 ∧ b < 108
      · have := h2 (b / 18) (by omega)
        rw [hgi _ (by omega), vi_par V _ w hw] at this
        rw [decide_eq_true hm, Bool.true_and]; exact this
      · rw [decide_eq_false hm, Bool.false_and]
    obtain ⟨_, hlow⟩ := lowbit_spec hlb1 hlb2
    rw [show Nat.xor pm (Nat.land pm (Nat.sub pm 1)) = 2 ^ (18 * i0 + 9) from hlow]
    apply Nat.eq_of_testBit_eq; intro t
    show (((enc18 V) &&& (2 ^ (18 * i0 + 9) * 511)) / 2 ^ (18 * i0 + 9)).testBit t = _
    rw [Nat.testBit_div_two_pow, Nat.testBit_and, Nat.testBit_two_pow_mul, enc18_bit,
      show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]
    by_cases ht : t < 9
    · rw [show (t + (18 * i0 + 9)) % 18 = 9 + t by omega, show (t + (18 * i0 + 9)) / 18 = i0 by omega,
        show 9 + t - 9 = t by omega, show t + (18 * i0 + 9) - (18 * i0 + 9) = t by omega]
      simp [ht, show t + (18 * i0 + 9) < 108 by omega]
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (vi_lt V i0) (le_trans (show 512 ≤ 2 ^ 9 by norm_num)
        (Nat.pow_le_pow_right (by norm_num) (by omega)))), show t + (18 * i0 + 9) - (18 * i0 + 9) = t by omega,
        decide_eq_false ht]
      simp
  · have hgi : ∀ i < 6, [vi V 0, vi V 1, vi V 2, vi V 3, vi V 4, vi V 5].getD i 0 = vi V i := by
      intro i hi; interval_cases i <;> rfl
    have h0 : pm = 0 := by
      apply Nat.eq_of_testBit_eq; intro b
      rw [hpm, Nat.zero_testBit]
      by_cases hm : b % 18 = 9 ∧ b < 108
      · have := h1 (b / 18) (by simp; omega)
        rw [hgi _ (by omega), vi_par V _ w hw] at this
        rw [decide_eq_true hm, Bool.true_and]; exact this
      · rw [decide_eq_false hm, Bool.false_and]
    rw [h2, h0]
    have e : Nat.xor 0 (Nat.land 0 (Nat.sub 0 1)) = 0 := rfl
    rw [e]
    show (enc18 V &&& 0 * 511) / 0 = 0
    exact Nat.div_zero _

end NL
