module
public import R22Port.U_d41d8cd98f00
public import L5.Consts5
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # The SWAR popcounts and the byte gather of the L1 checker

* `swar3_pk`: `L1.swar3` of a packing of bytes is the packing of the bytes' popcounts.
* `pcSlots_eq`: `L1.pcSlots x` holds the popcount of each 512-bit slot of `x` in the slot's low byte, when every slot has at
  most 127 set bits.
* `pcF31_eq`: `L1.pcF31 x` holds the popcount of each slot in bits 496.. of the slot (no condition).
* `gath_eq`: the gathering multiplication by `L1.GATH` moves the low bytes of 63 slots into 63 consecutive bytes.
* `blocks_sound`: `L1.blocks` checks `E_i = |row_i ∩ S|` for every row of the record. -/
namespace L5
open E1S Finset

/-! ## Disjoint sums, masked differences -/

theorem add_eq_or_of_disj (u v : ℕ) (h : u &&& v = 0) : u + v = u ||| v := by
  have hu : u < 2 ^ (u + v + 1) := lt_of_lt_of_le (Nat.lt_two_pow_self) (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hv : v < 2 ^ (u + v + 1) := lt_of_lt_of_le (Nat.lt_two_pow_self) (Nat.pow_le_pow_right (by norm_num) (by omega))
  set n := u + v + 1
  have eu : pk 1 (dig 1 u) n = u := pk_dig 1 u n (by rw [Nat.one_mul]; exact hu)
  have ev : pk 1 (dig 1 v) n = v := pk_dig 1 v n (by rw [Nat.one_mul]; exact hv)
  have hd : ∀ i, dig 1 u i + dig 1 v i < 2 ^ 1 := by
    intro i
    have h0 := congrArg (fun x => x.testBit i) h
    simp only [Nat.testBit_and, Nat.zero_testBit] at h0
    have e1 : dig 1 u i = (u.testBit i).toNat := by
      unfold dig; rw [Nat.toNat_testBit]; simp
    have e2 : dig 1 v i = (v.testBit i).toNat := by
      unfold dig; rw [Nat.toNat_testBit]; simp
    rw [e1, e2]; cases hu' : u.testBit i <;> cases hv' : v.testBit i <;> simp_all
  have hs : u + v = pk 1 (fun i => dig 1 u i + dig 1 v i) n := by rw [pk_add, eu, ev]
  apply Nat.eq_of_testBit_eq; intro p
  rw [hs, testBit_pk 1 (by norm_num) _ n (fun i _ => hd i), Nat.testBit_or]
  simp only [Nat.div_one, Nat.mod_one]
  by_cases hp : p < n
  · simp only [hp, decide_true, Bool.true_and]
    have e1 : dig 1 u p = (u.testBit p).toNat := by
      unfold dig; rw [Nat.toNat_testBit]; simp
    have e2 : dig 1 v p = (v.testBit p).toNat := by
      unfold dig; rw [Nat.toNat_testBit]; simp
    have h0 := congrArg (fun x => x.testBit p) h
    simp only [Nat.testBit_and, Nat.zero_testBit] at h0
    rw [e1, e2]; cases hu' : u.testBit p <;> cases hv' : v.testBit p <;> simp_all
  · simp only [hp, decide_false, Bool.false_and]
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hu (Nat.pow_le_pow_right (by norm_num) (by omega))),
      Nat.testBit_lt_two_pow (lt_of_lt_of_le hv (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    rfl

/-- `a - (a &&& b)` clears the bits of `b` in `a` -/
theorem sub_and_testBit (a b l : ℕ) : (a - (a &&& b)).testBit l = (a.testBit l && !b.testBit l) := by
  have hd : (a &&& b) &&& (a ^^^ (a &&& b)) = 0 := by
    apply Nat.eq_of_testBit_eq; intro i
    simp only [Nat.testBit_and, Nat.testBit_xor, Nat.zero_testBit]
    cases a.testBit i <;> cases b.testBit i <;> rfl
  have ho : (a &&& b) ||| (a ^^^ (a &&& b)) = a := by
    apply Nat.eq_of_testBit_eq; intro i
    simp only [Nat.testBit_and, Nat.testBit_xor, Nat.testBit_or]
    cases a.testBit i <;> cases b.testBit i <;> rfl
  have e : a - (a &&& b) = a ^^^ (a &&& b) := by
    have := add_eq_or_of_disj _ _ hd; rw [ho] at this; omega
  rw [e, Nat.testBit_xor, Nat.testBit_and]
  cases a.testBit l <;> cases b.testBit l <;> rfl

theorem sub_and_le (a b : ℕ) : a - (a &&& b) ≤ a := Nat.sub_le _ _

/-! ## Sums over blocks -/

theorem sum_range_mul_eq (f : ℕ → ℕ) (k n : ℕ) :
    ∑ l ∈ range (k * n), f l = ∑ i ∈ range n, ∑ j ∈ range k, f (k * i + j) := by
  induction n with
  | zero => simp
  | succ n ih => rw [show k * (n + 1) = k * n + k by ring, sum_range_add, ih, sum_range_succ]

/-- the bytes of slot `s` -/
theorem dig_shr (B x k i : ℕ) : dig B (x >>> (B * k)) i = dig B x (k + i) := by
  unfold dig; rw [Nat.shiftRight_eq_div_pow, Nat.div_div_eq_div_mul, ← pow_add, Nat.mul_add]

theorem pcnt_slot (x s : ℕ) : pcnt 512 (dig 512 x s) = ∑ j ∈ range 64, pcnt 8 (dig 8 x (64 * s + j)) := by
  rw [show (512 : ℕ) = 8 * 64 by norm_num, dig_regroup 8 64 x s, pcnt_pk 8 _ 64 (fun j _ => dig_lt 8 x _)]

/-- a sum over `k n` items restricted to block `t` (blocks of `k`) -/
theorem sum_blk (P : ℕ → ℕ) (k n t : ℕ) (ht : t < n) :
    ∑ l ∈ range (k * n), (if l / k = t then P l else 0) = ∑ j ∈ range k, P (k * t + j) := by
  rw [sum_range_mul_eq]
  rw [Finset.sum_eq_single t]
  · apply sum_congr rfl; intro j hj; rw [mem_range] at hj
    rw [if_pos]; rw [Nat.add_comm, Nat.add_mul_div_left _ _ (by omega), Nat.div_eq_of_lt hj, Nat.zero_add]
  · intro i _ hi; apply sum_eq_zero; intro j hj; rw [mem_range] at hj
    rw [if_neg]; rw [Nat.add_comm, Nat.add_mul_div_left _ _ (by omega), Nat.div_eq_of_lt hj, Nat.zero_add]; exact hi
  · intro h; exact absurd (mem_range.mpr ht) h

theorem sum_blk_ge (P : ℕ → ℕ) (k n t : ℕ) (ht : n ≤ t) :
    ∑ l ∈ range (k * n), (if l / k = t then P l else 0) = 0 := by
  apply sum_eq_zero; intro l hl; rw [mem_range] at hl; rw [if_neg]
  intro h
  have hk : 0 < k := by rcases Nat.eq_zero_or_pos k with h0 | h0 <;> [simp [h0] at hl; exact h0]
  have : l / k < n := by rw [Nat.div_lt_iff_lt_mul hk]; rw [Nat.mul_comm]; exact hl
  omega

/-- a window of `K ≤ k` items ending at `m` lies in blocks `m / k - 1` and `m / k` -/
theorem window_le (f : ℕ → ℕ) (k L K m : ℕ) (hk : 0 < k) (hK : K ≤ k) :
    ∑ l ∈ range L, (if l ≤ m ∧ m - l < K then f l else 0) ≤
      ∑ l ∈ range L, (if l / k = m / k then f l else 0) + ∑ l ∈ range L, (if l / k = m / k - 1 then f l else 0) := by
  rw [← sum_add_distrib]; apply sum_le_sum; intro l _
  split
  · rename_i h
    have h1 : l / k ≤ m / k := Nat.div_le_div_right h.1
    have h2 : m / k ≤ l / k + 1 := by
      have : m < l + k := by omega
      have h3 : m / k ≤ (l + k) / k := Nat.div_le_div_right (by omega)
      rw [Nat.add_div_right _ hk] at h3; exact h3
    generalize l / k = A at h1 h2 ⊢
    generalize m / k = B at h1 h2 ⊢
    by_cases e : A = B
    · rw [if_pos e]; omega
    · rw [if_neg e, if_pos (show A = B - 1 by omega)]; omega
  · exact Nat.zero_le _

/-! ## Per-byte SWAR steps -/

def bA (v : ℕ) : ℕ := v - ((v >>> 1) &&& 0x55)
def bB (v : ℕ) : ℕ := (bA v &&& 0x33) + ((bA v >>> 2) &&& 0x33)

theorem byte_facts : ∀ v < 256, ((v >>> 1) &&& 0x55 ≤ v) ∧ bA v < 2 ^ 8 ∧ bB v ≤ 68 ∧ bB v % 2 ^ 4 < 5 ∧
    (∀ w < 5, (bB v + (bB v >>> 4 + w * 2 ^ (8 - 4))) &&& 0x0F = pcnt 8 v) := by
  decide +kernel

/-- **SWAR byte popcounts.** -/
theorem swar3_pk (X : ℕ → ℕ) (hX : ∀ i < 32768, X i < 2 ^ 8) :
    L1.swar3 (pk 8 X 32768) = pk 8 (fun i => pcnt 8 (X i)) 32768 := by
  have hbf : ∀ i < 32768, _ := fun i hi => byte_facts (X i) (by have := hX i hi; norm_num at this; exact this)
  have e1 : (pk 8 X 32768 >>> 1) &&& L1.K55 = pk 8 (fun i => (X i >>> 1) &&& 0x55) 32768 := by
    rw [K55_eq]; exact pk_shr_and 8 1 (by norm_num) (by norm_num) X 32768 0x55 hX (by norm_num)
  have e2 : pk 8 X 32768 - pk 8 (fun i => (X i >>> 1) &&& 0x55) 32768 = pk 8 (fun i => bA (X i)) 32768 :=
    pk_sub 8 X _ 32768 (fun i hi => (hbf i hi).1)
  have hA : ∀ i < 32768, bA (X i) < 2 ^ 8 := fun i hi => (hbf i hi).2.1
  have e3 : pk 8 (fun i => bA (X i)) 32768 &&& L1.K33 = pk 8 (fun i => bA (X i) &&& 0x33) 32768 := by
    rw [K33_eq]; exact pk_and 8 (by norm_num) _ _ 32768 hA (fun _ _ => by norm_num)
  have e4 : (pk 8 (fun i => bA (X i)) 32768 >>> 2) &&& L1.K33 =
      pk 8 (fun i => (bA (X i) >>> 2) &&& 0x33) 32768 := by
    rw [K33_eq]; exact pk_shr_and 8 2 (by norm_num) (by norm_num) _ 32768 0x33 hA (by norm_num)
  have e5 : pk 8 (fun i => bA (X i) &&& 0x33) 32768 + pk 8 (fun i => (bA (X i) >>> 2) &&& 0x33) 32768 =
      pk 8 (fun i => bB (X i)) 32768 := pk_add' 8 _ _ 32768
  have hB : ∀ i < 32768, bB (X i) < 2 ^ 8 := fun i hi => by have := (hbf i hi).2.2.1; omega
  have e6 := pk_shr 8 4 (by norm_num) (by norm_num) (fun i => bB (X i)) 32768 hB
  have e7 := pk_add' 8 (fun i => bB (X i))
    (fun i => bB (X i) >>> 4 + (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) * 2 ^ (8 - 4)) 32768
  have hw : ∀ i, (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) < 5 := by
    intro i; split
    · rename_i h; exact (hbf (i + 1) h).2.2.2.1
    · norm_num
  have hC : ∀ i < 32768,
      bB (X i) + (bB (X i) >>> 4 + (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) * 2 ^ (8 - 4)) < 2 ^ 8 := by
    intro i hi
    have h1 := (hbf i hi).2.2.1
    have h2 := hw i
    have h3 : bB (X i) >>> 4 ≤ 4 := by rw [Nat.shiftRight_eq_div_pow]; norm_num; omega
    generalize (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) = w at h2 ⊢
    rw [show (2 : ℕ) ^ (8 - 4) = 16 by norm_num, show (2 : ℕ) ^ 8 = 256 by norm_num]; omega
  have e8 : pk 8 (fun i => bB (X i) + (bB (X i) >>> 4 +
      (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) * 2 ^ (8 - 4))) 32768 &&& L1.K0F =
      pk 8 (fun i => (bB (X i) + (bB (X i) >>> 4 +
      (if i + 1 < 32768 then bB (X (i + 1)) % 2 ^ 4 else 0) * 2 ^ (8 - 4))) &&& 0x0F) 32768 := by
    rw [K0F_eq]; exact pk_and 8 (by norm_num) _ _ 32768 hC (fun _ _ => by norm_num)
  unfold L1.swar3
  simp only [land_eq, shr_eq, nsub_eq, nadd_eq]
  rw [e1, e2, e3, e4, e5, e6, e7, e8]
  apply pk_congr; intro i hi
  exact (hbf i hi).2.2.2.2 _ (hw i)

theorem swar3_eq (x : ℕ) (hx : x < 2 ^ (8 * 32768)) :
    L1.swar3 x = pk 8 (fun i => pcnt 8 (dig 8 x i)) 32768 := by
  have hx8 : x = pk 8 (dig 8 x) 32768 := (pk_dig 8 x 32768 hx).symm
  conv_lhs => rw [hx8]
  exact swar3_pk _ (fun i _ => dig_lt 8 x i)

/-! ## Slot popcounts -/

theorem testBit_255 (j : ℕ) : (255 : ℕ).testBit j = decide (j < 8) := by
  rw [show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.testBit_two_pow_sub_one]

/-- **`pcSlots`**: popcount of every 512-bit slot in its low byte (slots of at most 127 bits). -/
theorem pcSlots_eq (x : ℕ) (hx : x < 2 ^ (8 * 32768)) (hs : ∀ s < 512, pcnt 512 (dig 512 x s) ≤ 127) :
    L1.pcSlots x = pk 512 (fun s => pcnt 512 (dig 512 x s)) 512 := by
  have hslot : ∀ t, ∑ l ∈ range (64 * 512), (if l / 64 = t then pcnt 8 (dig 8 x l) else 0) ≤ 127 := by
    intro t
    by_cases ht : t < 512
    · rw [sum_blk _ 64 512 t ht, ← pcnt_slot]; exact hs t ht
    · rw [sum_blk_ge _ 64 512 t (by omega)]; norm_num
  have hcb : ∀ m, (∑ l ∈ range 32768, if l ≤ m ∧ m - l < 64 then pcnt 8 (dig 8 x l) else 0) < 2 ^ 8 := by
    intro m
    have h1 := window_le (fun l => pcnt 8 (dig 8 x l)) 64 32768 64 m (by norm_num) (le_refl _)
    beta_reduce at h1
    have h2 := hslot (m / 64)
    have h3 := hslot (m / 64 - 1)
    simp only [show (64 * 512 : ℕ) = 32768 by norm_num] at h2 h3
    rw [show (2 : ℕ) ^ 8 = 256 by norm_num]; omega
  have hprod : L1.swar3 x * L1.SUM64 = pk 8 (fun m => ∑ l ∈ range 32768,
      if l ≤ m ∧ m - l < 64 then pcnt 8 (dig 8 x l) else 0) (32768 + 64) := by
    rw [swar3_eq x hx, SUM64_eq, pk_mul_ones]
  have hcs : ∀ s < 512, (∑ l ∈ range 32768, if l ≤ 64 * s + 63 ∧ 64 * s + 63 - l < 64 then pcnt 8 (dig 8 x l) else 0)
      = pcnt 512 (dig 512 x s) := by
    intro s hs'
    have hb := sum_blk (fun l => pcnt 8 (dig 8 x l)) 64 512 s hs'
    beta_reduce at hb
    rw [pcnt_slot, ← hb, show (64 * 512 : ℕ) = 32768 by norm_num]
    apply sum_congr rfl; intro l hl; rw [mem_range] at hl
    by_cases h : l / 64 = s
    · rw [if_pos h, if_pos (by omega)]
    · rw [if_neg h, if_neg (by omega)]
  have hR : ∀ s < 512, pcnt 512 (dig 512 x s) < 2 ^ 512 := fun s _ => lt_of_le_of_lt (pcnt_le 512 _) (by norm_num)
  unfold L1.pcSlots
  simp only [land_eq, shr_eq, nmul_eq]
  rw [hprod, LB_eq]
  apply Nat.eq_of_testBit_eq; intro p
  obtain ⟨s, j, hj, rfl⟩ : ∃ s j, j < 512 ∧ p = 512 * s + j :=
    ⟨p / 512, p % 512, Nat.mod_lt _ (by norm_num), (Nat.div_add_mod p 512).symm⟩
  rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_pk 8 (by norm_num) _ _ (fun m _ => hcb m),
    testBit_pk 512 (by norm_num) (fun _ => 255) 512 (fun _ _ => by norm_num),
    testBit_pk 512 (by norm_num) _ 512 hR, (divmod_eq 512 s j hj).1, (divmod_eq 512 s j hj).2, testBit_255]
  by_cases hj8 : j < 8
  · have e := divmod_eq 8 (64 * s + 63) j hj8
    rw [show 504 + (512 * s + j) = 8 * (64 * s + 63) + j by ring, e.1, e.2]
    by_cases hs5 : s < 512
    · simp only [hs5, decide_true, show 64 * s + 63 < 32768 + 64 by omega, hj8, Bool.true_and, Bool.and_true]
      rw [hcs s hs5]
    · simp [hs5]
  · simp only [hj8, decide_false, Bool.and_false]
    by_cases hs5 : s < 512
    · simp only [hs5, decide_true, Bool.true_and]
      symm; apply Nat.testBit_lt_two_pow
      have := hs s hs5
      calc pcnt 512 (dig 512 x s) < 2 ^ 8 := by omega
        _ ≤ 2 ^ j := Nat.pow_le_pow_right (by norm_num) (by omega)
    · simp [hs5]

/-- **`pcF31`**: popcount of every 512-bit slot in bits 496.. of the slot. -/
theorem pcF31_eq (x : ℕ) (hx : x < 2 ^ (8 * 32768)) :
    L1.pcF31 x = pk 512 (fun s => pcnt 512 (dig 512 x s) * 2 ^ 496) 512 := by
  have hP8 : ∀ i, pcnt 8 (dig 8 x i) ≤ 8 := fun i => pcnt_le 8 _
  have hP : ∀ i < 32768, pcnt 8 (dig 8 x i) < 2 ^ 8 := fun i _ => by have := hP8 i; omega
  have e1 : pk 8 (fun i => pcnt 8 (dig 8 x i)) 32768 >>> 8 =
      pk 8 (fun i => if i + 1 < 32768 then pcnt 8 (dig 8 x (i + 1)) else 0) 32768 := by
    rw [pk_shr 8 8 (by norm_num) (le_refl 8) _ 32768 hP]
    apply pk_congr; intro i hi
    rw [Nat.shiftRight_eq_div_pow, Nat.div_eq_of_lt (hP i hi), Nat.sub_self, pow_zero, Nat.mul_one, Nat.zero_add]
    split
    · rename_i h; exact Nat.mod_eq_of_lt (hP (i + 1) h)
    · rfl
  have e2 := pk_add' 8 (fun i => pcnt 8 (dig 8 x i)) (fun i => if i + 1 < 32768 then pcnt 8 (dig 8 x (i + 1)) else 0) 32768
  have hQ : ∀ i, pcnt 8 (dig 8 x i) + (if i + 1 < 32768 then pcnt 8 (dig 8 x (i + 1)) else 0) ≤ 16 := by
    intro i; have := hP8 i; split
    · have := hP8 (i + 1); omega
    · omega
  have e3 : pk 8 (fun i => pcnt 8 (dig 8 x i) + (if i + 1 < 32768 then pcnt 8 (dig 8 x (i + 1)) else 0)) 32768 =
      pk 16 (fun k => (pcnt 8 (dig 8 x (2 * k)) + (if 2 * k + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1)) else 0)) +
        (pcnt 8 (dig 8 x (2 * k + 1)) + (if 2 * k + 1 + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1 + 1)) else 0)) * 2 ^ 8)
        16384 := by
    rw [show (32768 : ℕ) = 2 * 16384 by norm_num, pk_regroup 8 2 _ 16384]
    apply pk_congr; intro k _; unfold pk; simp [sum_range_succ]
  have hW : ∀ k < 16384, (pcnt 8 (dig 8 x (2 * k)) + (if 2 * k + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1)) else 0)) +
      (pcnt 8 (dig 8 x (2 * k + 1)) + (if 2 * k + 1 + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1 + 1)) else 0)) * 2 ^ 8
      < 2 ^ 16 := by
    intro k _; have h1 := hQ (2 * k); have h2 := hQ (2 * k + 1); norm_num at h1 h2 ⊢; omega
  have e4 : pk 16 (fun k => (pcnt 8 (dig 8 x (2 * k)) + (if 2 * k + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1)) else 0)) +
        (pcnt 8 (dig 8 x (2 * k + 1)) + (if 2 * k + 1 + 1 < 32768 then pcnt 8 (dig 8 x (2 * k + 1 + 1)) else 0)) * 2 ^ 8)
        16384 &&& L1.K00FF = pk 16 (fun k => pcnt 8 (dig 8 x (2 * k)) + pcnt 8 (dig 8 x (2 * k + 1))) 16384 := by
    rw [K00FF_eq, pk_and 16 (by norm_num) _ _ 16384 hW (fun _ _ => by norm_num)]
    apply pk_congr; intro k hk
    rw [show (255 : ℕ) = 2 ^ 8 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod, Nat.add_mul_mod_self_right,
      if_pos (by omega)]
    apply Nat.mod_eq_of_lt; have h1 := hQ (2 * k); rw [if_pos (by omega)] at h1; norm_num; omega
  set W : ℕ → ℕ := fun k => pcnt 8 (dig 8 x (2 * k)) + pcnt 8 (dig 8 x (2 * k + 1)) with hWdef
  have hblk : ∀ t, ∑ k ∈ range (32 * 512), (if k / 32 = t then W k else 0) =
      if t < 512 then pcnt 512 (dig 512 x t) else 0 := by
    intro t; split
    · rename_i ht
      rw [sum_blk W 32 512 t ht, pcnt_slot, show (64 : ℕ) = 2 * 32 by norm_num, sum_range_mul_eq]
      apply sum_congr rfl; intro i _; simp [hWdef, sum_range_succ]; ring_nf
    · rw [sum_blk_ge W 32 512 t (by omega)]
  have hcb : ∀ m, (∑ k ∈ range 16384, if k ≤ m ∧ m - k < 32 then W k else 0) < 2 ^ 16 := by
    intro m
    have h1 := window_le W 32 16384 32 m (by norm_num) (le_refl _)
    beta_reduce at h1
    have h2 := hblk (m / 32)
    have h3 := hblk (m / 32 - 1)
    simp only [show (32 * 512 : ℕ) = 16384 by norm_num] at h2 h3
    have h4 : ∀ t, (if t < 512 then pcnt 512 (dig 512 x t) else 0) ≤ 512 := by
      intro t; split
      · exact pcnt_le 512 _
      · exact Nat.zero_le _
    have := h4 (m / 32); have := h4 (m / 32 - 1)
    rw [show (2 : ℕ) ^ 16 = 65536 by norm_num]; omega
  have hprod : pk 16 W 16384 * L1.SUM32 = pk 16 (fun m => ∑ k ∈ range 16384,
      if k ≤ m ∧ m - k < 32 then W k else 0) (16384 + 32) := by
    rw [SUM32_eq, pk_mul_ones]
  have hcs : ∀ s < 512, (∑ k ∈ range 16384, if k ≤ 32 * s + 31 ∧ 32 * s + 31 - k < 32 then W k else 0)
      = pcnt 512 (dig 512 x s) := by
    intro s hs'
    have := hblk s; rw [if_pos hs', show (32 * 512 : ℕ) = 16384 by norm_num] at this
    rw [← this]
    apply sum_congr rfl; intro k hk; rw [mem_range] at hk
    by_cases h : k / 32 = s
    · rw [if_pos h, if_pos (by omega)]
    · rw [if_neg h, if_neg (by omega)]
  have hR : ∀ s < 512, pcnt 512 (dig 512 x s) * 2 ^ 496 < 2 ^ 512 := by
    intro s _
    calc pcnt 512 (dig 512 x s) * 2 ^ 496 < 2 ^ 16 * 2 ^ 496 :=
          Nat.mul_lt_mul_of_pos_right (lt_of_le_of_lt (pcnt_le 512 _) (by norm_num)) (by positivity)
      _ = 2 ^ 512 := by norm_num
  unfold L1.pcF31
  simp only [land_eq, shr_eq, nmul_eq, nadd_eq]
  rw [swar3_eq x hx, e1, e2, e3, e4, hprod, F31_eq]
  apply Nat.eq_of_testBit_eq; intro p
  obtain ⟨s, j, hj, rfl⟩ : ∃ s j, j < 512 ∧ p = 512 * s + j :=
    ⟨p / 512, p % 512, Nat.mod_lt _ (by norm_num), (Nat.div_add_mod p 512).symm⟩
  rw [Nat.testBit_and, testBit_pk 16 (by norm_num) _ _ (fun m _ => hcb m),
    testBit_pk 512 (by norm_num) (fun _ => 65535 * 2 ^ 496) 512 (fun _ _ => by norm_num),
    testBit_pk 512 (by norm_num) _ 512 hR, (divmod_eq 512 s j hj).1, (divmod_eq 512 s j hj).2,
    Nat.testBit_mul_two_pow, Nat.testBit_mul_two_pow, show (65535 : ℕ) = 2 ^ 16 - 1 by norm_num,
    Nat.testBit_two_pow_sub_one]
  by_cases hj4 : 496 ≤ j
  · have e := divmod_eq 16 (32 * s + 31) (j - 496) (by omega)
    rw [show 512 * s + j = 16 * (32 * s + 31) + (j - 496) by omega, e.1, e.2]
    by_cases hs5 : s < 512
    · simp only [hs5, hj4, decide_true, show 32 * s + 31 < 16384 + 32 by omega, show j - 496 < 16 by omega,
        Bool.true_and, Bool.and_true]
      rw [hcs s hs5]
    · simp [hs5]
  · simp [hj4]

/-! ## The byte gather -/

/-- **`GATH`**: the low bytes of 63 slots, gathered into 63 consecutive bytes. -/
theorem gath_eq (Q : ℕ → ℕ) (hQ : ∀ s < 63, Q s < 2 ^ 8) :
    ((pk 512 Q 63 * L1.GATH) >>> 31248) &&& L1.EBLK = pk 8 Q 63 := by
  have e1 : pk 512 Q 63 = pk 504 (fun s => Q s * 2 ^ (8 * s)) 63 := by
    unfold pk; apply sum_congr rfl; intro s _; rw [mul_assoc, ← pow_add]; congr 2; ring
  have hcb : ∀ m, (∑ s ∈ range 63, if s ≤ m ∧ m - s < 63 then Q s * 2 ^ (8 * s) else 0) < 2 ^ 504 := by
    intro m
    calc (∑ s ∈ range 63, if s ≤ m ∧ m - s < 63 then Q s * 2 ^ (8 * s) else 0)
        ≤ ∑ s ∈ range 63, Q s * 2 ^ (8 * s) := sum_le_sum (fun s _ => by split <;> simp)
      _ = pk 8 Q 63 := rfl
      _ < 2 ^ (8 * 63) := pk_lt 8 Q 63 hQ
      _ = 2 ^ 504 := by norm_num
  have h62 : (∑ s ∈ range 63, if s ≤ 62 ∧ 62 - s < 63 then Q s * 2 ^ (8 * s) else 0) = pk 8 Q 63 := by
    unfold pk; apply sum_congr rfl; intro s hs; rw [mem_range] at hs; rw [if_pos (by omega)]
  rw [e1, GATH_eq, pk_mul_ones, EBLK_eq, Nat.and_two_pow_sub_one_eq_mod, show (31248 : ℕ) = 504 * 62 by norm_num,
    show (63 + 63 : ℕ) = 62 + (1 + 63) by norm_num, pk_shr_field 504 _ 62 (1 + 63) (fun m _ => hcb m),
    show (2 : ℕ) ^ 504 = 2 ^ (504 * 1) by norm_num, pk_mod 504 _ 1 63 (fun i _ => hcb _)]
  unfold pk; simp only [Finset.sum_range_one, Nat.mul_zero, pow_zero, Nat.mul_one, Nat.add_zero]
  exact h62

/-! ## The claimed counts -/

theorem blockOK_sound (MB E S' : ℕ) (hS : S' < 2 ^ 511) (hc : pcnt 512 S' ≤ 127)
    (h : Nat.beq (Nat.land (Nat.shiftRight (Nat.mul (L1.pcSlots (Nat.land MB (Nat.land (Nat.mul S' L1.REP63) L1.MBLK)))
      L1.GATH) 31248) L1.EBLK) (Nat.land E L1.EBLK) = true) :
    ∀ s < 63, dig 8 E s = pcnt 512 (dig 512 MB s &&& S') := by
  have hS512 : S' < 2 ^ 512 := lt_trans hS (by norm_num)
  have hS63 : S' * L1.REP63 = pk 512 (fun _ => S') 63 := by
    rw [REP63_eq, mul_comm, ← pk_mul_const]; simp
  have hlt : pk 512 (fun _ => S') 63 < 2 ^ (512 * 63) := pk_lt 512 _ 63 (fun _ _ => hS512)
  have e1 : S' * L1.REP63 &&& L1.MBLK = pk 512 (fun _ => S') 63 := by
    rw [MBLK_eq, Nat.and_two_pow_sub_one_eq_mod, hS63, Nat.mod_eq_of_lt hlt]
  have e2 : MB &&& pk 512 (fun _ => S') 63 = pk 512 (fun s => dig 512 MB s &&& S') 63 := by
    have : MB &&& pk 512 (fun _ => S') 63 = (MB % 2 ^ (512 * 63)) &&& pk 512 (fun _ => S') 63 := by
      apply Nat.eq_of_testBit_eq; intro i; simp only [Nat.testBit_and, Nat.testBit_mod_two_pow]
      by_cases hi : i < 512 * 63
      · simp [hi]
      · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]; simp
    rw [this, ← pk_dig_mod 512 MB 63, pk_and 512 (by norm_num) _ _ 63 (fun s _ => dig_lt 512 MB s) (fun _ _ => hS512)]
  have hfl : ∀ s < 63, dig 512 MB s &&& S' < 2 ^ 512 := fun s _ => lt_of_le_of_lt Nat.and_le_right hS512
  have hx : pk 512 (fun s => dig 512 MB s &&& S') 63 < 2 ^ (8 * 32768) :=
    lt_of_lt_of_le (pk_lt 512 _ 63 hfl) (Nat.pow_le_pow_right (by norm_num) (by norm_num))
  have hdx : ∀ s, dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) s = if s < 63 then dig 512 MB s &&& S' else 0 := by
    intro s; split
    · rename_i hs; exact dig_pk 512 _ 63 hfl s hs
    · rename_i hs; exact dig_ge 512 (by norm_num) _ 63 hfl s (by omega)
  have hpc : ∀ s, pcnt 512 (dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) s) ≤ 127 := by
    intro s; rw [hdx]; split
    · refine le_trans (pcnt_mono 512 _ _ (fun j _ hj => ?_)) hc
      rw [Nat.testBit_and, Bool.and_eq_true] at hj; exact hj.2
    · rw [pcnt_zero_x]; norm_num
  have hps : L1.pcSlots (pk 512 (fun s => dig 512 MB s &&& S') 63) =
      pk 512 (fun s => pcnt 512 (dig 512 MB s &&& S')) 63 := by
    rw [pcSlots_eq _ hx (fun s _ => hpc s)]
    rw [show pk 512 (fun s => pcnt 512 (dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) s)) 512 =
      pk 512 (fun s => pcnt 512 (dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) s)) (63 + 449) from rfl, pk_split]
    have hz : pk 512 (fun i => pcnt 512 (dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) (63 + i))) 449 = 0 := by
      rw [show (fun i => pcnt 512 (dig 512 (pk 512 (fun s => dig 512 MB s &&& S') 63) (63 + i))) = fun _ => 0 from by
        funext i; rw [hdx, if_neg (by omega), pcnt_zero_x]]
      exact pk_zero 512 449
    rw [hz, Nat.mul_zero, Nat.add_zero]
    apply pk_congr; intro s hs; rw [hdx, if_pos hs]
  have hQ : ∀ s < 63, pcnt 512 (dig 512 MB s &&& S') < 2 ^ 8 := by
    intro s _
    have := le_trans (pcnt_mono 512 (dig 512 MB s &&& S') S' (fun j _ hj => by
      rw [Nat.testBit_and, Bool.and_eq_true] at hj; exact hj.2)) hc
    omega
  have h' := Nat.eq_of_beq_eq_true h
  simp only [land_eq, shr_eq, nmul_eq] at h'
  have hl : ((L1.pcSlots (MB &&& (S' * L1.REP63 &&& L1.MBLK)) * L1.GATH) >>> 31248) &&& L1.EBLK =
      pk 8 (fun s => pcnt 512 (dig 512 MB s &&& S')) 63 := by
    rw [e1, e2, hps, gath_eq _ hQ]
  have hr : E &&& L1.EBLK = pk 8 (dig 8 E) 63 := by
    rw [EBLK_eq, Nat.and_two_pow_sub_one_eq_mod, pk_dig_mod]
  rw [hl, hr] at h'
  intro s hs
  exact (pk_inj 8 _ _ 63 hQ (fun i _ => dig_lt 8 E i) h' s hs).symm

/-- **`blocks`**: the claimed count `E_i` of every row `i < 63 nb` is `|row_i ∩ S|` (popcount of the 512-bit row slot
masked by the prefix). -/
theorem blocks_sound (S' : ℕ) (hS : S' < 2 ^ 511) (hc : pcnt 512 S' ≤ 127) :
    ∀ nb MB E, L1.blocks MB E (Nat.mul S' L1.REP63) nb = true →
      ∀ i < 63 * nb, dig 8 E i = pcnt 512 (dig 512 MB i &&& S') := by
  intro nb
  induction nb with
  | zero => intro MB E _ i hi; omega
  | succ nb ih =>
    intro MB E h i hi
    simp only [L1.blocks, Bool.and_eq_true] at h
    by_cases hi63 : i < 63
    · exact blockOK_sound MB E S' hS hc h.1 i hi63
    · have h2 := ih (Nat.shiftRight MB 32256) (Nat.shiftRight E 504) h.2 (i - 63) (by omega)
      rw [shr_eq, shr_eq, show (32256 : ℕ) = 512 * 63 by norm_num, show (504 : ℕ) = 8 * 63 by norm_num,
        dig_shr, dig_shr, show 63 + (i - 63) = i by omega] at h2
      exact h2

end L5
