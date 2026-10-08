module
public import R22Port.U_d41d8cd98f00
public import GS.Spec
/-! # L1: packed terms of states, the parity identity, compatibility (`G/Accept.lean` `pkState`, `G/Gram.lean` fields)

* `pkOf r yu xv a`: the packed term with fields `yu q` (bit `32q`), `xv q` (bit `96 + 32q`), `q < r`, `r` (bit 192), `a`
  (bit 196); `pkState d s = pkOf (rk s.a) (yuS d s) (xvS d s) s.a` (`pkState_eq`), `mkTerm1 yu xv a = pkOf 1 …`
  (`mkTerm1_eq`), `vTerm o r j = pkOf 2 …` (`vTerm_eq`);
* `fYU_pkOf`, `fXV_pkOf`, `fR_pkOf`, `fA_pkOf` (fields below `2^29`, `r ≤ 3`, `a < 512`) and the state versions `fYU_pk`, …;
  `pkOf_congr`: equal fields give equal packed terms;
* `par_identity`: `par32 (yuS d t al &&& xvS d s be)` is `gram t s al be` xor `dirt d t s al be` (`d ≤ 2`);
* `valid_par`, `compat_par`, `compat_par'`, `compat_CP` (`Compat` gives the checker's `compatP` of the packed terms);
* `XL_ok`, `YL_ok`: the constant lists of `G/Lists.lean`. -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## bounds of `xvec`, `yvec`, rows -/

theorem foldl_or_lt (l : List ℕ) (f : ℕ → Bool) (n acc : ℕ) (hacc : acc < 2 ^ n) (hl : ∀ p ∈ l, p < n) :
    l.foldl (fun acc p => if f p then acc ||| (1 <<< p) else acc) acc < 2 ^ n := by
  induction l generalizing acc with
  | nil => exact hacc
  | cons p l ih =>
    rw [List.foldl_cons]
    have hp : p < n := hl p List.mem_cons_self
    have hstep : (if f p then acc ||| (1 <<< p) else acc) < 2 ^ n := by
      split
      · apply Nat.or_lt_two_pow hacc
        rw [Nat.shiftLeft_eq, Nat.one_mul]; exact Nat.pow_lt_pow_right (by norm_num) hp
      · exact hacc
    exact ih _ hstep (fun q hq => hl q (List.mem_cons_of_mem _ hq))

theorem xvec_lt (B L : ℕ) : xvec B L < 2 ^ 27 :=
  foldl_or_lt (List.range 27) (fun p => bitN B (p / 3) && bitN L (p % 3)) 27 0 (by norm_num)
    (fun p hp => List.mem_range.mp hp)

theorem yvec_lt (R C : ℕ) : yvec R C < 2 ^ 27 :=
  foldl_or_lt (List.range 27) (fun p => bitN R (p / 9) && bitN C (p % 9)) 27 0 (by norm_num)
    (fun p hp => List.mem_range.mp hp)

theorem row_lt (d W q : ℕ) : row d W q < 2 ^ d := Nat.mod_lt _ (Nat.two_pow_pos d)

/-- the YU field of a state -/
def yuS (d : ℕ) (s : State) (q : ℕ) : ℕ := yvec (Rc s.a q) s.C ||| (row d s.U q <<< 27)
/-- the XV field of a state -/
def xvS (d : ℕ) (s : State) (q : ℕ) : ℕ := xvec s.B (Lc s.a q) ||| (row d s.V q <<< 27)

theorem shl27_lt (x d : ℕ) (hd : d ≤ 2) (hx : x < 2 ^ d) : x <<< 27 < 2 ^ 29 := by
  rw [Nat.shiftLeft_eq]
  have : x < 4 := lt_of_lt_of_le hx (by interval_cases d <;> norm_num)
  calc x * 2 ^ 27 < 4 * 2 ^ 27 := Nat.mul_lt_mul_of_pos_right this (by norm_num)
    _ = 2 ^ 29 := by norm_num

theorem yuS_lt (d : ℕ) (s : State) (q : ℕ) (hd : d ≤ 2) : yuS d s q < 2 ^ 29 :=
  Nat.or_lt_two_pow (lt_of_lt_of_le (yvec_lt _ _) (by norm_num)) (shl27_lt _ d hd (row_lt d s.U q))

theorem xvS_lt (d : ℕ) (s : State) (q : ℕ) (hd : d ≤ 2) : xvS d s q < 2 ^ 29 :=
  Nat.or_lt_two_pow (lt_of_lt_of_le (xvec_lt _ _) (by norm_num)) (shl27_lt _ d hd (row_lt d s.V q))

theorem rk_lt (a : ℕ) : rk a < 4 := Nat.mod_lt _ (by norm_num)

/-! ## packed terms from fields -/

def pkOf (r : ℕ) (yu xv : ℕ → ℕ) (a : ℕ) : ℕ :=
  ((List.range r).foldl (fun acc q => acc ||| (yu q <<< (32 * q)) ||| (xv q <<< (96 + 32 * q))) 0) |||
    (r <<< 192) ||| (a <<< 196)

theorem pkState_eq (d : ℕ) (s : State) : pkState d s = pkOf (rk s.a) (yuS d s) (xvS d s) s.a := rfl

/-- the field part of `pkOf` -/
def pkF (r : ℕ) (yu xv : ℕ → ℕ) : ℕ :=
  (List.range r).foldl (fun acc q => acc ||| (yu q <<< (32 * q)) ||| (xv q <<< (96 + 32 * q))) 0

theorem testBit_pkF (r : ℕ) (yu xv : ℕ → ℕ) (p : ℕ) :
    (pkF r yu xv).testBit p = true ↔ ∃ q < r, ((yu q <<< (32 * q)).testBit p = true ∨
      (xv q <<< (96 + 32 * q)).testBit p = true) := by
  induction r with
  | zero => simp [pkF]
  | succ r ih =>
    unfold pkF at ih ⊢
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil, Nat.testBit_or, Nat.testBit_or]
    simp only [Bool.or_eq_true]
    rw [ih]
    constructor
    · rintro ((⟨q, hq, h⟩ | h) | h)
      · exact ⟨q, by omega, h⟩
      · exact ⟨r, by omega, Or.inl h⟩
      · exact ⟨r, by omega, Or.inr h⟩
    · rintro ⟨q, hq, h⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hq with hlt | rfl
      · exact Or.inl (Or.inl ⟨q, hlt, h⟩)
      · rcases h with h | h
        · exact Or.inl (Or.inr h)
        · exact Or.inr h

theorem testBit_shl (x s p : ℕ) : (x <<< s).testBit p = (decide (s ≤ p) && x.testBit (p - s)) := by
  rw [Nat.testBit_shiftLeft]

theorem pkOf_testBit (r : ℕ) (yu xv : ℕ → ℕ) (a p : ℕ) :
    (pkOf r yu xv a).testBit p = ((pkF r yu xv).testBit p || (r <<< 192).testBit p || (a <<< 196).testBit p) := by
  unfold pkOf pkF; rw [Nat.testBit_or, Nat.testBit_or]

/-- below bit 192 a packed term is its field part -/
theorem pkOf_testBit_low (r : ℕ) (yu xv : ℕ → ℕ) (a p : ℕ) (hp : p < 192) :
    (pkOf r yu xv a).testBit p = (pkF r yu xv).testBit p := by
  rw [pkOf_testBit, testBit_shl, testBit_shl]
  simp [show ¬ (192 ≤ p) from by omega, show ¬ (196 ≤ p) from by omega]

/-- the fields of a packed term -/
structure PkOK (r : ℕ) (yu xv : ℕ → ℕ) (a : ℕ) : Prop where
  r_le : r ≤ 3
  yu_lt : ∀ q < r, yu q < 2 ^ 29
  xv_lt : ∀ q < r, xv q < 2 ^ 29
  a_lt : a < 512

theorem testBit_lt29 {x : ℕ} (hx : x < 2 ^ 29) {j : ℕ} (hj : 29 ≤ j) : x.testBit j = false :=
  Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) hj))

theorem fYU_pkOf {r : ℕ} {yu xv : ℕ → ℕ} {a : ℕ} (h : PkOK r yu xv a) {q : ℕ} (hq : q < r) :
    fYU (pkOf r yu xv a) q = yu q := by
  have hr := h.r_le
  unfold fYU
  show (pkOf r yu xv a >>> (32 * q)) &&& M29 = _
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_shiftRight, show M29 = 2 ^ 29 - 1 by decide, Nat.testBit_two_pow_sub_one]
  by_cases hj : j < 29
  · rw [pkOf_testBit_low _ _ _ _ _ (by omega)]
    simp only [hj, decide_true, Bool.and_true]
    apply Bool.eq_iff_iff.mpr
    rw [testBit_pkF]
    constructor
    · rintro ⟨q', hq', hy | hx⟩
      · rw [testBit_shl] at hy
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hy
        obtain ⟨hle, hb⟩ := hy
        by_cases e : q' = q
        · subst e; rw [show 32 * q' + j - 32 * q' = j by omega] at hb; exact hb
        · exfalso
          have : 29 ≤ 32 * q + j - 32 * q' := by
            rcases Nat.lt_or_gt_of_ne e with h1 | h1 <;> omega
          rw [testBit_lt29 (h.yu_lt q' hq') this] at hb; exact absurd hb (by simp)
      · rw [testBit_shl] at hx
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hx
        omega
    · intro hb
      refine ⟨q, hq, Or.inl ?_⟩
      rw [testBit_shl]; simp [show 32 * q + j - 32 * q = j by omega, hb]
  · simp only [hj, decide_false, Bool.and_false]
    rw [testBit_lt29 (h.yu_lt q hq) (by omega)]

theorem fXV_pkOf {r : ℕ} {yu xv : ℕ → ℕ} {a : ℕ} (h : PkOK r yu xv a) {q : ℕ} (hq : q < r) :
    fXV (pkOf r yu xv a) q = xv q := by
  have hr := h.r_le
  unfold fXV
  show (pkOf r yu xv a >>> (96 + 32 * q)) &&& M29 = _
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_shiftRight, show M29 = 2 ^ 29 - 1 by decide, Nat.testBit_two_pow_sub_one]
  by_cases hj : j < 29
  · rw [pkOf_testBit_low _ _ _ _ _ (by omega)]
    simp only [hj, decide_true, Bool.and_true]
    apply Bool.eq_iff_iff.mpr
    rw [testBit_pkF]
    constructor
    · rintro ⟨q', hq', hy | hx⟩
      · rw [testBit_shl] at hy
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hy
        obtain ⟨hle, hb⟩ := hy
        rw [testBit_lt29 (h.yu_lt q' hq') (by omega)] at hb; exact absurd hb (by simp)
      · rw [testBit_shl] at hx
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hx
        obtain ⟨hle, hb⟩ := hx
        by_cases e : q' = q
        · subst e; rw [show 96 + 32 * q' + j - (96 + 32 * q') = j by omega] at hb; exact hb
        · exfalso
          have : 29 ≤ 96 + 32 * q + j - (96 + 32 * q') := by
            rcases Nat.lt_or_gt_of_ne e with h1 | h1 <;> omega
          rw [testBit_lt29 (h.xv_lt q' hq') this] at hb; exact absurd hb (by simp)
    · intro hb
      refine ⟨q, hq, Or.inr ?_⟩
      rw [testBit_shl]; simp [show 96 + 32 * q + j - (96 + 32 * q) = j by omega, hb]
  · simp only [hj, decide_false, Bool.and_false]
    rw [testBit_lt29 (h.xv_lt q hq) (by omega)]

/-- no field bit at or above 192 -/
theorem pkF_high {r : ℕ} {yu xv : ℕ → ℕ} {a : ℕ} (h : PkOK r yu xv a) {p : ℕ} (hp : 192 ≤ p) :
    (pkF r yu xv).testBit p = false := by
  have hr := h.r_le
  apply Bool.eq_false_iff.mpr
  intro hb
  obtain ⟨q, hq, hy | hx⟩ := (testBit_pkF r yu xv p).mp hb
  · rw [testBit_shl] at hy
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hy
    rw [testBit_lt29 (h.yu_lt q hq) (by omega)] at hy; exact absurd hy.2 (by simp)
  · rw [testBit_shl] at hx
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hx
    rw [testBit_lt29 (h.xv_lt q hq) (by omega)] at hx; exact absurd hx.2 (by simp)

theorem fR_pkOf {r : ℕ} {yu xv : ℕ → ℕ} {a : ℕ} (h : PkOK r yu xv a) : fR (pkOf r yu xv a) = r := by
  have hr := h.r_le
  unfold fR
  show (pkOf r yu xv a >>> 192) &&& 3 = _
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_shiftRight, show (3 : ℕ) = 2 ^ 2 - 1 by norm_num, Nat.testBit_two_pow_sub_one,
    pkOf_testBit, pkF_high h (by omega), testBit_shl, testBit_shl]
  by_cases hj : j < 2
  · simp only [Bool.false_or, show 192 ≤ 192 + j from by omega, show ¬ (196 ≤ 192 + j) from by omega, decide_true,
      decide_false, Bool.true_and, Bool.false_and, Bool.or_false, hj]
    rw [show 192 + j - 192 = j by omega, Bool.and_true]
  · simp only [hj, decide_false, Bool.and_false]
    rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le (show r < 2 ^ 2 by omega) (Nat.pow_le_pow_right (by norm_num) (by omega)))]

theorem fA_pkOf {r : ℕ} {yu xv : ℕ → ℕ} {a : ℕ} (h : PkOK r yu xv a) : fA (pkOf r yu xv a) = a := by
  have hr := h.r_le
  have ha := h.a_lt
  unfold fA
  show (pkOf r yu xv a >>> 196) &&& 511 = _
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_shiftRight, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one,
    pkOf_testBit, pkF_high h (by omega), testBit_shl, testBit_shl]
  have hr2 : r.testBit (196 + j - 192) = false :=
    Nat.testBit_eq_false_of_lt (lt_of_lt_of_le (show r < 2 ^ 2 by omega) (Nat.pow_le_pow_right (by norm_num) (by omega)))
  simp only [Bool.false_or, show 192 ≤ 196 + j from by omega, show 196 ≤ 196 + j from by omega, decide_true,
    Bool.true_and, hr2, Bool.false_or]
  rw [show 196 + j - 196 = j by omega]
  by_cases hj : j < 9
  · simp [hj]
  · simp only [hj, decide_false, Bool.and_false]
    rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le ha (Nat.pow_le_pow_right (show 0 < 2 by norm_num) (show 9 ≤ j by omega)))]

/-- equal fields give equal packed terms -/
theorem pkOf_congr {r : ℕ} {yu xv yu' xv' : ℕ → ℕ} {a : ℕ} (h : ∀ q < r, yu q = yu' q ∧ xv q = xv' q) :
    pkOf r yu xv a = pkOf r yu' xv' a := by
  have : pkF r yu xv = pkF r yu' xv' := by
    apply Nat.eq_of_testBit_eq; intro p
    apply Bool.eq_iff_iff.mpr
    rw [testBit_pkF, testBit_pkF]
    constructor
    · rintro ⟨q, hq, hh⟩; exact ⟨q, hq, by rw [← (h q hq).1, ← (h q hq).2]; exact hh⟩
    · rintro ⟨q, hq, hh⟩; exact ⟨q, hq, by rw [(h q hq).1, (h q hq).2]; exact hh⟩
  unfold pkOf; unfold pkF at this; rw [this]

/-! ## the state versions -/

theorem pkOK_state (d : ℕ) (s : State) (hd : d ≤ 2) (ha : s.a < 512) : PkOK (rk s.a) (yuS d s) (xvS d s) s.a :=
  ⟨by have := rk_lt s.a; omega, fun q _ => yuS_lt d s q hd, fun q _ => xvS_lt d s q hd, ha⟩

theorem fYU_pk {d : ℕ} {s : State} {q : ℕ} (h : q < rk s.a) (hd : d ≤ 2) (ha : s.a < 512) :
    fYU (pkState d s) q = yuS d s q := by
  rw [pkState_eq]; exact fYU_pkOf (pkOK_state d s hd ha) h

theorem fXV_pk {d : ℕ} {s : State} {q : ℕ} (h : q < rk s.a) (hd : d ≤ 2) (ha : s.a < 512) :
    fXV (pkState d s) q = xvS d s q := by
  rw [pkState_eq]; exact fXV_pkOf (pkOK_state d s hd ha) h

theorem fR_pk {d : ℕ} {s : State} (hd : d ≤ 2) (ha : s.a < 512) : fR (pkState d s) = rk s.a := by
  rw [pkState_eq]; exact fR_pkOf (pkOK_state d s hd ha)

theorem fA_pk {d : ℕ} {s : State} (hd : d ≤ 2) (ha : s.a < 512) : fA (pkState d s) = s.a := by
  rw [pkState_eq]; exact fA_pkOf (pkOK_state d s hd ha)

/-! ## the parity identity -/

theorem tb_or_disj (x y p : ℕ) (h : x &&& y = 0) : tb (x ||| y) p = tb x p + tb y p := by
  unfold tb
  have hb := congrArg (fun z => z.testBit p) h
  simp only [Nat.testBit_and, Nat.zero_testBit] at hb
  rw [Nat.testBit_or]
  cases hx : x.testBit p <;> cases hy : y.testBit p <;> simp_all

theorem land_split (Y X U V : ℕ) (hY : Y < 2 ^ 27) (hX : X < 2 ^ 27) :
    (Y ||| (U <<< 27)) &&& (X ||| (V <<< 27)) = (Y &&& X) ||| ((U &&& V) <<< 27) := by
  apply Nat.eq_of_testBit_eq; intro p
  simp only [Nat.testBit_and, Nat.testBit_or, testBit_shl]
  by_cases hp : 27 ≤ p
  · rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hY (Nat.pow_le_pow_right (by norm_num) hp)),
      Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hX (Nat.pow_le_pow_right (by norm_num) hp))]
    simp [hp, Nat.testBit_and]
  · simp [hp]

/-- `∑_{j<32} tb (Y ||| W <<< 27) j` splits at 27 -/
theorem sum32_split (Y W : ℕ) (hY : Y < 2 ^ 27) :
    ∑ j ∈ range 32, tb (Y ||| (W <<< 27)) j = ∑ j ∈ range 27, tb Y j + ∑ j ∈ range 5, tb W j := by
  have hs := Finset.sum_range_add (fun j => tb (Y ||| (W <<< 27)) j) 27 5
  rw [show (27 : ℕ) + 5 = 32 from rfl] at hs
  rw [hs]
  have h1 : ∀ j ∈ range 27, tb (Y ||| (W <<< 27)) j = tb Y j := by
    intro j hj; rw [Finset.mem_range] at hj
    unfold tb; rw [Nat.testBit_or, testBit_shl]
    have : ¬ (27 ≤ j) := by omega
    simp [this]
  have h2 : ∀ j ∈ range 5, tb (Y ||| (W <<< 27)) (27 + j) = tb W j := by
    intro j hj
    unfold tb; rw [Nat.testBit_or, testBit_shl, Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hY
      (Nat.pow_le_pow_right (show 0 < 2 by norm_num) (show 27 ≤ 27 + j by omega)))]
    have : 27 + j - 27 = j := by omega
    simp [this]
  rw [Finset.sum_congr rfl h1, Finset.sum_congr rfl h2]

theorem sum_range_low (W n m : ℕ) (hW : W < 2 ^ n) (hnm : n ≤ m) : ∑ j ∈ range m, tb W j = ∑ j ∈ range n, tb W j := by
  rw [show m = n + (m - n) by omega, Finset.sum_range_add]
  have : ∑ j ∈ range (m - n), tb W (n + j) = 0 := Finset.sum_eq_zero (fun j _ => by
    unfold tb; rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hW (Nat.pow_le_pow_right (by norm_num) (by omega)))]; simp)
  rw [this, add_zero]

theorem ite_bool_zmod_inj {b c : Bool} (h : (if b then (1 : ZMod 2) else 0) = if c then 1 else 0) : b = c := by
  cases b <;> cases c <;> simp_all

theorem ite_xor_zmod (b c : Bool) :
    (if xor b c then (1 : ZMod 2) else 0) = (if b then 1 else 0) + (if c then 1 else 0) := by
  cases b <;> cases c <;> decide

/-- **the parity identity** -/
theorem par_identity (d : ℕ) (t s : State) (al be : ℕ) (hd : d ≤ 2) :
    par32 (yuS d t al &&& xvS d s be) = if xor (gram t s al be) (dirt d t s al be) then 1 else 0 := by
  rw [par32_eq]
  have hY := yvec_lt (Rc t.a al) t.C
  have hX := xvec_lt s.B (Lc s.a be)
  have hsplit := land_split (yvec (Rc t.a al) t.C) (xvec s.B (Lc s.a be)) (row d t.U al) (row d s.V be) hY hX
  have hUV : row d t.U al &&& row d s.V be < 2 ^ d := Nat.and_lt_two_pow _ (row_lt d s.V be)
  have hb : parN 32 (yuS d t al &&& xvS d s be) = xor (gram t s al be) (dirt d t s al be) := by
    apply ite_bool_zmod_inj
    rw [parN_eq, ite_xor_zmod]
    unfold yuS xvS
    rw [hsplit, sum32_split _ _ (Nat.and_lt_two_pow _ hX), sum_range_low _ d 5 hUV (by omega)]
    unfold gram dirt
    rw [parN_eq, parN_eq]
  rw [hb]

theorem valid_par {d : ℕ} {s : State} (hd : d ≤ 2) (h : Valid d s) :
    ∀ al < rk s.a, ∀ be < rk s.a, par32 (yuS d s al &&& xvS d s be) = if al = be then 1 else 0 := by
  intro al hal be hbe
  rw [par_identity d s s al be hd, h.2.2.2.2.2.2 al hal be hbe]
  by_cases e : al = be
  · subst e; simp
  · have : (al == be) = false := by simp [e]
    rw [this]; simp [e]

theorem compat_par {d : ℕ} {t s : State} (hd : d ≤ 2) (h : Compat d t s) :
    ∀ al < rk t.a, ∀ be < rk s.a, par32 (yuS d t al &&& xvS d s be) = 0 := by
  intro al hal be hbe
  rw [par_identity d t s al be hd, h.2.1 al hal be hbe]; simp

theorem compat_par' {d : ℕ} {t s : State} (hd : d ≤ 2) (h : Compat d t s) :
    ∀ al < rk s.a, ∀ be < rk t.a, par32 (yuS d s al &&& xvS d t be) = 0 := by
  intro al hal be hbe
  rw [par_identity d s t al be hd, h.2.2 al hal be hbe]; simp

/-! ## the checker's compatibility -/

theorem rowsOK_of {t x : ℕ} : ∀ r, (∀ q < r, par32 (fYU t q &&& x) = 0) → rowsOK t x r = true
  | 0, _ => rfl
  | r + 1, h => by
    show (Nat.beq (par32 (Nat.land (fYU t r) x)) 0 && rowsOK t x r) = true
    rw [Bool.and_eq_true]
    refine ⟨?_, rowsOK_of r (fun q hq => h q (by omega))⟩
    show Nat.beq (par32 (fYU t r &&& x)) 0 = true
    rw [h r (by omega)]; rfl

theorem cross_of {t s : ℕ} : ∀ n, (∀ be < n, ∀ al < fR t, par32 (fYU t al &&& fXV s be) = 0) →
    compatP.cross t s n = true
  | 0, _ => rfl
  | n + 1, h => by
    show (rowsOK t (fXV s n) (fR t) && compatP.cross t s n) = true
    rw [Bool.and_eq_true]
    exact ⟨rowsOK_of _ (fun q hq => h n (by omega) q hq), cross_of n (fun be hbe => h be (by omega))⟩

/-- **`Compat` gives the checker's compatibility of the packed terms** -/
theorem compat_CP {d : ℕ} {t s : State} (hd : d ≤ 2) (ht : Valid d t) (hs : Valid d s) (h : Compat d t s) :
    CP (pkState d t) (pkState d s) := by
  have hta : t.a < 512 := ht.2.1
  have hsa : s.a < 512 := hs.2.1
  unfold CP compatP
  rw [Bool.and_eq_true, Bool.and_eq_true]
  refine ⟨⟨?_, ?_⟩, ?_⟩
  · rw [fA_pk hd hta, fA_pk hd hsa]
    cases hb : Nat.beq t.a s.a
    · rfl
    · exact absurd (Nat.eq_of_beq_eq_true hb) h.1
  · apply cross_of
    intro be hbe al hal
    rw [fR_pk hd hsa] at hbe; rw [fR_pk hd hta] at hal
    rw [fYU_pk hal hd hta, fXV_pk hbe hd hsa]
    exact compat_par hd h al hal be hbe
  · apply cross_of
    intro be hbe al hal
    rw [fR_pk hd hta] at hbe; rw [fR_pk hd hsa] at hal
    rw [fYU_pk hal hd hsa, fXV_pk hbe hd hta]
    exact compat_par' hd h al hal be hbe

/-! ## rank-1 and rank-2 packed terms -/

theorem mkTerm1_eq (yu xv a : ℕ) : mkTerm1 yu xv a = pkOf 1 (fun _ => yu) (fun _ => xv) a := by
  unfold mkTerm1 pkOf
  simp only [List.range_one, List.foldl_cons, List.foldl_nil, Nat.mul_zero, Nat.add_zero, Nat.shiftLeft_zero,
    Nat.zero_or]
  show yu ||| ((xv <<< 96) ||| ((1 <<< 192) ||| (a <<< 196))) = ((yu ||| (xv <<< 96)) ||| (1 <<< 192)) ||| (a <<< 196)
  simp only [Nat.or_assoc]

theorem vTerm_eq (o : Orb2) (r j : ℕ) :
    vTerm o r j = pkOf 2 (fun q => if q = 0 then rYU0 r else rYU1 r)
      (fun q => if q = 0 then get32 o.PB2X0 (rBstart r + j) else get32 o.PB2X1 (rBstart r + j)) (rA r) := by
  unfold vTerm pkOf
  simp only [show List.range 2 = [0, 1] from rfl, List.foldl_cons, List.foldl_nil, if_pos, Nat.mul_zero, Nat.add_zero,
    Nat.shiftLeft_zero, Nat.zero_or, show (1 : ℕ) = 0 → False from by decide, if_false, Nat.mul_one]
  show rYU0 r ||| ((rYU1 r <<< 32) ||| ((get32 o.PB2X0 (rBstart r + j) <<< 96) ||| ((get32 o.PB2X1 (rBstart r + j) <<< 128)
      ||| ((2 <<< 192) ||| (rA r <<< 196))))) = _
  simp only [Nat.or_assoc, Nat.or_left_comm]
  rfl

/-! ## the constant lists -/

theorem XL_ok : ∀ L < 8, ∀ B < 512, get32 (G.LS.XL L) B = xvec B L := by decide +kernel
theorem YL_ok : ∀ R < 8, ∀ C < 512, get32 (G.LS.YL R) C = yvec R C := by decide +kernel

end GS

#print axioms GS.par_identity
#print axioms GS.compat_CP
#print axioms GS.fYU_pk
#print axioms GS.vTerm_eq
#print axioms GS.XL_ok
