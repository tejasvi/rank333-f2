module
public import R22Port.U_d41d8cd98f00
public import GS.Spec
/-! # Track D, part 1: rank-1 packed terms, parities, the OK masks (`okB`, `okC`)

* `par32_one_iff` / `par32_zero_iff`: `par32` against the `ZMod 2` parity `parZ`;
* `parZ_and_lt29`: with one operand below `2^29` the parity is the 29-bit sum of `sx_spec`;
* `fYU_mk`, `fXV_mk`, `fR_mk`, `fA_mk`: the fields of `mkTerm1 yu xv a`;
* `compatP_mk`: compatibility of two rank-1 packed terms (distinct first factors, both cross parities 0);
* `testBit_okB`, `testBit_okC`: the OK masks of any packed term against the rank-1 part lists of `R1Data`. -/
@[expose] public section
namespace GS.PD
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## parities -/

theorem par32_one_iff (x : ℕ) : par32 x = 1 ↔ parZ x = 1 := by
  rw [par32_eq]
  have h := parN_eq 32 x
  unfold parZ; rw [← h]
  cases parN 32 x <;> decide

theorem par32_zero_iff (x : ℕ) : par32 x = 0 ↔ parZ x = 0 := by
  rw [par32_eq]
  have h := parN_eq 32 x
  unfold parZ; rw [← h]
  cases parN 32 x <;> decide

theorem zmod2_cases (z : ZMod 2) : z = 0 ∨ z = 1 := by
  rcases z with ⟨v, hv⟩
  interval_cases v
  · left; rfl
  · right; rfl

theorem parZ_and_comm (x y : ℕ) : parZ (x &&& y) = parZ (y &&& x) := by rw [Nat.land_comm]

/-- with `x < 2^29`, the 32-bit parity of `y &&& x` is the sum over the 29 low bits -/
theorem parZ_and_lt29 (y x : ℕ) (hx : x < 2 ^ 29) : parZ (y &&& x) = ∑ i ∈ range 29, tb y i * tb x i := by
  unfold parZ
  rw [show (32 : ℕ) = 29 + 3 from rfl, Finset.sum_range_add]
  have h0 : ∀ j < 3, tb (y &&& x) (29 + j) = 0 := by
    intro j hj
    rw [tb_land]
    have : tb x (29 + j) = 0 := by
      rw [tb_eq_zero]; exact Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) (by omega)))
    rw [this, mul_zero]
  rw [Finset.sum_eq_zero (fun j hj => h0 j (Finset.mem_range.mp hj)), add_zero]
  apply Finset.sum_congr rfl; intro i _; rw [tb_land]

/-! ## rank-1 packed terms -/

theorem mkTerm1_eq (yu xv a : ℕ) : mkTerm1 yu xv a = yu ||| (xv <<< 96 ||| (2 ^ 192 ||| a <<< 196)) := by
  show yu ||| (xv <<< 96 ||| (Nat.shiftLeft 1 192 ||| a <<< 196)) = _
  rw [shiftLeft_one]

theorem testBit_lt_false {x n p : ℕ} (hx : x < 2 ^ n) (hp : n ≤ p) : x.testBit p = false :=
  Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) hp))

theorem M29_testBit (j : ℕ) : M29.testBit j = decide (j < 29) := by
  rw [show M29 = 2 ^ 29 - 1 by decide, Nat.testBit_two_pow_sub_one]

theorem fYU_mk (yu xv a : ℕ) (hyu : yu < 2 ^ 29) : fYU (mkTerm1 yu xv a) 0 = yu := by
  apply Nat.eq_of_testBit_eq; intro j
  show ((mkTerm1 yu xv a >>> (32 * 0)) &&& M29).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, M29_testBit, mkTerm1_eq]
  simp only [Nat.mul_zero, Nat.zero_add, Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_two_pow]
  by_cases hj : j < 29
  · have h1 : ¬ (96 ≤ j) := by omega
    have h2 : ¬ (196 ≤ j) := by omega
    have h3 : ¬ (192 = j) := by omega
    simp [hj, h1, h2, h3]
  · rw [testBit_lt_false (p := j) hyu (by omega)]; simp [hj]

theorem fXV_mk (yu xv a : ℕ) (hyu : yu < 2 ^ 29) (hxv : xv < 2 ^ 29) : fXV (mkTerm1 yu xv a) 0 = xv := by
  apply Nat.eq_of_testBit_eq; intro j
  show ((mkTerm1 yu xv a >>> (96 + 32 * 0)) &&& M29).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, M29_testBit, mkTerm1_eq]
  simp only [Nat.mul_zero, Nat.add_zero, Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_two_pow]
  by_cases hj : j < 29
  · have h0 : yu.testBit (96 + j) = false := testBit_lt_false hyu (by omega)
    have h1 : 96 ≤ 96 + j := by omega
    have h2 : ¬ (196 ≤ 96 + j) := by omega
    have h3 : ¬ (192 = 96 + j) := by omega
    have e : 96 + j - 96 = j := by omega
    simp [hj, h0, h1, h2, h3, e]
  · rw [testBit_lt_false (p := j) hxv (by omega)]; simp [hj]

theorem fR_mk (yu xv a : ℕ) (hyu : yu < 2 ^ 29) (hxv : xv < 2 ^ 29) : fR (mkTerm1 yu xv a) = 1 := by
  apply Nat.eq_of_testBit_eq; intro j
  show ((mkTerm1 yu xv a >>> 192) &&& 3).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, mkTerm1_eq]
  simp only [Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_two_pow]
  have h0 : yu.testBit (192 + j) = false := testBit_lt_false hyu (by omega)
  have h1 : xv.testBit (192 + j - 96) = false := testBit_lt_false hxv (by omega)
  have h96 : 96 ≤ 192 + j := by omega
  rcases Nat.lt_or_ge j 2 with hj | hj
  · interval_cases j <;> simp [h0, h1, h96] <;> decide
  · have h3 : (3 : ℕ).testBit j = false := testBit_lt_false (show 3 < 2 ^ 2 by norm_num) hj
    have h1' : (1 : ℕ).testBit j = false := testBit_lt_false (show 1 < 2 ^ 1 by norm_num) (by omega)
    simp [h3, h1']

theorem fA_mk (yu xv a : ℕ) (hyu : yu < 2 ^ 29) (hxv : xv < 2 ^ 29) (ha : a < 512) : fA (mkTerm1 yu xv a) = a := by
  apply Nat.eq_of_testBit_eq; intro j
  show ((mkTerm1 yu xv a >>> 196) &&& 511).testBit j = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, mkTerm1_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num,
    Nat.testBit_two_pow_sub_one]
  simp only [Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_two_pow]
  have h0 : yu.testBit (196 + j) = false := testBit_lt_false hyu (by omega)
  have h1 : xv.testBit (196 + j - 96) = false := testBit_lt_false hxv (by omega)
  have he : ¬ (192 = 196 + j) := by omega
  have h96 : 96 ≤ 196 + j := by omega
  have h196 : 196 ≤ 196 + j := by omega
  have e : 196 + j - 196 = j := by omega
  by_cases hj : j < 9
  · simp [h0, h1, he, e, hj, h96, h196]
  · rw [testBit_lt_false (p := j) (show a < 2 ^ 9 by norm_num; exact ha) (by omega)]; simp [hj]

/-- `compatP` of two packed terms of rank 1 -/
theorem compatP_r1 (t s : ℕ) (ht : fR t = 1) (hs : fR s = 1) :
    compatP t s = ((!(Nat.beq (fA t) (fA s)) && Nat.beq (par32 (fYU t 0 &&& fXV s 0)) 0) &&
      Nat.beq (par32 (fYU s 0 &&& fXV t 0)) 0) := by
  unfold compatP
  rw [ht, hs]
  simp only [compatP.cross, rowsOK, ht, hs, Bool.and_true]
  rfl

theorem compatP_r1_iff (t s : ℕ) (ht : fR t = 1) (hs : fR s = 1) :
    compatP t s = true ↔ fA t ≠ fA s ∧ par32 (fYU t 0 &&& fXV s 0) = 0 ∧ par32 (fYU s 0 &&& fXV t 0) = 0 := by
  rw [compatP_r1 t s ht hs]
  constructor
  · intro h
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨ha, hb⟩, hc⟩ := h
    refine ⟨?_, Nat.eq_of_beq_eq_true hb, Nat.eq_of_beq_eq_true hc⟩
    intro hEq; rw [hEq, Nat.beq_refl] at ha; exact absurd ha (by decide)
  · rintro ⟨ha, hb, hc⟩
    have h1 : Nat.beq (fA t) (fA s) = false := by
      cases h : Nat.beq (fA t) (fA s)
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) ha
    rw [h1, hb, hc]; rfl

/-- compatibility of two rank-1 packed terms -/
theorem compatP_mk (yu xv a yu' xv' a' : ℕ) (h1 : yu < 2 ^ 29) (h2 : xv < 2 ^ 29) (h3 : a < 512)
    (h1' : yu' < 2 ^ 29) (h2' : xv' < 2 ^ 29) (h3' : a' < 512) :
    compatP (mkTerm1 yu xv a) (mkTerm1 yu' xv' a') = true ↔
      a ≠ a' ∧ par32 (yu &&& xv') = 0 ∧ par32 (yu' &&& xv) = 0 := by
  rw [compatP_r1_iff _ _ (fR_mk _ _ _ h1 h2) (fR_mk _ _ _ h1' h2'), fA_mk _ _ _ h1 h2 h3, fA_mk _ _ _ h1' h2' h3',
    fYU_mk _ _ _ h1, fYU_mk _ _ _ h1', fXV_mk _ _ _ h1 h2, fXV_mk _ _ _ h1' h2']

/-! ## the OK masks -/

/-- the fields of the rank-1 part lists, extended by 0 beyond the list (the slices' contents) -/
def fx (P n k : ℕ) : ℕ := if k < n then fld P k else 0

theorem slOK_of_slOKn {S : Sl29} {P n : ℕ} (h : SlOKn S (fld P) n) : SlOK S (fx P n) := by
  intro i hi k
  rw [h i hi k]; unfold fx
  by_cases hk : k < n <;> simp [hk]

theorem testBit_AB {n b : ℕ} : (2 ^ n - 1).testBit b = decide (b < n) := Nat.testBit_two_pow_sub_one n b

/-- the parity read by `sx` on the B-part slices -/
theorem sxB (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (y b : ℕ) (hb : b < nB) :
    tb (sx r1.SB y) b = parZ (y &&& fld PB1 b) := by
  rw [sx_spec r1.SB (fx PB1 nB) (slOK_of_slOKn hD.SB) y b, parZ_and_lt29 y _ (hD.fB b hb)]
  unfold fx; rw [if_pos hb]

theorem sxC (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (y c : ℕ) (hc : c < nC) :
    tb (sx r1.SC y) c = parZ (y &&& fld PC1 c) := by
  rw [sx_spec r1.SC (fx PC1 nC) (slOK_of_slOKn hD.SC) y c, parZ_and_lt29 y _ (hD.fC c hc)]
  unfold fx; rw [if_pos hc]

/-- `rowsB` reads, for every row `q' < q` of `t`, the parity against the B-part field -/
theorem testBit_rowsB (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (t : ℕ) :
    ∀ (q b : ℕ), (rowsB r1 t q).testBit b = (decide (b < nB) && decide (∀ q' < q, parZ (fYU t q' &&& fld PB1 b) = 0))
  | 0, b => by
    show r1.AB.testBit b = _
    rw [hD.AB, testBit_AB]; simp
  | q + 1, b => by
    show (rowsB r1 t q &&& (r1.AB ^^^ sx r1.SB (fYU t q))).testBit b = _
    rw [Nat.testBit_and, testBit_rowsB r1 PB1 PC1 nB nC hD t q b, Nat.testBit_xor, hD.AB, testBit_AB]
    by_cases hb : b < nB
    · have hs := sxB r1 PB1 PC1 nB nC hD (fYU t q) b hb
      simp only [hb, decide_true, Bool.true_and]
      rcases zmod2_cases (parZ (fYU t q &&& fld PB1 b)) with h0 | h0
      · rw [h0] at hs; rw [tb_eq_zero.mp hs]
        simp only [Bool.xor_false, Bool.and_true]
        apply decide_eq_decide.mpr
        constructor
        · intro h q' hq'
          rcases Nat.lt_succ_iff_lt_or_eq.mp hq' with hlt | rfl
          · exact h q' hlt
          · exact h0
        · intro h q' hq'; exact h q' (by omega)
      · rw [h0] at hs; rw [tb_eq_one.mp hs]
        simp only [Bool.xor_true, Bool.not_true, Bool.and_false]
        symm; rw [decide_eq_false_iff_not]
        intro h; have := h q (by omega); rw [h0] at this; exact absurd this (by decide)
    · simp [hb]

theorem testBit_rowsC (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (t : ℕ) :
    ∀ (q c : ℕ), (rowsC r1 t q).testBit c = (decide (c < nC) && decide (∀ q' < q, parZ (fXV t q' &&& fld PC1 c) = 0))
  | 0, c => by
    show r1.AC.testBit c = _
    rw [hD.AC, testBit_AB]; simp
  | q + 1, c => by
    show (rowsC r1 t q &&& (r1.AC ^^^ sx r1.SC (fXV t q))).testBit c = _
    rw [Nat.testBit_and, testBit_rowsC r1 PB1 PC1 nB nC hD t q c, Nat.testBit_xor, hD.AC, testBit_AB]
    by_cases hc : c < nC
    · have hs := sxC r1 PB1 PC1 nB nC hD (fXV t q) c hc
      simp only [hc, decide_true, Bool.true_and]
      rcases zmod2_cases (parZ (fXV t q &&& fld PC1 c)) with h0 | h0
      · rw [h0] at hs; rw [tb_eq_zero.mp hs]
        simp only [Bool.xor_false, Bool.and_true]
        apply decide_eq_decide.mpr
        constructor
        · intro h q' hq'
          rcases Nat.lt_succ_iff_lt_or_eq.mp hq' with hlt | rfl
          · exact h q' hlt
          · exact h0
        · intro h q' hq'; exact h q' (by omega)
      · rw [h0] at hs; rw [tb_eq_one.mp hs]
        simp only [Bool.xor_true, Bool.not_true, Bool.and_false]
        symm; rw [decide_eq_false_iff_not]
        intro h; have := h q (by omega); rw [h0] at this; exact absurd this (by decide)
    · simp [hc]

/-- **`okB`**: the B-parts `b < nB` whose field has parity 0 against every row of `t` -/
theorem testBit_okB (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (t b : ℕ) :
    (okB r1 t).testBit b = (decide (b < nB) && decide (∀ q < fR t, parZ (fYU t q &&& fld PB1 b) = 0)) :=
  testBit_rowsB r1 PB1 PC1 nB nC hD t (fR t) b

/-- **`okC`**: the C-parts `c < nC` whose field has parity 0 against every column of `t` -/
theorem testBit_okC (r1 : R1) (PB1 PC1 nB nC : ℕ) (hD : R1Data r1 PB1 PC1 nB nC) (t c : ℕ) :
    (okC r1 t).testBit c = (decide (c < nC) && decide (∀ q < fR t, parZ (fXV t q &&& fld PC1 c) = 0)) :=
  testBit_rowsC r1 PB1 PC1 nB nC hD t (fR t) c

end GS.PD

#print axioms GS.PD.compatP_mk
#print axioms GS.PD.testBit_okB
#print axioms GS.PD.testBit_okC
