module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import MisF.Packed
/-! # The bulk X-step of the deficit peel, on packed rows

A conflict matrix over `n` local points is a number `A` of rows of stride `S` (row `v` = `dig S A v`, a mask of points
conflicting with `v`).  One X-step tests every candidate against one demand `(H, d)` at once:

* `R0 = (cand ∩ H) · REP` puts `Y = cand ∩ H` in every row; `R = R0 ⊕ (R0 ∧ A)` leaves `Y ∖ row v` in row `v`;
* `d - 1` times, `acc ∧ ((acc ∨ GRD) - REP)` removes the lowest set bit of every row (a guard bit above each row stops
  borrows);
* `(R' + LOW) ∧ GRD` sets the guard bit of exactly the nonzero rows, and `(G >>> (S-1)) % (2^(S-1) - 1)` gathers the
  guard bits into a point mask.

`xstep_keep`: a candidate whose compatible part of `Y` has at least `d` points survives.  `peel_xstep`: every completion
`C` (independent in `A`, meeting the demand) survives the step, so a sequence of steps and a final count refutes the kill
(`xrun_sound`). -/
@[expose] public section
namespace K2
open MisF Finset

/-! ## Bits -/

theorem testBit_false_of_lt {x j : ℕ} (h : x < 2 ^ j) : x.testBit j = false := Nat.testBit_lt_two_pow h

theorem dig_testBit_high (B N v j : ℕ) (hj : B ≤ j) : (dig B N v).testBit j = false :=
  testBit_false_of_lt (lt_of_lt_of_le (dig_lt B N v) (Nat.pow_le_pow_right (by norm_num) hj))

theorem dig_land (B x y v : ℕ) : dig B (x &&& y) v = dig B x v &&& dig B y v := by
  apply Nat.eq_of_testBit_eq; intro j
  by_cases hj : j < B
  · rw [Nat.testBit_and, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, Nat.testBit_and]
  · push Not at hj; rw [Nat.testBit_and, dig_testBit_high _ _ _ _ hj, dig_testBit_high _ _ _ _ hj, Bool.false_and]

theorem dig_xor (B x y v : ℕ) : dig B (x ^^^ y) v = dig B x v ^^^ dig B y v := by
  apply Nat.eq_of_testBit_eq; intro j
  by_cases hj : j < B
  · rw [Nat.testBit_xor, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, Nat.testBit_xor]
  · push Not at hj; rw [Nat.testBit_xor, dig_testBit_high _ _ _ _ hj, dig_testBit_high _ _ _ _ hj, dig_testBit_high _ _ _ _ hj]; rfl

theorem dig_lor (B x y v : ℕ) : dig B (x ||| y) v = dig B x v ||| dig B y v := by
  apply Nat.eq_of_testBit_eq; intro j
  by_cases hj : j < B
  · rw [Nat.testBit_or, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, testBit_dig _ _ _ _ hj, Nat.testBit_or]
  · push Not at hj; rw [Nat.testBit_or, dig_testBit_high _ _ _ _ hj, dig_testBit_high _ _ _ _ hj, dig_testBit_high _ _ _ _ hj]; rfl

/-- `a ∨ 2^k = a + 2^k` for `a < 2^k` -/
theorem lor_two_pow_of_lt {a k : ℕ} (h : a < 2 ^ k) : a ||| 2 ^ k = a + 2 ^ k := by
  have := Nat.two_pow_add_eq_or_of_lt h 1
  rw [Nat.mul_one] at this
  rw [Nat.lor_comm, ← this, Nat.add_comm]

theorem testBit_add_two_pow_sub_one (r k : ℕ) (hr : r < 2 ^ k) : (r + 2 ^ k - 1).testBit k = decide (1 ≤ r) := by
  rcases Nat.eq_zero_or_pos r with rfl | hpos
  · simp only [Nat.zero_add]; rw [testBit_false_of_lt (by omega)]; rfl
  · have : r + 2 ^ k - 1 = 2 ^ k + (r - 1) := by omega
    rw [this, Nat.testBit_two_pow_add_eq, testBit_false_of_lt (by omega)]
    simp; omega

/-! ## Removing the lowest set bit -/

/-- bits of `x` below `B` -/
def bitsB (B x : ℕ) : Finset ℕ := (Finset.range B).filter (fun j => x.testBit j = true)

theorem land_pred_bits (x : ℕ) (hx : x ≠ 0) :
    ∃ k, x.testBit k = true ∧ ∀ j, (x &&& (x - 1)).testBit j = (x.testBit j && decide (j ≠ k)) := by
  obtain ⟨k, m, hm, rfl⟩ := Nat.exists_eq_two_pow_mul_odd hx
  obtain ⟨m', rfl⟩ := hm
  have hk1 : 1 ≤ 2 ^ k := Nat.one_le_two_pow
  have h1 : 2 ^ k * (2 * m' + 1) - 1 = 2 ^ k * (2 * m') + (2 ^ k - 1) := by
    rw [Nat.mul_add, Nat.mul_one]; omega
  refine ⟨k, ?_, ?_⟩
  · rw [Nat.testBit_two_pow_mul]; simp [Nat.testBit_zero]
  · intro j
    rw [Nat.testBit_and, h1, Nat.testBit_two_pow_mul_add _ (by omega : 2 ^ k - 1 < 2 ^ k), Nat.testBit_two_pow_mul]
    by_cases hjk : j < k
    · simp [hjk, show ¬ (j ≥ k) by omega]
    · have hj : j - k = 0 ∨ 0 < j - k := Nat.eq_zero_or_pos _
      rcases hj with hj | hj
      · have : j = k := by omega
        subst this; simp [Nat.testBit_zero]
      · simp only [hjk, if_false, show j ≥ k by omega, decide_true, Bool.true_and]
        obtain ⟨t, ht⟩ : ∃ t, j - k = t + 1 := ⟨j - k - 1, by omega⟩
        rw [ht, Nat.testBit_succ, Nat.testBit_succ]
        have e1 : (2 * m' + 1) / 2 = m' := by omega
        have e2 : (2 * m') / 2 = m' := by omega
        rw [e1, e2]; simp; omega

theorem mem_bitsB {B x j : ℕ} : j ∈ bitsB B x ↔ j < B ∧ x.testBit j = true := by simp [bitsB]

theorem bitsB_zero (B : ℕ) : bitsB B 0 = ∅ := by ext j; simp [bitsB, Nat.zero_testBit]

theorem card_bits_land_pred (B x : ℕ) (hx : x ≠ 0) (hB : x < 2 ^ B) :
    (bitsB B (x &&& (x - 1))).card = (bitsB B x).card - 1 := by
  obtain ⟨k, hk, h⟩ := land_pred_bits x hx
  have hkB : k < B := by
    by_contra hc; push Not at hc
    rw [testBit_false_of_lt (lt_of_lt_of_le hB (Nat.pow_le_pow_right (by norm_num) hc))] at hk; exact absurd hk (by decide)
  have : bitsB B (x &&& (x - 1)) = (bitsB B x).erase k := by
    ext j; rw [Finset.mem_erase, mem_bitsB, mem_bitsB, h j]
    constructor
    · rintro ⟨hj, hb⟩; simp only [Bool.and_eq_true, decide_eq_true_eq] at hb; exact ⟨hb.2, hj, hb.1⟩
    · rintro ⟨hne, hj, hb⟩; exact ⟨hj, by simp [hb, hne]⟩
  rw [this, Finset.card_erase_of_mem (mem_bitsB.mpr ⟨hkB, hk⟩)]

theorem card_bits_pos (B x : ℕ) (hx : x ≠ 0) (hB : x < 2 ^ B) : 1 ≤ (bitsB B x).card := by
  obtain ⟨k, hk, _⟩ := land_pred_bits x hx
  have hkB : k < B := by
    by_contra hc; push Not at hc
    rw [testBit_false_of_lt (lt_of_lt_of_le hB (Nat.pow_le_pow_right (by norm_num) hc))] at hk; exact absurd hk (by decide)
  exact Finset.card_pos.mpr ⟨k, mem_bitsB.mpr ⟨hkB, hk⟩⟩

/-- `j` lowest-bit removals (kernel form) -/
def remB (x j : ℕ) : ℕ := Nat.rec (motive := fun _ => ℕ) x (fun _ acc => Nat.land acc (Nat.sub acc 1)) j

theorem remB_succ (x j : ℕ) : remB x (j + 1) = remB x j &&& (remB x j - 1) := rfl

theorem remB_lt (B x j : ℕ) (hB : x < 2 ^ B) : remB x j < 2 ^ B := by
  induction j with
  | zero => exact hB
  | succ j ih => rw [remB_succ]; exact lt_of_le_of_lt Nat.and_le_left ih

theorem card_bits_remB (B x j : ℕ) (hB : x < 2 ^ B) : (bitsB B (remB x j)).card = (bitsB B x).card - j := by
  induction j with
  | zero => rfl
  | succ j ih =>
    rw [remB_succ]
    by_cases h0 : remB x j = 0
    · rw [h0, Nat.zero_and, bitsB_zero]; rw [h0, bitsB_zero] at ih; simp at ih ⊢; omega
    · rw [card_bits_land_pred B _ h0 (remB_lt B x j hB), ih]; omega

/-- at least `d` bits survive `d - 1` removals -/
theorem remB_ne_zero (B x d : ℕ) (hB : x < 2 ^ B) (hd : 1 ≤ d) (hc : d ≤ (bitsB B x).card) : remB x (d - 1) ≠ 0 := by
  intro h0
  have := card_bits_remB B x (d - 1) hB
  rw [h0, bitsB_zero] at this; simp at this; omega

/-- fewer than `d` bits once `d - 1` removals leave zero -/
theorem card_lt_of_remB (B x d : ℕ) (hB : x < 2 ^ B) (hd : 1 ≤ d) (h0 : remB x (d - 1) = 0) : (bitsB B x).card < d := by
  have := card_bits_remB B x (d - 1) hB
  rw [h0, bitsB_zero] at this; simp at this; omega

/-! ## Packed rows -/

theorem land_add_pow_sub (p k : ℕ) (hp : p < 2 ^ k) : p &&& (p + 2 ^ k - 1) = p &&& (p - 1) := by
  rcases Nat.eq_zero_or_pos p with rfl | hpos
  · simp
  · have e : p + 2 ^ k - 1 = (p - 1) ||| 2 ^ k := by rw [lor_two_pow_of_lt (by omega)]; omega
    rw [e]; apply Nat.eq_of_testBit_eq; intro j
    rw [Nat.testBit_and, Nat.testBit_or, Nat.testBit_and, Nat.testBit_two_pow]
    by_cases hj : j = k
    · subst hj; rw [testBit_false_of_lt hp]; simp
    · simp [show k ≠ j from fun h => hj h.symm]

theorem two_pow_S (S : ℕ) (hS : 1 ≤ S) : 2 ^ S = 2 * 2 ^ (S - 1) := by
  rw [← pow_succ']; congr 1; omega

/-- one per-row removal step on packed rows -/
theorem rowstep (S n P REP GRD : ℕ) (hS : 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hP : P < 2 ^ (S * n)) (hd : ∀ i < n, dig S P i < 2 ^ (S - 1)) :
    P &&& ((P ||| GRD) - REP) < 2 ^ (S * n) ∧
    (∀ i < n, dig S (P &&& ((P ||| GRD) - REP)) i = dig S P i &&& (dig S P i - 1)) ∧
    (∀ i < n, dig S (P &&& ((P ||| GRD) - REP)) i < 2 ^ (S - 1)) := by
  have hpow := two_pow_S S hS
  have hhalf : 1 ≤ 2 ^ (S - 1) := Nat.one_le_two_pow
  have hGlt : GRD < 2 ^ (S * n) := by rw [hGRD]; exact pk_lt _ _ _ (fun i _ => by omega)
  have hOlt : P ||| GRD < 2 ^ (S * n) := Nat.or_lt_two_pow hP hGlt
  -- digits of P ∨ GRD
  have hOd : ∀ i < n, dig S (P ||| GRD) i = dig S P i + 2 ^ (S - 1) := by
    intro i hi
    rw [dig_lor, hGRD, dig_pk _ _ _ (fun j _ => by omega) i hi, lor_two_pow_of_lt (hd i hi)]
  have hO : P ||| GRD = pk S (fun i => dig S P i + 2 ^ (S - 1)) n := by
    rw [← pk_dig S (P ||| GRD) n hOlt]; exact pk_congr _ _ _ _ hOd
  -- subtract REP
  have hsum : pk S (fun i => dig S P i + 2 ^ (S - 1) - 1) n + REP = P ||| GRD := by
    rw [hREP, ← pk_add, hO]; apply pk_congr; intro i hi; omega
  have hD : (P ||| GRD) - REP = pk S (fun i => dig S P i + 2 ^ (S - 1) - 1) n := by omega
  have hDd : ∀ i < n, dig S ((P ||| GRD) - REP) i = dig S P i + 2 ^ (S - 1) - 1 := by
    intro i hi; rw [hD]; exact dig_pk _ _ _ (fun j hj => by have := hd j hj; omega) i hi
  refine ⟨lt_of_le_of_lt Nat.and_le_left hP, fun i hi => ?_, fun i hi => ?_⟩
  · rw [dig_land, hDd i hi, land_add_pow_sub _ _ (hd i hi)]
  · rw [dig_land]; exact lt_of_le_of_lt Nat.and_le_left (hd i hi)

/-- iterated removals (kernel form) -/
def remR (P GRD REP j : ℕ) : ℕ :=
  Nat.rec (motive := fun _ => ℕ) P (fun _ acc => Nat.land acc (Nat.sub (Nat.lor acc GRD) REP)) j

theorem remR_spec (S n P REP GRD : ℕ) (hS : 1 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hP : P < 2 ^ (S * n)) (hd : ∀ i < n, dig S P i < 2 ^ (S - 1)) :
    ∀ j, remR P GRD REP j < 2 ^ (S * n) ∧ (∀ i < n, dig S (remR P GRD REP j) i = remB (dig S P i) j) ∧
      (∀ i < n, dig S (remR P GRD REP j) i < 2 ^ (S - 1)) := by
  intro j
  induction j with
  | zero => exact ⟨hP, fun i _ => rfl, hd⟩
  | succ j ih =>
    obtain ⟨h1, h2, h3⟩ := ih
    obtain ⟨g1, g2, g3⟩ := rowstep S n _ REP GRD hS hREP hGRD h1 h3
    refine ⟨g1, fun i hi => ?_, g3⟩
    change dig S (remR P GRD REP j &&& ((remR P GRD REP j ||| GRD) - REP)) i = _
    rw [g2 i hi, h2 i hi]; rfl

theorem and_two_pow_eq (x k : ℕ) : x &&& 2 ^ k = if x.testBit k then 2 ^ k else 0 := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_two_pow]
  by_cases hj : k = j
  · subst hj; split <;> simp_all
  · split <;> simp [hj]

/-- the guard bits of the nonzero rows -/
theorem guard_pk (S n R LOWS GRD : ℕ) (hS : 1 ≤ S) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hR : R < 2 ^ (S * n)) (hd : ∀ i < n, dig S R i < 2 ^ (S - 1)) :
    (R + LOWS) &&& GRD = pk S (fun i => (if dig S R i = 0 then 0 else 1) * 2 ^ (S - 1)) n := by
  have hpow := two_pow_S S hS
  have hhalf : 1 ≤ 2 ^ (S - 1) := Nat.one_le_two_pow
  have hRL : R + LOWS = pk S (fun i => dig S R i + (2 ^ (S - 1) - 1)) n := by
    rw [hL, pk_add, pk_dig S R n hR]
  have hRLd : ∀ i < n, dig S (R + LOWS) i = dig S R i + (2 ^ (S - 1) - 1) := by
    intro i hi; rw [hRL]; exact dig_pk _ _ _ (fun j hj => by have := hd j hj; omega) i hi
  have hGlt : GRD < 2 ^ (S * n) := by rw [hGRD]; exact pk_lt _ _ _ (fun i _ => by omega)
  have hlt : (R + LOWS) &&& GRD < 2 ^ (S * n) := lt_of_le_of_lt Nat.and_le_right hGlt
  rw [← pk_dig S _ n hlt]; apply pk_congr; intro i hi
  rw [dig_land, hRLd i hi, hGRD, dig_pk _ _ _ (fun j _ => by omega) i hi, and_two_pow_eq]
  have ht := testBit_add_two_pow_sub_one (dig S R i) (S - 1) (hd i hi)
  rw [show dig S R i + (2 ^ (S - 1) - 1) = dig S R i + 2 ^ (S - 1) - 1 by omega, ht]
  by_cases h0 : dig S R i = 0
  · simp [h0]
  · have : 1 ≤ dig S R i := Nat.one_le_iff_ne_zero.mpr h0
    simp [h0, this]

theorem two_pow_modEq (S i : ℕ) (hS : 1 ≤ S) : 2 ^ (S * i) ≡ 2 ^ i [MOD 2 ^ (S - 1) - 1] := by
  have h1 : 2 ^ (S - 1) ≡ 1 [MOD 2 ^ (S - 1) - 1] := by
    have : 1 ≤ 2 ^ (S - 1) := Nat.one_le_two_pow
    rw [Nat.ModEq]; conv_lhs => rw [show 2 ^ (S - 1) = (2 ^ (S - 1) - 1) + 1 by omega]
    simp [Nat.add_mod_left]
  have : 2 ^ (S * i) = (2 ^ (S - 1)) ^ i * 2 ^ i := by
    rw [← pow_mul, ← pow_add]; congr 1
    rcases Nat.eq_zero_or_pos i with rfl | _
    · simp
    · have : S * i = (S - 1) * i + i := by
        have : S = (S - 1) + 1 := by omega
        conv_lhs => rw [this]
        ring
      exact this
  rw [this]
  calc (2 ^ (S - 1)) ^ i * 2 ^ i ≡ 1 ^ i * 2 ^ i [MOD 2 ^ (S - 1) - 1] := Nat.ModEq.mul_right _ (Nat.ModEq.pow _ h1)
    _ = 2 ^ i := by simp

theorem pk_modEq (S : ℕ) (hS : 1 ≤ S) (g : ℕ → ℕ) : ∀ n, pk S g n ≡ pk 1 g n [MOD 2 ^ (S - 1) - 1] := by
  intro n
  induction n with
  | zero => simp [pk]; rfl
  | succ n ih =>
    rw [pk_succ, pk_succ, Nat.one_mul]
    exact Nat.ModEq.add ih (Nat.ModEq.mul_left _ (two_pow_modEq S n hS))

/-- gathering the guard bits into a point mask -/
theorem gather (S n : ℕ) (g : ℕ → ℕ) (hg : ∀ i < n, g i ≤ 1) (hS : n + 2 ≤ S) :
    (pk S (fun i => g i * 2 ^ (S - 1)) n >>> (S - 1)) % (2 ^ (S - 1) - 1) = pk 1 g n := by
  have h1 : pk S (fun i => g i * 2 ^ (S - 1)) n = 2 ^ (S - 1) * pk S g n := by
    rw [← pk_mul]; apply pk_congr; intro i _; ring
  rw [h1, Nat.shiftRight_eq_div_pow, Nat.mul_div_cancel_left _ (by positivity)]
  have hlt : pk 1 g n < 2 ^ (S - 1) - 1 := by
    have := pk_lt 1 g n (fun i hi => by have := hg i hi; simp; omega)
    simp only [Nat.one_mul] at this
    have h2 : 2 ^ n < 2 ^ (S - 1) := Nat.pow_lt_pow_right (by norm_num) (by omega)
    omega
  rw [pk_modEq S (by omega) g n, Nat.mod_eq_of_lt hlt]

theorem testBit_pk1 (g : ℕ → ℕ) (n v : ℕ) (hg : ∀ i < n, g i ≤ 1) (hv : v < n) :
    (pk 1 g n).testBit v = decide (g v = 1) := by
  have h := testBit_dig 1 (pk 1 g n) v 0 (by norm_num)
  rw [dig_pk 1 g n (fun i hi => by have := hg i hi; simp; omega) v hv] at h
  simp only [Nat.one_mul, Nat.add_zero] at h
  rw [← h]
  have := hg v hv
  interval_cases (g v) <;> simp

/-! ## The X-step -/

/-- one X-step (kernel form): candidates whose compatible part of `cand ∩ H` has fewer than `d` points are removed -/
def xstep (A REP GRD LOWS MODM S cand H d : ℕ) : ℕ :=
  Nat.land cand (Nat.mod (Nat.shiftRight (Nat.land (Nat.add
    (remR (Nat.xor (Nat.mul (Nat.land cand H) REP) (Nat.land (Nat.mul (Nat.land cand H) REP) A)) GRD REP (Nat.sub d 1))
    LOWS) GRD) (Nat.sub S 1)) MODM)

theorem xor_and_lt (Y a k : ℕ) (hY : Y < 2 ^ k) : Y ^^^ (Y &&& a) < 2 ^ k := by
  apply Nat.lt_pow_two_of_testBit; intro j hj
  rw [Nat.testBit_xor, Nat.testBit_and, testBit_false_of_lt (lt_of_lt_of_le hY (Nat.pow_le_pow_right (by norm_num) hj))]; rfl

/-- **The X-step keeps every candidate with at least `d` compatible points of `cand ∩ H`.** -/
theorem xstep_keep (A REP GRD LOWS MODM S n cand H d v : ℕ) (hS : n + 2 ≤ S) (hc : cand < 2 ^ n)
    (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hv : v < n) (hcv : cand.testBit v = true) (hd : 1 ≤ d)
    (hpop : d ≤ (bitsB S ((cand &&& H) ^^^ ((cand &&& H) &&& dig S A v))).card) :
    (xstep A REP GRD LOWS MODM S cand H d).testBit v = true := by
  have hS1 : 1 ≤ S := by omega
  set Y := cand &&& H with hYdef
  have hY : Y < 2 ^ n := lt_of_le_of_lt Nat.and_le_left hc
  have hYS : Y < 2 ^ (S - 1) := lt_of_lt_of_le hY (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hYS2 : Y < 2 ^ S := lt_of_lt_of_le hYS (Nat.pow_le_pow_right (by norm_num) (by omega))
  -- rows of R0 = Y · REP
  have hR0 : Y * REP = pk S (fun _ => Y) n := by rw [hREP, ← pk_mul]; apply pk_congr; intro i _; ring
  have hR0lt : Y * REP < 2 ^ (S * n) := by rw [hR0]; exact pk_lt _ _ _ (fun _ _ => hYS2)
  have hR0d : ∀ i < n, dig S (Y * REP) i = Y := fun i hi => by rw [hR0]; exact dig_pk _ _ _ (fun _ _ => hYS2) i hi
  -- rows of R
  set R := (Y * REP) ^^^ ((Y * REP) &&& A) with hRdef
  have hRd : ∀ i < n, dig S R i = Y ^^^ (Y &&& dig S A i) := by
    intro i hi; rw [hRdef, dig_xor, dig_land, hR0d i hi]
  have hRlt : R < 2 ^ (S * n) := xor_and_lt _ _ _ hR0lt
  have hRdl : ∀ i < n, dig S R i < 2 ^ (S - 1) := fun i hi => by rw [hRd i hi]; exact xor_and_lt _ _ _ hYS
  -- removals
  obtain ⟨h1, h2, h3⟩ := remR_spec S n R REP GRD hS1 hREP hGRD hRlt hRdl (d - 1)
  -- guard and gather
  have hG := guard_pk S n _ LOWS GRD hS1 hL hGRD h1 h3
  set g := fun i => if dig S (remR R GRD REP (d - 1)) i = 0 then 0 else 1 with hgdef
  have hg : ∀ i < n, g i ≤ 1 := fun i _ => by simp only [hgdef]; split <;> omega
  have hgv : g v = 1 := by
    simp only [hgdef]
    have hne : remB (dig S R v) (d - 1) ≠ 0 := by
      apply remB_ne_zero S _ d (lt_of_lt_of_le (hRdl v hv) (Nat.pow_le_pow_right (by norm_num) (by omega))) hd
      rw [hRd v hv]; exact hpop
    rw [h2 v hv]; simp [hne]
  have hgat := gather S n g hg hS
  unfold xstep
  rw [show Nat.land cand H = Y from rfl]
  change (cand &&& ((((remR R GRD REP (d - 1) + LOWS) &&& GRD) >>> (S - 1)) % MODM)).testBit v = true
  rw [hG, hM, hgat, Nat.testBit_and, hcv, testBit_pk1 g n v hg hv, hgv]; rfl

/-! ## A run of X-steps -/

/-- fewer than `d` bits (kernel form) -/
def fewerB (x d : ℕ) : Bool := Nat.beq (remB x (Nat.sub d 1)) 0

/-- X-steps, then the final count `|cand ∩ H| < d` -/
def xrun (A REP GRD LOWS MODM S : ℕ) (fin : ℕ × ℕ) (sts : List (ℕ × ℕ)) (cand : ℕ) : Bool :=
  List.rec (motive := fun _ => ℕ → Bool)
    (fun c => fewerB (Nat.land c fin.1) fin.2)
    (fun st _ ih c => ih (xstep A REP GRD LOWS MODM S c st.1 st.2)) sts cand

theorem sub_bits (S n cand H a : ℕ) (C : Finset ℕ) (hSn : n ≤ S) (hC : ∀ v ∈ C, v < n ∧ cand.testBit v = true)
    (ha : ∀ w ∈ C, a.testBit w = false) :
    (C.filter (fun v => H.testBit v = true)).card ≤ (bitsB S ((cand &&& H) ^^^ ((cand &&& H) &&& a))).card := by
  apply Finset.card_le_card; intro w hw
  rw [Finset.mem_filter] at hw
  obtain ⟨hwC, hwH⟩ := hw
  rw [mem_bitsB]; refine ⟨lt_of_lt_of_le (hC w hwC).1 hSn, ?_⟩
  simp [Nat.testBit_xor, Nat.testBit_and, (hC w hwC).2, hwH, ha w hwC]

/-- **Soundness of an X-step run.** No completion `C` (inside `cand`, independent in `A` with no self loops on `C`,
meeting every demand of the steps and of the final test) exists when `xrun` accepts. -/
theorem xrun_sound (A REP GRD LOWS MODM S n : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (fin : ℕ × ℕ) (sts : List (ℕ × ℕ)) :
    ∀ cand, cand < 2 ^ n → xrun A REP GRD LOWS MODM S fin sts cand = true →
    ∀ C : Finset ℕ, (∀ v ∈ C, v < n ∧ cand.testBit v = true) →
      (∀ v ∈ C, ∀ w ∈ C, (dig S A v).testBit w = false) →
      (1 ≤ fin.2 ∧ fin.2 ≤ (C.filter (fun v => fin.1.testBit v = true)).card) →
      (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (C.filter (fun v => st.1.testBit v = true)).card) → False := by
  induction sts with
  | nil =>
    intro cand hc h C hC hind hfin _
    change Nat.beq (remB (Nat.land cand fin.1) (Nat.sub fin.2 1)) 0 = true at h
    have h0 := Nat.eq_of_beq_eq_true h
    have hlt := card_lt_of_remB n (cand &&& fin.1) fin.2 (lt_of_le_of_lt Nat.and_le_left hc) hfin.1 h0
    have hsub : (C.filter (fun v => fin.1.testBit v = true)).card ≤ (bitsB n (cand &&& fin.1)).card := by
      apply Finset.card_le_card; intro w hw
      rw [Finset.mem_filter] at hw
      rw [mem_bitsB, Nat.testBit_and, (hC w hw.1).2, hw.2]; exact ⟨(hC w hw.1).1, rfl⟩
    omega
  | cons st sts ih =>
    intro cand hc h C hC hind hfin hdem
    obtain ⟨H, d⟩ := st
    change xrun A REP GRD LOWS MODM S fin sts (xstep A REP GRD LOWS MODM S cand H d) = true at h
    have hd := hdem (H, d) (List.mem_cons_self ..)
    apply ih _ (lt_of_le_of_lt Nat.and_le_left hc) h C _ hind hfin (fun st hst => hdem st (List.mem_cons_of_mem _ hst))
    intro v hv
    refine ⟨(hC v hv).1, ?_⟩
    apply xstep_keep A REP GRD LOWS MODM S n cand H d v hS hc hREP hGRD hL hM (hC v hv).1 (hC v hv).2 hd.1
    exact le_trans hd.2 (sub_bits S n cand H (dig S A v) C (by omega) hC (fun w hw => hind v hv w hw))

end K2
