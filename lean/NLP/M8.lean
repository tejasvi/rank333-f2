module
public import R22Port.U_ca6050a07146
public import Mathlib
public import NL.Check
public import S5.Bit
/-! # NLP.M8: the 512-bit masks `NL.M8` refine `Nat` masks

`M8.toNat` is the abstraction; `M8.testBit_toNat` says bit `i` of the value is `M8.bit`.  Every mask operation of the native
checker is shown to compute the kernel checker's `Nat` operation on the values: `and`, `or`, `andn` (the kernel's
`x &&& perp v` with `y = nperp v`), `isZero`, the low-bit enumeration `low`/`clrLow` (the kernel's `lg2 (m ^^^ (m &&& (m-1)))`
and `m &&& (m - 1)`), and the translate `trans`. -/
@[expose] public section
namespace NL
open Nat

/-! ## Words -/

theorem u64_bit (w : UInt64) (j : Nat) (hj : j < 64) : (((w >>> j.toUInt64) &&& 1) != 0) = w.toNat.testBit j := by
  have h1 : ((w >>> j.toUInt64) &&& 1).toNat = (w.toNat >>> j) % 2 := by
    rw [UInt64.toNat_and, UInt64.toNat_shiftRight]
    simp [Nat.toUInt64, UInt64.toNat_ofNat, Nat.mod_eq_of_lt hj]
  rw [Nat.testBit_eq_decide_div_mod_eq, ← Nat.shiftRight_eq_div_pow, ← h1]
  have : ((w >>> j.toUInt64) &&& 1).toNat < 2 := by rw [h1]; omega
  cases h : ((w >>> j.toUInt64) &&& 1).toNat with
  | zero =>
    have : (w >>> j.toUInt64) &&& 1 = 0 := UInt64.toNat_inj.mp (by rw [h]; rfl)
    simp [this]
  | succ k =>
    have hk : k = 0 := by omega
    subst hk
    have : (w >>> j.toUInt64) &&& 1 ≠ 0 := by intro e; rw [e] at h; simp at h
    simp [this]

theorem u64_testBit_ge (w : UInt64) (j : Nat) (hj : 64 ≤ j) : w.toNat.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le w.toNat_lt (Nat.pow_le_pow_right (by norm_num) hj))

theorem u64_not_bit (w : UInt64) (j : Nat) (hj : j < 64) : (~~~w).toNat.testBit j = !w.toNat.testBit j := by
  rw [← UInt64.toNat_toBitVec, ← UInt64.toNat_toBitVec, UInt64.toBitVec_not, BitVec.testBit_toNat, BitVec.testBit_toNat,
    BitVec.getLsbD_not]
  simp [hj]

/-! ## The value of a mask -/

def M8.toNat (x : M8) : Nat :=
  x.a0.toNat + 2 ^ 64 * (x.a1.toNat + 2 ^ 64 * (x.a2.toNat + 2 ^ 64 * (x.a3.toNat + 2 ^ 64 * (x.a4.toNat +
    2 ^ 64 * (x.a5.toNat + 2 ^ 64 * (x.a6.toNat + 2 ^ 64 * x.a7.toNat))))))

theorem tb64 (a b : Nat) (ha : a < 2 ^ 64) (i : Nat) :
    (a + 2 ^ 64 * b).testBit i = if i < 64 then a.testBit i else b.testBit (i - 64) := by
  rw [Nat.add_comm, Nat.testBit_two_pow_mul_add b ha]
theorem tbA {a b j : Nat} (ha : a < 2 ^ 64) (hj : j < 64) : (a + 2 ^ 64 * b).testBit j = a.testBit j := by
  rw [tb64 a b ha, if_pos hj]
theorem tbB {a b : Nat} (ha : a < 2 ^ 64) (m : Nat) : (a + 2 ^ 64 * b).testBit (64 + m) = b.testBit m := by
  rw [tb64 a b ha, if_neg (by omega)]; congr 1; omega

theorem M8.toNat_lt (x : M8) : x.toNat < 2 ^ 512 := by
  have := x.a0.toNat_lt; have := x.a1.toNat_lt; have := x.a2.toNat_lt; have := x.a3.toNat_lt
  have := x.a4.toNat_lt; have := x.a5.toNat_lt; have := x.a6.toNat_lt; have := x.a7.toNat_lt
  unfold M8.toNat; omega

theorem M8.testBit_wd (x : M8) (k j : Nat) (hk : k < 8) (hj : j < 64) :
    x.toNat.testBit (64 * k + j) = (x.wd k).toNat.testBit j := by
  unfold M8.toNat
  have h := fun (w : UInt64) => w.toNat_lt
  interval_cases k
  · simp only [Nat.mul_zero, Nat.zero_add, tbA (h _) hj, M8.wd]
  · rw [show 64 * 1 + j = 64 + j by omega]; simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 2 + j = 64 + (64 + j) by omega]; simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 3 + j = 64 + (64 + (64 + j)) by omega]; simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 4 + j = 64 + (64 + (64 + (64 + j))) by omega]; simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 5 + j = 64 + (64 + (64 + (64 + (64 + j)))) by omega]; simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 6 + j = 64 + (64 + (64 + (64 + (64 + (64 + j))))) by omega]
    simp only [tbB (h _), tbA (h _) hj, M8.wd]
  · rw [show 64 * 7 + j = 64 + (64 + (64 + (64 + (64 + (64 + (64 + j)))))) by omega]
    simp only [tbB (h _), M8.wd]

/-- **bit `i` of the value is `M8.bit`** -/
theorem M8.testBit_toNat (x : M8) (i : Nat) : x.toNat.testBit i = x.bit i := by
  by_cases hi : i < 512
  · have e : i = 64 * (i / 64) + i % 64 := by omega
    rw [e, M8.testBit_wd x _ _ (by omega) (by omega)]
    unfold M8.bit
    have h6 : (64 * (i / 64) + i % 64) >>> 6 = i / 64 := by rw [Nat.shiftRight_eq_div_pow]; omega
    have h63 : (64 * (i / 64) + i % 64) &&& 63 = i % 64 := by
      rw [show (63 : Nat) = 2 ^ 6 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]; omega
    rw [h6, h63, u64_bit _ _ (by omega)]
    simp [Nat.blt_eq.mpr (show 64 * (i / 64) + i % 64 < 512 by omega)]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le x.toNat_lt (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    unfold M8.bit
    simp [show ¬ i < 512 from hi]

theorem M8.bit_ge (x : M8) (i : Nat) (hi : 512 ≤ i) : x.bit i = false := by
  unfold M8.bit; simp [show ¬ i < 512 by omega]

/-- bit `i < 512` through the word -/
theorem M8.bit_wd (x : M8) (i : Nat) (hi : i < 512) : x.bit i = (x.wd (i / 64)).toNat.testBit (i % 64) := by
  have h := M8.testBit_wd x (i / 64) (i % 64) (by omega) (by omega)
  rw [show 64 * (i / 64) + i % 64 = i by omega] at h
  rw [← M8.testBit_toNat, h]

/-- a mask is determined by its bits below 512 -/
theorem M8.toNat_eq (x : M8) (y : Nat) (hy : y < 2 ^ 512) (h : ∀ i, i < 512 → x.bit i = y.testBit i) : x.toNat = y := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [M8.testBit_toNat]
  by_cases hi : i < 512
  · exact h i hi
  · rw [M8.bit_ge x i (by omega), Nat.testBit_lt_two_pow (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) (by omega)))]

/-! ## Operations -/

theorem M8.and_wd (x y : M8) (k : Nat) : (x.and y).wd k = x.wd k &&& y.wd k := by
  unfold M8.and M8.wd; split <;> rfl
theorem M8.or_wd (x y : M8) (k : Nat) : (x.or y).wd k = x.wd k ||| y.wd k := by
  unfold M8.or M8.wd; split <;> rfl
theorem M8.andn_wd (x y : M8) (k : Nat) : (x.andn y).wd k = x.wd k &&& ~~~y.wd k := by
  unfold M8.andn M8.wd; split <;> rfl

theorem M8.bit_and (x y : M8) (i : Nat) : (x.and y).bit i = (x.bit i && y.bit i) := by
  by_cases hi : i < 512
  · rw [M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.and_wd, UInt64.toNat_and, Nat.testBit_and]
  · simp [M8.bit_ge _ _ (by omega : 512 ≤ i)]
theorem M8.bit_or (x y : M8) (i : Nat) : (x.or y).bit i = (x.bit i || y.bit i) := by
  by_cases hi : i < 512
  · rw [M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.or_wd, UInt64.toNat_or, Nat.testBit_or]
  · simp [M8.bit_ge _ _ (by omega : 512 ≤ i)]
theorem M8.bit_andn (x y : M8) (i : Nat) : (x.andn y).bit i = (x.bit i && !y.bit i) := by
  by_cases hi : i < 512
  · rw [M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.bit_wd _ _ hi, M8.andn_wd, UInt64.toNat_and, Nat.testBit_and,
      u64_not_bit _ _ (by omega)]
  · simp [M8.bit_ge _ _ (by omega : 512 ≤ i)]

theorem M8.toNat_and (x y : M8) : (x.and y).toNat = x.toNat &&& y.toNat :=
  M8.toNat_eq _ _ (lt_of_le_of_lt Nat.and_le_left x.toNat_lt) (fun i _ => by
    rw [Nat.testBit_and, M8.testBit_toNat, M8.testBit_toNat, M8.bit_and])
theorem M8.toNat_or (x y : M8) : (x.or y).toNat = x.toNat ||| y.toNat :=
  M8.toNat_eq _ _ (Nat.or_lt_two_pow x.toNat_lt y.toNat_lt) (fun i _ => by
    rw [Nat.testBit_or, M8.testBit_toNat, M8.testBit_toNat, M8.bit_or])

theorem m512_bit (i : Nat) : BC4.M512.testBit i = decide (i < 512) := by
  rw [S5.m512_eq, Nat.testBit_two_pow_sub_one]

/-- `andn` is the kernel's `x &&& perp v` for `y = nperp v`: `x &&& (M512 ^^^ y)` -/
theorem M8.toNat_andn (x y : M8) : (x.andn y).toNat = x.toNat &&& (BC4.M512 ^^^ y.toNat) :=
  M8.toNat_eq _ _ (lt_of_le_of_lt Nat.and_le_left x.toNat_lt) (fun i hi => by
    rw [Nat.testBit_and, Nat.testBit_xor, m512_bit, M8.testBit_toNat, M8.testBit_toNat, M8.bit_andn]
    simp [hi])

theorem beq_dec (a b : Nat) : Nat.beq a b = decide (a = b) := by
  cases h : Nat.beq a b
  · simp [Nat.ne_of_beq_eq_false h]
  · simp [Nat.eq_of_beq_eq_true h]

theorem nat_or_eq_zero (a b : Nat) : a ||| b = 0 ↔ a = 0 ∧ b = 0 := by
  constructor
  · intro h
    have hb : ∀ i, a.testBit i = false ∧ b.testBit i = false := by
      intro i; have := congrArg (fun x => x.testBit i) h
      simp only [Nat.testBit_or, Nat.zero_testBit, Bool.or_eq_false_iff] at this; exact this
    exact ⟨Nat.eq_of_testBit_eq (fun i => by simp [(hb i).1]), Nat.eq_of_testBit_eq (fun i => by simp [(hb i).2])⟩
  · rintro ⟨rfl, rfl⟩; rfl

theorem u64_or_eq_zero (a b : UInt64) : (a ||| b = 0) ↔ (a = 0 ∧ b = 0) := by
  constructor
  · intro h
    have h' := congrArg UInt64.toNat h
    rw [UInt64.toNat_or] at h'
    have := (nat_or_eq_zero _ _).mp h'
    exact ⟨UInt64.toNat_inj.mp (by rw [this.1]; rfl), UInt64.toNat_inj.mp (by rw [this.2]; rfl)⟩
  · rintro ⟨rfl, rfl⟩; rfl

theorem u64_eq_zero (a : UInt64) : a = 0 ↔ a.toNat = 0 :=
  ⟨fun h => by rw [h]; rfl, fun h => UInt64.toNat_inj.mp (by rw [h]; rfl)⟩

theorem M8.toNat_eq_zero (x : M8) : x.toNat = 0 ↔
    (x.a0 = 0 ∧ x.a1 = 0 ∧ x.a2 = 0 ∧ x.a3 = 0 ∧ x.a4 = 0 ∧ x.a5 = 0 ∧ x.a6 = 0 ∧ x.a7 = 0) := by
  simp only [u64_eq_zero]
  unfold M8.toNat
  have := x.a0.toNat_lt; have := x.a1.toNat_lt; have := x.a2.toNat_lt; have := x.a3.toNat_lt
  have := x.a4.toNat_lt; have := x.a5.toNat_lt; have := x.a6.toNat_lt; have := x.a7.toNat_lt
  omega

/-- `isZero` is the kernel's `Nat.beq m 0` -/
theorem M8.isZero_eq (x : M8) : x.isZero = Nat.beq x.toNat 0 := by
  have h : x.isZero = true ↔ x.toNat = 0 := by
    rw [M8.toNat_eq_zero]; unfold M8.isZero
    simp only [beq_iff_eq, u64_or_eq_zero]; tauto
  rw [beq_dec]
  cases hz : x.isZero
  · symm; simp only [decide_eq_false_iff_not]; intro e; rw [← h, hz] at e; exact absurd e (by decide)
  · symm; simp only [decide_eq_true_eq]; exact h.mp hz

end NL
