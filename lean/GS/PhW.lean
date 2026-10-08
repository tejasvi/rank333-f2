module
public import R22Port.U_d41d8cd98f00
public import GS.Ok
/-! # Shape W (d = 1, (19,0,3)): two compatible rank-3 vertices are refuted (`checkV1`'s partner part)

* `cp_spec`: the checker's `compatP` unfolded (distinct first factors, all cross parities 0);
* `swarPar_bit`, `nz32_bit` (any `z`, fields below `2^31` for `k < m`, nothing assumed above field `m`);
* `wMask_bit`: a rank-3 vertex `iw > iv` compatible with `v3term o iv` has bit `32·iw` in `wMask o iv (v3term o iv)`;
* `okB_land_AB`, `okbOf_pair`: `okbOf r1 [v, w] = okB v &&& okB w` (and for `okC`);
* `shapeW_of`: `VOK1 → ShapeW`. -/
@[expose] public section
namespace GS
open G G.V2 G.D2 G.A2 G.Acc Finset

/-! ## `compatP` unfolded -/

theorem rowsOK_spec {t x : ℕ} : ∀ r, rowsOK t x r = true → ∀ q < r, par32 (fYU t q &&& x) = 0
  | 0, _ => fun q hq => absurd hq (Nat.not_lt_zero q)
  | r + 1, h => by
    have h' : (Nat.beq (par32 (Nat.land (fYU t r) x)) 0 && rowsOK t x r) = true := h
    rw [Bool.and_eq_true] at h'
    intro q hq
    rcases Nat.lt_succ_iff_lt_or_eq.mp hq with hlt | rfl
    · exact rowsOK_spec r h'.2 q hlt
    · exact Nat.eq_of_beq_eq_true h'.1

theorem cross_spec {t s : ℕ} : ∀ n, compatP.cross t s n = true → ∀ be < n, ∀ al < fR t, par32 (fYU t al &&& fXV s be) = 0
  | 0, _ => fun be hbe => absurd hbe (Nat.not_lt_zero be)
  | n + 1, h => by
    have h' : (rowsOK t (fXV s n) (fR t) && compatP.cross t s n) = true := h
    rw [Bool.and_eq_true] at h'
    intro be hbe
    rcases Nat.lt_succ_iff_lt_or_eq.mp hbe with hlt | rfl
    · exact cross_spec n h'.2 be hlt
    · exact rowsOK_spec _ h'.1

theorem cp_spec {t s : ℕ} (h : CP t s) : fA t ≠ fA s ∧
    (∀ be < fR s, ∀ al < fR t, par32 (fYU t al &&& fXV s be) = 0) ∧
    (∀ be < fR t, ∀ al < fR s, par32 (fYU s al &&& fXV t be) = 0) := by
  unfold CP compatP at h
  rw [Bool.and_eq_true, Bool.and_eq_true] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  refine ⟨fun e => ?_, cross_spec _ h2, cross_spec _ h3⟩
  rw [e] at h1; simp at h1

/-! ## `swarPar` and `nz32` bits -/

theorem parZ_eq (x : ℕ) : parZ x = if par32 x = 1 then 1 else 0 := by
  unfold parZ
  rw [← parN_eq, par32_eq]
  by_cases h : parN 32 x <;> simp [h]

/-- bit `32k` of `swarPar P (rep32 m) y` (`k < m`) is `par32 (fld P k &&& y) = 1` -/
theorem swarPar_bit (P y m k : ℕ) (hy : y < 2 ^ 32) (hk : k < m) :
    (swarPar P (rep32 m) y).testBit (32 * k) = decide (par32 (fld P k &&& y) = 1) := by
  rw [swarPar_testBit P y m _ hy]
  have e1 : 32 * k / 32 = k := by omega
  have e2 : 32 * k % 32 = 0 := by omega
  rw [e1, e2, parZ_eq]
  rcases par32_le_one (fld P k &&& y) with h0 | h1
  · simp [hk, h0]
  · simp [hk, h1]

theorem testBit_add_low (a b n p : ℕ) (hp : p < n) : (a + b).testBit p = ((a % 2 ^ n) + (b % 2 ^ n)).testBit p := by
  have : (a + b) % 2 ^ n = ((a % 2 ^ n) + (b % 2 ^ n)) % 2 ^ n := Nat.add_mod _ _ _
  have h1 := congrArg (fun z => z.testBit p) this
  simp only [Nat.testBit_mod_two_pow, hp, decide_true, Bool.true_and] at h1
  exact h1

theorem pk32_congr {f g : ℕ → ℕ} {m : ℕ} (h : ∀ k < m, f k = g k) : pk32 f m = pk32 g m := by
  unfold pk32; exact Finset.sum_congr rfl (fun k hk => by rw [h k (Finset.mem_range.mp hk)])

theorem fld_mod (z m k : ℕ) (hk : k < m) : fld (z % 2 ^ (32 * m)) k = fld z k := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_fld, testBit_fld, Nat.testBit_mod_two_pow]
  by_cases hj : j < 32
  · simp [hj, show 32 * k + j < 32 * m by omega]
  · simp [hj]

theorem mod_pk32 (z m : ℕ) : z % 2 ^ (32 * m) = pk32 (fld z) m := by
  rw [eq_pk32 (z % 2 ^ (32 * m)) m (Nat.mod_lt _ (Nat.two_pow_pos _))]
  exact pk32_congr (fun k hk => fld_mod z m k hk)

/-- bit `32k` of `nz32 z (rep32 m)`, `k < m`, for fields of `z` below `2^31` (for `k < m`) -/
theorem nz32_bit (z m k : ℕ) (hz : ∀ k < m, fld z k < 2 ^ 31) (hk : k < m) :
    (nz32 z (rep32 m)).testBit (32 * k) = decide (fld z k ≠ 0) := by
  unfold nz32
  show (((z + 2147483647 * rep32 m) >>> 31) &&& rep32 m).testBit (32 * k) = _
  rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_rep32]
  have e1 : 32 * k / 32 = k := by omega
  have e2 : 32 * k % 32 = 0 := by omega
  rw [e1, e2]
  simp only [hk, decide_true, Bool.and_true]
  have hcR : 2147483647 * rep32 m < 2 ^ (32 * m) := by
    rw [Nat.mul_comm]; exact (Nat.mul_comm _ _ ▸ mul_rep32_lt 2147483647 m (by norm_num))
  rw [testBit_add_low _ _ (32 * m) _ (by omega), mod_pk32, Nat.mod_eq_of_lt hcR, rep32_pk, pk32_mul, pk32_add]
  have hb : ∀ j < m, fld z j + 2147483647 * 1 < 2 ^ 32 := fun j hj => by have := hz j hj; omega
  rw [testBit_pk32 _ m _ hb]
  have e3 : (31 + 32 * k) / 32 = k := by omega
  have e4 : (31 + 32 * k) % 32 = 31 := by omega
  rw [e3, e4]
  simp only [hk, decide_true, Bool.true_and]
  have hzk := hz k hk
  rw [Nat.testBit_eq_decide_div_mod_eq]
  rcases Nat.eq_zero_or_pos (fld z k) with h0 | hp
  · rw [h0]; decide
  · have h1 : (fld z k + 2147483647 * 1) / 2 ^ 31 = 1 := Nat.div_eq_of_lt_le (by norm_num; omega) (by norm_num; omega)
    rw [h1]; simp [Nat.pos_iff_ne_zero.mp hp]

theorem eq_of_xor_zero {a b : ℕ} (h : a ^^^ b = 0) : a = b := by
  apply Nat.eq_of_testBit_eq; intro i
  have := congrArg (fun z => z.testBit i) h
  simp only [Nat.testBit_xor, Nat.zero_testBit] at this
  cases ha : a.testBit i <;> cases hb : b.testBit i <;> simp_all

/-- field `k < m` of `P ^^^ y * rep32 m` (`y < 2^32`) -/
theorem fld_xor_mul_rep (P y m k : ℕ) (hy : y < 2 ^ 32) (hk : k < m) : fld (P ^^^ (y * rep32 m)) k = fld P k ^^^ y := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_fld, Nat.testBit_xor, Nat.testBit_xor, testBit_fld, testBit_mul_rep32 _ _ _ hy]
  by_cases hj : j < 32
  · have e3 : (32 * k + j) / 32 = k := by omega
    have e4 : (32 * k + j) % 32 = j := by omega
    rw [e3, e4]; simp [hj, hk]
  · have : y.testBit j = false := Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) (by omega)))
    simp [hj, this]

/-! ## `wMask` -/

theorem fR_v3 {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true) {iv : ℕ}
    (hiv : iv < nV3) : fR (v3term o iv) = 3 := ((hF.V3 rfl).2 iv hiv).2.2.2.2.2.2.2.1

/-- **a compatible later rank-3 vertex has its bit in `wMask`** -/
theorem wMask_bit {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true) {iv iw : ℕ}
    (hiv : iv < nV3) (hiw : iw < nV3) (hlt : iv < iw) (hcp : CP (v3term o iv) (v3term o iw)) :
    (wMask o iv (v3term o iv)).testBit (32 * iw) = true := by
  obtain ⟨hR, hV⟩ := hF.V3 rfl
  obtain ⟨hy0, hy1, hy2, hx0, hx1, hx2, hA, hR3, hfl, hAlt⟩ := hV iw hiw
  obtain ⟨-, -, -, -, -, -, -, hR3v, hflv, hAv⟩ := hV iv hiv
  obtain ⟨hne, hc1, hc2⟩ := cp_spec hcp
  rw [hR3v, hR3] at hc1 hc2
  set v := v3term o iv
  have hyv : ∀ q < 3, fYU v q < 2 ^ 32 := fun q hq => lt_of_lt_of_le (hflv q hq).1 (by norm_num)
  have hxv : ∀ q < 3, fXV v q < 2 ^ 32 := fun q hq => lt_of_lt_of_le (hflv q hq).2 (by norm_num)
  unfold wMask
  simp only [hR]
  show ((rep32 nV3 ^^^ (rep32 nV3 &&& (Nat.shiftLeft 1 (32 * Nat.succ iv) - 1))) &&&
    ((nz32 (o.V3A ^^^ (fA v * rep32 nV3)) (rep32 nV3)) &&& (rep32 nV3 ^^^ _))).testBit (32 * iw) = true
  rw [Nat.testBit_and, Nat.testBit_and, Nat.testBit_xor, Nat.testBit_xor, Nat.testBit_and, shiftLeft_one,
    Nat.testBit_two_pow_sub_one, testBit_rep32]
  have e1 : 32 * iw / 32 = iw := by omega
  have e2 : 32 * iw % 32 = 0 := by omega
  rw [e1, e2]
  simp only [hiw, decide_true, Bool.and_true, show ¬ (32 * iw < 32 * Nat.succ iv) from by omega, decide_false,
    Bool.and_false, Bool.xor_false, Bool.true_and]
  refine Bool.and_eq_true_iff.mpr ⟨?_, ?_⟩
  · -- distinct first factors
    have hfA : fA v < 2 ^ 32 := lt_of_lt_of_le hAv (by norm_num)
    have hfz : ∀ k < nV3, fld (o.V3A ^^^ (fA v * rep32 nV3)) k < 2 ^ 31 := by
      intro k hk
      rw [fld_xor_mul_rep _ _ _ _ hfA hk, (hV k hk).2.2.2.2.2.2.1]
      exact lt_of_lt_of_le (Nat.xor_lt_two_pow (lt_of_lt_of_le (hV k hk).2.2.2.2.2.2.2.2.2 (by norm_num))
        (lt_of_lt_of_le hAv (by norm_num))) le_rfl
    rw [nz32_bit _ _ _ hfz hiw, fld_xor_mul_rep _ _ _ _ hfA hiw, hA]
    simp only [ne_eq, decide_eq_true_eq]
    intro hz
    exact hne (eq_of_xor_zero hz).symm
  · -- no bad parity
    have hX : ∀ P, (P = o.V3X0 ∨ P = o.V3X1 ∨ P = o.V3X2) → ∀ q < 3,
        (swarPar P (rep32 nV3) (fYU v q)).testBit (32 * iw) = false := by
      intro P hP q hq
      rw [swarPar_bit _ _ _ _ (hyv q hq) hiw]
      rcases hP with rfl | rfl | rfl
      · rw [hx0, Nat.land_comm, hc1 0 (by norm_num) q hq]; decide
      · rw [hx1, Nat.land_comm, hc1 1 (by norm_num) q hq]; decide
      · rw [hx2, Nat.land_comm, hc1 2 (by norm_num) q hq]; decide
    have hY : ∀ P, (P = o.V3Y0 ∨ P = o.V3Y1 ∨ P = o.V3Y2) → ∀ q < 3,
        (swarPar P (rep32 nV3) (fXV v q)).testBit (32 * iw) = false := by
      intro P hP q hq
      rw [swarPar_bit _ _ _ _ (hxv q hq) hiw]
      rcases hP with rfl | rfl | rfl
      · rw [hy0, hc2 q hq 0 (by norm_num)]; decide
      · rw [hy1, hc2 q hq 1 (by norm_num)]; decide
      · rw [hy2, hc2 q hq 2 (by norm_num)]; decide
    have lor_bit : ∀ a b i : ℕ, (Nat.lor a b).testBit i = (a.testBit i || b.testBit i) := fun a b i => Nat.testBit_or a b i
    have xor_bit : ∀ a b i : ℕ, (Nat.xor a b).testBit i = (a.testBit i ^^ b.testBit i) := fun a b i => Nat.testBit_xor a b i
    have xX00 := hX o.V3X0 (Or.inl rfl) 0 (by norm_num)
    have xX01 := hX o.V3X0 (Or.inl rfl) 1 (by norm_num)
    have xX02 := hX o.V3X0 (Or.inl rfl) 2 (by norm_num)
    have xX10 := hX o.V3X1 (Or.inr (Or.inl rfl)) 0 (by norm_num)
    have xX11 := hX o.V3X1 (Or.inr (Or.inl rfl)) 1 (by norm_num)
    have xX12 := hX o.V3X1 (Or.inr (Or.inl rfl)) 2 (by norm_num)
    have xX20 := hX o.V3X2 (Or.inr (Or.inr rfl)) 0 (by norm_num)
    have xX21 := hX o.V3X2 (Or.inr (Or.inr rfl)) 1 (by norm_num)
    have xX22 := hX o.V3X2 (Or.inr (Or.inr rfl)) 2 (by norm_num)
    have yY00 := hY o.V3Y0 (Or.inl rfl) 0 (by norm_num)
    have yY01 := hY o.V3Y0 (Or.inl rfl) 1 (by norm_num)
    have yY02 := hY o.V3Y0 (Or.inl rfl) 2 (by norm_num)
    have yY10 := hY o.V3Y1 (Or.inr (Or.inl rfl)) 0 (by norm_num)
    have yY11 := hY o.V3Y1 (Or.inr (Or.inl rfl)) 1 (by norm_num)
    have yY12 := hY o.V3Y1 (Or.inr (Or.inl rfl)) 2 (by norm_num)
    have yY20 := hY o.V3Y2 (Or.inr (Or.inr rfl)) 0 (by norm_num)
    have yY21 := hY o.V3Y2 (Or.inr (Or.inr rfl)) 1 (by norm_num)
    have yY22 := hY o.V3Y2 (Or.inr (Or.inr rfl)) 2 (by norm_num)
    simp only [xor_bit, lor_bit, testBit_rep32, xX00, xX01, xX02, xX10, xX11, xX12, xX20, xX21, xX22, yY00, yY01, yY02, yY10, yY11, yY12, yY20, yY21, yY22]
    simp [e1, e2, hiw]

/-! ## core masks of two terms -/

theorem rowsB_sub (r1 : R1) (t : ℕ) : ∀ n, rowsB r1 t n &&& r1.AB = rowsB r1 t n
  | 0 => Nat.and_self _
  | n + 1 => by
    show (Nat.land (rowsB r1 t n) (Nat.xor r1.AB (sx r1.SB (fYU t n)))) &&& r1.AB = _
    show (rowsB r1 t n &&& (r1.AB ^^^ sx r1.SB (fYU t n))) &&& r1.AB = rowsB r1 t n &&& (r1.AB ^^^ sx r1.SB (fYU t n))
    rw [Nat.and_assoc, Nat.and_comm (r1.AB ^^^ _) r1.AB, ← Nat.and_assoc, rowsB_sub r1 t n]

theorem rowsC_sub (r1 : R1) (t : ℕ) : ∀ n, rowsC r1 t n &&& r1.AC = rowsC r1 t n
  | 0 => Nat.and_self _
  | n + 1 => by
    show (rowsC r1 t n &&& (r1.AC ^^^ sx r1.SC (fXV t n))) &&& r1.AC = rowsC r1 t n &&& (r1.AC ^^^ sx r1.SC (fXV t n))
    rw [Nat.and_assoc, Nat.and_comm (r1.AC ^^^ _) r1.AC, ← Nat.and_assoc, rowsC_sub r1 t n]

theorem okbOf_pair (r1 : R1) (v w : ℕ) : okbOf r1 [v, w] = okB r1 v &&& okB r1 w := by
  unfold okbOf
  simp only [List.foldl_cons, List.foldl_nil]
  rw [Nat.and_comm r1.AB, show okB r1 v &&& r1.AB = okB r1 v from rowsB_sub r1 v _]

theorem okcOf_pair (r1 : R1) (v w : ℕ) : okcOf r1 [v, w] = okC r1 v &&& okC r1 w := by
  unfold okcOf
  simp only [List.foldl_cons, List.foldl_nil]
  rw [Nat.and_comm r1.AC, show okC r1 v &&& r1.AC = okC r1 v from rowsC_sub r1 v _]

/-! ## shape W -/

theorem shapeW_spec (o : Orb2) (need okb okc : ℕ) :
    ∀ ws : List (ℕ × CoreCert), shapeW o need okb okc ws = true → ∀ x ∈ ws, core1 o need okb okc (v3term o x.1) x.2 = true
  | [], _ => fun x hx => absurd hx (List.not_mem_nil)
  | (w, c) :: rest, h => by
    have h' : (core1 o need okb okc (v3term o w) c && shapeW o need okb okc rest) = true := h
    rw [Bool.and_eq_true] at h'
    intro x hx
    rcases List.mem_cons.mp hx with rfl | hx'
    · exact h'.1
    · exact shapeW_spec o need okb okc rest h'.2 x hx'

/-- **shape W** (d = 1, (19,0,3)) -/
theorem shapeW_of {o : Orb2} {PY0 PY1 nB2 nRec nV3 : ℕ} (hF : OrbFacts o PY0 PY1 nB2 nRec nV3 true)
    (hV : VOK1 o nV3) : ShapeW o nV3 := by
  intro iv hiv iw hiw hlt hcp
  obtain ⟨⟨chs, recs, ws⟩, hc⟩ := hV iv hiv
  have hc' : checkV1 o 18 iv chs recs ws = true := by
    have : (checkV1 o 18 iv chs recs ws && allV1 o 18 (Nat.succ iv) []) = true := hc
    rw [Bool.and_eq_true] at this; exact this.1
  unfold checkV1 at hc'
  dsimp only at hc'
  split at hc'
  · exact absurd hc' (by simp)
  · rename_i p hp
    simp only [Bool.and_eq_true] at hc'
    obtain ⟨⟨-, hl⟩, hs⟩ := hc'
    obtain ⟨-, hmem⟩ := listChk32_spec _ _ hl
    obtain ⟨k, hk, e⟩ := (hmem (32 * iw)).mp (wMask_bit hF hiv hiw hlt hcp)
    have hkw : k = iw := by omega
    subst hkw
    obtain ⟨⟨w', c⟩, hwc, hw'⟩ := List.mem_map.mp hk
    simp only at hw'
    subst hw'
    have := shapeW_spec o _ _ _ ws hs _ hwc
    refine ⟨c, ?_⟩
    rw [okbOf_pair, okcOf_pair]
    exact this

end GS

#print axioms GS.wMask_bit
#print axioms GS.shapeW_of
