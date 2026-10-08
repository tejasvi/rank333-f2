module
public import R22Port.U_6d73af0793e7
public import G.Gram
public import G.Interface
public import Mathlib
/-! # L0: bit primitives of the Gram checkers (`G/Gram.lean`)

Bits as elements of `ZMod 2` (`tb z p`), so that parities are finite sums.
* `tb_fold32`: bit `p` of `fold32 z` is the sum of the 32 bits of `z` from `p`;
* `par32_eq`: `par32 x` is the parity of the low 32 bits (`parN 32 x` of the interface);
* `rep32_succ`, `testBit_rep32`: `rep32 m = ∑_{k<m} 2^(32k)`;
* `testBit_mul_rep32`: `y * rep32 m` repeats `y < 2^32` in the fields `k < m`;
* `swarPar_spec`: bit `32k + j` of `swarPar P (rep32 m) y` (`k < m`, `y < 2^32`) is `[j = 0] ⬝ par (field_k P &&& y)`. -/
@[expose] public section
namespace GS
open G Finset

/-! ## bits in `ZMod 2` -/

def tb (z p : ℕ) : ZMod 2 := if z.testBit p then 1 else 0

theorem tb_xor (a b p : ℕ) : tb (a ^^^ b) p = tb a p + tb b p := by
  unfold tb; rw [Nat.testBit_xor]
  cases a.testBit p <;> cases b.testBit p <;> decide

theorem tb_land (a b p : ℕ) : tb (a &&& b) p = tb a p * tb b p := by
  unfold tb; rw [Nat.testBit_and]
  cases a.testBit p <;> cases b.testBit p <;> decide

theorem tb_shiftRight (a s p : ℕ) : tb (a >>> s) p = tb a (s + p) := by
  unfold tb; rw [Nat.testBit_shiftRight]

theorem tb_eq_one {z p : ℕ} : tb z p = 1 ↔ z.testBit p = true := by
  unfold tb; cases z.testBit p <;> decide

theorem tb_eq_zero {z p : ℕ} : tb z p = 0 ↔ z.testBit p = false := by
  unfold tb; cases z.testBit p <;> decide

/-- `∑_{j < 2n} f j = ∑_{j < n} (f j + f (j + n))` -/
theorem sum_range_double (f : ℕ → ZMod 2) (n : ℕ) :
    ∑ j ∈ range (n + n), f j = ∑ j ∈ range n, (f j + f (j + n)) := by
  rw [Finset.sum_range_add, Finset.sum_add_distrib]
  congr 1
  apply Finset.sum_congr rfl; intro j _; rw [Nat.add_comm n j]

/-! ## `fold32` and `par32` -/

theorem tb_fstep (z s p : ℕ) : tb (Nat.xor z (Nat.shiftRight z s)) p = tb z p + tb z (s + p) := by
  show tb (z ^^^ (z >>> s)) p = _
  rw [tb_xor, tb_shiftRight]

/-- bit `p` of `fold32 z` is the parity of bits `p, …, p + 31` of `z` -/
theorem tb_fold32 (z p : ℕ) : tb (fold32 z) p = ∑ j ∈ range 32, tb z (p + j) := by
  unfold fold32
  simp only [tb_fstep]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
  ring_nf

theorem parN_succ (n x : ℕ) : parN (n + 1) x = xor (x % 2 == 1) (parN n (x / 2)) := rfl

/-- the parity of the lowest `n` bits, as a sum -/
theorem parN_eq (n x : ℕ) : (if parN n x then (1 : ZMod 2) else 0) = ∑ j ∈ range n, tb x j := by
  induction n generalizing x with
  | zero => simp [parN]
  | succ n ih =>
    have hs : (∑ j ∈ range n, tb x (j + 1)) = ∑ j ∈ range n, tb (x / 2) j :=
      Finset.sum_congr rfl (fun j _ => by
        unfold tb; rw [show x / 2 = x >>> 1 from (Nat.shiftRight_one x).symm, Nat.testBit_shiftRight, Nat.add_comm 1 j])
    rw [Finset.sum_range_succ', hs, ← ih (x / 2)]
    have h0 : tb x 0 = if x % 2 == 1 then 1 else 0 := by
      unfold tb; rw [Nat.testBit_zero]
      rcases Nat.mod_two_eq_zero_or_one x with h | h <;> simp [h]
    rw [h0, parN_succ]
    cases (x % 2 == 1) <;> cases parN n (x / 2) <;> decide

theorem par32_eq (x : ℕ) : par32 x = if parN 32 x then 1 else 0 := by
  have h : (par32 x : ℕ) = (fold32 x) &&& 1 := rfl
  have hf : tb (fold32 x) 0 = (if parN 32 x then (1 : ZMod 2) else 0) := by
    rw [tb_fold32, parN_eq]; simp only [Nat.zero_add]
  rw [h, Nat.and_one_is_mod]
  by_cases hp : parN 32 x
  · rw [if_pos hp] at hf ⊢
    have := tb_eq_one.mp hf
    rw [Nat.testBit_zero] at this
    simpa using this
  · rw [if_neg hp] at hf ⊢
    have := tb_eq_zero.mp hf
    rw [Nat.testBit_zero] at this
    simpa using this

/-! ## `rep32` -/

theorem two32_sub_dvd (m : ℕ) : 4294967295 ∣ 2 ^ (32 * m) - 1 := by
  have := Nat.sub_dvd_pow_sub_pow (2 ^ 32) 1 m
  rw [one_pow, ← pow_mul] at this
  simpa using this

theorem rep32_eq (m : ℕ) : rep32 m = (2 ^ (32 * m) - 1) / 4294967295 := by
  have h : Nat.shiftLeft 1 (Nat.mul 32 m) = 2 ^ (32 * m) := by
    rw [show Nat.shiftLeft 1 (Nat.mul 32 m) = 1 <<< (32 * m) from rfl, Nat.shiftLeft_eq, Nat.one_mul]
  unfold rep32
  rw [h]; rfl

theorem rep32_mul (m : ℕ) : rep32 m * 4294967295 = 2 ^ (32 * m) - 1 := by
  rw [rep32_eq]
  exact Nat.div_mul_cancel (two32_sub_dvd m)

theorem rep32_succ (m : ℕ) : rep32 (m + 1) = rep32 m + 2 ^ (32 * m) := by
  have h1 := rep32_mul m
  have h2 := rep32_mul (m + 1)
  have hp : 2 ^ (32 * (m + 1)) = 2 ^ (32 * m) * 4294967296 := by rw [Nat.mul_succ, pow_add]; rfl
  have hpos : 1 ≤ 2 ^ (32 * m) := Nat.one_le_two_pow
  apply Nat.eq_of_mul_eq_mul_right (show 0 < 4294967295 by norm_num)
  rw [h2, Nat.add_mul, h1, hp]
  omega

theorem rep32_lt (m : ℕ) : rep32 m < 2 ^ (32 * m) := by
  have := rep32_mul m
  have hpos : 1 ≤ 2 ^ (32 * m) := Nat.one_le_two_pow
  by_contra h; push Not at h
  have : 2 ^ (32 * m) * 4294967295 ≤ rep32 m * 4294967295 := Nat.mul_le_mul_right _ h
  omega

theorem rep32_zero : rep32 0 = 0 := by decide

/-- `y * rep32 m` (`y < 2^32`) is below `2^(32m)` -/
theorem mul_rep32_lt (y m : ℕ) (hy : y < 2 ^ 32) : y * rep32 m < 2 ^ (32 * m) := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · rw [rep32_zero]; simp
  have h1 := rep32_mul m
  have hpos : 1 ≤ 2 ^ (32 * m) := Nat.one_le_two_pow
  calc y * rep32 m ≤ 4294967295 * rep32 m := Nat.mul_le_mul_right _ (by omega)
    _ = 2 ^ (32 * m) - 1 := by rw [Nat.mul_comm]; exact h1
    _ < 2 ^ (32 * m) := by omega

/-- the bits of `y * rep32 m`: field `k < m` is `y`, nothing above -/
theorem testBit_mul_rep32 (y m p : ℕ) (hy : y < 2 ^ 32) :
    (y * rep32 m).testBit p = (decide (p / 32 < m) && y.testBit (p % 32)) := by
  induction m generalizing p with
  | zero => rw [rep32_zero, Nat.mul_zero, Nat.zero_testBit]; simp
  | succ m ih =>
    have hlt := mul_rep32_lt y m hy
    have e : y * rep32 (m + 1) = 2 ^ (32 * m) * y + y * rep32 m := by
      rw [rep32_succ, Nat.mul_add, Nat.mul_comm y (2 ^ (32 * m)), Nat.add_comm]
    rw [e, Nat.testBit_two_pow_mul_add y hlt]
    by_cases hp : p < 32 * m
    · rw [if_pos hp, ih]
      have h1 : p / 32 < m := by omega
      have h2 : p / 32 < m + 1 := by omega
      simp [h1, h2]
    · rw [if_neg hp]
      by_cases hp2 : p < 32 * (m + 1)
      · have e1 : p / 32 = m := by omega
        have e2 : p - 32 * m = p % 32 := by omega
        rw [e2]; simp [e1]
      · have e1 : ¬ (p / 32 < m + 1) := by omega
        have hb : 32 ≤ p - 32 * m := by omega
        rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) hb))]
        simp [e1]

theorem testBit_rep32 (m p : ℕ) : (rep32 m).testBit p = (decide (p / 32 < m) && decide (p % 32 = 0)) := by
  have := testBit_mul_rep32 1 m p (by norm_num)
  rw [Nat.one_mul] at this
  rw [this]
  rcases Nat.eq_zero_or_pos (p % 32) with h | h
  · simp [h]
  · have h1 : (1 : ℕ).testBit (p % 32) = false := by
      rw [Nat.testBit_eq_false_of_lt]
      calc 1 < 2 := by norm_num
        _ = 2 ^ 1 := by norm_num
        _ ≤ 2 ^ (p % 32) := Nat.pow_le_pow_right (by norm_num) h
    have h2 : p % 32 ≠ 0 := by omega
    simp [h1, h2]

/-! ## `swarPar` -/

/-- field `k` of a stride-32 list -/
def fld (P k : ℕ) : ℕ := P / 2 ^ (32 * k) % 2 ^ 32

theorem testBit_fld (P k j : ℕ) : (fld P k).testBit j = (decide (j < 32) && P.testBit (32 * k + j)) := by
  unfold fld
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.add_comm j]

/-- parity of `x &&& y` as a sum (the low 32 bits) -/
def parZ (x : ℕ) : ZMod 2 := ∑ j ∈ range 32, tb x j

theorem swarPar_spec (P y m k j : ℕ) (hy : y < 2 ^ 32) (hk : k < m) (hj : j < 32) :
    tb (swarPar P (rep32 m) y) (32 * k + j) = if j = 0 then parZ (fld P k &&& y) else 0 := by
  unfold swarPar
  show tb (fold32 (P &&& (y * rep32 m)) &&& rep32 m) (32 * k + j) = _
  rw [tb_land, tb_fold32]
  have hR : tb (rep32 m) (32 * k + j) = if j = 0 then 1 else 0 := by
    unfold tb; rw [testBit_rep32]
    have e1 : (32 * k + j) / 32 = k := by omega
    have e2 : (32 * k + j) % 32 = j := by omega
    rw [e1, e2]; by_cases h : j = 0 <;> simp [h, hk]
  rw [hR]
  by_cases h0 : j = 0
  · subst h0
    rw [if_pos rfl, if_pos rfl, mul_one]
    unfold parZ
    apply Finset.sum_congr rfl; intro i hi
    rw [Finset.mem_range] at hi
    rw [tb_land, tb_land]
    congr 1
    · unfold tb; rw [testBit_fld]; simp [hi]
    · unfold tb; rw [testBit_mul_rep32 y m _ hy]
      have e1 : (32 * k + 0 + i) / 32 = k := by omega
      have e2 : (32 * k + 0 + i) % 32 = i := by omega
      rw [e1, e2]; simp [hk]
  · rw [if_neg h0, if_neg h0, mul_zero]

/-- the bits of `swarPar P (rep32 m) y` outside the field starts are zero -/
theorem swarPar_testBit (P y m p : ℕ) (hy : y < 2 ^ 32) :
    (swarPar P (rep32 m) y).testBit p =
      (decide (p / 32 < m) && decide (p % 32 = 0) && decide (parZ (fld P (p / 32) &&& y) = 1)) := by
  by_cases hm : p / 32 < m
  · have hj : p % 32 < 32 := Nat.mod_lt _ (by norm_num)
    have := swarPar_spec P y m (p / 32) (p % 32) hy hm hj
    rw [show 32 * (p / 32) + p % 32 = p by omega] at this
    by_cases h0 : p % 32 = 0
    · rw [if_pos h0] at this
      rcases (show ∀ z : ZMod 2, z = 0 ∨ z = 1 by decide) (parZ (fld P (p / 32) &&& y)) with hz | hz
      · rw [hz] at this; rw [tb_eq_zero.mp this]; simp [hm, h0, hz]
      · rw [hz] at this; rw [tb_eq_one.mp this]; simp [hm, h0, hz]
    · rw [if_neg h0] at this
      rw [tb_eq_zero.mp this]; simp [h0]
  · -- outside the fields: `rep32 m` has no bit there
    unfold swarPar
    show (fold32 (P &&& (y * rep32 m)) &&& rep32 m).testBit p = _
    rw [Nat.testBit_and, testBit_rep32]; simp [hm]

end GS

#print axioms GS.swarPar_spec
#print axioms GS.par32_eq
