module
public import R22Port.U_d41d8cd98f00
public import GS.Spec
public import GS.Bits2
public import GS.Pk
/-! # Track V, part 1: packed rank-2 terms, checker compatibility, the record / B-part masks of phase B

* `T2 y0 y1 x0 x1 a`: the packed rank-2 term (`vTerm`, `memTerm` are instances, `vTerm_eq`, `memTerm_eq`); `T2_val` as a sum,
  its fields `fYU_T2_0` … `fA_T2`;
* `CP_cross`: checker compatibility gives distinct first factors and all cross parities 0; `CP_symm`;
* `okcR_bit`, `okbR_bit`: the record / B-part masks of a base term contain every record / B-part with the parities 0. -/
@[expose] public section
namespace GS.V
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## packed rank-2 terms -/

theorem shl_eq (y k : ℕ) : Nat.shiftLeft y k = y * 2 ^ k := by
  show y <<< k = _; exact Nat.shiftLeft_eq y k

theorem shr_eq (y k : ℕ) : Nat.shiftRight y k = y / 2 ^ k := by
  show y >>> k = _; exact Nat.shiftRight_eq_div_pow y k

theorem land_mask (x n : ℕ) : Nat.land x (2 ^ n - 1) = x % 2 ^ n := Nat.and_two_pow_sub_one_eq_mod x n

theorem lor_mul_two_pow (x y k : ℕ) (hx : x < 2 ^ k) : Nat.lor x (y * 2 ^ k) = x + y * 2 ^ k := by
  have h := Nat.two_pow_add_eq_or_of_lt hx y
  show x ||| (y * 2 ^ k) = _
  rw [Nat.lor_comm, Nat.mul_comm y, ← h, Nat.add_comm]

/-- the packed rank-2 term with fields `y0, y1` (YU), `x0, x1` (XV) and first factor `a` -/
def T2 (y0 y1 x0 x1 a : ℕ) : ℕ :=
  Nat.lor y0 (Nat.lor (Nat.shiftLeft y1 32) (Nat.lor (Nat.shiftLeft x0 96)
    (Nat.lor (Nat.shiftLeft x1 128) (Nat.lor (Nat.shiftLeft 2 192) (Nat.shiftLeft a 196)))))

theorem vTerm_eq (o : Orb2) (r j : ℕ) : vTerm o r j =
    T2 (rYU0 r) (rYU1 r) (get32 o.PB2X0 (rBstart r + j)) (get32 o.PB2X1 (rBstart r + j)) (rA r) := rfl

theorem memTerm_eq (p : Packs) (k : ℕ) : memTerm p k =
    T2 (get32 p.Y0 k) (get32 p.Y1 k) (get32 p.X0 k) (get32 p.X1 k) (get32 p.A k) := rfl

theorem T2_val (y0 y1 x0 x1 a : ℕ) (h0 : y0 < 2 ^ 32) (h1 : y1 < 2 ^ 32) (h2 : x0 < 2 ^ 32) (h3 : x1 < 2 ^ 32) :
    T2 y0 y1 x0 x1 a = y0 + y1 * 2 ^ 32 + x0 * 2 ^ 96 + x1 * 2 ^ 128 + 2 * 2 ^ 192 + a * 2 ^ 196 := by
  unfold T2
  simp only [shl_eq]
  rw [lor_mul_two_pow (2 * 2 ^ 192) a 196 (by norm_num)]
  rw [show 2 * 2 ^ 192 + a * 2 ^ 196 = (2 + a * 16) * 2 ^ 192 by ring,
    lor_mul_two_pow (x1 * 2 ^ 128) (2 + a * 16) 192 (by
      calc x1 * 2 ^ 128 < 2 ^ 32 * 2 ^ 128 := Nat.mul_lt_mul_of_pos_right h3 (by positivity)
        _ ≤ 2 ^ 192 := by norm_num)]
  rw [show x1 * 2 ^ 128 + (2 + a * 16) * 2 ^ 192 = (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 128 by ring,
    lor_mul_two_pow (x0 * 2 ^ 96) (x1 + (2 + a * 16) * 2 ^ 64) 128 (by
      calc x0 * 2 ^ 96 < 2 ^ 32 * 2 ^ 96 := Nat.mul_lt_mul_of_pos_right h2 (by positivity)
        _ ≤ 2 ^ 128 := by norm_num)]
  rw [show x0 * 2 ^ 96 + (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 128 = (x0 + (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 32) * 2 ^ 96 by ring,
    lor_mul_two_pow (y1 * 2 ^ 32) (x0 + (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 32) 96 (by
      calc y1 * 2 ^ 32 < 2 ^ 32 * 2 ^ 32 := Nat.mul_lt_mul_of_pos_right h1 (by positivity)
        _ ≤ 2 ^ 96 := by norm_num)]
  rw [show y1 * 2 ^ 32 + (x0 + (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 32) * 2 ^ 96 =
      (y1 + (x0 + (x1 + (2 + a * 16) * 2 ^ 64) * 2 ^ 32) * 2 ^ 64) * 2 ^ 32 by ring,
    lor_mul_two_pow y0 _ 32 h0]
  ring

theorem M29_eq : M29 = 2 ^ 29 - 1 := by decide

theorem fYU_eq (t q : ℕ) : fYU t q = t / 2 ^ (32 * q) % 2 ^ 29 := by
  unfold fYU; rw [shr_eq, M29_eq, land_mask]; rfl

theorem fXV_eq (t q : ℕ) : fXV t q = t / 2 ^ (96 + 32 * q) % 2 ^ 29 := by
  unfold fXV; rw [shr_eq, M29_eq, land_mask]; rfl

theorem fR_eq (t : ℕ) : fR t = t / 2 ^ 192 % 4 := by
  unfold fR; rw [shr_eq, show (3 : ℕ) = 2 ^ 2 - 1 by norm_num, land_mask]; rfl

theorem fA_eq (t : ℕ) : fA t = t / 2 ^ 196 % 512 := by
  unfold fA; rw [shr_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, land_mask]; rfl

section fields
variable (y0 y1 x0 x1 a : ℕ) (h0 : y0 < 2 ^ 29) (h1 : y1 < 2 ^ 29) (h2 : x0 < 2 ^ 29) (h3 : x1 < 2 ^ 29)
include h0 h1 h2 h3

theorem T2_val' : T2 y0 y1 x0 x1 a = y0 + y1 * 2 ^ 32 + x0 * 2 ^ 96 + x1 * 2 ^ 128 + 2 * 2 ^ 192 + a * 2 ^ 196 :=
  T2_val y0 y1 x0 x1 a (by omega) (by omega) (by omega) (by omega)

theorem fYU_T2_0 : fYU (T2 y0 y1 x0 x1 a) 0 = y0 := by
  rw [fYU_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

theorem fYU_T2_1 : fYU (T2 y0 y1 x0 x1 a) 1 = y1 := by
  rw [fYU_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

theorem fXV_T2_0 : fXV (T2 y0 y1 x0 x1 a) 0 = x0 := by
  rw [fXV_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

theorem fXV_T2_1 : fXV (T2 y0 y1 x0 x1 a) 1 = x1 := by
  rw [fXV_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

theorem fR_T2 : fR (T2 y0 y1 x0 x1 a) = 2 := by
  rw [fR_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

theorem fA_T2 (ha : a < 512) : fA (T2 y0 y1 x0 x1 a) = a := by
  rw [fA_eq, T2_val' y0 y1 x0 x1 a h0 h1 h2 h3]; norm_num; omega

end fields

/-! ## checker compatibility -/

theorem rowsOK_spec (t x : ℕ) : ∀ n, rowsOK t x n = true → ∀ q < n, par32 (Nat.land (fYU t q) x) = 0
  | 0, _, q, hq => absurd hq (Nat.not_lt_zero q)
  | n + 1, h, q, hq => by
    have h' : (Nat.beq (par32 (Nat.land (fYU t n) x)) 0 && rowsOK t x n) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hq with hlt | rfl
    · exact rowsOK_spec t x n h'.2 q hlt
    · exact Nat.eq_of_beq_eq_true h'.1

theorem cross_spec (t s : ℕ) : ∀ n, compatP.cross t s n = true → ∀ be < n, ∀ al < fR t,
    par32 (Nat.land (fYU t al) (fXV s be)) = 0
  | 0, _, be, hb => absurd hb (Nat.not_lt_zero be)
  | n + 1, h, be, hb => by
    have h' : (rowsOK t (fXV s n) (fR t) && compatP.cross t s n) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.mp hb with hlt | rfl
    · exact cross_spec t s n h'.2 be hlt
    · exact rowsOK_spec t (fXV s be) (fR t) h'.1

/-- **checker compatibility**: distinct first factors and all cross parities 0 -/
theorem CP_cross {t s : ℕ} (h : CP t s) : fA t ≠ fA s ∧
    (∀ be < fR s, ∀ al < fR t, par32 (Nat.land (fYU t al) (fXV s be)) = 0) ∧
    (∀ be < fR t, ∀ al < fR s, par32 (Nat.land (fYU s al) (fXV t be)) = 0) := by
  have h' : (!(Nat.beq (fA t) (fA s)) && compatP.cross t s (fR s) && compatP.cross s t (fR t)) = true := h
  simp only [Bool.and_eq_true, Bool.not_eq_true'] at h'
  obtain ⟨⟨ha, h1⟩, h2⟩ := h'
  refine ⟨fun e => ?_, cross_spec t s _ h1, cross_spec s t _ h2⟩
  rw [e, Nat.beq_refl] at ha; exact absurd ha (by decide)

theorem CP_symm {t s : ℕ} (h : CP t s) : CP s t := by
  have h' : (!(Nat.beq (fA t) (fA s)) && compatP.cross t s (fR s) && compatP.cross s t (fR t)) = true := h
  show (!(Nat.beq (fA s) (fA t)) && compatP.cross s t (fR t) && compatP.cross t s (fR s)) = true
  simp only [Bool.and_eq_true, Bool.not_eq_true'] at h' ⊢
  obtain ⟨⟨ha, h1⟩, h2⟩ := h'
  refine ⟨⟨?_, h2⟩, h1⟩
  cases e : Nat.beq (fA s) (fA t)
  · rfl
  · rw [Nat.eq_of_beq_eq_true e, Nat.beq_refl] at ha; exact absurd ha (by decide)

/-! ## parities from `par32` -/

theorem testBit_false_of_lt {f j n : ℕ} (hf : f < 2 ^ n) (hj : n ≤ j) : f.testBit j = false :=
  Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hf (Nat.pow_le_pow_right (by norm_num) hj))

/-- `par32 (f &&& y) = 0` with `f < 2^29` makes the 29-bit sum vanish -/
theorem par29_of_par32 {f y : ℕ} (hf : f < 2 ^ 29) (h : par32 (Nat.land f y) = 0) :
    ∑ i ∈ range 29, tb y i * tb f i = 0 := by
  rw [par32_eq] at h
  have hp : parN 32 (Nat.land f y) = false := by
    cases e : parN 32 (Nat.land f y)
    · rfl
    · rw [e] at h; exact absurd h (by decide)
  have hs := parN_eq 32 (Nat.land f y)
  rw [hp] at hs; simp only [Bool.false_eq_true, if_false] at hs
  rw [show (32 : ℕ) = 29 + 3 from rfl, Finset.sum_range_add] at hs
  have h3 : ∑ j ∈ range 3, tb (Nat.land f y) (29 + j) = 0 := by
    apply Finset.sum_eq_zero; intro j hj; rw [Finset.mem_range] at hj
    show tb (f &&& y) (29 + j) = 0
    rw [tb_land]; unfold tb; rw [testBit_false_of_lt hf (by omega)]; simp
  rw [h3, add_zero] at hs
  rw [hs]; apply Finset.sum_congr rfl; intro i _
  show tb y i * tb f i = tb (f &&& y) i
  rw [tb_land, mul_comm]

/-- slices with a length are slices of the truncated fields -/
theorem slOK_of_n {S : Sl29} {x : ℕ → ℕ} {n : ℕ} (h : SlOKn S x n) : SlOK S (fun k => if k < n then x k else 0) := by
  intro i hi k
  rw [h i hi k]
  by_cases hk : k < n <;> simp [hk]

/-- bit `k < n` of a bit-sliced parity test vanishes when the field's parity with `y` does -/
theorem sx_bit_false {S : Sl29} {x : ℕ → ℕ} {n : ℕ} (h : SlOKn S x n) (y k : ℕ) (hk : k < n) (hx : x k < 2 ^ 29)
    (hp : par32 (Nat.land (x k) y) = 0) : (sx S y).testBit k = false := by
  have := sx_spec S _ (slOK_of_n h) y k
  simp only [hk, if_true] at this
  rw [par29_of_par32 hx hp] at this
  exact tb_eq_zero.mp this

/-! ## the record and B-part masks of a base term (phase B) -/

theorem testBit_two_pow_sub_one (n k : ℕ) : (2 ^ n - 1).testBit k = decide (k < n) := by
  rw [Nat.testBit_two_pow_sub_one]

/-- the record mask of `t` contains every record whose two YU fields have parity 0 with every column of `t` -/
theorem okcR_bit {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3) (t c : ℕ)
    (hc : c < nRec)
    (h : ∀ q < fR t, par32 (Nat.land (rYU0 (recG o c)) (fXV t q)) = 0 ∧ par32 (Nat.land (rYU1 (recG o c)) (fXV t q)) = 0) :
    (okcR o t).testBit c = true := by
  obtain ⟨e0, e1, b0, b1, -⟩ := hF.recs c hc
  have key : ∀ n, n ≤ fR t → (rowsCR o t n).testBit c = true := by
    intro n
    induction n with
    | zero => intro _; show o.AR.testBit c = true; rw [hF.AR, testBit_two_pow_sub_one]; simp [hc]
    | succ n ih =>
      intro hn
      show (Nat.land (rowsCR o t n) (Nat.xor o.AR (Nat.lor (sx o.SY0 (fXV t n)) (sx o.SY1 (fXV t n))))).testBit c = true
      have hq := h n (by omega)
      have s0 := sx_bit_false hF.SY0 (fXV t n) c hc (by rw [e0]; exact b0) (by rw [e0]; exact hq.1)
      have s1 := sx_bit_false hF.SY1 (fXV t n) c hc (by rw [e1]; exact b1) (by rw [e1]; exact hq.2)
      show ((rowsCR o t n) &&& (o.AR ^^^ (sx o.SY0 (fXV t n) ||| sx o.SY1 (fXV t n)))).testBit c = true
      rw [Nat.testBit_and, Nat.testBit_xor, Nat.testBit_or, s0, s1, ih (by omega), hF.AR, testBit_two_pow_sub_one]
      simp [hc]
  exact key (fR t) le_rfl

/-- the B-part mask of `t` contains every B-part whose two XV fields have parity 0 with every row of `t` -/
theorem okbR_bit {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} {v3 : Bool} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 v3) (t b : ℕ)
    (hb : b < nB2)
    (h : ∀ q < fR t, par32 (Nat.land (fld o.PB2X0 b) (fYU t q)) = 0 ∧ par32 (Nat.land (fld o.PB2X1 b) (fYU t q)) = 0) :
    (okbR o t).testBit b = true := by
  obtain ⟨b0, b1⟩ := hF.bx b hb
  have key : ∀ n, n ≤ fR t → (rowsBR o t n).testBit b = true := by
    intro n
    induction n with
    | zero => intro _; show o.AB2.testBit b = true; rw [hF.AB2, testBit_two_pow_sub_one]; simp [hb]
    | succ n ih =>
      intro hn
      have hq := h n (by omega)
      have s0 := sx_bit_false hF.SX0 (fYU t n) b hb b0 hq.1
      have s1 := sx_bit_false hF.SX1 (fYU t n) b hb b1 hq.2
      show ((rowsBR o t n) &&& (o.AB2 ^^^ (sx o.SX0 (fYU t n) ||| sx o.SX1 (fYU t n)))).testBit b = true
      rw [Nat.testBit_and, Nat.testBit_xor, Nat.testBit_or, s0, s1, ih (by omega), hF.AB2, testBit_two_pow_sub_one]
      simp [hb]
  exact key (fR t) le_rfl

end GS.V

#print axioms GS.V.T2_val
#print axioms GS.V.fA_T2
#print axioms GS.V.CP_cross
#print axioms GS.V.okcR_bit
#print axioms GS.V.okbR_bit
