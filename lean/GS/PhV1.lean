module
public import R22Port.U_d41d8cd98f00
public import GS.PhB2
public import GS.Compact
/-! # Track V, part 3: adjacency of members and the enumeration of edges and triangles (phase C)

* `adj32_bits`, `adj32_bit`: `adj32 p (rep32 p.m) t` has bits only at `32k`, `k < p.m`, and bit `32k` is set when `t` and
  member `k` are compatible (`CP`);
* `arow_bit`: the compacted adjacency row of a member has bit `k` set for every compatible member `k`;
* `RowInv`, `rowInv_step`, `rowInv_block`: the stored adjacency rows (`cur`, `done`) read back by `rowOf`;
* `phaseC3_spec`: every triangle of the adjacency rows is refuted by `coreOK`; `phaseC2_spec`: every edge. -/
@[expose] public section
namespace GS.V
open G G.V2 G.D2 G.A2 G.Acc Finset

theorem testBit_land' (a b q : ℕ) : (Nat.land a b).testBit q = (a.testBit q && b.testBit q) := Nat.testBit_and a b q
theorem testBit_lor' (a b q : ℕ) : (Nat.lor a b).testBit q = (a.testBit q || b.testBit q) := Nat.testBit_or a b q
theorem testBit_xor' (a b q : ℕ) : (Nat.xor a b).testBit q = (a.testBit q ^^ b.testBit q) := Nat.testBit_xor a b q
theorem testBit_shr' (x n q : ℕ) : (Nat.shiftRight x n).testBit q = x.testBit (n + q) := Nat.testBit_shiftRight x
theorem testBit_shl' (x n q : ℕ) : (Nat.shiftLeft x n).testBit q = (decide (q ≥ n) && x.testBit (q - n)) :=
  Nat.testBit_shiftLeft x

theorem fYU_lt (t q : ℕ) : fYU t q < 2 ^ 29 := by rw [fYU_eq]; exact Nat.mod_lt _ (by positivity)
theorem fXV_lt (t q : ℕ) : fXV t q < 2 ^ 29 := by rw [fXV_eq]; exact Nat.mod_lt _ (by positivity)
theorem fA_lt (t : ℕ) : fA t < 512 := by rw [fA_eq]; exact Nat.mod_lt _ (by positivity)

/-! ## fields of xors and repeated values -/

theorem fld_xor (a b k : ℕ) : fld (Nat.xor a b) k = Nat.xor (fld a k) (fld b k) := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_xor', testBit_fld, testBit_fld, testBit_fld, testBit_xor']
  cases decide (j < 32) <;> simp

theorem fld_mul_rep32 (y m k : ℕ) (hy : y < 2 ^ 32) (hk : k < m) : fld (y * rep32 m) k = y := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_fld, testBit_mul_rep32 y m _ hy]
  by_cases hj : j < 32
  · have e1 : (32 * k + j) / 32 = k := by omega
    have e2 : (32 * k + j) % 32 = j := by omega
    simp [hj, e1, e2, hk]
  · have : y.testBit j = false := testBit_false_of_lt hy (by omega)
    simp [hj, this]

/-- `nz32` for any `z` whose first `m` fields are below `2^31` -/
theorem testBit_nz32_gen (z m q : ℕ) (hz : ∀ k < m, fld z k < 2 ^ 31) :
    (nz32 z (rep32 m)).testBit q = (decide (q / 32 < m) && decide (q % 32 = 0) && decide (fld z (q / 32) ≠ 0)) := by
  set z' := pk32 (fld z) m with hz'
  have hlt' : z' + 2147483647 * rep32 m < 2 ^ (32 * m) := by
    rw [rep32_pk, pk32_mul, hz', pk32_add]
    exact pk32_lt _ m (fun k hk => by have := hz k hk; omega)
  have hmod : z % 2 ^ (32 * m) = z' := by
    rw [eq_pk32 (z % 2 ^ (32 * m)) m (Nat.mod_lt _ (by positivity)), hz']
    unfold pk32; apply Finset.sum_congr rfl; intro k hk
    rw [Finset.mem_range] at hk
    congr 1
    apply Nat.eq_of_testBit_eq; intro j
    rw [testBit_fld, testBit_fld, Nat.testBit_mod_two_pow]
    by_cases hj : j < 32
    · have : 32 * k + j < 32 * m := by omega
      simp [hj, this]
    · simp [hj]
  have hsame : (nz32 z (rep32 m)).testBit q = (nz32 z' (rep32 m)).testBit q := by
    unfold nz32
    rw [testBit_land', testBit_land', testBit_shr', testBit_shr']
    cases hR : (rep32 m).testBit q
    · simp
    · rw [testBit_rep32] at hR
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hR
      have hpos : 31 + q < 32 * m := by omega
      have hz2 : Nat.add z (Nat.mul 2147483647 (rep32 m)) =
          2 ^ (32 * m) * (z / 2 ^ (32 * m)) + (z' + 2147483647 * rep32 m) := by
        show z + 2147483647 * rep32 m = _
        have := Nat.mod_add_div z (2 ^ (32 * m))
        rw [hmod] at this; omega
      rw [hz2, Nat.testBit_two_pow_mul_add _ hlt', if_pos hpos]
      rfl
  rw [hsame, hz', testBit_nz32 (fld z) m q hz]

/-! ## adjacency -/

theorem adj32_sub (p : Packs) (t q : ℕ) (h : (adj32 p (rep32 p.m) t).testBit q = true) :
    (rep32 p.m).testBit q = true := by
  unfold adj32 at h
  simp only [] at h
  rw [testBit_land'] at h
  have h1 := (Bool.and_eq_true _ _).mp h |>.1
  unfold nz32 at h1
  rw [testBit_land'] at h1
  exact ((Bool.and_eq_true _ _).mp h1).2

/-- the adjacency vector has bits only at `32k`, `k < p.m` -/
theorem adj32_bits (p : Packs) (t q : ℕ) (h : (adj32 p (rep32 p.m) t).testBit q = true) :
    q % 32 = 0 ∧ q / 32 < p.m := by
  have := adj32_sub p t q h
  rw [testBit_rep32] at this
  simp only [Bool.and_eq_true, decide_eq_true_eq] at this
  exact ⟨this.2, this.1⟩

theorem parZ_zero_of {a b : ℕ} (h : par32 (Nat.land a b) = 0) : parZ (b &&& a) = 0 := by
  have hp : parN 32 (Nat.land a b) = false := by
    rw [par32_eq] at h; cases e : parN 32 (Nat.land a b)
    · rfl
    · rw [e] at h; exact absurd h (by decide)
  have := parN_eq 32 (Nat.land a b)
  rw [hp] at this
  unfold parZ
  rw [show b &&& a = Nat.land a b from Nat.land_comm b a]
  rw [← this]; rfl

theorem parZ_zero_of' {a b : ℕ} (h : par32 (Nat.land a b) = 0) : parZ (a &&& b) = 0 := by
  have := parZ_zero_of (a := b) (b := a) (by rw [show Nat.land b a = Nat.land a b from Nat.land_comm b a]; exact h)
  exact this

theorem swarPar_bit_false (P y m k : ℕ) (hy : y < 2 ^ 32) (h : parZ (fld P k &&& y) = 0) :
    (swarPar P (rep32 m) y).testBit (32 * k) = false := by
  rw [swarPar_testBit P y m _ hy]
  have e1 : 32 * k / 32 = k := by omega
  rw [e1, h]; simp

/-- **adjacency is complete**: a compatible member has its bit -/
theorem adj32_bit (p : Packs) (t k : ℕ) (hk : k < p.m) (htR : fR t = 2)
    (hY0 : fld p.Y0 k < 2 ^ 29) (hY1 : fld p.Y1 k < 2 ^ 29) (hX0 : fld p.X0 k < 2 ^ 29) (hX1 : fld p.X1 k < 2 ^ 29)
    (hA : fld p.A k < 512) (hAall : ∀ k' < p.m, fld p.A k' < 2 ^ 31) (hcp : CP t (memTerm p k)) :
    (adj32 p (rep32 p.m) t).testBit (32 * k) = true := by
  have hm : memTerm p k = T2 (fld p.Y0 k) (fld p.Y1 k) (fld p.X0 k) (fld p.X1 k) (fld p.A k) := by
    rw [memTerm_eq]; simp only [get32_eq]
  obtain ⟨hne, hc1, hc2⟩ := CP_cross hcp
  rw [hm] at hne hc1 hc2
  rw [fR_T2 _ _ _ _ _ hY0 hY1 hX0 hX1, htR] at hc1 hc2
  rw [fA_T2 _ _ _ _ _ hY0 hY1 hX0 hX1 hA] at hne
  have eY0 := fYU_T2_0 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eY1 := fYU_T2_1 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eX0 := fXV_T2_0 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  have eX1 := fXV_T2_1 _ _ _ _ (fld p.A k) hY0 hY1 hX0 hX1
  -- the eight parities
  have p1 := hc1 0 (by norm_num) 0 (by norm_num); rw [eX0] at p1
  have p2 := hc1 1 (by norm_num) 0 (by norm_num); rw [eX1] at p2
  have p3 := hc1 0 (by norm_num) 1 (by norm_num); rw [eX0] at p3
  have p4 := hc1 1 (by norm_num) 1 (by norm_num); rw [eX1] at p4
  have p5 := hc2 0 (by norm_num) 0 (by norm_num); rw [eY0] at p5
  have p6 := hc2 0 (by norm_num) 1 (by norm_num); rw [eY1] at p6
  have p7 := hc2 1 (by norm_num) 0 (by norm_num); rw [eY0] at p7
  have p8 := hc2 1 (by norm_num) 1 (by norm_num); rw [eY1] at p8
  have hy : ∀ q, fYU t q < 2 ^ 32 := fun q => lt_trans (fYU_lt t q) (by norm_num)
  have hx : ∀ q, fXV t q < 2 ^ 32 := fun q => lt_trans (fXV_lt t q) (by norm_num)
  unfold adj32
  simp only []
  rw [testBit_land', testBit_xor', testBit_lor', testBit_lor', testBit_lor', testBit_lor', testBit_lor', testBit_lor',
    testBit_lor', swarPar_bit_false _ _ _ _ (hy 0) (parZ_zero_of p1), swarPar_bit_false _ _ _ _ (hy 0) (parZ_zero_of p2),
    swarPar_bit_false _ _ _ _ (hy 1) (parZ_zero_of p3), swarPar_bit_false _ _ _ _ (hy 1) (parZ_zero_of p4),
    swarPar_bit_false _ _ _ _ (hx 0) (parZ_zero_of' p5), swarPar_bit_false _ _ _ _ (hx 0) (parZ_zero_of' p6),
    swarPar_bit_false _ _ _ _ (hx 1) (parZ_zero_of' p7), swarPar_bit_false _ _ _ _ (hx 1) (parZ_zero_of' p8)]
  have hR : (rep32 p.m).testBit (32 * k) = true := by
    rw [testBit_rep32]; simp only [Bool.and_eq_true, decide_eq_true_eq]; omega
  rw [hR]
  have hfz : ∀ k' < p.m, fld (Nat.xor p.A (Nat.mul (fA t) (rep32 p.m))) k' < 2 ^ 31 := by
    intro k' hk'
    rw [fld_xor, show Nat.mul (fA t) (rep32 p.m) = fA t * rep32 p.m from rfl,
      fld_mul_rep32 _ _ _ (lt_trans (fA_lt t) (by norm_num)) hk']
    exact Nat.xor_lt_two_pow (hAall k' hk') (lt_trans (fA_lt t) (by norm_num))
  rw [testBit_nz32_gen _ _ _ hfz]
  have e1 : 32 * k / 32 = k := by omega
  have e2 : 32 * k % 32 = 0 := by omega
  rw [e1, e2, fld_xor, show Nat.mul (fA t) (rep32 p.m) = fA t * rep32 p.m from rfl,
    fld_mul_rep32 _ _ _ (lt_trans (fA_lt t) (by norm_num)) hk]
  have hxne : Nat.xor (fld p.A k) (fA t) ≠ 0 := by
    intro h0
    apply hne
    have : fld p.A k = fA t := by
      apply Nat.eq_of_testBit_eq; intro j
      have := congrArg (fun x => Nat.testBit x j) h0
      simp only [testBit_xor', Nat.zero_testBit] at this
      revert this; cases (fld p.A k).testBit j <;> cases (fA t).testBit j <;> simp
    exact this.symm
  simp [hk]
  exact fun h => hne h.symm

/-- the compacted adjacency row of a term -/
theorem arow_bit (p : Packs) (T t k : ℕ) (hT : p.m ≤ 2 ^ T) (hk : k < p.m) (h : (adj32 p (rep32 p.m) t).testBit (32 * k) = true) :
    (compactL (cmasks p.m T 0) 0 (adj32 p (rep32 p.m) t)).testBit k = true := by
  rw [compactL_spec p.m T _ hT (adj32_bits p t) k, h]; simp [hk]

theorem arow_lt (p : Packs) (T t : ℕ) (hT : p.m ≤ 2 ^ T) :
    compactL (cmasks p.m T 0) 0 (adj32 p (rep32 p.m) t) < 2 ^ p.m := by
  apply Nat.lt_pow_two_of_testBit
  intro i hi
  rw [compactL_spec p.m T _ hT (adj32_bits p t) i]
  simp; omega

/-! ## stored rows -/

/-- field `u` (width `m`) -/
theorem rowOf_eq (m ALL1 i j cur : ℕ) (done : List ℕ) (hALL : ALL1 = 2 ^ m - 1) :
    G.V2.rowOf m ALL1 i j cur done =
      (if i / 64 = j / 64 then cur else done.getD (j / 64 - i / 64 - 1) 0) / 2 ^ (m * (j % 64)) % 2 ^ m := by
  unfold G.V2.rowOf
  simp only []
  rw [hALL, land_mask, shr_eq]
  have e1 : Nat.shiftRight i 6 = i / 64 := by rw [shr_eq]; norm_num
  have e2 : Nat.shiftRight j 6 = j / 64 := by rw [shr_eq]; norm_num
  have e3 : Nat.land j 63 = j % 64 := by
    rw [show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, land_mask]; norm_num
  rw [e1, e2, e3]
  by_cases h : i / 64 = j / 64
  · rw [if_pos h]; simp [h]
  · rw [if_neg h]
    have : Nat.beq (i / 64) (j / 64) = false := by
      cases e : Nat.beq (i / 64) (j / 64)
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true e) h
    rw [this]; rfl

/-- two numbers agreeing on bits `[m u, m u + m)` have the same field `u` -/
theorem field_congr (m u x y : ℕ) (h : ∀ q, m * u ≤ q → q < m * u + m → x.testBit q = y.testBit q) :
    x / 2 ^ (m * u) % 2 ^ m = y / 2 ^ (m * u) % 2 ^ m := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, Nat.testBit_div_two_pow]
  by_cases hj : j < m
  · rw [h (j + m * u) (by omega) (by omega)]
  · simp [hj]

theorem field_of_lt (m u x : ℕ) (hx : x < 2 ^ m) (c : ℕ) (hc : ∀ q < m * (u + 1), c.testBit q = false) :
    (Nat.lor c (Nat.shiftLeft x (Nat.mul m u))) / 2 ^ (m * u) % 2 ^ m = x := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow, testBit_lor', testBit_shl']
  simp only [show Nat.mul m u = m * u from rfl]
  by_cases hj : j < m
  · rw [hc (j + m * u) (by rw [Nat.mul_add, Nat.mul_one]; omega)]
    have e : j + m * u - m * u = j := by omega
    simp [hj, e]
  · have hxj : x.testBit j = false := testBit_false_of_lt hx (by omega)
    simp [hj, hxj]

theorem shl_testBit_high (x u m q : ℕ) (hx : x < 2 ^ m) (hq : m * (u + 1) ≤ q) :
    (Nat.shiftLeft x (Nat.mul m u)).testBit q = false := by
  rw [testBit_shl']
  have h1 : q - m * u ≥ m := by rw [Nat.mul_add, Nat.mul_one] at hq; omega
  have : x.testBit (q - Nat.mul m u) = false := testBit_false_of_lt hx h1
  rw [this]; simp

theorem shl_testBit_low (x u m q : ℕ) (hq : q < m * u) : (Nat.shiftLeft x (Nat.mul m u)).testBit q = false := by
  rw [testBit_shl']
  simp only [show Nat.mul m u = m * u from rfl]
  have : ¬ (q ≥ m * u) := by omega
  simp [this]

/-- the stored rows read back the computed rows `A j` of the members above `i` -/
def RowInv (m ALL1 i cur : ℕ) (done : List ℕ) (A : ℕ → ℕ) : Prop :=
  (∀ j, i < j → j < m → G.V2.rowOf m ALL1 i j cur done = A j) ∧ ∀ q < m * (i % 64 + 1), cur.testBit q = false

theorem rowInv_init (m ALL1 : ℕ) (A : ℕ → ℕ) : RowInv m ALL1 (m - 1) 0 [] A :=
  ⟨fun j h1 h2 => by omega, fun q _ => Nat.zero_testBit q⟩

/-- adding row `i` inside a block -/
theorem rowInv_step (m ALL1 i cur : ℕ) (done : List ℕ) (A : ℕ → ℕ) (hALL : ALL1 = 2 ^ m - 1) (hAi : A i < 2 ^ m)
    (hi : Nat.beq (Nat.land i 63) 0 = false) (h : RowInv m ALL1 i cur done A) :
    RowInv m ALL1 (Nat.pred i) (Nat.lor cur (Nat.shiftLeft (A i) (Nat.mul m (Nat.land i 63)))) done A := by
  have e3 : Nat.land i 63 = i % 64 := by rw [show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, land_mask]; norm_num
  rw [e3] at hi ⊢
  have hi0 : i % 64 ≠ 0 := fun e => by rw [e] at hi; exact absurd hi (by decide)
  have hb : (i - 1) / 64 = i / 64 := by omega
  have hm : (i - 1) % 64 = i % 64 - 1 := by omega
  obtain ⟨hr, hz⟩ := h
  refine ⟨fun j h1 h2 => ?_, fun q hq => ?_⟩
  · rw [Nat.pred_eq_sub_one] at h1
    rw [rowOf_eq _ _ _ _ _ _ hALL, show Nat.pred i = i - 1 from rfl, hb]
    by_cases hj : j = i
    · subst hj
      rw [if_pos rfl]
      exact field_of_lt m (j % 64) (A j) hAi cur hz
    · have hji : i < j := by omega
      have := hr j hji h2
      rw [rowOf_eq _ _ _ _ _ _ hALL] at this
      by_cases hs : i / 64 = j / 64
      · rw [if_pos hs] at this ⊢
        rw [← this]
        apply field_congr; intro q hq1 hq2
        have hlt : i % 64 < j % 64 := by omega
        have hle : m * (i % 64 + 1) ≤ m * (j % 64) := Nat.mul_le_mul_left _ (by omega)
        rw [testBit_lor', shl_testBit_high (A i) (i % 64) m q hAi (by omega)]; simp
      · rw [if_neg hs] at this ⊢; exact this
  · rw [show Nat.pred i = i - 1 from rfl, hm] at hq
    have hq' : q < m * (i % 64) := by
      have : i % 64 - 1 + 1 = i % 64 := by omega
      rw [this] at hq; exact hq
    rw [testBit_lor', shl_testBit_low (A i) (i % 64) m q hq',
      hz q (by have : m * (i % 64) ≤ m * (i % 64 + 1) := Nat.mul_le_mul_left _ (by omega); omega)]
    rfl

/-- closing a block at `i % 64 = 0` -/
theorem rowInv_block (m ALL1 i cur : ℕ) (done : List ℕ) (A : ℕ → ℕ) (hALL : ALL1 = 2 ^ m - 1) (hAi : A i < 2 ^ m)
    (hi : Nat.beq (Nat.land i 63) 0 = true) (hi1 : 1 ≤ i) (h : RowInv m ALL1 i cur done A) :
    RowInv m ALL1 (Nat.pred i) 0 (Nat.lor cur (Nat.shiftLeft (A i) (Nat.mul m (Nat.land i 63))) :: done) A := by
  have e3 : Nat.land i 63 = i % 64 := by rw [show (63 : ℕ) = 2 ^ 6 - 1 by norm_num, land_mask]; norm_num
  rw [e3] at hi ⊢
  have hi0 : i % 64 = 0 := Nat.eq_of_beq_eq_true hi
  have hb : (i - 1) / 64 = i / 64 - 1 := by omega
  have hb1 : 1 ≤ i / 64 := by omega
  obtain ⟨hr, hz⟩ := h
  refine ⟨fun j h1 h2 => ?_, fun q _ => Nat.zero_testBit q⟩
  rw [Nat.pred_eq_sub_one] at h1
  rw [rowOf_eq _ _ _ _ _ _ hALL, show Nat.pred i = i - 1 from rfl, hb]
  have hne : ¬ (i / 64 - 1 = j / 64) := by omega
  rw [if_neg hne]
  have hidx : j / 64 - (i / 64 - 1) - 1 = j / 64 - i / 64 := by omega
  rw [hidx]
  by_cases hs : j / 64 = i / 64
  · rw [hs, Nat.sub_self, List.getD_cons_zero]
    by_cases hj : j = i
    · subst hj
      have hz0 : ∀ q < m * (0 + 1), cur.testBit q = false := fun q hq => hz q (by rw [hi0]; exact hq)
      have := field_of_lt m 0 (A j) hAi cur hz0
      rw [hi0]; exact this
    · have hji : i < j := by omega
      have := hr j hji h2
      rw [rowOf_eq _ _ _ _ _ _ hALL, if_pos hs.symm] at this
      rw [← this]
      apply field_congr; intro q hq1 hq2
      have hlt : i % 64 < j % 64 := by omega
      have hle : m * (i % 64 + 1) ≤ m * (j % 64) := Nat.mul_le_mul_left _ (by omega)
      rw [testBit_lor', shl_testBit_high (A i) (i % 64) m q hAi (by omega)]; simp
  · have hgt : i / 64 < j / 64 := by omega
    have hidx2 : j / 64 - i / 64 = (j / 64 - i / 64 - 1) + 1 := by omega
    rw [hidx2, List.getD_cons_succ]
    have hji : i < j := by omega
    have := hr j hji h2
    rw [rowOf_eq _ _ _ _ _ _ hALL, if_neg (by omega)] at this
    exact this

/-! ## the walks of phase C -/

theorem coresOK_mem (o : Orb2) (need : ℕ) (p : Packs) (okb okc : ℕ) :
    ∀ (ks : List ℕ) (cs : List CoreCert), coresOK o need p okb okc ks cs = true →
      ∀ k ∈ ks, ∃ c, core1 o need okb okc (memTerm p k) c = true
  | [], [], _, k, hk => by simp at hk
  | [], _ :: _, h, _, _ => by simp [coresOK] at h
  | _ :: _, [], h, _, _ => by simp [coresOK] at h
  | k' :: ks, c :: cs, h, k, hk => by
    have h' : (core1 o need okb okc (memTerm p k') c && coresOK o need p okb okc ks cs) = true := h
    rw [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hk with rfl | hk2
    · exact ⟨c, h'.1⟩
    · exact coresOK_mem o need p okb okc ks cs h'.2 k hk2

theorem edgesOK_mem (o : Orb2) (need : ℕ) (p : Packs) (i a1 ALL1 cur : ℕ) (done : List ℕ) (okb okc : ℕ) :
    ∀ (js : List ℕ) (es : List EdgeRec), edgesOK o need p i a1 ALL1 cur done okb okc js es = true →
      ∀ j ∈ js, ∃ ks cs, listChk1 ks (Nat.land a1 (Nat.land (G.V2.rowOf p.m ALL1 i j cur done)
          (Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ j)) 1)))) = true ∧
        coresOK o need p (Nat.land okb (okB o.r1 (memTerm p j))) (Nat.land okc (okC o.r1 (memTerm p j))) ks cs = true
  | [], [], _, j, hj => by simp at hj
  | [], _ :: _, h, _, _ => by simp [edgesOK] at h
  | _ :: _, [], h, _, _ => by simp [edgesOK] at h
  | j' :: js, (ks, cs) :: es, h, j, hj => by
    have h' : (listChk1 ks (Nat.land a1 (Nat.land (G.V2.rowOf p.m ALL1 i j' cur done)
        (Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ j')) 1)))) &&
        coresOK o need p (Nat.land okb (okB o.r1 (memTerm p j'))) (Nat.land okc (okC o.r1 (memTerm p j'))) ks cs &&
        edgesOK o need p i a1 ALL1 cur done okb okc js es) = true := h
    simp only [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hj with rfl | hj2
    · exact ⟨ks, cs, h'.1.1, h'.1.2⟩
    · exact edgesOK_mem o need p i a1 ALL1 cur done okb okc js es h'.2 j hj2

theorem edges2OK_mem (o : Orb2) (need : ℕ) (p : Packs) (okb okc : ℕ) :
    ∀ (js : List ℕ) (cs : List CoreCert), edges2OK o need p okb okc js cs = true →
      ∀ j ∈ js, ∃ c, core1 o need okb okc (memTerm p j) c = true
  | [], [], _, j, hj => by simp at hj
  | [], _ :: _, h, _, _ => by simp [edges2OK] at h
  | _ :: _, [], h, _, _ => by simp [edges2OK] at h
  | j' :: js, c :: cs, h, j, hj => by
    have h' : (core1 o need okb okc (memTerm p j') c && edges2OK o need p okb okc js cs) = true := h
    rw [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hj with rfl | hj2
    · exact ⟨c, h'.1⟩
    · exact edges2OK_mem o need p okb okc js cs h'.2 j hj2

theorem above_bit (m ALL1 i j : ℕ) (hALL : ALL1 = 2 ^ m - 1) (hi : i < m) :
    (Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ i)) 1)).testBit j = (decide (j < m) && decide (i < j)) := by
  rw [testBit_xor', hALL, shiftLeft_one, show Nat.sub (2 ^ Nat.succ i) 1 = 2 ^ (i + 1) - 1 from rfl,
    Nat.testBit_two_pow_sub_one, Nat.testBit_two_pow_sub_one]
  by_cases h1 : j < m <;> by_cases h2 : j < i + 1 <;> simp [h1, h2] <;> omega

/-- the computed adjacency row of member `j` -/
abbrev arow (p : Packs) (R : ℕ) (CM : List ℕ) (j : ℕ) : ℕ := compactL CM 0 (adj32 p R (memTerm p j))

/-- **triangles**: `phaseC3` refutes the core of every triangle of the adjacency rows -/
theorem phaseC3_spec (o : Orb2) (need : ℕ) (p : Packs) (okb0 okc0 R ALL1 : ℕ) (CM : List ℕ)
    (hALL : ALL1 = 2 ^ p.m - 1) (hrow : ∀ j, arow p R CM j < 2 ^ p.m) :
    ∀ (recs : List MemRec) (i cur : ℕ) (done : List ℕ), recs.length = i + 1 → i < p.m →
      RowInv p.m ALL1 i cur done (arow p R CM) →
      phaseC3 o need p okb0 okc0 R ALL1 CM i recs cur done = true →
      ∀ i' j' k', i' ≤ i → i' < j' → j' < k' → k' < p.m →
        (arow p R CM i').testBit j' = true → (arow p R CM i').testBit k' = true → (arow p R CM j').testBit k' = true →
        ∃ cert, coreOK o.r1 need
          (Nat.land (Nat.land (Nat.land okb0 (okB o.r1 (memTerm p i'))) (okB o.r1 (memTerm p j'))) (okB o.r1 (memTerm p k')))
          (Nat.land (Nat.land (Nat.land okc0 (okC o.r1 (memTerm p i'))) (okC o.r1 (memTerm p j'))) (okC o.r1 (memTerm p k')))
          cert = true
  | [], i, _, _, hl, _, _, _ => by simp at hl
  | (up, es) :: recs, i, cur, done, hl, hi, hinv, h => by
    intro i' j' k' hi' hij hjk hk hA1 hA2 hA3
    have h' : (listChk1 up (Nat.land (arow p R CM i) (Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ i)) 1))) &&
        edgesOK o need p i (arow p R CM i) ALL1 cur done (Nat.land okb0 (okB o.r1 (memTerm p i)))
          (Nat.land okc0 (okC o.r1 (memTerm p i))) up es &&
        cond (Nat.beq (Nat.land i 63) 0)
          (phaseC3 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs 0
            (Nat.lor cur (Nat.shiftLeft (arow p R CM i) (Nat.mul p.m (Nat.land i 63))) :: done))
          (phaseC3 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs
            (Nat.lor cur (Nat.shiftLeft (arow p R CM i) (Nat.mul p.m (Nat.land i 63)))) done)) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨hup, hedges⟩, hrec⟩ := h'
    by_cases hii : i' = i
    · subst hii
      obtain ⟨-, hupm⟩ := listChk1_spec up _ hup
      have hj'up : j' ∈ up := by
        apply (hupm j').mp
        rw [testBit_land', hA1, above_bit _ _ _ _ hALL hi]; simp; omega
      obtain ⟨ks, cs, hks, hcores⟩ := edgesOK_mem o need p i' _ ALL1 cur done _ _ up es hedges j' hj'up
      obtain ⟨-, hksm⟩ := listChk1_spec ks _ hks
      have hk'ks : k' ∈ ks := by
        apply (hksm k').mp
        rw [testBit_land', testBit_land', hA2, hinv.1 j' hij (by omega), hA3, above_bit _ _ _ _ hALL (by omega)]; simp; omega
      obtain ⟨c, hc⟩ := coresOK_mem o need p _ _ ks cs hcores k' hk'ks
      exact ⟨c, hc⟩
    · have hlt : i' < i := by omega
      have hi1 : 1 ≤ i := by omega
      have hl' : recs.length = Nat.pred i + 1 := by
        rw [Nat.pred_eq_sub_one]; simp at hl; omega
      have hi'' : i' ≤ Nat.pred i := by rw [Nat.pred_eq_sub_one]; omega
      cases hb : Nat.beq (Nat.land i 63) 0
      · rw [hb] at hrec
        exact phaseC3_spec o need p okb0 okc0 R ALL1 CM hALL hrow recs (Nat.pred i) _ done hl' (by rw [Nat.pred_eq_sub_one]; omega)
          (rowInv_step p.m ALL1 i cur done _ hALL (hrow i) hb hinv) hrec i' j' k' hi'' hij hjk hk hA1 hA2 hA3
      · rw [hb] at hrec
        exact phaseC3_spec o need p okb0 okc0 R ALL1 CM hALL hrow recs (Nat.pred i) 0 _ hl' (by rw [Nat.pred_eq_sub_one]; omega)
          (rowInv_block p.m ALL1 i cur done _ hALL (hrow i) hb hi1 hinv) hrec i' j' k' hi'' hij hjk hk hA1 hA2 hA3

/-- **edges**: `phaseC2` refutes the core of every edge of the adjacency rows -/
theorem phaseC2_spec (o : Orb2) (need : ℕ) (p : Packs) (okb0 okc0 R ALL1 : ℕ) (CM : List ℕ)
    (hALL : ALL1 = 2 ^ p.m - 1) :
    ∀ (recs : List (List ℕ × List CoreCert)) (i : ℕ), recs.length = i + 1 → i < p.m →
      phaseC2 o need p okb0 okc0 R ALL1 CM i recs = true →
      ∀ i' j', i' ≤ i → i' < j' → j' < p.m → (arow p R CM i').testBit j' = true →
        ∃ cert, coreOK o.r1 need (Nat.land (Nat.land okb0 (okB o.r1 (memTerm p i'))) (okB o.r1 (memTerm p j')))
          (Nat.land (Nat.land okc0 (okC o.r1 (memTerm p i'))) (okC o.r1 (memTerm p j'))) cert = true
  | [], i, hl, _, _ => by simp at hl
  | (up, cs) :: recs, i, hl, hi, h => by
    intro i' j' hi' hij hj hA
    have h' : (listChk1 up (Nat.land (arow p R CM i) (Nat.xor ALL1 (Nat.sub (Nat.shiftLeft 1 (Nat.succ i)) 1))) &&
        edges2OK o need p (Nat.land okb0 (okB o.r1 (memTerm p i))) (Nat.land okc0 (okC o.r1 (memTerm p i))) up cs &&
        phaseC2 o need p okb0 okc0 R ALL1 CM (Nat.pred i) recs) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨hup, hedges⟩, hrec⟩ := h'
    by_cases hii : i' = i
    · subst hii
      obtain ⟨-, hupm⟩ := listChk1_spec up _ hup
      have hj'up : j' ∈ up := by
        apply (hupm j').mp
        rw [testBit_land', hA, above_bit _ _ _ _ hALL hi]; simp; omega
      obtain ⟨c, hc⟩ := edges2OK_mem o need p _ _ up cs hedges j' hj'up
      exact ⟨c, hc⟩
    · have hl' : recs.length = Nat.pred i + 1 := by
        rw [Nat.pred_eq_sub_one]; simp at hl; omega
      have hi'' : i' ≤ Nat.pred i := by rw [Nat.pred_eq_sub_one]; omega
      exact phaseC2_spec o need p okb0 okc0 R ALL1 CM hALL recs (Nat.pred i) hl' (by rw [Nat.pred_eq_sub_one]; omega) hrec i' j' hi'' hij hj hA

end GS.V

#print axioms GS.V.adj32_bit
#print axioms GS.V.phaseC3_spec
#print axioms GS.V.phaseC2_spec
