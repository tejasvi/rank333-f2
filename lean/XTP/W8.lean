module
public import R22Port.U_bbfd25d9ed1e
public import Mathlib
public import L5.Pk5
public import NNP.Core
public import XT.W8
/-! # XTP.W8: the masks `XT.W8` as Nats

`view` is the Nat of the eight words; every operation of `XT.W8` is characterized bit by bit:
`testBit_view` (bit `l` = bit `l % 64` of word `l / 64`, nothing from 512 on), `W8.testBit` = the view's bit, and/or/andn,
`clrBit`, `setBit`, `beq`, the popcounts (`L5.pcnt 512`), `ofLimbs` (`NN.natL`), `window`, `all511`, `ofNat`.  Also the word
popcount `popK`/`pc64` and the lowest-bit index `lowIdx`. -/
@[expose] public section
namespace XTP
open XT

/-! ## Words -/

theorem toNat_one_shlU (s : UInt64) (hs : s.toNat < 64) : ((1 : UInt64) <<< s).toNat = 2 ^ s.toNat := by
  rw [UInt64.toNat_shiftLeft, Nat.mod_eq_of_lt hs, show ((1 : UInt64)).toNat = 1 from rfl, Nat.one_shiftLeft,
    Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by norm_num) hs)]

/-- the word test `(a >>> s) &&& 1 != 0` is bit `s` -/
theorem bit_word (a s : UInt64) (hs : s.toNat < 64) : ((a >>> s) &&& 1 != 0) = a.toNat.testBit s.toNat := by
  have h : ((a >>> s) &&& 1).toNat = a.toNat / 2 ^ s.toNat % 2 := by
    rw [UInt64.toNat_and, UInt64.toNat_shiftRight, Nat.mod_eq_of_lt hs, show ((1 : UInt64)).toNat = 1 from rfl,
      Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow]
  rw [Nat.testBit_eq_decide_div_mod_eq]
  have h2 : a.toNat / 2 ^ s.toNat % 2 < 2 := Nat.mod_lt _ (by norm_num)
  cases hb : decide (a.toNat / 2 ^ s.toNat % 2 = 1) with
  | false =>
    have h0 : a.toNat / 2 ^ s.toNat % 2 = 0 := by simp at hb; omega
    have : (a >>> s) &&& 1 = 0 := UInt64.toNat_inj.mp (by rw [h, h0]; rfl)
    rw [this]; rfl
  | true =>
    have h1 : a.toNat / 2 ^ s.toNat % 2 = 1 := by simpa using hb
    have : (a >>> s) &&& 1 ≠ 0 := by intro h0; have := congrArg UInt64.toNat h0; rw [h, h1] at this; simp at this
    simp [this]

theorem toNat_one_shl (k : ℕ) (hk : k < 64) : ((1 : UInt64) <<< k.toUInt64).toNat = 2 ^ k := by
  rw [UInt64.toNat_shiftLeft]
  have e1 : (k.toUInt64).toNat % 64 = k := by
    rw [Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_eq_of_lt (show k < 2 ^ 64 by omega), Nat.mod_eq_of_lt hk]
  rw [e1, show ((1 : UInt64)).toNat = 1 from rfl, Nat.one_shiftLeft, Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by norm_num) hk)]

theorem testBit_toNat_lt (x : UInt64) (j : ℕ) (hj : 64 ≤ j) : x.toNat.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le (UInt64.toNat_lt x) (Nat.pow_le_pow_right (by norm_num) hj))

/-- `x &&& (x - 1)` clears exactly the lowest set bit -/
theorem andPred_bits (x : UInt64) (hx : x ≠ 0) :
    ∃ k, k < 64 ∧ x.toNat.testBit k = true ∧ (∀ j, j < k → x.toNat.testBit j = false) ∧
      ∀ j, (x &&& (x - 1)).toNat.testBit j = (x.toNat.testBit j && decide (j ≠ k)) := by
  have hx0 : x.toNat ≠ 0 := by intro h; apply hx; exact UInt64.toNat_inj.mp (by simpa using h)
  have h2 : (x - 1).toNat = x.toNat - 1 := by
    rw [UInt64.toNat_sub_of_le]; · rfl
    · rw [UInt64.le_iff_toNat_le]; show 1 ≤ x.toNat; omega
  obtain ⟨k, m, hm, hxk⟩ := Nat.exists_eq_two_pow_mul_odd hx0
  obtain ⟨m', rfl⟩ := hm
  have hk1 : 1 ≤ 2 ^ k := Nat.one_le_two_pow
  have hsub : 2 ^ k * (2 * m' + 1) - 1 = 2 ^ k * (2 * m') + (2 ^ k - 1) := by rw [Nat.mul_add, Nat.mul_one]; omega
  have hbit : ∀ j, x.toNat.testBit j = (decide (k ≤ j) && (2 * m' + 1).testBit (j - k)) := by
    intro j; rw [hxk, Nat.testBit_two_pow_mul]
  refine ⟨k, ?_, ?_, ?_, ?_⟩
  · by_contra hc; push Not at hc
    have := testBit_toNat_lt x k hc
    rw [hbit] at this; simp [Nat.testBit_zero] at this
  · rw [hbit]; simp [Nat.testBit_zero]
  · intro j hj; rw [hbit]; simp; omega
  · intro j
    rw [UInt64.toNat_and, h2, Nat.testBit_and, hxk, hsub, Nat.testBit_two_pow_mul_add _ (by omega : 2 ^ k - 1 < 2 ^ k),
      Nat.testBit_two_pow_mul]
    by_cases hjk : j < k
    · simp [hjk, show ¬ (k ≤ j) by omega]
    · rcases Nat.eq_or_lt_of_le (Nat.not_lt.mp hjk) with hj | hj
      · subst hj; simp [Nat.testBit_zero]
      · simp only [hjk, if_false, show k ≤ j by omega, decide_true, Bool.true_and]
        obtain ⟨t, ht⟩ : ∃ t, j - k = t + 1 := ⟨j - k - 1, by omega⟩
        rw [ht, Nat.testBit_succ, Nat.testBit_succ]
        have e1 : (2 * m' + 1) / 2 = m' := by omega
        have e2 : (2 * m') / 2 = m' := by omega
        rw [e1, e2]; simp; omega

/-- `popK x c = c + |x|` -/
theorem popK_toNat : ∀ (x c : UInt64), c.toNat + L5.pcnt 64 x.toNat < 2 ^ 64 →
    (popK x c).toNat = c.toNat + L5.pcnt 64 x.toNat := by
  intro x
  induction x using WellFounded.induction (r := fun a b : UInt64 => a.toNat < b.toNat)
    (hwf := (measure (fun a : UInt64 => a.toNat)).wf) with
  | h x ih =>
    intro c hc
    rw [popK]
    by_cases hx : x = 0
    · rw [dif_pos hx]; subst hx; simp [L5.pcnt_zero_x]
    · rw [dif_neg hx]
      obtain ⟨k, hk, hxk, _, hy⟩ := andPred_bits x hx
      have hpc : L5.pcnt 64 x.toNat = L5.pcnt 64 (x &&& (x - 1)).toNat + 1 := by
        rw [L5.pcnt_eq_card, L5.pcnt_eq_card]
        have : (Finset.range 64).filter (fun j => x.toNat.testBit j = true) =
            insert k ((Finset.range 64).filter (fun j => (x &&& (x - 1)).toNat.testBit j = true)) := by
          ext j; simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_insert, hy]
          constructor
          · rintro ⟨hj, hb⟩; by_cases hjk : j = k
            · left; exact hjk
            · right; simp [hj, hb, hjk]
          · rintro (rfl | ⟨hj, hb⟩)
            · exact ⟨hk, hxk⟩
            · simp only [Bool.and_eq_true] at hb; exact ⟨hj, hb.1⟩
        rw [this, Finset.card_insert_of_notMem (by
          rw [Finset.mem_filter]; rintro ⟨_, h⟩; rw [hy] at h; simp at h)]
      have hc1 : (c + 1).toNat = c.toNat + 1 := by
        rw [UInt64.toNat_add]; simp; omega
      rw [ih _ (andPred_lt x hx) (c + 1) (by rw [hc1]; omega), hc1, hpc]; ring

theorem pc64_toNat (x : UInt64) : (pc64 x).toNat = L5.pcnt 64 x.toNat := by
  unfold pc64
  rw [popK_toNat x 0 (by have := L5.pcnt_le 64 x.toNat; simp; omega)]; simp

theorem pcnt_two_pow_sub_one (k : ℕ) (hk : k ≤ 64) : L5.pcnt 64 (2 ^ k - 1) = k := by
  rw [L5.pcnt_eq_card]
  have : (Finset.range 64).filter (fun j => (2 ^ k - 1).testBit j = true) = Finset.range k := by
    ext j; simp only [Finset.mem_filter, Finset.mem_range, Nat.testBit_two_pow_sub_one, decide_eq_true_eq]; omega
  rw [this, Finset.card_range]

/-- the lowest set bit of a nonzero word is at `lowIdx x`; `x &&& (x - 1)` clears it -/
theorem lowIdx_spec (x : UInt64) (hx : x ≠ 0) :
    (lowIdx x).toNat < 64 ∧ x.toNat.testBit (lowIdx x).toNat = true ∧
      (∀ j, j < (lowIdx x).toNat → x.toNat.testBit j = false) ∧
      (∀ j, (x &&& (x - 1)).toNat.testBit j = (x.toNat.testBit j && decide (j ≠ (lowIdx x).toNat))) ∧
      (x ^^^ (x &&& (x - 1))).toNat = 2 ^ (lowIdx x).toNat := by
  obtain ⟨k, hk, hxk, hlow, hy⟩ := andPred_bits x hx
  have hb : (x ^^^ (x &&& (x - 1))).toNat = 2 ^ k := by
    apply Nat.eq_of_testBit_eq; intro j
    rw [UInt64.toNat_xor, Nat.testBit_xor, hy, Nat.testBit_two_pow]
    by_cases hjk : j = k
    · subst hjk; simp [hxk]
    · simp [hjk, Ne.symm hjk]
  have hi : (lowIdx x).toNat = k := by
    unfold lowIdx
    rw [pc64_toNat]
    have hb1 : ((x ^^^ (x &&& (x - 1))) - 1).toNat = 2 ^ k - 1 := by
      rw [UInt64.toNat_sub_of_le]; · rw [hb]; rfl
      · rw [UInt64.le_iff_toNat_le, hb]; show 1 ≤ 2 ^ k; exact Nat.one_le_two_pow
    rw [hb1, pcnt_two_pow_sub_one k (by omega)]
  rw [hi]
  exact ⟨hk, hxk, hlow, hy, hb⟩

/-! ## Masks -/

namespace W8

theorem view_eq_natL (x : W8) : x.view = NN.natL x.arr 0 8 := by
  simp [W8.view, NN.natL, XT.W8.arr]

theorem limb_eq (x : W8) (i : ℕ) : x.limb i = x.arr[i]! := by
  rcases x with ⟨a0, a1, a2, a3, a4, a5, a6, a7⟩
  match i with
  | 0 => rfl | 1 => rfl | 2 => rfl | 3 => rfl | 4 => rfl | 5 => rfl | 6 => rfl | 7 => rfl
  | i + 8 => simp [XT.W8.limb, XT.W8.arr]; rfl

theorem testBit_view (x : W8) (l : ℕ) : x.view.testBit l = (decide (l < 512) && (x.limb (l / 64)).toNat.testBit (l % 64)) := by
  rw [view_eq_natL, NNP.natL_testBit, limb_eq]; simp

theorem view_lt (x : W8) : x.view < 2 ^ 512 := by rw [view_eq_natL]; exact NNP.natL_lt _ 8 0

theorem view_ext {x y : W8} (h : ∀ i < 8, x.limb i = y.limb i) : x.view = y.view := by
  apply Nat.eq_of_testBit_eq; intro l
  rw [testBit_view, testBit_view]
  by_cases hl : l < 512
  · rw [h (l / 64) (by omega)]
  · simp [hl]

theorem eq_of_limbs {x y : W8} (h : ∀ i < 8, x.limb i = y.limb i) : x = y := by
  rcases x with ⟨a0, a1, a2, a3, a4, a5, a6, a7⟩; rcases y with ⟨b0, b1, b2, b3, b4, b5, b6, b7⟩
  have h0 := h 0 (by norm_num); have h1 := h 1 (by norm_num); have h2 := h 2 (by norm_num); have h3 := h 3 (by norm_num)
  have h4 := h 4 (by norm_num); have h5 := h 5 (by norm_num); have h6 := h 6 (by norm_num); have h7 := h 7 (by norm_num)
  simp only [W8.limb] at h0 h1 h2 h3 h4 h5 h6 h7
  subst h0 h1 h2 h3 h4 h5 h6 h7; rfl

theorem limbs_of_view {x y : W8} (h : x.view = y.view) : x = y := by
  apply eq_of_limbs; intro i hi
  apply UInt64.toNat_inj.mp
  apply Nat.eq_of_testBit_eq; intro j
  by_cases hj : j < 64
  · have := congrArg (fun z => z.testBit (64 * i + j)) h
    simp only [testBit_view] at this
    rwa [decide_eq_true (by omega), show (64 * i + j) / 64 = i by omega, show (64 * i + j) % 64 = j by omega] at this
  · rw [testBit_toNat_lt _ _ (by omega), testBit_toNat_lt _ _ (by omega)]

theorem limbU_eq (x : W8) (i : UInt64) : x.limbU i = x.limb i.toNat := by
  unfold XT.W8.limbU
  have hi : i.toNat < 2 ^ 64 := UInt64.toNat_lt i
  by_cases h8 : i.toNat < 8
  · have hcases : i.toNat = 0 ∨ i.toNat = 1 ∨ i.toNat = 2 ∨ i.toNat = 3 ∨ i.toNat = 4 ∨ i.toNat = 5 ∨ i.toNat = 6 ∨
        i.toNat = 7 := by omega
    rcases hcases with h | h | h | h | h | h | h | h <;>
    · have hi' : i = UInt64.ofNat i.toNat := by simp
      rw [h] at hi'; subst hi'; rfl
  · have h4 : ¬ i < 4 := by rw [UInt64.lt_iff_toNat_lt]; simp; omega
    have h8' : ¬ i < 8 := by rw [UInt64.lt_iff_toNat_lt]; simp; omega
    rw [if_neg h4, if_neg h8']
    match hm : i.toNat with
    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 => omega
    | k + 8 => rfl

theorem shr6 (l : ℕ) (hl : l < 512) : (l.toUInt64 >>> 6).toNat = l / 64 := by
  rw [UInt64.toNat_shiftRight, Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_eq_of_lt (by omega)]
  simp [Nat.shiftRight_eq_div_pow]

theorem and63 (l : ℕ) (hl : l < 512) : (l.toUInt64 &&& 63).toNat = l % 64 := by
  rw [UInt64.toNat_and, Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.mod_eq_of_lt (by omega),
    show ((63 : UInt64)).toNat = 2 ^ 6 - 1 from rfl, Nat.and_two_pow_sub_one_eq_mod]

/-- the checker's bit test is the view's bit -/
theorem testBit_eq (x : W8) (l : ℕ) : x.testBit l = x.view.testBit l := by
  unfold XT.W8.testBit
  rw [testBit_view]
  by_cases hl : l < 512
  · rw [if_pos hl, decide_eq_true hl, Bool.true_and, limbU_eq, shr6 l hl, bit_word _ _ (by rw [and63 l hl]; omega),
      and63 l hl]
  · rw [if_neg hl]; simp [hl]

theorem limb_and (x y : W8) (i : ℕ) : (x.and y).limb i = x.limb i &&& y.limb i := by
  match i with
  | 0 => rfl | 1 => rfl | 2 => rfl | 3 => rfl | 4 => rfl | 5 => rfl | 6 => rfl | 7 => rfl
  | i + 8 => simp [W8.limb]
theorem limb_or (x y : W8) (i : ℕ) : (x.or y).limb i = x.limb i ||| y.limb i := by
  match i with
  | 0 => rfl | 1 => rfl | 2 => rfl | 3 => rfl | 4 => rfl | 5 => rfl | 6 => rfl | 7 => rfl
  | i + 8 => simp [W8.limb]
theorem limb_andn (x y : W8) (i : ℕ) : (x.andn y).limb i = x.limb i &&& ~~~(y.limb i) := by
  match i with
  | 0 => rfl | 1 => rfl | 2 => rfl | 3 => rfl | 4 => rfl | 5 => rfl | 6 => rfl | 7 => rfl
  | i + 8 => simp [W8.limb]

theorem testBit_and (x y : W8) (l : ℕ) : (x.and y).view.testBit l = (x.view.testBit l && y.view.testBit l) := by
  simp only [testBit_view, limb_and, UInt64.toNat_and, Nat.testBit_and]
  cases decide (l < 512) <;> simp
theorem testBit_or (x y : W8) (l : ℕ) : (x.or y).view.testBit l = (x.view.testBit l || y.view.testBit l) := by
  simp only [testBit_view, limb_or, UInt64.toNat_or, Nat.testBit_or]
  cases decide (l < 512) <;> simp
theorem testBit_not (y : UInt64) (j : ℕ) (hj : j < 64) : (~~~y).toNat.testBit j = !y.toNat.testBit j := by
  rw [← UInt64.toNat_toBitVec, ← UInt64.toNat_toBitVec, BitVec.testBit_toNat, BitVec.testBit_toNat, UInt64.toBitVec_not,
    BitVec.getLsbD_not]
  simp [hj]

theorem testBit_andn (x y : W8) (l : ℕ) : (x.andn y).view.testBit l = (x.view.testBit l && !y.view.testBit l) := by
  simp only [testBit_view, limb_andn, UInt64.toNat_and, Nat.testBit_and]
  by_cases hl : l < 512
  · simp only [hl, decide_true, Bool.true_and]
    rw [testBit_not _ _ (by omega)]
  · simp [hl]

theorem view_and (x y : W8) : (x.and y).view = x.view &&& y.view := by
  apply Nat.eq_of_testBit_eq; intro l; rw [testBit_and, Nat.testBit_and]
theorem view_or (x y : W8) : (x.or y).view = x.view ||| y.view := by
  apply Nat.eq_of_testBit_eq; intro l; rw [testBit_or, Nat.testBit_or]

theorem view_andn (x y : W8) : (x.andn y).view = x.view ^^^ (x.view &&& y.view) := by
  apply Nat.eq_of_testBit_eq; intro l
  rw [testBit_andn, Nat.testBit_xor, Nat.testBit_and]
  cases x.view.testBit l <;> cases y.view.testBit l <;> rfl

theorem limb_setLimbU (x : W8) (i : UInt64) (v : UInt64) (k : ℕ) :
    (x.setLimbU i v).limb k = if k = i.toNat ∧ k < 8 then v else x.limb k := by
  unfold XT.W8.setLimbU
  have hi : i.toNat < 2 ^ 64 := UInt64.toNat_lt i
  by_cases h8 : i.toNat < 8
  · have hcases : i.toNat = 0 ∨ i.toNat = 1 ∨ i.toNat = 2 ∨ i.toNat = 3 ∨ i.toNat = 4 ∨ i.toNat = 5 ∨ i.toNat = 6 ∨
        i.toNat = 7 := by omega
    rcases hcases with h | h | h | h | h | h | h | h <;>
    · have hi' : i = UInt64.ofNat i.toNat := by simp
      rw [h] at hi' ⊢; subst hi'
      match k with
      | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 => rfl
      | k + 8 => simp [W8.limb]
  · have h4 : ¬ i < 4 := by rw [UInt64.lt_iff_toNat_lt]; simp; omega
    have h8' : ¬ i < 8 := by rw [UInt64.lt_iff_toNat_lt]; simp; omega
    rw [if_neg h4, if_neg h8']
    simp only [show ¬ (k = i.toNat ∧ k < 8) by omega, if_false]

theorem testBit_clrBit (x : W8) (l j : ℕ) : (x.clrBit l).view.testBit j = (x.view.testBit j && decide (j ≠ l)) := by
  unfold XT.W8.clrBit
  by_cases hl : l < 512
  · rw [if_pos hl, testBit_view, testBit_view, limb_setLimbU, shr6 l hl]
    by_cases hj : j < 512
    · simp only [hj, decide_true, Bool.true_and]
      by_cases hw : j / 64 = l / 64
      · rw [if_pos ⟨hw, by omega⟩, hw, UInt64.toNat_and, Nat.testBit_and, testBit_not _ _ (by omega), limbU_eq, shr6 l hl,
          toNat_one_shlU _ (by rw [and63 l hl]; omega), and63 l hl, Nat.testBit_two_pow]
        by_cases hjl : j = l
        · subst hjl; simp
        · have : l % 64 ≠ j % 64 := by omega
          simp [this, hjl]
      · rw [if_neg (by omega)]
        have : j ≠ l := by intro h; apply hw; rw [h]
        simp [this]
    · simp [hj]
  · rw [if_neg hl]
    by_cases hjl : j = l
    · subst hjl; rw [testBit_view]; simp [hl]
    · simp [hjl]

theorem testBit_setBit (x : W8) (l j : ℕ) (hl : l < 512) :
    (x.setBit l).view.testBit j = (x.view.testBit j || decide (j = l)) := by
  unfold XT.W8.setBit
  rw [if_pos hl, testBit_view, testBit_view, limb_setLimbU, shr6 l hl]
  by_cases hj : j < 512
  · simp only [hj, decide_true, Bool.true_and]
    by_cases hw : j / 64 = l / 64
    · rw [if_pos ⟨hw, by omega⟩, hw, UInt64.toNat_or, Nat.testBit_or, limbU_eq, shr6 l hl,
        toNat_one_shlU _ (by rw [and63 l hl]; omega), and63 l hl, Nat.testBit_two_pow]
      by_cases hjl : j = l
      · subst hjl; simp
      · have : l % 64 ≠ j % 64 := by omega
        simp [this, hjl]
    · rw [if_neg (by omega)]
      have : j ≠ l := by intro h; apply hw; rw [h]
      simp [this]
  · have : j ≠ l := by omega
    simp [hj, this]

theorem beq_eq_true {x y : W8} (h : x.beq y = true) : x = y := by
  unfold W8.beq at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  rcases x with ⟨a0, a1, a2, a3, a4, a5, a6, a7⟩; rcases y with ⟨b0, b1, b2, b3, b4, b5, b6, b7⟩
  simp only at h0 h1 h2 h3 h4 h5 h6 h7
  subst h0 h1 h2 h3 h4 h5 h6 h7; rfl

theorem pcnt512_view (x : W8) : L5.pcnt 512 x.view = L5.pcnt 64 x.a0.toNat + L5.pcnt 64 x.a1.toNat + L5.pcnt 64 x.a2.toNat +
    L5.pcnt 64 x.a3.toNat + L5.pcnt 64 x.a4.toNat + L5.pcnt 64 x.a5.toNat + L5.pcnt 64 x.a6.toNat + L5.pcnt 64 x.a7.toNat := by
  have e : ∀ (a : UInt64) (r : ℕ), (a.toNat + 2 ^ 64 * r) >>> 64 = r := by
    intro a r
    rw [Nat.shiftRight_eq_div_pow, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (UInt64.toNat_lt _), Nat.zero_add]
  have f : ∀ (a : UInt64) (r : ℕ), L5.pcnt 64 (a.toNat + 2 ^ 64 * r) = L5.pcnt 64 a.toNat := by
    intro a r
    rw [← L5.pcnt_mod, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (UInt64.toNat_lt _)]
  unfold W8.view
  rw [show (512 : ℕ) = 64 + (64 + (64 + (64 + (64 + (64 + (64 + 64)))))) by norm_num]
  simp only [L5.pcnt_add, e, f]
  ring

theorem pop_eq (x : W8) : x.pop = L5.pcnt 512 x.view := by
  unfold W8.pop
  rw [pcnt512_view]
  simp only [UInt64.toNat_add, pc64_toNat]
  have hb : ∀ a : UInt64, L5.pcnt 64 a.toNat ≤ 64 := fun a => L5.pcnt_le _ _
  have := hb x.a0; have := hb x.a1; have := hb x.a2; have := hb x.a3; have := hb x.a4; have := hb x.a5
  have := hb x.a6; have := hb x.a7
  simp only [UInt64.size, Nat.reducePow]
  omega

theorem andPop_eq (x y : W8) : x.andPop y = L5.pcnt 512 (x.view &&& y.view) := by
  rw [← view_and]
  unfold W8.andPop
  rw [pcnt512_view]
  simp only [UInt64.toNat_add, pc64_toNat]
  show _ = L5.pcnt 64 (x.a0 &&& y.a0).toNat + L5.pcnt 64 (x.a1 &&& y.a1).toNat + L5.pcnt 64 (x.a2 &&& y.a2).toNat +
    L5.pcnt 64 (x.a3 &&& y.a3).toNat + L5.pcnt 64 (x.a4 &&& y.a4).toNat + L5.pcnt 64 (x.a5 &&& y.a5).toNat +
    L5.pcnt 64 (x.a6 &&& y.a6).toNat + L5.pcnt 64 (x.a7 &&& y.a7).toNat
  have hb : ∀ a : UInt64, L5.pcnt 64 a.toNat ≤ 64 := fun a => L5.pcnt_le _ _
  have := hb (x.a0 &&& y.a0); have := hb (x.a1 &&& y.a1); have := hb (x.a2 &&& y.a2); have := hb (x.a3 &&& y.a3)
  have := hb (x.a4 &&& y.a4); have := hb (x.a5 &&& y.a5); have := hb (x.a6 &&& y.a6); have := hb (x.a7 &&& y.a7)
  simp only [UInt64.size, Nat.reducePow]
  omega

theorem view_ofLimbs (a : Array UInt64) (off : ℕ) : (W8.ofLimbs a off).view = NN.natL a off 8 := by
  simp [W8.view, W8.ofLimbs, NN.natL]

theorem view_zero : W8.zero.view = 0 := by simp [W8.view, W8.zero]

theorem view_all511 : W8.all511.view = 2 ^ 511 - 1 := by decide +kernel

theorem view_ofNat (n : ℕ) : (W8.ofNat n).view = n % 2 ^ 512 := by
  apply Nat.eq_of_testBit_eq; intro l
  rw [testBit_view, Nat.testBit_mod_two_pow]
  by_cases hl : l < 512
  · simp only [hl, decide_true, Bool.true_and]
    have hlimb : (W8.ofNat n).limb (l / 64) = (n >>> (64 * (l / 64))).toUInt64 := by
      have : l / 64 < 8 := by omega
      unfold W8.ofNat
      match hm : l / 64, this with
      | 0, _ => simp [W8.limb] | 1, _ => rfl | 2, _ => rfl | 3, _ => rfl | 4, _ => rfl | 5, _ => rfl | 6, _ => rfl
      | 7, _ => rfl
    rw [hlimb, Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]
    simp only [show l % 64 < 64 by omega, decide_true, Bool.true_and]
    congr 1; omega
  · simp [hl]

/-! ## The fused updates (`orClr`, `orClr2`) equal their unfused forms -/

theorem limb_clrBit (x : W8) (l k : ℕ) (hl : l < 512) (hk : k < 8) :
    (x.clrBit l).limb k = if k = l / 64 then x.limb k &&& ~~~((1 : UInt64) <<< (l.toUInt64 &&& 63)) else x.limb k := by
  unfold XT.W8.clrBit
  rw [if_pos hl, limb_setLimbU, shr6 l hl, limbU_eq, shr6 l hl]
  by_cases h : k = l / 64
  · subst h; simp [hk]
  · simp [h]

theorem clrMask_eq (l : ℕ) (hl : l < 512) (j : UInt64) :
    W8.clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) j =
      if l / 64 = j.toNat then ~~~((1 : UInt64) <<< (l.toUInt64 &&& 63)) else ~~~0 := by
  unfold XT.W8.clrMask
  have h : (l.toUInt64 >>> 6 = j) ↔ (l / 64 = j.toNat) := by
    rw [← shr6 l hl]; exact ⟨fun h => by rw [h], fun h => UInt64.toNat_inj.mp h⟩
  by_cases hc : l / 64 = j.toNat
  · rw [if_pos (h.mpr hc), if_pos hc]
  · rw [if_neg (fun e => hc (h.mp e)), if_neg hc]

theorem toNat_toUInt64_small (k : ℕ) (hk : k < 8) : k.toUInt64.toNat = k := by
  simp [Nat.toUInt64]; omega

theorem limb_orClr (w m : W8) (l k : ℕ) (hl : l < 512) (hk : k < 8) :
    (w.orClr m l).limb k = (w.limb k ||| m.limb k) &&& W8.clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) k.toUInt64 := by
  unfold XT.W8.orClr
  rw [if_pos hl]
  have : k = 0 ∨ k = 1 ∨ k = 2 ∨ k = 3 ∨ k = 4 ∨ k = 5 ∨ k = 6 ∨ k = 7 := by omega
  rcases this with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl

theorem orClr_eq (w m : W8) (l : ℕ) : w.orClr m l = (w.or m).clrBit l := by
  by_cases hl : l < 512
  · apply eq_of_limbs; intro k hk
    rw [limb_orClr w m l k hl hk, limb_clrBit _ l k hl hk, limb_or, clrMask_eq l hl, toNat_toUInt64_small k hk]
    by_cases h : k = l / 64
    · rw [if_pos h.symm, if_pos h]
    · rw [if_neg (Ne.symm h), if_neg h]; simp
  · unfold XT.W8.orClr XT.W8.clrBit; rw [if_neg hl, if_neg hl]

theorem limb_orClr2 (w c : W8) (x l k : ℕ) (hx : x < 512) (hl : l < 512) (hk : k < 8) :
    (w.orClr2 c x l).limb k = (w.limb k ||| (c.limb k &&& W8.clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) k.toUInt64)) &&&
      W8.clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) k.toUInt64 := by
  unfold XT.W8.orClr2
  rw [if_pos (by simp [hx, hl])]
  have : k = 0 ∨ k = 1 ∨ k = 2 ∨ k = 3 ∨ k = 4 ∨ k = 5 ∨ k = 6 ∨ k = 7 := by omega
  rcases this with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl

theorem orClr2_eq (w c : W8) (x l : ℕ) : w.orClr2 c x l = (w.or (c.clrBit x)).clrBit l := by
  by_cases hxl : x < 512 ∧ l < 512
  · obtain ⟨hx, hl⟩ := hxl
    apply eq_of_limbs; intro k hk
    rw [limb_orClr2 w c x l k hx hl hk, limb_clrBit _ l k hl hk, limb_or, limb_clrBit c x k hx hk, clrMask_eq l hl,
      clrMask_eq x hx, toNat_toUInt64_small k hk]
    by_cases h : k = l / 64 <;> by_cases h' : k = x / 64
    · rw [if_pos h, if_pos h', if_pos h.symm, if_pos h'.symm]
    · rw [if_pos h, if_neg h', if_pos h.symm, if_neg (Ne.symm h')]; simp
    · rw [if_neg h, if_pos h', if_neg (Ne.symm h), if_pos h'.symm]; simp
    · rw [if_neg h, if_neg h', if_neg (Ne.symm h), if_neg (Ne.symm h')]; simp
  · unfold XT.W8.orClr2
    rw [if_neg (by simpa using hxl)]

end W8
end XTP
