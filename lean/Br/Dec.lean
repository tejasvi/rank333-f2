module
public import R22Port.U_d41d8cd98f00
public import Br.Bits
public import S5.Sym
public import S6.LG
/-! # Decoding the interface's encodings into `Matrix` (bridge, part 3b)

Decoded matrices (all over `F2`):
* `toM3 v` (3x3, entry `(i, j)` = bit `3i+j`; `RootSound.Bits`), used for `a`, `B`, `C` and the GL3 elements;
* `Um d r W` (`r × d`, entry `(q, x)` = bit `d q + x`): the dirt rows `U`, `V` of a state;
* `Dm d M` (`d × d`, entry `(x, y)` = bit `d x + y`);
* `Lm a`, `Rm a` (`3 × rk a`, `rk a × 3`): the FAC factors, `toM3 a = Lm a * Rm a` (`toM3_fac`; `Rm` is `Rᵀ` in the
  interface's notation).

Results: `gram_mat` (`gram t s` = entries of `Rm t.a * B_s * C_t * Lm s.a`), `dirt_mat` (`U_t V_sᵀ`), `toM3_mul3`,
`toM3_tr3`, `Dm_mulD`, `Dm_trD`, `Dm_ID`, `Um_xformRows` (`M W γ`), `toM3_fac`, `rk_rank` (`rk a = rank (toM3 a)`),
and the encoders `e3`, `eR` with their round trips and injectivity. -/
@[expose] public section
open Matrix

namespace G.Br
open RootSound

/-! ## decoded matrices -/

/-- a packed `r × d` matrix (rows of `d` bits) -/
def Um (d r W : ℕ) : Matrix (Fin r) (Fin d) F2 := fun q x => bitF W (d * q.val + x.val)
/-- a packed `d × d` matrix -/
def Dm (d M : ℕ) : Matrix (Fin d) (Fin d) F2 := fun x y => bitF M (d * x.val + y.val)
/-- the FAC factor `L` of `a` -/
def Lm (a : ℕ) : Matrix (Fin 3) (Fin (rk a)) F2 := fun i q => bitF (Lc a q.val) i.val
/-- the FAC factor `Rᵀ` of `a` -/
def Rm (a : ℕ) : Matrix (Fin (rk a)) (Fin 3) F2 := fun q j => bitF (Rc a q.val) j.val

theorem dmod (d x y : ℕ) (hy : y < d) : (d * x + y) % d = y := by
  rw [add_comm, Nat.add_mul_mod_self_left]; exact Nat.mod_eq_of_lt hy

theorem ddiv (d x y : ℕ) (hy : y < d) : (d * x + y) / d = x := by
  rw [add_comm, Nat.add_mul_div_left _ _ (by omega), Nat.div_eq_of_lt hy, zero_add]

theorem dlt (d r x y : ℕ) (hx : x < r) (hy : y < d) : d * x + y < d * r := by
  have : d * (x + 1) ≤ d * r := Nat.mul_le_mul_left d hx
  rw [Nat.mul_succ] at this; omega

/-! ## `gram` and `dirt` -/

theorem testBit_yvec (R C p : ℕ) :
    (yvec R C).testBit p = (decide (p < 27) && (R.testBit (p / 9) && C.testBit (p % 9))) :=
  testBit_orFold (fun p => bitN R (p / 9) && bitN C (p % 9)) 27 p

theorem testBit_xvec (B L p : ℕ) :
    (xvec B L).testBit p = (decide (p < 27) && (B.testBit (p / 3) && L.testBit (p % 3))) :=
  testBit_orFold (fun p => bitN B (p / 3) && bitN L (p % 3)) 27 p

theorem bF_gram (t s : State) (al be : ℕ) : bF (gram t s al be) =
    ∑ j : Fin 3, ∑ k : Fin 3, ∑ i : Fin 3,
      bitF (Rc t.a al) j * bitF s.B (3 * j + k) * bitF t.C (3 * k + i) * bitF (Lc s.a be) i := by
  unfold gram
  rw [bF_parN]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.testBit_and, testBit_yvec, testBit_xvec,
    Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two, bF_and, bF_testBit]
  norm_num
  ring

theorem gram_mat (t s : State) (al : Fin (rk t.a)) (be : Fin (rk s.a)) :
    bF (gram t s al be) = (Rm t.a * toM3 s.B * toM3 t.C * Lm s.a) al be := by
  rw [bF_gram]
  simp only [Matrix.mul_apply, Rm, Lm, toM3, Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two]
  ring

theorem bF_dirt (d : ℕ) (t s : State) (al be : ℕ) :
    bF (dirt d t s al be) = ∑ x : Fin d, bitF t.U (d * al + x) * bitF s.V (d * be + x) := by
  unfold dirt
  rw [bF_parN, Finset.sum_range]
  refine Finset.sum_congr rfl (fun x _ => ?_)
  rw [Nat.testBit_and, testBit_row, testBit_row, bF_and]
  simp [x.isLt, bF_testBit]

theorem dirt_mat (d : ℕ) (t s : State) (al : Fin (rk t.a)) (be : Fin (rk s.a)) :
    bF (dirt d t s al be) = (Um d (rk t.a) t.U * (Um d (rk s.a) s.V)ᵀ) al be := by
  rw [bF_dirt]
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Um]

/-! ## 3x3 matrices -/

theorem bF_vecMul3 (v N j : ℕ) (hj : j < 3) :
    bF ((vecMul3 v N).testBit j) = ∑ k : Fin 3, bitF v k * bitF N (3 * k + j) := by
  unfold vecMul3
  rw [bF_xorFold (fun k => bitN v k) (fun k => rowOf N k), Finset.sum_range]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [testBit_rowOf]
  simp [hj, bF_testBit, bitN]

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
  rw [← bF_testBit, testBit_mul3 M N i j i.isLt j.isLt, bF_vecMul3 _ _ _ j.isLt]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [← bF_testBit (rowOf M i) k, testBit_rowOf]
  simp [k.isLt, bF_testBit]

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

theorem toM3_I3 : toM3 I3 = 1 := S5.toM3_273

theorem testBit_tr3 (M p : ℕ) : (tr3 M).testBit p = (decide (p < 9) && M.testBit (3 * (p % 3) + p / 3)) :=
  testBit_orFold (fun p => bitN M (3 * (p % 3) + p / 3)) 9 p

theorem toM3_tr3 (M : ℕ) : toM3 (tr3 M) = (toM3 M)ᵀ := by
  ext i j
  simp only [toM3, Matrix.transpose_apply]
  rw [← bF_testBit, testBit_tr3, dmod 3 _ _ j.isLt, ddiv 3 _ _ j.isLt]
  simp [dlt 3 3 _ _ i.isLt j.isLt, bF_testBit]

theorem GL3_inv {g : ℕ} (h : GL3 g) : toM3 g * toM3 (inv3 g) = 1 := by
  rw [← toM3_mul3, h.2, toM3_I3]

/-! ## d x d matrices -/

theorem bF_vecMulD (d v M y : ℕ) (hy : y < d) :
    bF ((vecMulD d v M).testBit y) = ∑ x : Fin d, bitF v x * bitF M (d * x + y) := by
  unfold vecMulD
  rw [bF_xorFold (fun x => bitN v x) (fun x => rowD d M x), Finset.sum_range]
  refine Finset.sum_congr rfl (fun x _ => ?_)
  rw [testBit_rowD]
  simp [hy, bF_testBit, bitN]

theorem vecMulD_lt (d v M : ℕ) : vecMulD d v M < 2 ^ d :=
  xorFold_lt (fun x => bitN v x) (fun x => rowD d M x) d (fun x => rowD_lt d M x) d

theorem Dm_mulD (d M N : ℕ) : Dm d (mulD d M N) = Dm d M * Dm d N := by
  ext x y
  simp only [Dm, Matrix.mul_apply]
  rw [← bF_testBit]
  unfold mulD
  rw [testBit_shFold d (fun x => vecMulD d (rowD d M x) N) (fun x => vecMulD_lt _ _ _) d x y y.isLt]
  simp only [x.isLt, decide_true, Bool.true_and]
  rw [bF_vecMulD _ _ _ _ y.isLt]
  refine Finset.sum_congr rfl (fun z _ => ?_)
  rw [← bF_testBit (rowD d M x) z, testBit_rowD]
  simp [z.isLt, bF_testBit]

theorem testBit_trD (d M p : ℕ) :
    (trD d M).testBit p = (decide (p < d * d) && M.testBit (d * (p % d) + p / d)) :=
  testBit_orFold (fun p => bitN M (d * (p % d) + p / d)) (d * d) p

theorem Dm_trD (d M : ℕ) : Dm d (trD d M) = (Dm d M)ᵀ := by
  ext x y
  simp only [Dm, Matrix.transpose_apply]
  rw [← bF_testBit, testBit_trD, dmod d _ _ y.isLt, ddiv d _ _ y.isLt]
  simp [dlt d d _ _ x.isLt y.isLt, bF_testBit]

theorem testBit_ID (d p : ℕ) : (ID d).testBit p = decide (∃ x < d, d * x + x = p) :=
  testBit_posFold (fun x => d * x + x) d p

theorem Dm_ID (d : ℕ) : Dm d (ID d) = 1 := by
  ext x y
  simp only [Dm, Matrix.one_apply]
  rw [← bF_testBit, testBit_ID]
  by_cases h : x = y
  · subst h
    have : ∃ z < d, d * z + z = d * x.val + x.val := ⟨x.val, x.isLt, rfl⟩
    simp [this]
  · have hn : ¬ ∃ z < d, d * z + z = d * x.val + y.val := by
      rintro ⟨z, hz, e⟩
      have e1 := congrArg (· % d) e
      simp only at e1
      rw [dmod d _ _ hz, dmod d _ _ y.isLt] at e1
      subst e1
      have e2 := congrArg (· / d) e
      simp only at e2
      rw [ddiv d _ _ hz, ddiv d _ _ y.isLt] at e2
      exact h (Fin.ext (by omega))
    simp [hn, h]

theorem GLd_inv {d γ : ℕ} (h : GLd d γ) : Dm d γ * Dm d (invD d γ) = 1 := by
  rw [← Dm_mulD, h.2, Dm_ID]

/-! ## `xformRows` -/

theorem shFold_lt (w : ℕ) (f : ℕ → ℕ) (hf : ∀ x, f x < 2 ^ w) (n : ℕ) :
    (List.range n).foldl (fun acc x => acc ||| (f x <<< (w * x))) 0 < 2 ^ (w * n) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [foldl_range_succ]
    apply Nat.or_lt_two_pow
    · exact lt_of_lt_of_le ih (Nat.pow_le_pow_right (by norm_num) (Nat.mul_le_mul_left w (by omega)))
    · rw [Nat.shiftLeft_eq, Nat.mul_succ, pow_add, mul_comm]
      exact Nat.mul_lt_mul_of_pos_left (hf n) (by positivity)

theorem Um_xformRows (d M γ W : ℕ) : Um d 3 (xformRows d M γ W) = toM3 M * Um d 3 W * Dm d γ := by
  ext i x
  simp only [Um, Dm, toM3, Matrix.mul_apply]
  rw [← bF_testBit]
  unfold xformRows
  set Wg := (List.range 3).foldl (fun acc q => acc ||| (vecMulD d (row d W q) γ <<< (d * q))) 0 with hWg
  have hin : ∀ i, (List.range 3).foldl (fun r j => if bitN (rowOf M i) j = true then r ^^^ row d Wg j else r) 0
      < 2 ^ d := fun i => xorFold_lt _ _ d (fun j => row_lt d Wg j) 3
  simp only []
  rw [testBit_shFold d (fun i => (List.range 3).foldl
      (fun r j => if bitN (rowOf M i) j = true then r ^^^ row d Wg j else r) 0) hin 3 i x x.isLt]
  simp only [i.isLt, decide_true, Bool.true_and]
  rw [bF_xorFold (fun j => bitN (rowOf M i) j) (fun j => row d Wg j), Finset.sum_range]
  have hWbit : ∀ j : Fin 3, bF ((row d Wg j).testBit x) =
      ∑ z : Fin d, bitF W (d * j.val + z.val) * bitF γ (d * z.val + x.val) := by
    intro j
    rw [testBit_row]
    simp only [x.isLt, decide_true, Bool.true_and]
    rw [hWg, testBit_shFold d (fun q => vecMulD d (row d W q) γ) (fun q => vecMulD_lt _ _ _) 3 j x x.isLt]
    simp only [j.isLt, decide_true, Bool.true_and]
    rw [bF_vecMulD _ _ _ _ x.isLt]
    refine Finset.sum_congr rfl (fun z _ => ?_)
    rw [← bF_testBit (row d W j) z, testBit_row]
    simp [z.isLt, bF_testBit]
  simp only [hWbit]
  have hM : ∀ j : Fin 3, bF (bitN (rowOf M i) j) = bitF M (3 * i.val + j.val) := by
    intro j
    show bF ((rowOf M i).testBit j) = _
    rw [testBit_rowOf]; simp [j.isLt, bF_testBit]
  simp only [hM, Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun z _ => Finset.sum_congr rfl (fun j _ => by ring))

theorem xformRows_lt (d M γ W : ℕ) : xformRows d M γ W < 2 ^ (d * 3) := by
  unfold xformRows
  exact shFold_lt d _ (fun i => xorFold_lt _ _ d (fun j => row_lt d _ j) 3) 3

/-! ## the factorization table -/

theorem testBit_outer (l r p : ℕ) :
    (outer l r).testBit p = (decide (p < 9) && (l.testBit (p / 3) && r.testBit (p % 3))) :=
  testBit_orFold (fun p => bitN l (p / 3) && bitN r (p % 3)) 9 p

theorem bF_facSum (a n p : ℕ) :
    bF ((facSum a n).testBit p) = ∑ q ∈ Finset.range n, bF ((outer (Lc a q) (Rc a q)).testBit p) := by
  induction n with
  | zero => simp [facSum]
  | succ n ih => rw [facSum, Nat.testBit_xor, bF_xor, ih, Finset.sum_range_succ]

/-- the table is a rank factorization: kernel check over the 511 nonzero codes (`rk` against the project's `rk3`) -/
def facChk : Bool := S5.allLT 511 (fun i => facSum (i + 1) (rk (i + 1)) == i + 1 && rk (i + 1) == BC6s.rk3 (i + 1))

theorem facChk_true : facChk = true := by decide +kernel

theorem facChk_at (a : ℕ) (h0 : 0 < a) (h : a < 512) : facSum a (rk a) = a ∧ rk a = BC6s.rk3 a := by
  have := S5.allLT_spec facChk_true (a - 1) (by omega)
  rw [show a - 1 + 1 = a by omega] at this
  simpa using this

theorem toM3_fac (a : ℕ) (h0 : 0 < a) (h : a < 512) : toM3 a = Lm a * Rm a := by
  ext i j
  simp only [toM3, Matrix.mul_apply, Lm, Rm]
  conv_lhs => rw [← (facChk_at a h0 h).1]
  rw [← bF_testBit, bF_facSum, Finset.sum_range]
  refine Finset.sum_congr rfl (fun q _ => ?_)
  rw [testBit_outer, dmod 3 _ _ j.isLt, ddiv 3 _ _ j.isLt]
  simp [dlt 3 3 _ _ i.isLt j.isLt, bF_and, bF_testBit]

theorem rk_rank (a : ℕ) (h0 : 0 < a) (h : a < 512) : rk a = (toM3 a).rank := by
  rw [(facChk_at a h0 h).2, S6.rk3_rank a h]

/-! ## encoders -/

/-- entry `p` (`p = 3i+j`) of a 3x3 matrix -/
def ent3 (M : M3) (p : ℕ) : Bool := if h : p < 9 then decide (M ⟨p / 3, by omega⟩ ⟨p % 3, by omega⟩ = 1) else false

/-- the 9-bit code of a 3x3 matrix -/
def e3 (M : M3) : ℕ := (List.range 9).foldl (fun acc p => if ent3 M p = true then acc ||| (1 <<< p) else acc) 0

theorem testBit_e3 (M : M3) (p : ℕ) : (e3 M).testBit p = (decide (p < 9) && ent3 M p) :=
  testBit_orFold (ent3 M) 9 p

theorem toM3_e3 (M : M3) : toM3 (e3 M) = M := by
  ext i j
  simp only [toM3]
  rw [← bF_testBit, testBit_e3]
  have hp : 3 * i.val + j.val < 9 := dlt 3 3 _ _ i.isLt j.isLt
  rw [ent3, dif_pos hp]
  simp only [hp, decide_true, Bool.true_and]
  rw [bF_decide_eq_one]
  congr 1
  · exact Fin.ext (ddiv 3 _ _ j.isLt)
  · exact Fin.ext (dmod 3 _ _ j.isLt)

theorem e3_lt (M : M3) : e3 M < 512 := by
  show e3 M < 2 ^ 9
  apply lt_of_bits
  intro i hi
  rw [testBit_e3]; simp [show ¬ i < 9 by omega]

theorem eq_of_toM3 {v w : ℕ} (hv : v < 512) (hw : w < 512) (h : toM3 v = toM3 w) : v = w := by
  apply eq_of_bits_lt (n := 9) hv hw
  intro i hi
  have := congrFun (congrFun h ⟨i / 3, by omega⟩) ⟨i % 3, by omega⟩
  simp only [toM3] at this
  rw [show 3 * (i / 3) + i % 3 = i by omega] at this
  exact bF_inj this

theorem e3_toM3 {v : ℕ} (hv : v < 512) : e3 (toM3 v) = v := eq_of_toM3 (e3_lt _) hv (toM3_e3 _)

theorem e3_inj {M N : M3} (h : e3 M = e3 N) : M = N := by rw [← toM3_e3 M, ← toM3_e3 N, h]

theorem e3_ne_zero {M : M3} (h : M ≠ 0) : e3 M ≠ 0 := by
  intro e
  apply h
  rw [← toM3_e3 M, e, S5.toM3_zero]

/-- entry `p` (`p = d q + x`) of an `r × d` matrix -/
def entR (d r : ℕ) (M : Matrix (Fin r) (Fin d) F2) (p : ℕ) : Bool :=
  if h : p < d * r then
    decide (M ⟨p / d, by
      have hd : 0 < d := by
        rcases Nat.eq_zero_or_pos d with h0 | h0
        · subst h0; simp at h
        · exact h0
      exact (Nat.div_lt_iff_lt_mul hd).mpr (by rw [mul_comm]; exact h)⟩
      ⟨p % d, Nat.mod_lt _ (by
        rcases Nat.eq_zero_or_pos d with h0 | h0
        · subst h0; simp at h
        · exact h0)⟩ = 1)
  else false

/-- the packed code of an `r × d` matrix (row `q` at bits `[d q, d q + d)`) -/
def eR (d r : ℕ) (M : Matrix (Fin r) (Fin d) F2) : ℕ :=
  (List.range (d * r)).foldl (fun acc p => if entR d r M p = true then acc ||| (1 <<< p) else acc) 0

theorem testBit_eR (d r : ℕ) (M : Matrix (Fin r) (Fin d) F2) (p : ℕ) :
    (eR d r M).testBit p = (decide (p < d * r) && entR d r M p) :=
  testBit_orFold (entR d r M) (d * r) p

theorem Um_eR (d r : ℕ) (M : Matrix (Fin r) (Fin d) F2) : Um d r (eR d r M) = M := by
  ext q x
  simp only [Um]
  rw [← bF_testBit, testBit_eR]
  have hp : d * q.val + x.val < d * r := dlt d r _ _ q.isLt x.isLt
  rw [entR, dif_pos hp]
  simp only [hp, decide_true, Bool.true_and]
  rw [bF_decide_eq_one]
  congr 1
  · exact Fin.ext (ddiv d _ _ x.isLt)
  · exact Fin.ext (dmod d _ _ x.isLt)

theorem eR_lt (d r : ℕ) (M : Matrix (Fin r) (Fin d) F2) : eR d r M < 2 ^ (d * r) := by
  apply lt_of_bits
  intro i hi
  rw [testBit_eR]; simp [show ¬ i < d * r by omega]

theorem eq_of_Um {d r v w : ℕ} (hv : v < 2 ^ (d * r)) (hw : w < 2 ^ (d * r)) (h : Um d r v = Um d r w) : v = w := by
  apply eq_of_bits_lt hv hw
  intro i hi
  have hd : 0 < d := by
    rcases Nat.eq_zero_or_pos d with h0 | h0
    · subst h0; simp at hi
    · exact h0
  have hq : i / d < r := (Nat.div_lt_iff_lt_mul hd).mpr (by rw [mul_comm]; exact hi)
  have := congrFun (congrFun h ⟨i / d, hq⟩) ⟨i % d, Nat.mod_lt _ hd⟩
  simp only [Um] at this
  rw [show d * (i / d) + i % d = i from Nat.div_add_mod i d] at this
  exact bF_inj this

theorem eR_Um {d r v : ℕ} (hv : v < 2 ^ (d * r)) : eR d r (Um d r v) = v :=
  eq_of_Um (eR_lt _ _ _) hv (Um_eR _ _ _)

end G.Br
