module
public import R22Port.U_d41d8cd98f00
public import NLP.Tables
/-! # NLP.Bytes: reading bits of a byte array is the kernel's `rd`/`sk` on its value

`natOfBytes d` (NL.Basic) is the little-endian value of `d`.  The certificate window `[.., e)` at position `p` is the kernel
stream `win N e p = rd (e - p) (sk p N)`: bits `p .. e-1` of `N`, zero beyond.  `rdw d e p k` (`k ≤ 9`) is
`rd k (win N e p)`, `sk k (win N e p) = win N e (p + k)`, and `rdList` is the kernel's. -/
@[expose] public section
namespace NL
open Nat

/-- the kernel stream of the window `[.., e)` at bit `p` -/
def win (N e p : Nat) : Nat := BC5.rd (e - p) (BC5.sk p N)

theorem rd_eq' (k N : Nat) : BC5.rd k N = N % 2 ^ k := by
  show N &&& (1 <<< k - 1) = _
  rw [Nat.one_shiftLeft, Nat.and_two_pow_sub_one_eq_mod]
theorem sk_eq' (k N : Nat) : BC5.sk k N = N >>> k := rfl

theorem rd_bit (k N i : Nat) : (BC5.rd k N).testBit i = (decide (i < k) && N.testBit i) := by
  rw [rd_eq', Nat.testBit_mod_two_pow]

theorem win_bit (N e p i : Nat) : (win N e p).testBit i = (decide (i < e - p) && N.testBit (p + i)) := by
  unfold win; rw [rd_bit, sk_eq', Nat.testBit_shiftRight]

theorem sk_win (N e p k : Nat) : BC5.sk k (win N e p) = win N e (p + k) := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [sk_eq', Nat.testBit_shiftRight, win_bit, win_bit]
  have h1 : (k + i < e - p) ↔ (i < e - (p + k)) := by omega
  rw [show p + (k + i) = p + k + i by omega]; simp only [h1]

theorem rd_rd (a b N : Nat) : BC5.rd a (BC5.rd b N) = BC5.rd (Nat.min a b) N := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [rd_bit, rd_bit, rd_bit]
  have : (i < Nat.min a b) ↔ (i < a ∧ i < b) := by rw [Nat.lt_min]
  by_cases h1 : i < a <;> by_cases h2 : i < b <;> simp [h1, h2, this]

/-! ## The value of a byte array -/

def natOfList (l : List UInt8) : Nat := l.foldr (fun b acc => b.toNat + 256 * acc) 0

theorem natOfBytes_eq (d : ByteArray) : natOfBytes d = natOfList d.data.toList := rfl

theorem natOfList_bit : ∀ (l : List UInt8) (p : Nat), (natOfList l).testBit p = ((l.getD (p / 8) 0).toNat).testBit (p % 8)
  | [], p => by simp [natOfList]
  | b :: bs, p => by
    show (b.toNat + 2 ^ 8 * natOfList bs).testBit p = _
    rw [Nat.add_comm, Nat.testBit_two_pow_mul_add _ b.toNat_lt]
    by_cases hp : p < 8
    · rw [if_pos hp, show p / 8 = 0 by omega, show p % 8 = p by omega]; rfl
    · rw [if_neg hp, natOfList_bit bs (p - 8), show p / 8 = (p - 8) / 8 + 1 by omega, show (p - 8) % 8 = p % 8 by omega]
      rfl

theorem byteAt_eq (d : ByteArray) (i : Nat) : byteAt d i = (d.data.toList.getD i 0).toNat := by
  unfold byteAt
  by_cases h : i < d.size
  · rw [dif_pos h]
    have h' : i < d.data.toList.length := by rw [Array.length_toList]; exact h
    rw [List.getD_eq_getElem _ _ h']
    rfl
  · rw [dif_neg h]
    have h' : ¬ i < d.data.toList.length := by rw [Array.length_toList]; exact h
    rw [List.getD_eq_default _ _ (by omega)]; rfl

/-- **bit `p` of the value is bit `p % 8` of byte `p / 8`** -/
theorem natOfBytes_bit (d : ByteArray) (p : Nat) : (natOfBytes d).testBit p = (byteAt d (p / 8)).testBit (p % 8) := by
  rw [natOfBytes_eq, natOfList_bit, byteAt_eq]

theorem byteAt_lt (d : ByteArray) (i : Nat) : byteAt d i < 256 := by
  rw [byteAt_eq]; exact UInt8.toNat_lt _

theorem two_byte_bit (b0 b1 j : Nat) (h0 : b0 < 256) (h1 : b1 < 256) :
    (b0 ||| b1 * 256).testBit j = if j < 8 then b0.testBit j else b1.testBit (j - 8) := by
  rw [Nat.testBit_or, show (256 : Nat) = 2 ^ 8 by norm_num, Nat.testBit_mul_two_pow]
  by_cases hj : j < 8
  · rw [if_pos hj]; simp [show ¬ (8 ≤ j) by omega]
  · rw [if_neg hj, Nat.testBit_lt_two_pow (lt_of_lt_of_le h0 (le_trans (by norm_num : 256 ≤ 2 ^ 8)
      (Nat.pow_le_pow_right (by norm_num) (by omega))))]
    simp [show 8 ≤ j by omega]

/-- **`rdb` reads the value's bits** (`k ≤ 9`) -/
theorem rdb_eq (d : ByteArray) (p k : Nat) (hk : k ≤ 9) : rdb d p k = BC5.rd k (BC5.sk p (natOfBytes d)) := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [rd_bit, sk_eq', Nat.testBit_shiftRight, natOfBytes_bit]
  unfold rdb
  have hpw : pw k - 1 = 2 ^ k - 1 := by rw [pw_fact k (by omega)]
  have e3 : p >>> 3 = p / 8 := by rw [Nat.shiftRight_eq_div_pow]
  have e7 : p &&& 7 = p % 8 := by rw [show (7 : Nat) = 2 ^ 3 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  rw [hpw, Nat.testBit_and, Nat.testBit_two_pow_sub_one, Nat.testBit_shiftRight, e3, e7,
    two_byte_bit _ _ _ (byteAt_lt d _) (byteAt_lt d _)]
  by_cases hi : i < k
  · simp only [hi, decide_true, Bool.and_true, Bool.true_and]
    by_cases hr : p % 8 + i < 8
    · rw [if_pos hr, show (p + i) / 8 = p / 8 by omega, show (p + i) % 8 = p % 8 + i by omega]
    · rw [if_neg hr, show (p + i) / 8 = p / 8 + 1 by omega, show (p + i) % 8 = p % 8 + i - 8 by omega]
  · simp [hi]

/-- **`rdw` reads the window** -/
theorem rdw_eq (d : ByteArray) (e p k : Nat) (hk : k ≤ 9) : rdw d e p k = BC5.rd k (win (natOfBytes d) e p) := by
  unfold rdw win
  rw [rdb_eq d p _ (le_trans (Nat.min_le_left _ _) hk), rd_rd]

theorem rdList_eq (d : ByteArray) (e : Nat) : ∀ m p, BC5.rdList m (win (natOfBytes d) e p) =
    ((rdList d e m p).1, win (natOfBytes d) e (rdList d e m p).2)
  | 0, p => rfl
  | m + 1, p => by
    show (BC5.rd 9 (win (natOfBytes d) e p) :: (BC5.rdList m (BC5.sk 9 (win (natOfBytes d) e p))).1,
        (BC5.rdList m (BC5.sk 9 (win (natOfBytes d) e p))).2) =
      (rdw d e p 9 :: (rdList d e m (p + 9)).1, win (natOfBytes d) e (rdList d e m (p + 9)).2)
    rw [sk_win, rdList_eq d e m (p + 9), rdw_eq d e p 9 (le_refl _)]

theorem rdList_lt (d : ByteArray) (e : Nat) : ∀ m p, ∀ x ∈ (rdList d e m p).1, x < 512
  | 0, _ => fun _ h => absurd h List.not_mem_nil
  | m + 1, p => fun x hx => by
    change x ∈ rdw d e p 9 :: (rdList d e m (p + 9)).1 at hx
    rcases List.mem_cons.mp hx with rfl | hx
    · rw [rdw_eq d e p 9 (le_refl _), rd_eq']; exact Nat.mod_lt _ (by norm_num)
    · exact rdList_lt d e m (p + 9) x hx

theorem rdw_lt (d : ByteArray) (e p k : Nat) (hk : k ≤ 9) : rdw d e p k < 2 ^ k := by
  rw [rdw_eq d e p k hk, rd_eq']; exact Nat.mod_lt _ (Nat.two_pow_pos k)

end NL
