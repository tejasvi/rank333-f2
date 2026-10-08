module
public import R22Port.U_6d73af0793e7
public import G.Interface
public import RootSound.Bits
public import Mathlib
/-! # Generic bit lemmas for decoding the interface's `Nat` encodings (bridge, part 3a)

`bF b` is `b` as an element of `F2` (`bitF v i = bF (v.testBit i)`).  The interface builds numbers by folds over
`List.range n`; their bits are:
* `testBit_orFold`: `foldl (fun acc p => if P p then acc ||| 1 <<< p else acc) 0` has bit `i` iff `i < n ∧ P i`;
* `testBit_posFold`: `foldl (fun acc x => acc ||| 1 <<< pos x) 0` has bit `p` iff `∃ x < n, pos x = p`;
* `bF_xorFold`: `foldl (fun acc k => if c k then acc ^^^ g k else acc) 0` has bit `i` = `∑_{k<n} c k · (g k)_i`;
* `testBit_shFold`: `foldl (fun acc x => acc ||| f x <<< (w x)) 0` (all `f x < 2^w`) has bit `w x + y` = `(f x)_y`;
* `bF_parN`: `parN n x = ∑_{i<n} x_i`. -/
@[expose] public section
open Matrix

namespace G.Br
open RootSound

/-- a Boolean as an element of `F2` -/
def bF (b : Bool) : F2 := if b then 1 else 0

@[simp] theorem bF_true : bF true = 1 := rfl
@[simp] theorem bF_false : bF false = 0 := rfl
theorem bF_xor (p q : Bool) : bF (xor p q) = bF p + bF q := by cases p <;> cases q <;> decide
theorem bF_and (p q : Bool) : bF (p && q) = bF p * bF q := by cases p <;> cases q <;> decide
theorem bF_inj {p q : Bool} (h : bF p = bF q) : p = q := by
  cases p <;> cases q
  · rfl
  · exact absurd h (by decide)
  · exact absurd h (by decide)
  · rfl
theorem bF_testBit (v i : ℕ) : bF (v.testBit i) = bitF v i := rfl
theorem bF_decide_eq_one (x : F2) : bF (decide (x = 1)) = x := by revert x; decide

theorem F2_cases (x : F2) : x = 0 ∨ x = 1 := by revert x; decide

/-! ## folds over `List.range n` -/

theorem foldl_range_succ {β : Type*} (f : β → ℕ → β) (b : β) (n : ℕ) :
    (List.range (n + 1)).foldl f b = f ((List.range n).foldl f b) n := by
  rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]

theorem testBit_orFold (P : ℕ → Bool) (n i : ℕ) :
    ((List.range n).foldl (fun acc p => if P p = true then acc ||| (1 <<< p) else acc) 0).testBit i =
      (decide (i < n) && P i) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ]
    by_cases hP : P n = true
    · rw [if_pos hP, Nat.testBit_or, ih, Nat.one_shiftLeft, Nat.testBit_two_pow]
      by_cases h1 : i < n
      · simp [h1, show i < n + 1 by omega, show ¬ n = i by omega]
      · by_cases h2 : i = n
        · subst h2; simp [hP]
        · simp [h1, show ¬ i < n + 1 by omega, show ¬ n = i by omega]
    · rw [if_neg hP, ih]
      by_cases h1 : i < n
      · simp [h1, show i < n + 1 by omega]
      · by_cases h2 : i = n
        · subst h2; simp [hP]
        · simp [h1, show ¬ i < n + 1 by omega]

theorem testBit_posFold (pos : ℕ → ℕ) (n p : ℕ) :
    ((List.range n).foldl (fun acc x => acc ||| (1 <<< pos x)) 0).testBit p = decide (∃ x < n, pos x = p) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ, Nat.testBit_or, ih, Nat.one_shiftLeft, Nat.testBit_two_pow]
    apply Bool.eq_iff_iff.mpr
    simp only [Bool.or_eq_true, decide_eq_true_eq]
    constructor
    · rintro (⟨x, hx, e⟩ | e)
      · exact ⟨x, by omega, e⟩
      · exact ⟨n, by omega, e⟩
    · rintro ⟨x, hx, e⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hx with h | h
      · exact Or.inl ⟨x, h, e⟩
      · subst h; exact Or.inr e

theorem bF_xorFold (c : ℕ → Bool) (g : ℕ → ℕ) (n i : ℕ) :
    bF (((List.range n).foldl (fun acc k => if c k = true then acc ^^^ g k else acc) 0).testBit i) =
      ∑ k ∈ Finset.range n, bF (c k) * bF ((g k).testBit i) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ, Finset.sum_range_succ, ← ih]
    by_cases hc : c n = true
    · rw [if_pos hc, Nat.testBit_xor, bF_xor, hc, bF_true, one_mul]
    · rw [if_neg hc]
      simp only [Bool.not_eq_true] at hc
      rw [hc, bF_false, zero_mul, add_zero]

theorem xorFold_lt (c : ℕ → Bool) (g : ℕ → ℕ) (w : ℕ) (hg : ∀ k, g k < 2 ^ w) (n : ℕ) :
    (List.range n).foldl (fun acc k => if c k = true then acc ^^^ g k else acc) 0 < 2 ^ w := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ]
    split_ifs
    · exact Nat.xor_lt_two_pow ih (hg n)
    · exact ih

theorem testBit_shFold (w : ℕ) (f : ℕ → ℕ) (hf : ∀ x, f x < 2 ^ w) (n x y : ℕ) (hy : y < w) :
    ((List.range n).foldl (fun acc x => acc ||| (f x <<< (w * x))) 0).testBit (w * x + y) =
      (decide (x < n) && (f x).testBit y) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ, Nat.testBit_or, ih, Nat.testBit_shiftLeft]
    rcases lt_trichotomy x n with h | h | h
    · have h1 : ¬ (w * x + y ≥ w * n) := by
        have : w * (x + 1) ≤ w * n := Nat.mul_le_mul_left w h
        rw [Nat.mul_succ] at this; omega
      simp [h, h1, show x < n + 1 by omega]
    · subst h
      simp
    · have h1 : w * x + y ≥ w * n := by
        have : w * n ≤ w * x := Nat.mul_le_mul_left w h.le
        omega
      have h2 : (f n).testBit (w * x + y - w * n) = false := by
        apply Nat.testBit_lt_two_pow
        have : w * (n + 1) ≤ w * x := Nat.mul_le_mul_left w h
        rw [Nat.mul_succ] at this
        exact lt_of_lt_of_le (hf n) (Nat.pow_le_pow_right (by norm_num) (by omega))
      simp [show ¬ x < n by omega, show ¬ x < n + 1 by omega, h2]

theorem bF_parN (n x : ℕ) : bF (parN n x) = ∑ i ∈ Finset.range n, bF (x.testBit i) := by
  induction n generalizing x with
  | zero => simp [parN]
  | succ n ih =>
    rw [parN, bF_xor, ih, Finset.sum_range_succ']
    have h0 : bF (x % 2 == 1) = bF (x.testBit 0) := by
      rw [Nat.testBit_zero]
      rcases Nat.mod_two_eq_zero_or_one x with h | h <;> simp [h]
    rw [h0, add_comm]
    congr 1
    refine Finset.sum_congr rfl (fun i _ => ?_)
    rw [Nat.testBit_succ]

/-! ## rows of packed matrices -/

theorem testBit_row (d W q x : ℕ) : (row d W q).testBit x = (decide (x < d) && W.testBit (d * q + x)) := by
  unfold row; rw [Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]

theorem testBit_rowD (d W q x : ℕ) : (rowD d W q).testBit x = (decide (x < d) && W.testBit (d * q + x)) := by
  unfold rowD; rw [Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]

theorem testBit_rowOf (M i k : ℕ) : (rowOf M i).testBit k = (decide (k < 3) && M.testBit (3 * i + k)) := by
  show ((M >>> (3 * i)) % 2 ^ 3).testBit k = _
  rw [Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]

theorem row_lt (d W q : ℕ) : row d W q < 2 ^ d := Nat.mod_lt _ (by positivity)
theorem rowD_lt (d W q : ℕ) : rowD d W q < 2 ^ d := Nat.mod_lt _ (by positivity)
theorem rowOf_lt (M i : ℕ) : rowOf M i < 2 ^ 3 := Nat.mod_lt _ (by norm_num)

/-- a number below `2^n` is determined by its bits below `n` -/
theorem eq_of_bits_lt {v w n : ℕ} (hv : v < 2 ^ n) (hw : w < 2 ^ n) (h : ∀ i < n, v.testBit i = w.testBit i) :
    v = w := by
  apply Nat.eq_of_testBit_eq
  intro i
  by_cases hi : i < n
  · exact h i hi
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hv (Nat.pow_le_pow_right (by norm_num) (by omega))),
      Nat.testBit_lt_two_pow (lt_of_lt_of_le hw (Nat.pow_le_pow_right (by norm_num) (by omega)))]

theorem lt_of_bits {v n : ℕ} (h : ∀ i, n ≤ i → v.testBit i = false) : v < 2 ^ n :=
  Nat.lt_pow_two_of_testBit v (fun i hi => h i hi)

end G.Br
