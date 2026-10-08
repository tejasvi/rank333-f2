module
public import R22Port.U_d41d8cd98f00
public import GS.PhA2
public import GS.Pkd
/-! # Track A, part 3: the phase-A masks (`cmask`/`bmask`/`validB`, `sel`, `par2`, the `XL`/`YL` parities)

* `swarYL_bit`/`swarXL_bit`: bit `32 C` of `swarPar (YL R) R512 X` is the 27-bit parity of `yvec R C &&& X` (`C < 512`);
* `sel_bit`, `par2_eq`;
* `cmask_bit`, `bmask_bit`, `validB_bit`: the masks are the conjunctions of their per-entry conditions;
* `cmaskF_of_compat`, `bmaskF_of_compat`, `validB_of_valid`: a state compatible with the anchor (resp. valid) has its bit;
* `cmaskF_mok`, `bmaskF_mok`, `validB_mok`: the masks have bits only at `32 C`, `C < 512`. -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc Finset

/-! ## parities of the constant lists -/

theorem R512_mok : MOK G.LS.R512 := by
  intro p hp; rw [R512_eq, testBit_rep32] at hp; simp only [Bool.and_eq_true, decide_eq_true_eq] at hp; exact ⟨hp.2, hp.1⟩

theorem parZ_eq27 (z : ℕ) (hz : z < 2 ^ 27) : (decide (parZ z = 1)) = parN 27 z := by
  have h1 : parZ z = ∑ j ∈ range 27, tb z j := sum_range_low z 27 32 hz (by norm_num)
  have h2 := parN_eq 27 z
  rw [h1, ← h2]; cases parN 27 z <;> decide

/-- bit `32 C` of `swarPar (YL R) R512 X` -/
theorem swarYL_bit (R C X : ℕ) (hR : R < 8) (hC : C < 512) (hX : X < 2 ^ 27) :
    (swarPar (YL R) R512 X).testBit (32 * C) = parN 27 (yvec R C &&& X) := by
  rw [R512_eq, swarPar_testBit _ X 512 (32 * C) (lt_trans hX (by norm_num))]
  have e1 : 32 * C / 32 = C := by omega
  have e2 : 32 * C % 32 = 0 := by omega
  rw [e1, e2, ← get32_eq, YL_ok R hR C hC]
  simp only [hC, decide_true, Bool.true_and]
  exact parZ_eq27 _ (lt_of_le_of_lt Nat.and_le_left (yvec_lt R C)) |>.trans (by rfl)

/-- bit `32 B` of `swarPar (XL L) R512 Y` -/
theorem swarXL_bit (L B Y : ℕ) (hL : L < 8) (hB : B < 512) (hY : Y < 2 ^ 27) :
    (swarPar (XL L) R512 Y).testBit (32 * B) = parN 27 (xvec B L &&& Y) := by
  rw [R512_eq, swarPar_testBit _ Y 512 (32 * B) (lt_trans hY (by norm_num))]
  have e1 : 32 * B / 32 = B := by omega
  have e2 : 32 * B % 32 = 0 := by omega
  rw [e1, e2, ← get32_eq, XL_ok L hL B hB]
  simp only [hB, decide_true, Bool.true_and]
  exact parZ_eq27 _ (lt_of_le_of_lt Nat.and_le_left (xvec_lt B L))

/-! ## `sel`, `par2`, `rowD`, `M27` -/

theorem sel_bit (p S C : ℕ) (hp : p ≤ 1) (hC : C < 512) :
    (sel p S).testBit (32 * C) = (S.testBit (32 * C) == decide (p = 1)) := by
  unfold sel
  show (S ^^^ (G.LS.R512 * (1 ^^^ p))).testBit (32 * C) = _
  have hR : G.LS.R512.testBit (32 * C) = true := by
    rw [R512_eq, testBit_rep32]; simp only [Bool.and_eq_true, decide_eq_true_eq]; omega
  rcases (show p = 0 ∨ p = 1 by omega) with rfl | rfl
  · rw [show (1 : ℕ) ^^^ 0 = 1 by decide, Nat.mul_one, Nat.testBit_xor, hR]
    cases S.testBit (32 * C) <;> decide
  · rw [show (1 : ℕ) ^^^ 1 = 0 by decide, Nat.mul_zero, Nat.xor_zero]
    cases S.testBit (32 * C) <;> decide

theorem par2_le (x : ℕ) : par2 x ≤ 1 := by
  unfold par2; exact Nat.and_le_right

/-- `par2 x` is the parity of the low 4 bits -/
theorem par2_eq (x : ℕ) : decide (par2 x = 1) = parN 4 x := by
  have h : tb (par2 x) 0 = ∑ j ∈ range 4, tb x j := by
    unfold par2
    show tb ((x ^^^ ((x >>> 1) ^^^ ((x >>> 2) ^^^ (x >>> 3)))) &&& 1) 0 = _
    rw [tb_land, show tb 1 0 = 1 by decide, mul_one, tb_xor, tb_xor, tb_xor, tb_shiftRight, tb_shiftRight, tb_shiftRight]
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add, Nat.add_zero]
    ring
  have h2 := parN_eq 4 x
  have hle := par2_le x
  have h0 : tb (par2 x) 0 = if par2 x = 1 then 1 else 0 := by
    unfold tb
    rcases (show par2 x = 0 ∨ par2 x = 1 by omega) with e | e <;> rw [e] <;> decide
  rw [h0, ← h2] at h
  by_cases e : par2 x = 1
  · rw [if_pos e] at h; rw [decide_eq_true e]
    cases hq : parN 4 x
    · rw [hq] at h; exact absurd h (by decide)
    · rfl
  · rw [if_neg e] at h; rw [decide_eq_false e]
    cases hq : parN 4 x
    · rfl
    · rw [hq] at h; exact absurd h (by decide)

theorem parN_low (n m x : ℕ) (hx : x < 2 ^ n) (hnm : n ≤ m) : parN m x = parN n x := by
  have h1 := parN_eq m x
  have h2 := parN_eq n x
  rw [sum_range_low x n m hx hnm] at h1
  exact ite_bool_zmod_inj (h1.trans h2.symm)

theorem rowD_eq (d W q : ℕ) : G.A2.rowD d W q = row d W q := by
  unfold G.A2.rowD row
  show (W >>> (d * q)) &&& (Nat.shiftLeft 1 d - 1) = _
  rw [shiftLeft_one, land_two_pow_sub_one, Nat.shiftRight_eq_div_pow]

theorem M27_eq : M27 = 2 ^ 27 - 1 := by decide

theorem low27 (x y : ℕ) (hx : x < 2 ^ 27) : Nat.land (x ||| (y <<< 27)) M27 = x := by
  show (x ||| (y <<< 27)) &&& M27 = x
  rw [M27_eq, land_two_pow_sub_one]
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_mod_two_pow, Nat.testBit_or, Nat.testBit_shiftLeft]
  by_cases hj : j < 27
  · simp [hj]
  · rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hj]

theorem high27 (x y : ℕ) (hx : x < 2 ^ 27) : Nat.shiftRight (x ||| (y <<< 27)) 27 = y := by
  show (x ||| (y <<< 27)) >>> 27 = y
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_shiftRight, Nat.testBit_or, Nat.testBit_shiftLeft]
  rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) (by omega)))]
  simp [show 27 + j - 27 = j by omega]

/-! ## the masks as conjunctions -/

theorem land_bit (a b p : ℕ) : (Nat.land a b).testBit p = (a.testBit p && b.testBit p) := Nat.testBit_and a b p

theorem cmask_bit (t0 d a U r0 : ℕ) : ∀ (n acc C : ℕ), (G.A2.cmask t0 d a U r0 n acc).testBit (32 * C) = true ↔
    acc.testBit (32 * C) = true ∧ ∀ k < n,
      (sel (par2 (Nat.land (G.A2.rowD d U (k / r0)) (Nat.shiftRight (fXV t0 (k % r0)) 27)))
        (swarPar (YL (G.Rc a (k / r0))) R512 (Nat.land (fXV t0 (k % r0)) M27))).testBit (32 * C) = true
  | 0, acc, C => by simp [G.A2.cmask]
  | n + 1, acc, C => by
    show (G.A2.cmask t0 d a U r0 n (Nat.land acc (sel (par2 (Nat.land (G.A2.rowD d U (n / r0)) (Nat.shiftRight (fXV t0 (n % r0)) 27)))
      (swarPar (YL (G.Rc a (n / r0))) R512 (Nat.land (fXV t0 (n % r0)) M27))))).testBit (32 * C) = true ↔ _
    rw [cmask_bit t0 d a U r0 n _ C, land_bit, Bool.and_eq_true]
    constructor
    · rintro ⟨⟨h1, h2⟩, h3⟩
      refine ⟨h1, fun k hk => ?_⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hk | rfl
      · exact h3 k hk
      · exact h2
    · rintro ⟨h1, h3⟩
      exact ⟨⟨h1, h3 n (by omega)⟩, fun k hk => h3 k (by omega)⟩

theorem bmask_bit (t0 d a V r : ℕ) : ∀ (n acc B : ℕ), (bmask t0 d a V r n acc).testBit (32 * B) = true ↔
    acc.testBit (32 * B) = true ∧ ∀ k < n,
      (sel (par2 (Nat.land (Nat.shiftRight (fYU t0 (k / r)) 27) (G.A2.rowD d V (k % r))))
        (swarPar (XL (G.Lc a (k % r))) R512 (Nat.land (fYU t0 (k / r)) M27))).testBit (32 * B) = true
  | 0, acc, B => by simp [bmask]
  | n + 1, acc, B => by
    show (bmask t0 d a V r n (Nat.land acc (sel (par2 (Nat.land (Nat.shiftRight (fYU t0 (n / r)) 27) (G.A2.rowD d V (n % r))))
      (swarPar (XL (G.Lc a (n % r))) R512 (Nat.land (fYU t0 (n / r)) M27))))).testBit (32 * B) = true ↔ _
    rw [bmask_bit t0 d a V r n _ B, land_bit, Bool.and_eq_true]
    constructor
    · rintro ⟨⟨h1, h2⟩, h3⟩
      refine ⟨h1, fun k hk => ?_⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hk | rfl
      · exact h3 k hk
      · exact h2
    · rintro ⟨h1, h3⟩
      exact ⟨⟨h1, h3 n (by omega)⟩, fun k hk => h3 k (by omega)⟩

theorem diagParts_getD (a C r : ℕ) : ∀ (n i : ℕ), i < n →
    (diagParts a C r n).getD (n - 1 - i) 0 = swarPar (XL (G.Lc a (i % r))) R512 (get32 (YL (G.Rc a (i / r))) C)
  | 0, i, h => absurd h (Nat.not_lt_zero _)
  | n + 1, i, h => by
    show (swarPar (XL (G.Lc a (n % r))) R512 (get32 (YL (G.Rc a (n / r))) C) :: diagParts a C r n).getD (n + 1 - 1 - i) 0 = _
    rcases Nat.lt_succ_iff_lt_or_eq.mp h with h' | rfl
    · rw [show n + 1 - 1 - i = (n - 1 - i) + 1 by omega, List.getD_cons_succ]
      exact diagParts_getD a C r n i h'
    · simp

theorem diagParts_length (a C r : ℕ) : ∀ n, (diagParts a C r n).length = n
  | 0 => rfl
  | n + 1 => by show (diagParts a C r n).length + 1 = n + 1; rw [diagParts_length a C r n]

/-- `validB` over the parts `diagParts a C r n` (processed with `k = n, n-1, …`) -/
theorem validB_bit (d U V r a C : ℕ) : ∀ (n acc B : ℕ),
    (validB d U V r (diagParts a C r n) n acc).testBit (32 * B) = true ↔
    acc.testBit (32 * B) = true ∧ ∀ k < n,
      (sel (Nat.xor (cond (Nat.beq (k / r) (k % r)) 1 0) (par2 (Nat.land (G.A2.rowD d U (k / r)) (G.A2.rowD d V (k % r)))))
        (swarPar (XL (G.Lc a (k % r))) R512 (get32 (YL (G.Rc a (k / r))) C))).testBit (32 * B) = true
  | 0, acc, B => by simp [diagParts, validB]
  | n + 1, acc, B => by
    show (validB d U V r (diagParts a C r n) n (Nat.land acc
      (sel (Nat.xor (cond (Nat.beq (n / r) (n % r)) 1 0) (par2 (Nat.land (G.A2.rowD d U (n / r)) (G.A2.rowD d V (n % r)))))
        (swarPar (XL (G.Lc a (n % r))) R512 (get32 (YL (G.Rc a (n / r))) C))))).testBit (32 * B) = true ↔ _
    rw [validB_bit d U V r a C n _ B, land_bit, Bool.and_eq_true]
    constructor
    · rintro ⟨⟨h1, h2⟩, h3⟩
      refine ⟨h1, fun k hk => ?_⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hk with hk | rfl
      · exact h3 k hk
      · exact h2
    · rintro ⟨h1, h3⟩
      exact ⟨⟨h1, h3 n (by omega)⟩, fun k hk => h3 k (by omega)⟩

/-! ## the masks have bits only at `32 C`, `C < 512` -/

theorem cmask_sub (t0 d a U r0 : ℕ) : ∀ (n acc p : ℕ), (G.A2.cmask t0 d a U r0 n acc).testBit p = true → acc.testBit p = true
  | 0, acc, p, h => h
  | n + 1, acc, p, h => by
    have := cmask_sub t0 d a U r0 n _ p h
    rw [land_bit, Bool.and_eq_true] at this; exact this.1

theorem bmask_sub (t0 d a V r : ℕ) : ∀ (n acc p : ℕ), (bmask t0 d a V r n acc).testBit p = true → acc.testBit p = true
  | 0, acc, p, h => h
  | n + 1, acc, p, h => by
    have := bmask_sub t0 d a V r n _ p h
    rw [land_bit, Bool.and_eq_true] at this; exact this.1

theorem validB_sub (d U V r : ℕ) : ∀ (parts : List ℕ) (k acc p : ℕ), (validB d U V r parts k acc).testBit p = true →
    acc.testBit p = true
  | [], k, acc, p, h => h
  | S :: Ss, k, acc, p, h => by
    have := validB_sub d U V r Ss _ _ p h
    rw [land_bit, Bool.and_eq_true] at this; exact this.1

theorem cmaskF_mok (t0 d a U r : ℕ) : MOK (cmaskF t0 d a U r) :=
  fun p hp => R512_mok p (cmask_sub _ _ _ _ _ _ _ p hp)

theorem bmaskF_mok (t0 d a V r : ℕ) : MOK (bmaskF t0 d a V r) :=
  fun p hp => R512_mok p (bmask_sub _ _ _ _ _ _ _ p hp)

theorem validB_mok (d U V r : ℕ) (parts : List ℕ) (k Bm : ℕ) (h : MOK Bm) : MOK (validB d U V r parts k Bm) :=
  fun p hp => h p (validB_sub _ _ _ _ _ _ _ p hp)

/-! ## the masks contain the compatible / valid states -/

theorem Rc_lt (a q : ℕ) : Rc a q < 8 := Nat.mod_lt _ (by norm_num)
theorem Lc_lt (a q : ℕ) : Lc a q < 8 := Nat.mod_lt _ (by norm_num)

theorem rowrow_lt (d x y : ℕ) (hx : x < 2 ^ d) : x &&& y < 2 ^ d := lt_of_le_of_lt Nat.and_le_left hx

/-- `par2` of two dirt rows is their dot product (`d ≤ 2`) -/
theorem par2_rows (d x y : ℕ) (hd : d ≤ 2) (hx : x < 2 ^ d) : decide (par2 (Nat.land x y) = 1) = parN d (x &&& y) := by
  rw [par2_eq]
  exact parN_low d 4 (x &&& y) (rowrow_lt d x y hx) (by omega)

/-- the anchor's fields -/
structure Anchor (d : ℕ) (T0 : State) : Prop where
  hd : d ≤ 2
  ha : T0.a < 512

theorem anc_fXV {d : ℕ} {T0 : State} (h : Anchor d T0) {be : ℕ} (hbe : be < rk T0.a) :
    Nat.land (fXV (pkState d T0) be) M27 = xvec T0.B (Lc T0.a be) ∧
    Nat.shiftRight (fXV (pkState d T0) be) 27 = row d T0.V be := by
  rw [fXV_pk hbe h.hd h.ha]
  exact ⟨low27 _ _ (xvec_lt _ _), high27 _ _ (xvec_lt _ _)⟩

theorem anc_fYU {d : ℕ} {T0 : State} (h : Anchor d T0) {al : ℕ} (hal : al < rk T0.a) :
    Nat.land (fYU (pkState d T0) al) M27 = yvec (Rc T0.a al) T0.C ∧
    Nat.shiftRight (fYU (pkState d T0) al) 27 = row d T0.U al := by
  rw [fYU_pk hal h.hd h.ha]
  exact ⟨low27 _ _ (yvec_lt _ _), high27 _ _ (yvec_lt _ _)⟩

theorem beq_eq_nat_beq (x y : ℕ) : (x == y) = Nat.beq x y := by
  by_cases h : x = y
  · subst h; rw [Nat.beq_refl]; simp
  · have h1 : (x == y) = false := by simp [h]
    have h2 : Nat.beq x y = false := by
      cases hb : Nat.beq x y
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true hb) h
    rw [h1, h2]

theorem xor01 {x y : ℕ} (hx : x ≤ 1) (hy : y ≤ 1) : Nat.xor x y ≤ 1 := by
  rcases (show x = 0 ∨ x = 1 by omega) with rfl | rfl <;> rcases (show y = 0 ∨ y = 1 by omega) with rfl | rfl <;> decide

theorem decide_xor01 {x y : ℕ} (hx : x ≤ 1) (hy : y ≤ 1) :
    decide (Nat.xor x y = 1) = xor (decide (x = 1)) (decide (y = 1)) := by
  rcases (show x = 0 ∨ x = 1 by omega) with rfl | rfl <;> rcases (show y = 0 ∨ y = 1 by omega) with rfl | rfl <;> decide

theorem cond01 (b : Bool) : decide (cond b 1 0 = 1) = b := by cases b <;> decide

theorem cond01_le (b : Bool) : cond b 1 0 ≤ 1 := by cases b <;> decide

theorem R512_bit (C : ℕ) (hC : C < 512) : G.LS.R512.testBit (32 * C) = true := by
  rw [R512_eq, testBit_rep32]; simp only [Bool.and_eq_true, decide_eq_true_eq]; omega

theorem pos_of_lt_mul {k a b : ℕ} (h : k < a * b) : 0 < b := by
  rcases Nat.eq_zero_or_pos b with h0 | h0
  · rw [h0, Nat.mul_zero] at h; exact absurd h (Nat.not_lt_zero _)
  · exact h0

/-- a rank-`r` state `(a, U, C)` that is C-compatible with the anchor is in `cmaskF` -/
theorem cmaskF_of_compat {d : ℕ} {T0 s : State} (h : Anchor d T0) (hC : s.C < 512) (hc : Compat d T0 s) :
    (cmaskF (pkState d T0) d s.a s.U (rk s.a)).testBit (32 * s.C) = true := by
  have hr0 : fR (pkState d T0) = rk T0.a := fR_pk h.hd h.ha
  unfold cmaskF
  rw [cmask_bit, hr0]
  refine ⟨R512_bit _ hC, fun k hk => ?_⟩
  have hk' : k < rk s.a * rk T0.a := hk
  have hpos : 0 < rk T0.a := pos_of_lt_mul hk'
  have hal : k / rk T0.a < rk s.a := by rw [Nat.div_lt_iff_lt_mul hpos]; exact hk'
  have hbe : k % rk T0.a < rk T0.a := Nat.mod_lt _ hpos
  obtain ⟨hX, hV⟩ := anc_fXV h hbe
  rw [hX, hV, sel_bit _ _ _ (par2_le _) hC, swarYL_bit _ _ _ (Rc_lt _ _) hC (xvec_lt _ _),
    par2_rows d _ _ h.hd (by rw [rowD_eq]; exact row_lt _ _ _), rowD_eq]
  have := hc.2.2 (k / rk T0.a) hal (k % rk T0.a) hbe
  unfold gram dirt at this
  rw [this]; cases parN d (row d s.U (k / rk T0.a) &&& row d T0.V (k % rk T0.a)) <;> rfl

/-- a rank-`r` state `(a, V, B)` that is B-compatible with the anchor is in `bmaskF` -/
theorem bmaskF_of_compat {d : ℕ} {T0 s : State} (h : Anchor d T0) (hB : s.B < 512) (hc : Compat d T0 s) :
    (bmaskF (pkState d T0) d s.a s.V (rk s.a)).testBit (32 * s.B) = true := by
  have hr0 : fR (pkState d T0) = rk T0.a := fR_pk h.hd h.ha
  unfold bmaskF
  rw [bmask_bit, hr0]
  refine ⟨R512_bit _ hB, fun k hk => ?_⟩
  have hk' : k < rk T0.a * rk s.a := hk
  have hpos : 0 < rk s.a := pos_of_lt_mul hk'
  have hal : k / rk s.a < rk T0.a := by rw [Nat.div_lt_iff_lt_mul hpos]; exact hk'
  have hbe : k % rk s.a < rk s.a := Nat.mod_lt _ hpos
  obtain ⟨hY, hU⟩ := anc_fYU h hal
  rw [hY, hU, sel_bit _ _ _ (par2_le _) hB, swarXL_bit _ _ _ (Lc_lt _ _) hB (yvec_lt _ _),
    par2_rows d _ _ h.hd (row_lt _ _ _), rowD_eq]
  have := hc.2.1 (k / rk s.a) hal (k % rk s.a) hbe
  unfold gram dirt at this
  rw [Nat.land_comm] at this
  rw [this]; cases parN d (row d T0.U (k / rk s.a) &&& row d s.V (k % rk s.a)) <;> rfl

/-- a valid state `(a, U, V, B, C)` passes the diagonal conditions of `validB` -/
theorem validB_of_valid {d : ℕ} {s : State} (hd : d ≤ 2) (hB : s.B < 512) (hC : s.C < 512) (hv : Valid d s)
    (Bm : ℕ) (hBm : Bm.testBit (32 * s.B) = true) :
    (validB d s.U s.V (rk s.a) (diagParts s.a s.C (rk s.a) (rk s.a * rk s.a)) (rk s.a * rk s.a) Bm).testBit (32 * s.B) = true := by
  rw [validB_bit]
  refine ⟨hBm, fun k hk => ?_⟩
  have hpos : 0 < rk s.a := pos_of_lt_mul hk
  have hal : k / rk s.a < rk s.a := by rw [Nat.div_lt_iff_lt_mul hpos]; exact hk
  have hbe : k % rk s.a < rk s.a := Nat.mod_lt _ hpos
  have hp1 := par2_le (Nat.land (G.A2.rowD d s.U (k / rk s.a)) (G.A2.rowD d s.V (k % rk s.a)))
  have hc1 := cond01_le (Nat.beq (k / rk s.a) (k % rk s.a))
  rw [sel_bit _ _ _ (xor01 hc1 hp1) hB, YL_ok _ (Rc_lt _ _) _ hC, swarXL_bit _ _ _ (Lc_lt _ _) hB (yvec_lt _ _),
    decide_xor01 hc1 hp1, cond01, par2_rows d _ _ hd (by rw [rowD_eq]; exact row_lt _ _ _), rowD_eq, rowD_eq]
  have hv' := hv.2.2.2.2.2.2 (k / rk s.a) hal (k % rk s.a) hbe
  unfold gram dirt at hv'
  rw [Nat.land_comm] at hv'
  rw [hv']
  have hbeq : (k / rk s.a == k % rk s.a) = Nat.beq (k / rk s.a) (k % rk s.a) := beq_eq_nat_beq _ _
  rw [hbeq]
  cases Nat.beq (k / rk s.a) (k % rk s.a) <;> cases parN d (row d s.U (k / rk s.a) &&& row d s.V (k % rk s.a)) <;> rfl

end GS

#print axioms GS.cmask_bit
#print axioms GS.validB_bit
#print axioms GS.swarYL_bit
#print axioms GS.par2_eq
