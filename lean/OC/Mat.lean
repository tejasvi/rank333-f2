module
public import R22Port.U_6d73af0793e7
public import G.Interface
public import OC.Chk
public import Mathlib
/-! # Symbolic lemmas for the orbit-completeness proof: bits, 3x3 codes as matrices, inverses, the Gram condition

Self-contained (only `G.Interface`, `OC.Chk`, Mathlib).  The fold/bit lemmas and the decoding of `mul3` follow the bridge's
`Br/Bits.lean` and `Br/Dec.lean` (same statements, restated here with `bF (v.testBit i)` in place of `RootSound.bitF`).

* `toM3_mul3`, `eq_of_toM3`, `mul3_assoc`: `mul3` is the matrix product of the decoded 3x3 matrices over `F2`;
* `inv3_unique`: `mul3 M x = I3`, `x < 512` give `inv3 M = x` (the `find?` in `inv3` returns the unique inverse);
* `GL3_mul`, `compB`: products of invertible codes, and `(q (B0 h0)) (h h0)⁻¹ = (q B0) h⁻¹`;
* `gram_unit`: for FAC unit-vector factors, `gram t s al be` is bit `3 al + be` of `mul3 s.B t.C`;
* `valid273`, `valid17`: the Gram system of an anchor state as one equation on `mul3 B C`. -/
@[expose] public section
open Matrix

namespace OC
open G

abbrev F2 := ZMod 2

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

theorem lt_of_bits {v n : ℕ} (h : ∀ i, n ≤ i → v.testBit i = false) : v < 2 ^ n :=
  Nat.lt_pow_two_of_testBit v (fun i hi => h i hi)

theorem orFold_lt (P : ℕ → Bool) (n : ℕ) :
    (List.range n).foldl (fun acc p => if P p = true then acc ||| (1 <<< p) else acc) 0 < 2 ^ n := by
  apply lt_of_bits
  intro i hi
  rw [testBit_orFold]
  simp [show ¬ i < n by omega]

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

theorem testBit_rowOf (M i k : ℕ) : (rowOf M i).testBit k = (decide (k < 3) && M.testBit (3 * i + k)) := by
  show ((M >>> (3 * i)) % 2 ^ 3).testBit k = _
  rw [Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]

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

/-! ## 3x3 codes as matrices over `F2` -/

/-- the 3x3 matrix of a code: entry `(i, j)` = bit `3 i + j` -/
def toM3 (v : ℕ) : Matrix (Fin 3) (Fin 3) F2 := fun i j => bF (v.testBit (3 * i.val + j.val))

theorem bF_vecMul3 (v N j : ℕ) (hj : j < 3) :
    bF ((vecMul3 v N).testBit j) = ∑ k : Fin 3, bF (v.testBit k) * bF (N.testBit (3 * k + j)) := by
  unfold vecMul3
  rw [bF_xorFold (fun k => bitN v k) (fun k => rowOf N k), Finset.sum_range]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [testBit_rowOf]
  simp [hj, bitN]

theorem vecMul3_lt (v N : ℕ) : vecMul3 v N < 2 ^ 3 :=
  xorFold_lt (fun k => bitN v k) (fun k => rowOf N k) 3 (fun k => rowOf_lt N k) 3

theorem testBit_hi3 {x : ℕ} (hx : x < 2 ^ 3) (m : ℕ) (hm : 3 ≤ m) : x.testBit m = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) hm))

theorem testBit_mul3 (M N i j : ℕ) (hi : i < 3) (hj : j < 3) :
    (mul3 M N).testBit (3 * i + j) = (vecMul3 (rowOf M i) N).testBit j := by
  unfold mul3
  have b0 := vecMul3_lt (rowOf M 0) N
  have b1 := vecMul3_lt (rowOf M 1) N
  have b2 := vecMul3_lt (rowOf M 2) N
  interval_cases i
  · simp [Nat.testBit_or, Nat.testBit_shiftLeft, show ¬ 3 ≤ j by omega, show ¬ 6 ≤ j by omega]
  · rw [Nat.testBit_or, Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_shiftLeft,
      testBit_hi3 b0 _ (by omega)]
    simp [show ¬ 6 ≤ 3 * 1 + j by omega, show 3 * 1 + j - 3 = j by omega]
  · rw [Nat.testBit_or, Nat.testBit_or, Nat.testBit_shiftLeft, Nat.testBit_shiftLeft,
      testBit_hi3 b0 _ (by omega), testBit_hi3 b1 (3 * 2 + j - 3) (by omega)]
    simp [show 3 * 2 + j - 6 = j by omega]

theorem toM3_mul3 (M N : ℕ) : toM3 (mul3 M N) = toM3 M * toM3 N := by
  ext i j
  simp only [toM3, Matrix.mul_apply]
  rw [testBit_mul3 M N i j i.isLt j.isLt, bF_vecMul3 _ _ _ j.isLt]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [testBit_rowOf]
  simp [k.isLt]

theorem mul3_lt (M N : ℕ) : mul3 M N < 512 := by
  unfold mul3
  have b0 := vecMul3_lt (rowOf M 0) N
  have b1 := vecMul3_lt (rowOf M 1) N
  have b2 := vecMul3_lt (rowOf M 2) N
  show _ < 2 ^ 9
  refine Nat.or_lt_two_pow (Nat.or_lt_two_pow ?_ ?_) ?_
  · exact lt_of_lt_of_le b0 (by norm_num)
  · rw [Nat.shiftLeft_eq]; norm_num at b1 ⊢; omega
  · rw [Nat.shiftLeft_eq]; norm_num at b2 ⊢; omega

theorem eq_of_toM3 {v w : ℕ} (hv : v < 512) (hw : w < 512) (h : toM3 v = toM3 w) : v = w := by
  apply eq_of_bits_lt (n := 9) hv hw
  intro i hi
  have := congrFun (congrFun h ⟨i / 3, by omega⟩) ⟨i % 3, by omega⟩
  simp only [toM3] at this
  rw [show 3 * (i / 3) + i % 3 = i by omega] at this
  exact bF_inj this

theorem toM3_I3 : toM3 I3 = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> decide

theorem mul3_assoc (a b c : ℕ) : mul3 (mul3 a b) c = mul3 a (mul3 b c) :=
  eq_of_toM3 (mul3_lt _ _) (mul3_lt _ _) (by simp only [toM3_mul3, Matrix.mul_assoc])

/-! ## inverses -/

theorem inv3_spec {M x : ℕ} (hx : x < 512) (h : mul3 M x = I3) : inv3 M < 512 ∧ mul3 M (inv3 M) = I3 := by
  unfold inv3
  have hne : (List.range 512).find? (fun X => mul3 M X == I3) ≠ none := by
    intro hn
    rw [List.find?_eq_none] at hn
    exact hn x (List.mem_range.mpr hx) (by simp [h])
  obtain ⟨y, hy⟩ := Option.ne_none_iff_exists'.mp hne
  rw [hy, Option.getD_some]
  refine ⟨List.mem_range.mp (List.mem_of_find?_eq_some hy), ?_⟩
  have := List.find?_some hy
  simpa using this

theorem inv3_unique {M x : ℕ} (hx : x < 512) (h : mul3 M x = I3) : inv3 M = x := by
  obtain ⟨hy, hMy⟩ := inv3_spec hx h
  have e1 : toM3 M * toM3 x = 1 := by rw [← toM3_mul3, h, toM3_I3]
  have e2 : toM3 x * toM3 M = 1 := mul_eq_one_comm.mp e1
  have e3 : toM3 M * toM3 (inv3 M) = 1 := by rw [← toM3_mul3, hMy, toM3_I3]
  apply eq_of_toM3 hy hx
  calc toM3 (inv3 M) = (toM3 x * toM3 M) * toM3 (inv3 M) := by rw [e2, Matrix.one_mul]
    _ = toM3 x * (toM3 M * toM3 (inv3 M)) := Matrix.mul_assoc _ _ _
    _ = toM3 x := by rw [e3, Matrix.mul_one]

theorem GL3_of {g gi : ℕ} (h : inv3ok g gi = true) : GL3 g ∧ inv3 g = gi := by
  unfold inv3ok at h
  simp only [Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨⟨hg, hgi⟩, hm⟩ := h
  have hu := inv3_unique hgi hm
  exact ⟨⟨hg, by rw [hu]; exact hm⟩, hu⟩

theorem toM3_inv3 {g : ℕ} (hg : GL3 g) : toM3 g * toM3 (inv3 g) = 1 := by
  rw [← toM3_mul3, hg.2, toM3_I3]

theorem GL3_mul {h h0 : ℕ} (hh : GL3 h) (hh0 : GL3 h0) : GL3 (mul3 h h0) := by
  refine ⟨mul3_lt _ _, ?_⟩
  have hx : mul3 (mul3 h h0) (mul3 (inv3 h0) (inv3 h)) = I3 := by
    apply eq_of_toM3 (mul3_lt _ _) (by unfold I3; norm_num)
    rw [toM3_mul3, toM3_mul3, toM3_mul3, toM3_I3]
    calc toM3 h * toM3 h0 * (toM3 (inv3 h0) * toM3 (inv3 h))
        = toM3 h * (toM3 h0 * toM3 (inv3 h0)) * toM3 (inv3 h) := by simp only [Matrix.mul_assoc]
      _ = 1 := by rw [toM3_inv3 hh0, Matrix.mul_one, toM3_inv3 hh]
  rw [inv3_unique (mul3_lt _ _) hx]
  exact hx

/-- `(q (B0 h0)) (h h0)⁻¹ = (q B0) h⁻¹` -/
theorem compB (q B0 h h0 : ℕ) (hh : GL3 h) (hh0 : GL3 h0) :
    mul3 (mul3 q (mul3 B0 h0)) (inv3 (mul3 h h0)) = mul3 (mul3 q B0) (inv3 h) := by
  have hX := toM3_inv3 (GL3_mul hh hh0)
  have hHi : toM3 (inv3 h) * toM3 h = 1 := mul_eq_one_comm.mp (toM3_inv3 hh)
  rw [toM3_mul3] at hX
  have key : toM3 h0 * toM3 (inv3 (mul3 h h0)) = toM3 (inv3 h) := by
    calc toM3 h0 * toM3 (inv3 (mul3 h h0))
        = (toM3 (inv3 h) * toM3 h) * (toM3 h0 * toM3 (inv3 (mul3 h h0))) := by rw [hHi, Matrix.one_mul]
      _ = toM3 (inv3 h) * (toM3 h * toM3 h0 * toM3 (inv3 (mul3 h h0))) := by simp only [Matrix.mul_assoc]
      _ = toM3 (inv3 h) := by rw [hX, Matrix.mul_one]
  apply eq_of_toM3 (mul3_lt _ _) (mul3_lt _ _)
  simp only [toM3_mul3, Matrix.mul_assoc]
  rw [key]

/-! ## the Gram condition of anchor states -/

theorem testBit_yvec (R C p : ℕ) :
    (yvec R C).testBit p = (decide (p < 27) && (R.testBit (p / 9) && C.testBit (p % 9))) :=
  testBit_orFold (fun p => bitN R (p / 9) && bitN C (p % 9)) 27 p

theorem testBit_xvec (B L p : ℕ) :
    (xvec B L).testBit p = (decide (p < 27) && (B.testBit (p / 3) && L.testBit (p % 3))) :=
  testBit_orFold (fun p => bitN B (p / 3) && bitN L (p % 3)) 27 p

theorem bF_gram (t s : State) (al be : ℕ) : bF (G.gram t s al be) =
    ∑ j : Fin 3, ∑ k : Fin 3, ∑ i : Fin 3,
      bF ((Rc t.a al).testBit j) * bF (s.B.testBit (3 * j + k)) * bF (t.C.testBit (3 * k + i)) *
        bF ((Lc s.a be).testBit i) := by
  unfold G.gram
  rw [bF_parN]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.testBit_and, testBit_yvec, testBit_xvec,
    Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two, bF_and]
  norm_num
  ring

theorem bF_mul3 (B C al be : ℕ) (hal : al < 3) (hbe : be < 3) :
    bF ((mul3 B C).testBit (3 * al + be)) =
      ∑ k : Fin 3, bF (B.testBit (3 * al + k)) * bF (C.testBit (3 * k + be)) := by
  rw [testBit_mul3 B C al be hal hbe, bF_vecMul3 _ _ _ hbe]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [testBit_rowOf]
  simp [k.isLt]

/-- with unit-vector FAC factors `R_t[al] = e_al`, `L_s[be] = e_be`, `G_ts[al][be]` is entry `(al, be)` of `B_s C_t` -/
theorem gram_unit (t s : State) (al be : ℕ) (hal : al < 3) (hbe : be < 3)
    (hR : Rc t.a al = 2 ^ al) (hL : Lc s.a be = 2 ^ be) :
    G.gram t s al be = (mul3 s.B t.C).testBit (3 * al + be) := by
  apply bF_inj
  rw [bF_gram, bF_mul3 _ _ _ _ hal hbe, hR, hL]
  simp only [Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two, Nat.testBit_two_pow]
  interval_cases al <;> interval_cases be <;> simp

theorem testBit_dirtM (d U V al be : ℕ) (hal : al < 3) (hbe : be < 3) :
    (dirtM d U V).testBit (3 * al + be) = parN d (row d U al &&& row d V be) := by
  unfold dirtM
  rw [testBit_orFold (fun p => parN d (row d U (p / 3) &&& row d V (p % 3))) 9 (3 * al + be)]
  have h1 : (3 * al + be) / 3 = al := by omega
  have h2 : (3 * al + be) % 3 = be := by omega
  simp [h1, h2, show 3 * al + be < 9 by omega]

theorem dirtM_lt (d U V : ℕ) : dirtM d U V < 2 ^ 9 :=
  orFold_lt (fun p => parN d (row d U (p / 3) &&& row d V (p % 3))) 9

theorem rk273 : rk 273 = 3 := by decide
theorem fac273 : ∀ q < 3, Lc 273 q = 2 ^ q ∧ Rc 273 q = 2 ^ q := by decide
theorem rk17 : rk 17 = 2 := by decide
theorem fac17 : ∀ q < 2, Lc 17 q = 2 ^ q ∧ Rc 17 q = 2 ^ q := by decide
theorem testBit273 : ∀ al < 3, ∀ be < 3, (273 : ℕ).testBit (3 * al + be) = (al == be) := by decide

/-- the Gram system of an invertible anchor state: `B C = I + U Vᵀ` -/
theorem valid273 {d B C U V : ℕ} (h : Valid d ⟨I3, B, C, U, V⟩) :
    B < 512 ∧ C < 512 ∧ U < 2 ^ (d * 3) ∧ V < 2 ^ (d * 3) ∧ mul3 B C = Nat.xor 273 (dirtM d U V) := by
  obtain ⟨_, _, hB, hC, hU, hV, hg⟩ := h
  have hrk : rk (State.a ⟨I3, B, C, U, V⟩) = 3 := rk273
  rw [hrk] at hU hV hg
  refine ⟨hB, hC, hU, hV, ?_⟩
  apply eq_of_bits_lt (n := 9) (mul3_lt B C) (Nat.xor_lt_two_pow (by norm_num) (dirtM_lt d U V))
  intro p hp
  obtain ⟨al, be, hal, hbe, rfl⟩ : ∃ al be, al < 3 ∧ be < 3 ∧ p = 3 * al + be :=
    ⟨p / 3, p % 3, by omega, by omega, by omega⟩
  have e := hg al hal be hbe
  rw [gram_unit _ _ _ _ hal hbe (fac273 al hal).2 (fac273 be hbe).1] at e
  rw [e, Nat.testBit_xor, testBit_dirtM _ _ _ _ _ hal hbe, testBit273 al hal be hbe]
  rfl

/-- the Gram system of a rank-2 anchor state at `d = 0`: `U = V = 0` and `cond17 (mul3 B C)` -/
theorem valid17 {B C U V : ℕ} (h : Valid 0 ⟨17, B, C, U, V⟩) :
    B < 512 ∧ C < 512 ∧ U = 0 ∧ V = 0 ∧ cond17 (mul3 B C) = true := by
  obtain ⟨_, _, hB, hC, hU, hV, hg⟩ := h
  have hrk : rk (State.a ⟨17, B, C, U, V⟩) = 2 := rk17
  rw [hrk] at hU hV hg
  refine ⟨hB, hC, by simpa using hU, by simpa using hV, ?_⟩
  have e : ∀ al < 2, ∀ be < 2, (mul3 B C).testBit (3 * al + be) = (al == be) := by
    intro al hal be hbe
    have := hg al hal be hbe
    rw [gram_unit _ _ _ _ (by omega) (by omega) (fac17 al hal).2 (fac17 be hbe).1] at this
    rw [this]
    simp [dirt, parN]
  have e00 := e 0 (by norm_num) 0 (by norm_num)
  have e01 := e 0 (by norm_num) 1 (by norm_num)
  have e10 := e 1 (by norm_num) 0 (by norm_num)
  have e11 := e 1 (by norm_num) 1 (by norm_num)
  norm_num at e00 e01 e10 e11
  simp [cond17, e00, e01, e10, e11]

end OC
