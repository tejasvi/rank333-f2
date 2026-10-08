module
public import R22Port.U_84c30825f4b9
public import Mathlib
public import E1N.Check
public import E1P.Block
/-! # Bits of a byte array: the native reader `E1N.rdE` against the kernel's `rd`/`sk` on the block literal

* `natB B`: the little-endian value of `B` (the block literal the kernel checks); same body as the leaf agent's
  `NL.natOfBytes`.
* `win B p e = natB B / 2^p % 2^(e - p)`: the kernel's stream at bit `p`, truncated at `e`.
* `rdE_eq`: `E1N.rdE B q e k = natB B / 2^q % 2^(min k (e - q))` for `k ≤ 48`.
* `rd_win`, `sk_win`, `rdl_win`: the kernel's `rd`, `sk` on a window. -/
@[expose] public section
namespace E1NR
open E1N

/-- the little-endian value of a byte array -/
def natB (B : ByteArray) : ℕ := B.data.toList.foldr (fun b acc => b.toNat + 256 * acc) 0

/-- list form of `natB` -/
def natL : List UInt8 → ℕ
  | [] => 0
  | b :: bs => b.toNat + 256 * natL bs

theorem natB_eq (B : ByteArray) : natB B = natL B.data.toList := by
  unfold natB
  generalize B.data.toList = L
  induction L with
  | nil => rfl
  | cons b bs ih => simp only [List.foldr, natL, ih]

theorem natL_lt (L : List UInt8) : natL L < 2 ^ (8 * L.length) := by
  induction L with
  | nil => simp [natL]
  | cons b bs ih =>
    simp only [natL, List.length_cons]
    have hb : b.toNat < 256 := b.toNat_lt
    rw [show 8 * (bs.length + 1) = 8 * bs.length + 8 by ring, pow_add]
    nlinarith

theorem natB_lt (B : ByteArray) : natB B < 2 ^ (8 * B.size) := by
  rw [natB_eq, ByteArray.size, ← Array.length_toList]; exact natL_lt _

theorem natL_byte (L : List UInt8) (i : ℕ) : natL L / 2 ^ (8 * i) % 256 = (L.getD i 0).toNat := by
  induction L generalizing i with
  | nil => simp [natL]
  | cons b bs ih =>
    have hb : b.toNat < 256 := b.toNat_lt
    rcases i with _ | i
    · simp only [natL, mul_zero, pow_zero, Nat.div_one, List.getD_cons_zero]
      omega
    · simp only [natL, List.getD_cons_succ]
      have e : (b.toNat + 256 * natL bs) / 256 = natL bs := by omega
      rw [show 8 * (i + 1) = 8 + 8 * i by ring, pow_add, ← Nat.div_div_eq_div_mul, show (2 : ℕ) ^ 8 = 256 by norm_num, e]
      exact ih i

/-- `E1N.byte` reads byte `i` of the value -/
theorem byte_eq (B : ByteArray) (i : ℕ) : (E1N.byte B i).toNat = natB B / 2 ^ (8 * i) % 256 := by
  rw [natB_eq, natL_byte]
  unfold E1N.byte
  split
  · next h =>
    rw [UInt8.toNat_toUInt64]
    have h' : i < B.data.toList.length := by rw [Array.length_toList]; exact h
    rw [List.getD_eq_getElem _ _ h']
    simp only [ByteArray.get, Array.getElem_toList]
    rfl
  · next h =>
    have h' : B.data.toList.length ≤ i := by rw [Array.length_toList]; simpa using h
    rw [List.getD_eq_default _ _ h']
    rfl

/-! ## The 56-bit window -/

theorem or_shift_toNat (P b : UInt64) (s : ℕ) (hs : s < 64) (hP : P.toNat < 2 ^ s) (hb : b.toNat < 256)
    (hs8 : s + 8 ≤ 64) : (P ||| b <<< (s.toUInt64)).toNat = P.toNat + b.toNat * 2 ^ s := by
  rw [UInt64.toNat_or, UInt64.toNat_shiftLeft]
  have e1 : (s.toUInt64).toNat % 64 = s := by
    rw [UInt64.toNat_ofNat']; omega
  rw [e1]
  have hlt : b.toNat <<< s < 2 ^ 64 := by
    rw [Nat.shiftLeft_eq]
    calc b.toNat * 2 ^ s < 256 * 2 ^ s := Nat.mul_lt_mul_of_pos_right hb (by positivity)
      _ = 2 ^ (s + 8) := by rw [pow_add]; ring
      _ ≤ 2 ^ 64 := Nat.pow_le_pow_right (by norm_num) hs8
  rw [Nat.mod_eq_of_lt hlt, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hP, Nat.shiftLeft_eq]
  ring

/-- `x % 2^(8 n) = ∑_{t < n} (x / 2^(8t) % 256) 2^(8t)` -/
theorem mod_digits (x : ℕ) (n : ℕ) : x % 2 ^ (8 * n) = ∑ t ∈ Finset.range n, (x / 2 ^ (8 * t) % 256) * 2 ^ (8 * t) := by
  induction n with
  | zero => simp [Nat.mod_one]
  | succ n ih =>
    rw [Finset.sum_range_succ, ← ih, show 8 * (n + 1) = 8 * n + 8 by ring, pow_add, Nat.mod_mul,
      show (2 : ℕ) ^ 8 = 256 by norm_num]
    ring

theorem w56_eq (B : ByteArray) (a : ℕ) : (E1N.w56 B a).toNat = natB B / 2 ^ (8 * a) % 2 ^ 56 := by
  have hb : ∀ j, (E1N.byte B (a + j)).toNat < 256 := fun j => by rw [byte_eq]; exact Nat.mod_lt _ (by norm_num)
  have hbj : ∀ j, (E1N.byte B (a + j)).toNat = natB B / 2 ^ (8 * a) / 2 ^ (8 * j) % 256 := by
    intro j; rw [byte_eq, Nat.div_div_eq_div_mul, ← pow_add]; ring_nf
  unfold E1N.w56
  have e0 : (E1N.byte B a).toNat = (E1N.byte B (a + 0)).toNat := rfl
  have s1 := or_shift_toNat (E1N.byte B a) (E1N.byte B (a + 1)) 8 (by norm_num) (by rw [e0]; have := hb 0; omega)
    (hb 1) (by norm_num)
  have s2 := or_shift_toNat _ (E1N.byte B (a + 2)) 16 (by norm_num) (by rw [s1, e0]; have := hb 0; have := hb 1; omega)
    (hb 2) (by norm_num)
  have s3 := or_shift_toNat _ (E1N.byte B (a + 3)) 24 (by norm_num)
    (by rw [s2, s1, e0]; have := hb 0; have := hb 1; have := hb 2; omega) (hb 3) (by norm_num)
  have s4 := or_shift_toNat _ (E1N.byte B (a + 4)) 32 (by norm_num)
    (by rw [s3, s2, s1, e0]; have := hb 0; have := hb 1; have := hb 2; have := hb 3; omega) (hb 4) (by norm_num)
  have s5 := or_shift_toNat _ (E1N.byte B (a + 5)) 40 (by norm_num)
    (by rw [s4, s3, s2, s1, e0]; have := hb 0; have := hb 1; have := hb 2; have := hb 3; have := hb 4; omega) (hb 5)
    (by norm_num)
  have s6 := or_shift_toNat _ (E1N.byte B (a + 6)) 48 (by norm_num)
    (by rw [s5, s4, s3, s2, s1, e0]; have := hb 0; have := hb 1; have := hb 2; have := hb 3; have := hb 4; have := hb 5
        omega) (hb 6) (by norm_num)
  simp only [show (8 : ℕ).toUInt64 = 8 from rfl, show (16 : ℕ).toUInt64 = 16 from rfl,
    show (24 : ℕ).toUInt64 = 24 from rfl, show (32 : ℕ).toUInt64 = 32 from rfl, show (40 : ℕ).toUInt64 = 40 from rfl,
    show (48 : ℕ).toUInt64 = 48 from rfl] at s1 s2 s3 s4 s5 s6
  rw [s6, s5, s4, s3, s2, s1, e0, show (56 : ℕ) = 8 * 7 by norm_num, mod_digits]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, hbj]
  norm_num

/-! ## Reading `k ≤ 48` bits -/

theorem toNat_mask (k : ℕ) (hk : k ≤ 48) : (((1 : UInt64) <<< k.toUInt64) - 1).toNat = 2 ^ k - 1 := by
  have e1 : (k.toUInt64).toNat = k := by rw [UInt64.toNat_ofNat', Nat.mod_eq_of_lt (by omega)]
  have e2 : ((1 : UInt64) <<< k.toUInt64).toNat = 2 ^ k := by
    rw [UInt64.toNat_shiftLeft, e1, UInt64.toNat_one, show k % 64 = k by omega, Nat.one_shiftLeft,
      Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by norm_num) (by omega))]
  rw [UInt64.toNat_sub, e2, UInt64.toNat_one]
  have : 1 ≤ 2 ^ k := Nat.one_le_two_pow
  have h2 : 2 ^ k < 2 ^ 64 := Nat.pow_lt_pow_right (by norm_num) (by omega)
  rw [show 2 ^ 64 - 1 + 2 ^ k = (2 ^ k - 1) + 2 ^ 64 by omega, Nat.add_mod_right, Nat.mod_eq_of_lt (by omega)]

theorem bits_eq (B : ByteArray) (q k : ℕ) (hk : k ≤ 48) : E1N.bits B q k = natB B / 2 ^ q % 2 ^ k := by
  unfold E1N.bits
  rw [UInt64.toNat_and, UInt64.toNat_shiftRight, toNat_mask k hk, w56_eq, Nat.and_two_pow_sub_one_eq_mod,
    Nat.shiftRight_eq_div_pow]
  have e1 : ((q &&& 7).toUInt64).toNat % 64 = q % 8 := by
    rw [show q &&& 7 = q % 8 from Nat.and_two_pow_sub_one_eq_mod q 3, UInt64.toNat_ofNat',
      Nat.mod_eq_of_lt (by omega), Nat.mod_eq_of_lt (by omega)]
  rw [e1, Nat.shiftRight_eq_div_pow, show (2 : ℕ) ^ 3 = 8 by norm_num, E1PS.mod_div_mod _ 56 (q % 8) k (by omega),
    Nat.div_div_eq_div_mul, ← pow_add, show 8 * (q / 8) + q % 8 = q by omega]

theorem rdE_eq (B : ByteArray) (q e k : ℕ) (hk : k ≤ 48) : E1N.rdE B q e k = natB B / 2 ^ q % 2 ^ (min k (e - q)) := by
  unfold E1N.rdE; exact bits_eq B q _ (le_trans (min_le_left _ _) hk)

/-! ## Windows -/

/-- the kernel's stream at bit `p`, truncated at `e` -/
def win (B : ByteArray) (p e : ℕ) : ℕ := natB B / 2 ^ p % 2 ^ (e - p)

theorem mod_mod_pow (x m n : ℕ) : x % 2 ^ m % 2 ^ n = x % 2 ^ (min m n) := by
  apply Nat.eq_of_testBit_eq; intro i
  simp only [Nat.testBit_mod_two_pow]
  by_cases h1 : i < n <;> by_cases h2 : i < m <;> simp [h1, h2]

theorem rd_win (B : ByteArray) (p e k : ℕ) (hk : k ≤ 48) : E1P.rd k (win B p e) = E1N.rdE B p e k := by
  rw [E1PS.rd_eq, win, rdE_eq B p e k hk, mod_mod_pow, min_comm]

theorem rdl_win (B : ByteArray) (p e k : ℕ) : E1P.rd k (win B p e) = win B p (min e (p + k)) := by
  rw [E1PS.rd_eq, win, win, mod_mod_pow]; congr 2; omega

theorem sk_win (B : ByteArray) (p e k : ℕ) : E1P.sk k (win B p e) = win B (p + k) e := by
  rw [E1PS.sk_eq, win, win]
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_div_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow,
    Nat.testBit_div_two_pow]
  by_cases h : i + k < e - p
  · have h' : i < e - (p + k) := by omega
    simp [h, h', show i + k + p = i + (p + k) by ring]
  · have h' : ¬ (i < e - (p + k)) := by omega
    simp [h, h']

theorem win_full (B : ByteArray) (e : ℕ) (he : 8 * B.size ≤ e) : win B 0 e = natB B := by
  rw [win, pow_zero, Nat.div_one, Nat.sub_zero, Nat.mod_eq_of_lt]
  exact lt_of_lt_of_le (natB_lt B) (Nat.pow_le_pow_right (by norm_num) he)

theorem win_lt (B : ByteArray) (p e : ℕ) : win B p e < 2 ^ (e - p) := Nat.mod_lt _ (by positivity)

/-- reading through a window: `rdE` with the window's end -/
theorem rdE_win (B : ByteArray) (q e k : ℕ) (hk : k ≤ 48) : E1N.rdE B q e k = win B q e % 2 ^ k := by
  rw [← E1PS.rd_eq, rd_win B q e k hk]

end E1NR
