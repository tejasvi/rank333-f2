module
public import R22Port.U_d41d8cd98f00
public import NNP.Dict
public import L5.Node5O
/-! # NNP.Frame: the child frame of a native node step

* `setBit8_view`, `noBitsFrom_lt`: the prefix `S' = S ∪ {last}` and the prefix test;
* `dead_view` (the bits of `D'`), `conf_view` (`N' = N ∪ c2t[last]`), `addU_view` (`U' = U + h`);
* `dead_ok'`: `node5`'s dead-mask argument (`L5O.dead_ok`) for a dead mask given by its bits. -/
@[expose] public section
set_option maxHeartbeats 1000000
namespace NNP
open NN R3RT.SpecO
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## Masks inside a limb -/

theorem fromW_bit (lo k j : Nat) (hj : j < 64) : (fromW lo k).toNat.testBit j = decide (lo ≤ 64 * k + j) := by
  unfold fromW
  split
  · rename_i h
    rw [show ((0xFFFFFFFFFFFFFFFF : UInt64)).toNat = 2 ^ 64 - 1 from rfl, Nat.testBit_two_pow_sub_one,
      decide_eq_true hj, decide_eq_true (by omega)]
  · split
    · rename_i h1 h2; rw [tb_zero, decide_eq_false (by omega)]
    · rename_i h1 h2
      rw [tb_shl_ones _ _ (by omega)]
      exact decide_eq_decide.mpr (by omega)

theorem aboveW_bit (lo k j : Nat) (hj : j < 64) (hk : k < 8) :
    (aboveW lo k).toNat.testBit j = decide (lo ≤ 64 * k + j ∧ 64 * k + j < 511) := by
  unfold aboveW
  have hhi : ((if k = 7 then (0x7FFFFFFFFFFFFFFF : UInt64) else 0xFFFFFFFFFFFFFFFF)).toNat.testBit j =
      decide (64 * k + j < 511) := by
    split
    · rename_i h7; subst h7
      rw [show ((0x7FFFFFFFFFFFFFFF : UInt64)).toNat = 2 ^ 63 - 1 from rfl, Nat.testBit_two_pow_sub_one]
      exact decide_eq_decide.mpr (by omega)
    · rename_i h7
      rw [show ((0xFFFFFFFFFFFFFFFF : UInt64)).toNat = 2 ^ 64 - 1 from rfl, Nat.testBit_two_pow_sub_one]
      exact decide_eq_decide.mpr (by omega)
  simp only []
  split
  · rename_i h; rw [hhi]; exact decide_eq_decide.mpr (by omega)
  · split
    · rename_i h1 h2; rw [tb_zero]; exact (decide_eq_false (by omega)).symm
    · rename_i h1 h2
      rw [tb_and, hhi, tb_shl_ones _ _ (by omega)]
      by_cases ha : lo ≤ 64 * k + j <;> by_cases hb : 64 * k + j < 511 <;> simp [ha, hb] <;> omega

/-! ## The prefix -/

theorem setBit8_view (S : Array UInt64) (l : Nat) (hl : l < 512) :
    natL (setBit8 S l) 0 8 = natL S 0 8 ||| 2 ^ l := by
  unfold setBit8
  rw [natL_range_map]
  apply Nat.eq_of_testBit_eq; intro i
  rw [natF_testBit, Nat.testBit_or, natL_testBit, Nat.testBit_two_pow, getElem!_eq_getD', Nat.zero_add]
  by_cases hi : i < 512
  · simp only [decide_eq_true (show i < 64 * 8 by omega), Bool.true_and]
    by_cases hq : i / 64 = l / 64
    · rw [if_pos hq, tb_or, tb_one_shl _ _ (Nat.mod_lt _ (by norm_num))]
      have : (i % 64 = l % 64) ↔ (l = i) := by omega
      simp only [this]
    · rw [if_neg hq]
      have : ¬ (l = i) := by intro h; apply hq; rw [h]
      simp only [this, decide_false, Bool.or_false]
  · simp only [decide_eq_false (show ¬ i < 64 * 8 by omega), Bool.false_and, Bool.false_or]
    exact (decide_eq_false (by omega)).symm

theorem noBitsFrom_lt (S : Array UInt64) (lo : Nat) (h : noBitsFrom S lo = true) : natL S 0 8 < 2 ^ lo := by
  apply Nat.lt_pow_two_of_testBit; intro i hi
  rw [natL_testBit]
  by_cases h512 : i < 64 * 8
  · rw [decide_eq_true h512, Bool.true_and, Nat.zero_add]
    have hk := (allN_iff _ _).mp h (i / 64) (by omega)
    simp only [beq_iff_eq] at hk
    have hb := congrArg (fun x : UInt64 => x.toNat.testBit (i % 64)) hk
    simp only at hb
    rw [tb_and, fromW_bit _ _ _ (Nat.mod_lt _ (by norm_num)), decide_eq_true (by omega), Bool.and_true, tb_zero] at hb
    rw [Array.getElem!_eq_getD]; exact hb
  · rw [decide_eq_false h512, Bool.false_and]

/-! ## The dead mask -/

/-- the bits of the child dead mask `D' = D ∪ N[last] ∪ (V rows)` -/
theorem dead_view (tab : Tab) (ids : Array Nat) (D N : Array UInt64) (last nV : Nat) (hnV : nV ≤ ids.size) (hl : last < 511)
    (l : Nat) (hl5 : l < 512)
    (h : (natL ((Array.range 8).map fun k => (D.getD k 0) ||| (N.getD (8 * last + k) 0) ||| orN (fun p => dW tab ids nV p k) nV)
      0 8).testBit l = true) :
    (natL D 0 8).testBit l = true ∨ (natL N 0 4096 >>> (512 * last)).testBit l = true ∨
      ∃ p < nV, (dictRowV tab ids p).testBit l = true := by
  rw [natL_range_map, natF_testBit, decide_eq_true (by omega), Bool.true_and, tb_or, tb_or] at h
  simp only [Bool.or_eq_true] at h
  rcases h with (h | h) | h
  · left; rw [natL_testBit, decide_eq_true (by omega), Bool.true_and, Array.getElem!_eq_getD, Nat.zero_add]; exact h
  · right; left
    rw [Nat.testBit_shiftRight, natL_testBit, decide_eq_true (by omega), Bool.true_and, Array.getElem!_eq_getD,
      Nat.zero_add, show (512 * last + l) / 64 = 8 * last + l / 64 by omega, show (512 * last + l) % 64 = l % 64 by omega]
    exact h
  · right; right
    obtain ⟨p, hp, hb⟩ := (orN_testBit _ _ _).mp h
    refine ⟨p, hp, ?_⟩
    unfold dW at hb; rw [if_pos hp] at hb
    unfold dictRowV; rw [if_pos (by omega), rowT_testBit, decide_eq_true hl5, Bool.true_and]; exact hb

/-- **the dead mask of the child frame** (`L5O.dead_ok` for a dead mask given by its bits) -/
theorem dead_ok' (S D N D' last nV : ℕ) (rowV' : ℕ → ℕ) (A : R3RT.Spec.Dec22) (hΩ : Ω A) (hlast : last < 511)
    (hSlt : S < 2 ^ last) (hS0 : 0 < S)
    (hFA : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S (R3RT.Spec.lastOf S) →
      (∀ l, R3RT.Spec.lastOf S < l → l < 511 → D.testBit l = true → ¬ Has O A l) ∧
      (∀ v w, v < 511 → w < 511 → S.testBit v = false → S.testBit w = false → v ≠ w →
        (N >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w))
    (hrows : ∀ p < nV, RowOK O Ω (rowV' p % 2 ^ 511) (L5.pcnt 512 (rowV' p &&& (S ||| 2 ^ last))))
    (hD' : ∀ l, l < 511 → D'.testBit l = true →
      D.testBit l = true ∨ (N >>> (512 * last)).testBit l = true ∨ ∃ p < nV, (rowV' p).testBit l = true)
    (hB : Below O A (S ||| 2 ^ last) last) :
    ∀ l, last < l → l < 511 → D'.testBit l = true → ¬ Has O A l := by
  intro l hl1 hl2 hD hA
  have hBp := L5O.below_parent A S last hB hS0 hSlt
  have hlS : R3RT.Spec.lastOf S < last := L5O.lastOf_lt S _ hS0 hSlt
  have hS'lt : S ||| 2 ^ last < 2 ^ 511 := by
    rw [L5O.or_pow_eq S _ hSlt]
    calc 2 ^ last + S < 2 ^ last + 2 ^ last := by omega
      _ = 2 ^ (last + 1) := by rw [pow_succ]; ring
      _ ≤ 2 ^ 511 := Nat.pow_le_pow_right (by norm_num) (by omega)
  have hbits : ∀ l', (S ||| 2 ^ last).testBit l' = true → l' ≤ last := by
    intro l' h'
    rw [L5O.testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq] at h'
    rcases h' with h' | h'
    · have := L5O.bits_le_lastOf S l' h'; omega
    · omega
  rcases hD' l hl2 hD with hD | hD | ⟨p, hp, hbit⟩
  · exact (hFA A hΩ hBp).1 l (by omega) hl2 hD hA
  · have hSl : S.testBit last = false := Nat.testBit_lt_two_pow hSlt
    have hSw : S.testBit l = false := Nat.testBit_lt_two_pow
      (lt_of_lt_of_le hSlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
    exact (hFA A hΩ hBp).2 last l hlast hl2 hSl hSw (by omega) hD (L5O.below_has_last A S _ hB hlast) hA
  · have hR := hrows p hp
    have := L5O.row_count A hΩ _ last _ _ hS'lt hbits hB hR {l} (by
      intro x hx; rw [Finset.mem_singleton] at hx; subst hx
      refine ⟨hA, hbit, ?_⟩
      cases h' : (S ||| 2 ^ last).testBit x
      · rfl
      · have := hbits x h'; omega)
    simp at this

/-! ## The conflict table and the counters -/

theorem conf_view (N c2 : Array UInt64) :
    natL ((Array.range 4096).map fun k => (N.getD k 0) ||| (c2.getD k 0)) 0 4096 = natL N 0 4096 ||| natL c2 0 4096 := by
  rw [natL_range_map]
  apply Nat.eq_of_testBit_eq; intro i
  rw [natF_testBit, Nat.testBit_or, natL_testBit, natL_testBit, tb_or, getElem!_eq_getD', getElem!_eq_getD',
    Nat.zero_add]
  cases decide (i < 64 * 4096) <;> simp

theorem addU_get (U h : ByteArray) (X : Nat) (hX : X < 512) : (addU U h).get! X = U.get! X + h.get! X := by
  unfold addU
  show ((Array.range 512).map fun X => U.get! X + h.get! X)[X]! = _
  rw [Array.getElem!_eq_getD, getD_range_map, if_pos hX]

theorem natU7_add (U h : ByteArray) (hok : addUOK U h = true) : ∀ n, n ≤ 512 → natU7 (addU U h) n = natU7 U n + natU7 h n
  | 0, _ => rfl
  | n + 1, hn => by
    rw [natU7, natU7, natU7, natU7_add U h hok n (by omega), addU_get U h n (by omega)]
    have h1 := (allN_iff _ _).mp hok n (by omega)
    simp only [decide_eq_true_eq] at h1
    rw [UInt8.toNat_add, Nat.mod_eq_of_lt (by omega)]
    ring

theorem addU_view (U h : ByteArray) (hok : addUOK U h = true) : natU (addU U h) = natU U + natU h :=
  natU7_add U h hok 512 le_rfl

theorem addU_size (U h : ByteArray) : (addU U h).size = 512 := by
  unfold addU; simp [ByteArray.size]

theorem addU_lt (U h : ByteArray) (hok : addUOK U h = true) : ∀ X, X < 512 → ((addU U h).get! X).toNat < 128 := by
  intro X hX
  rw [addU_get U h X hX]
  have h1 := (allN_iff _ _).mp hok X hX
  simp only [decide_eq_true_eq] at h1
  rw [UInt8.toNat_add, Nat.mod_eq_of_lt (by omega)]; exact h1

end NNP
