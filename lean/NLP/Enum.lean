module
public import R22Port.U_d41d8cd98f00
public import NLP.M8
public import S5.Enum
/-! # NLP.Enum: the native low-bit enumeration is the kernel's

`ctz` (de Bruijn) finds the lowest set bit of a word; `M8.low` / `M8.clrLow` are the kernel's `lg2 (m ^^^ (m &&& (m - 1)))` and
`m &&& (m - 1)` on the value; hence `M8.bLoop f x = S5.bLoop f x.toNat` (the kernel's `bitsOf` at `f = 512`) and
`M8.pLoop … = S5.pLoop …` (the kernel's `pairs`). -/
@[expose] public section
namespace NL
open Nat

theorem dbt_fact : ∀ j < 64, DBT.getD ((2 ^ j * 285870213051386505 % 2 ^ 64) >>> 58) 0 = j := by decide

theorem u64_sub_one (w : UInt64) (hw : w.toNat ≠ 0) : (w - 1).toNat = w.toNat - 1 := by
  rw [UInt64.toNat_sub]
  have := w.toNat_lt
  have e : (1 : UInt64).toNat = 1 := rfl
  rw [e, show 2 ^ 64 - 1 + w.toNat = (w.toNat - 1) + 2 ^ 64 by omega, Nat.add_mod_right, Nat.mod_eq_of_lt (by omega)]

theorem ctz_spec (w : UInt64) (j : Nat) (hj : w.toNat.testBit j = true) (hlow : ∀ i < j, w.toNat.testBit i = false) :
    ctz w = j := by
  have hj64 : j < 64 := by
    by_contra h; rw [u64_testBit_ge w j (by omega)] at hj; exact absurd hj (by decide)
  have hw0 : w.toNat ≠ 0 := by intro e; rw [e, Nat.zero_testBit] at hj; exact absurd hj (by decide)
  obtain ⟨_, hx⟩ := S5.lowbit_spec hj hlow
  have hl : (w ^^^ (w &&& (w - 1))).toNat = 2 ^ j := by
    rw [UInt64.toNat_xor, UInt64.toNat_and, u64_sub_one w hw0, hx]
  unfold ctz
  have e : (((w ^^^ (w &&& (w - 1))) * DBC) >>> 58).toNat = (2 ^ j * 285870213051386505 % 2 ^ 64) >>> 58 := by
    rw [UInt64.toNat_shiftRight, UInt64.toNat_mul, hl]; rfl
  rw [e]; exact dbt_fact j hj64

theorem M8.wd_zero_of (x : M8) (m : Nat) (hm : m < 8) (h : ∀ i < 64, x.toNat.testBit (64 * m + i) = false) :
    x.wd m = 0 := by
  rw [u64_eq_zero]; apply Nat.eq_of_testBit_eq; intro i
  by_cases hi : i < 64
  · rw [← M8.testBit_wd x m i hm hi, h i hi, Nat.zero_testBit]
  · rw [u64_testBit_ge _ _ (by omega), Nat.zero_testBit]

theorem testBit_lt512 (x : M8) (k : Nat) (hk : x.toNat.testBit k = true) : k < 512 := by
  by_contra h
  rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le x.toNat_lt (Nat.pow_le_pow_right (by norm_num) (by omega)))] at hk
  exact absurd hk (by decide)

/-- the first nonzero word holds the lowest set bit -/
theorem M8.low_word (x : M8) (k : Nat) (hk : x.toNat.testBit k = true) (hlow : ∀ i < k, x.toNat.testBit i = false) :
    (∀ m' < k / 64, x.wd m' = 0) ∧ x.wd (k / 64) ≠ 0 ∧ ctz (x.wd (k / 64)) = k % 64 ∧
      (∀ i, ((x.wd (k / 64)) &&& (x.wd (k / 64) - 1)).toNat.testBit i =
        ((x.wd (k / 64)).toNat.testBit i && decide (i ≠ k % 64))) := by
  have hk512 := testBit_lt512 x k hk
  have hw : (x.wd (k / 64)).toNat.testBit (k % 64) = true := by
    rw [← M8.testBit_wd x _ _ (by omega) (by omega), show 64 * (k / 64) + k % 64 = k by omega]; exact hk
  have hwl : ∀ i < k % 64, (x.wd (k / 64)).toNat.testBit i = false := fun i hi => by
    rw [← M8.testBit_wd x _ _ (by omega) (by omega)]; exact hlow _ (by omega)
  have hne : x.wd (k / 64) ≠ 0 := by intro e; rw [e] at hw; simp at hw
  refine ⟨fun m' hm' => M8.wd_zero_of x m' (by omega) (fun i hi => hlow _ (by omega)), hne, ctz_spec _ _ hw hwl, ?_⟩
  intro i
  have hw0 : (x.wd (k / 64)).toNat ≠ 0 := fun e => hne ((u64_eq_zero _).mpr e)
  rw [UInt64.toNat_and, u64_sub_one _ hw0]
  exact (S5.lowbit_spec hw hwl).1 i

theorem M8.low_spec (x : M8) (k : Nat) (hk : x.toNat.testBit k = true) (hlow : ∀ i < k, x.toNat.testBit i = false) :
    x.low = k := by
  have hk512 := testBit_lt512 x k hk
  obtain ⟨hz, hne, hc, -⟩ := M8.low_word x k hk hlow
  have hm : k / 64 < 8 := by omega
  have ek : k = 64 * (k / 64) + k % 64 := by omega
  revert hz hne hc
  generalize k / 64 = m at hm ek ⊢
  intro hz hne hc
  unfold M8.low
  interval_cases m
  · -- first nonzero word 0
    have hn : x.a0 ≠ 0 := hne
    have hc' : ctz x.a0 = k % 64 := hc
    rw [if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 1
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have hn : x.a1 ≠ 0 := hne
    have hc' : ctz x.a1 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 2
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have hn : x.a2 ≠ 0 := hne
    have hc' : ctz x.a2 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 3
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have hn : x.a3 ≠ 0 := hne
    have hc' : ctz x.a3 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 4
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have hn : x.a4 ≠ 0 := hne
    have hc' : ctz x.a4 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 5
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have hn : x.a5 ≠ 0 := hne
    have hc' : ctz x.a5 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 6
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have h5 : x.a5 = 0 := hz 5 (by norm_num)
    have hn : x.a6 ≠ 0 := hne
    have hc' : ctz x.a6 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_neg (by simp [h5]), if_pos (by simp [hn])]
    rw [hc']; omega
  · -- first nonzero word 7
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have h5 : x.a5 = 0 := hz 5 (by norm_num)
    have h6 : x.a6 = 0 := hz 6 (by norm_num)
    have hn : x.a7 ≠ 0 := hne
    have hc' : ctz x.a7 = k % 64 := hc
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_neg (by simp [h5]), if_neg (by simp [h6])]
    rw [hc']; omega

theorem M8.clrLow_wd (x : M8) (m : Nat) (hm : m < 8) (hz : ∀ m' < m, x.wd m' = 0) (hne : x.wd m ≠ 0) (m' : Nat)
    (hm' : m' < 8) : x.clrLow.wd m' = if m' = m then x.wd m &&& (x.wd m - 1) else x.wd m' := by
  unfold M8.clrLow
  interval_cases m
  · -- first nonzero word 0
    have hn : x.a0 ≠ 0 := hne
    rw [if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 1
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have hn : x.a1 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 2
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have hn : x.a2 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 3
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have hn : x.a3 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 4
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have hn : x.a4 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 5
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have hn : x.a5 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 6
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have h5 : x.a5 = 0 := hz 5 (by norm_num)
    have hn : x.a6 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_neg (by simp [h5]), if_pos (by simp [hn])]
    interval_cases m' <;> simp [M8.wd]
  · -- first nonzero word 7
    have h0 : x.a0 = 0 := hz 0 (by norm_num)
    have h1 : x.a1 = 0 := hz 1 (by norm_num)
    have h2 : x.a2 = 0 := hz 2 (by norm_num)
    have h3 : x.a3 = 0 := hz 3 (by norm_num)
    have h4 : x.a4 = 0 := hz 4 (by norm_num)
    have h5 : x.a5 = 0 := hz 5 (by norm_num)
    have h6 : x.a6 = 0 := hz 6 (by norm_num)
    have hn : x.a7 ≠ 0 := hne
    rw [if_neg (by simp [h0]), if_neg (by simp [h1]), if_neg (by simp [h2]), if_neg (by simp [h3]), if_neg (by simp [h4]), if_neg (by simp [h5]), if_neg (by simp [h6])]
    interval_cases m' <;> simp [M8.wd]

theorem M8.clrLow_spec (x : M8) (h0 : x.toNat ≠ 0) : x.clrLow.toNat = x.toNat &&& (x.toNat - 1) := by
  obtain ⟨k, hk, hlow⟩ := S5.exists_low_bit h0
  have hk512 := testBit_lt512 x k hk
  obtain ⟨hz, hne, -, hb⟩ := M8.low_word x k hk hlow
  have hb2 := (S5.lowbit_spec hk hlow).1
  apply M8.toNat_eq _ _ (lt_of_le_of_lt Nat.and_le_left x.toNat_lt)
  intro i hi
  rw [hb2, M8.bit_wd _ _ hi, M8.clrLow_wd x _ (by omega) hz hne _ (by omega)]
  have hx : x.toNat.testBit i = (x.wd (i / 64)).toNat.testBit (i % 64) := by rw [M8.testBit_toNat, M8.bit_wd _ _ hi]
  rw [hx]
  by_cases e : i / 64 = k / 64
  · rw [if_pos e, hb, e]
    have : (i % 64 ≠ k % 64) ↔ (i ≠ k) := by omega
    simp [this]
  · rw [if_neg e]
    have : i ≠ k := fun h => e (by rw [h])
    simp [this]

/-- **`M8.bLoop` is the kernel's enumeration** (`BC5.bitsOf m = S5.bLoop 512 m`) -/
theorem M8.bLoop_eq : ∀ f (x : M8), M8.bLoop f x = S5.bLoop f x.toNat
  | 0, _ => rfl
  | f + 1, x => by
    rw [M8.bLoop, S5.bLoop_succ, M8.isZero_eq]
    cases h : Nat.beq x.toNat 0
    · have hm0 : x.toNat ≠ 0 := Nat.ne_of_beq_eq_false h
      obtain ⟨k, hk, hlow⟩ := S5.exists_low_bit hm0
      obtain ⟨_, hx⟩ := S5.lowbit_spec hk hlow
      have hk512 := testBit_lt512 x k hk
      simp only [cond_false, Bool.false_eq_true, if_false]
      rw [hx, S5.lg2_pow k hk512, M8.low_spec x k hk hlow, ← M8.clrLow_spec x hm0, M8.bLoop_eq f]
    · simp

/-- **`M8.pLoop` is the kernel's `pairs`** (`BC5.pairs bfirst c m tail = S5.pLoop bfirst c tail 512 m`) -/
theorem M8.pLoop_eq (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) :
    ∀ f (x : M8), M8.pLoop bfirst c tail f x = S5.pLoop bfirst c tail f x.toNat
  | 0, _ => rfl
  | f + 1, x => by
    rw [M8.pLoop, S5.pLoop_succ, M8.isZero_eq]
    cases h : Nat.beq x.toNat 0
    · have hm0 : x.toNat ≠ 0 := Nat.ne_of_beq_eq_false h
      obtain ⟨k, hk, hlow⟩ := S5.exists_low_bit hm0
      obtain ⟨_, hx⟩ := S5.lowbit_spec hk hlow
      have hk512 := testBit_lt512 x k hk
      simp only [cond_false, Bool.false_eq_true, if_false]
      rw [hx, S5.lg2_pow k hk512, M8.low_spec x k hk hlow, ← M8.clrLow_spec x hm0, M8.pLoop_eq bfirst c tail f]
      cases bfirst <;> rfl
    · simp

theorem bitsOf_eq (x : M8) : M8.bLoop 512 x = BC5.bitsOf x.toNat := M8.bLoop_eq 512 x
theorem pairs_eq (bfirst : Bool) (c : Nat) (tail : List (Nat × Nat)) (x : M8) :
    M8.pLoop bfirst c tail 512 x = BC5.pairs bfirst c x.toNat tail := M8.pLoop_eq bfirst c tail 512 x

end NL
