module
public import R22Port.U_d41d8cd98f00
public import E1G.Pk
public import E1G.Check
/-! # E1's packed vectors: 127 label fields of 128 bits

`V a` (forward, field `l` at `128 l`) and `VR a` (reversed, field `l` at `128 (126 - l)`).  The checker's primitives
are fieldwise maps or sums on them: `fld_V`, `spread_V`, `fmask_V`, the masks (`and_fmask`, `and_nfmask`, `and_hif`),
`fsum_V`, `dot_VR_V` and `deficit_eq` (no carries when the fields are small). -/
@[expose] public section
namespace E1GS
open Finset

abbrev V (a : ℕ → ℕ) : ℕ := pk 128 a 127
abbrev VR (a : ℕ → ℕ) : ℕ := pk 128 (fun j => a (126 - j)) 127

theorem FM_eq : E1G.FM = 2 ^ 128 - 1 := by decide
theorem M64_eq : E1G.M64 = 2 ^ 64 - 1 := by decide
theorem M127_eq : E1G.M127 = 2 ^ 127 - 1 := by decide
theorem SC_eq : E1G.SC = 2 ^ 30 := by decide

theorem ite_lt (c : Prop) [Decidable c] (x y K : ℕ) (hx : x < K) (hy : y < K) : (if c then x else y) < K := by
  split <;> assumption
theorem tb1 (i : ℕ) : Nat.testBit 1 i = decide (i = 0) := by
  by_cases h : i = 0
  · subst h; rfl
  · have : Nat.testBit 1 i ≠ true := fun h' => h (Nat.testBit_one_eq_true_iff_self_eq_zero.mp h')
    simp only [ne_eq, Bool.not_eq_true] at this
    simp [h, this]

theorem rd_eq (k S : ℕ) : E1G.rd k S = S % 2 ^ k := by
  show Nat.land S (Nat.sub (Nat.shiftLeft 1 k) 1) = _
  rw [show Nat.shiftLeft 1 k = 2 ^ k from Nat.one_shiftLeft k]
  exact Nat.and_two_pow_sub_one_eq_mod S k
theorem sk_eq (k S : ℕ) : E1G.sk k S = S / 2 ^ k := Nat.shiftRight_eq_div_pow S k

theorem REP_eq : ECT.REP = pk 128 (fun _ => 1) 128 := by
  rw [← pkL_eq]; decide +kernel
theorem SPM_eq : ECT.SPM = pk 127 (fun _ => 1) 128 := by
  rw [← pkL_eq]; decide +kernel
theorem FMALL_eq : ECT.FMALL = pk 128 (fun _ => 2 ^ 128 - 1) 128 := by
  rw [← pkL_eq]; decide +kernel
theorem DSCREP_eq : ECT.DSCREP = pk 128 (fun _ => 2 ^ 30 + 2 ^ 64) 128 := by
  rw [← pkL_eq]; decide +kernel

/-- a 127-field packing as a 128-field packing -/
theorem V_ext (a : ℕ → ℕ) : V a = pk 128 (fun l => if l < 127 then a l else 0) 128 := by
  rw [pk_succ, if_neg (by omega), zero_mul, Nat.add_zero]
  apply pk_congr; intro v hv; rw [if_pos hv]

theorem dig_eq_fld (v l : ℕ) : E1G.fld v l = dig 128 v l := by
  show (v >>> (128 * l)) &&& E1G.FM = _
  rw [FM_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]; rfl

theorem fld_V (a : ℕ → ℕ) (h : ∀ l < 127, a l < 2 ^ 128) (l : ℕ) (hl : l < 127) : E1G.fld (V a) l = a l := by
  rw [dig_eq_fld]; exact dig_pk 128 a 127 h l hl

theorem fld_VR (a : ℕ → ℕ) (h : ∀ l < 127, a l < 2 ^ 128) (l : ℕ) (hl : l < 127) :
    E1G.fld (VR a) (126 - l) = a l := by
  rw [dig_eq_fld, dig_pk 128 _ 127 (fun j hj => h _ (by omega)) _ (by omega), show 126 - (126 - l) = l by omega]

theorem V_lt (a : ℕ → ℕ) (h : ∀ l < 127, a l < 2 ^ 128) : V a < 2 ^ (128 * 127) := pk_lt 128 a 127 h

/-! ## Units -/

theorem one_V (l : ℕ) (hl : l < 127) : E1G.one l = V (fun j => if j = l then 1 else 0) := by
  show (1 : ℕ) <<< (128 * l) = pk 128 _ 127
  rw [Nat.one_shiftLeft]
  unfold pk
  rw [Finset.sum_eq_single l]
  · simp
  · intro j _ hj; simp [hj]
  · intro h; exact absurd (Finset.mem_range.mpr hl) h

theorem oner_VR (l : ℕ) (hl : l < 127) : E1G.oner l = VR (fun j => if j = l then 1 else 0) := by
  show (1 : ℕ) <<< (128 * (126 - l)) = pk 128 _ 127
  rw [Nat.one_shiftLeft]
  unfold pk
  rw [Finset.sum_eq_single (126 - l)]
  · simp only [show 126 - (126 - l) = l by omega, if_true, one_mul]
  · intro j hj hj'; rw [Finset.mem_range] at hj
    show (if 126 - j = l then 1 else 0) * 2 ^ (128 * j) = 0
    rw [if_neg (by omega), zero_mul]
  · intro h; exact absurd (Finset.mem_range.mpr (by omega)) h

theorem V_add (a b : ℕ → ℕ) : V a + V b = V (fun l => a l + b l) := pk_add' 128 a b 127
theorem VR_add (a b : ℕ → ℕ) : VR a + VR b = VR (fun l => a l + b l) := pk_add' 128 _ _ 127
theorem V_sub (a b : ℕ → ℕ) (h : ∀ l < 127, b l ≤ a l) : V a - V b = V (fun l => a l - b l) := pk_sub 128 a b 127 h
theorem VR_sub (a b : ℕ → ℕ) (h : ∀ l < 127, b l ≤ a l) : VR a - VR b = VR (fun l => a l - b l) :=
  pk_sub 128 _ _ 127 (fun l hl => h _ (by omega))
theorem V_mul (a : ℕ → ℕ) (c : ℕ) : V a * c = V (fun l => a l * c) := (pk_mul_const 128 c a 127).symm
theorem VR_mul (a : ℕ → ℕ) (c : ℕ) : VR a * c = VR (fun l => a l * c) := (pk_mul_const 128 c _ 127).symm
theorem V_zero : V (fun _ => 0) = 0 := pk_zero 128 127
theorem VR_zero : VR (fun _ => 0) = 0 := pk_zero 128 127

theorem V_congr (a b : ℕ → ℕ) (h : ∀ l < 127, a l = b l) : V a = V b := pk_congr 128 a b 127 h
theorem VR_congr (a b : ℕ → ℕ) (h : ∀ l < 127, a l = b l) : VR a = VR b :=
  pk_congr 128 _ _ 127 (fun j hj => h _ (by omega))

theorem V_inj (a b : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (hb : ∀ l < 127, b l < 2 ^ 128) (h : V a = V b) :
    ∀ l < 127, a l = b l := pk_inj 128 a b 127 ha hb h

/-! ## Spread and masks -/

theorem testBit_SPMm (m : ℕ) (hm : m < 2 ^ 127) (p : ℕ) :
    (m * ECT.SPM).testBit p = (decide (p / 127 < 128) && m.testBit (p % 127)) := by
  rw [SPM_eq, mul_comm, ← pk_mul_const]
  rw [testBit_pk 127 (by norm_num) _ 128 (fun v _ => by simpa using hm)]
  simp

theorem testBit_REP (p : ℕ) : ECT.REP.testBit p = (decide (p / 128 < 128) && decide (p % 128 = 0)) := by
  rw [REP_eq, testBit_pk 128 (by norm_num) _ 128 (fun v _ => by norm_num)]
  rw [tb1]

theorem spread_V (m : ℕ) (hm : m < 2 ^ 127) : E1G.spread m = V (fun l => if m.testBit l then 1 else 0) := by
  show (m * ECT.SPM &&& ECT.REP) = _
  have hb : ∀ v < 127, (fun l => if m.testBit l then 1 else 0) v < 2 ^ 128 := fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_and, testBit_SPMm m hm, testBit_REP,
    testBit_pk 128 (by norm_num) _ 127 hb]
  by_cases h0 : p % 128 = 0
  · obtain ⟨l, rfl⟩ : ∃ l, p = 128 * l := ⟨p / 128, by omega⟩
    have e1 : 128 * l / 128 = l := by omega
    rw [e1]
    by_cases hl : l < 127
    · have e2 : 128 * l / 127 = l := by omega
      have e3 : 128 * l % 127 = l := by omega
      rw [e2, e3]
      cases hb' : m.testBit l <;> simp [hl, show l < 128 by omega, h0]
    · have hl' : l < 128 ∨ 128 ≤ l := by omega
      rcases hl' with hl' | hl'
      · have e2 : 128 * l / 127 = 128 := by omega
        simp [hl, e2]
      · simp [hl, show ¬ (l < 128) by omega]
  · have : (if m.testBit (p / 128) then 1 else 0 : ℕ).testBit (p % 128) = false := by
      split
      · rw [tb1]; simp [h0]
      · simp
    rw [this]; simp [h0]

theorem fmask_V (m : ℕ) (hm : m < 2 ^ 127) : E1G.fmask m = V (fun l => if m.testBit l then 2 ^ 128 - 1 else 0) := by
  show Nat.mul (E1G.spread m) E1G.FM = _
  rw [spread_V m hm, FM_eq, show Nat.mul (V _) (2 ^ 128 - 1) = V _ * (2 ^ 128 - 1) from rfl, V_mul]
  apply V_congr; intro l _; dsimp only; split <;> simp

theorem and_full (x : ℕ) (hx : x < 2 ^ 128) : x &&& (2 ^ 128 - 1) = x := by
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.mod_eq_of_lt hx]

theorem and_fmask (a : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (m : ℕ) (hm : m < 2 ^ 127) :
    V a &&& E1G.fmask m = V (fun l => if m.testBit l then a l else 0) := by
  rw [fmask_V m hm, pk_and 128 (by norm_num) _ _ 127 ha (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
  apply V_congr; intro l hl; dsimp only
  split
  · exact and_full _ (ha l hl)
  · simp

theorem nfmask_eq (m : ℕ) (hm : m < 2 ^ 127) :
    ECT.FMALL ^^^ E1G.fmask m = pk 128 (fun l => if l < 127 ∧ m.testBit l then 0 else 2 ^ 128 - 1) 128 := by
  rw [fmask_V m hm, V_ext, FMALL_eq,
    pk_xor 128 (by norm_num) _ _ 128 (fun v _ => by norm_num)
      (fun v _ => ite_lt _ _ _ _ (ite_lt _ _ _ _ (by norm_num) (by norm_num)) (by norm_num))]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 127
  · by_cases h2 : m.testBit l
    · simp [h1, h2]
    · simp [h1, h2]
  · simp [h1]

theorem and_nfmask (a : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (m : ℕ) (hm : m < 2 ^ 127) :
    V a &&& (ECT.FMALL ^^^ E1G.fmask m) = V (fun l => if m.testBit l then 0 else a l) := by
  have ha' : ∀ v < 128, (fun l => if l < 127 then a l else 0) v < 2 ^ 128 := by
    intro v _; dsimp only; split
    · exact ha v (by assumption)
    · norm_num
  rw [nfmask_eq m hm, V_ext, pk_and 128 (by norm_num) _ _ 128 ha' (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)), V_ext]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 127
  · by_cases h2 : m.testBit l
    · simp [h1, h2]
    · simp only [h1, h2, if_true, and_false, if_false, Bool.false_eq_true]; exact and_full _ (ha l h1)
  · simp [h1]

theorem hif_eq (lo : ℕ) : E1G.hif lo = pk 128 (fun l => if lo ≤ l then 2 ^ 128 - 1 else 0) 128 := by
  show Nat.shiftLeft (Nat.shiftRight ECT.FMALL (Nat.mul 128 lo)) (Nat.mul 128 lo) = _
  apply Nat.eq_of_testBit_eq; intro p
  rw [show Nat.shiftLeft (Nat.shiftRight ECT.FMALL (Nat.mul 128 lo)) (Nat.mul 128 lo) =
    (ECT.FMALL >>> (128 * lo)) <<< (128 * lo) from rfl, Nat.testBit_shiftLeft, Nat.testBit_shiftRight, FMALL_eq,
    testBit_pk 128 (by norm_num) _ 128 (fun v _ => by norm_num),
    testBit_pk 128 (by norm_num) _ 128 (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
  by_cases h : 128 * lo ≤ p
  · have e1 : (128 * lo + (p - 128 * lo)) / 128 = p / 128 := by omega
    have e2 : (128 * lo + (p - 128 * lo)) % 128 = p % 128 := by omega
    rw [e1, e2]
    have h2 : lo ≤ p / 128 := by omega
    simp [h, h2]
  · have h2 : ¬ (lo ≤ p / 128) := by omega
    simp [h, h2]

theorem and_hif (a : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (lo : ℕ) :
    V a &&& E1G.hif lo = V (fun l => if lo ≤ l then a l else 0) := by
  have ha' : ∀ v < 128, (fun l => if l < 127 then a l else 0) v < 2 ^ 128 := by
    intro v _; dsimp only; split
    · exact ha v (by assumption)
    · norm_num
  rw [hif_eq, V_ext, pk_and 128 (by norm_num) _ _ 128 ha' (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)), V_ext]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 127
  · by_cases h2 : lo ≤ l
    · simp only [h1, h2, if_true]; exact and_full _ (ha l h1)
    · simp [h1, h2]
  · simp [h1]

/-! ## Sums and dot products -/

/-- one field of a product of packings, when every field of the convolution is small -/
theorem dig_mul (a b : ℕ → ℕ) (L1 L2 m0 : ℕ) (hm0 : m0 < L1 + L2)
    (hc : ∀ m < L1 + L2, ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0) < 2 ^ 128) :
    dig 128 (pk 128 a L1 * pk 128 b L2) m0 = ∑ l ∈ range L1, (if l ≤ m0 ∧ m0 - l < L2 then a l * b (m0 - l) else 0) := by
  rw [pk_mul_pk]; exact dig_pk 128 _ (L1 + L2) hc m0 hm0

theorem conv_le (a b : ℕ → ℕ) (L1 L2 A Bm m : ℕ) (ha : ∀ l < L1, a l ≤ A) (hb : ∀ l < L2, b l ≤ Bm) :
    ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0) ≤ L1 * (A * Bm) := by
  calc ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0)
      ≤ ∑ l ∈ range L1, A * Bm := by
        apply Finset.sum_le_sum; intro l hl; rw [Finset.mem_range] at hl
        split
        · exact Nat.mul_le_mul (ha l hl) (hb _ (by omega))
        · exact Nat.zero_le _
    _ = L1 * (A * Bm) := by rw [Finset.sum_const, Finset.card_range, smul_eq_mul]

/-- a packing is congruent to the sum of its fields modulo `2^128 - 1` -/
theorem pk_modEq (a : ℕ → ℕ) (L : ℕ) : pk 128 a L ≡ ∑ l ∈ range L, a l [MOD 2 ^ 128 - 1] := by
  induction L with
  | zero => simp only [pk, Finset.range_zero, Finset.sum_empty]; exact Nat.ModEq.refl 0
  | succ L ih =>
    rw [pk_succ, Finset.sum_range_succ]
    have h0 : 2 ^ 128 ≡ 1 [MOD 2 ^ 128 - 1] := by unfold Nat.ModEq; norm_num
    have h1 : 2 ^ (128 * L) ≡ 1 [MOD 2 ^ 128 - 1] := by rw [pow_mul]; simpa using h0.pow L
    exact ih.add (by simpa using h1.mul_left (a L))

theorem fsum_V (a : ℕ → ℕ) (A : ℕ) (ha : ∀ l < 127, a l ≤ A) (hA : 127 * A < 2 ^ 128 - 1) :
    E1G.fsum (V a) = ∑ l ∈ range 127, a l := by
  show pk 128 a 127 % E1G.FM = _
  have hs : ∑ l ∈ range 127, a l < 2 ^ 128 - 1 :=
    calc ∑ l ∈ range 127, a l ≤ ∑ _l ∈ range 127, A := Finset.sum_le_sum (fun l hl => ha l (Finset.mem_range.mp hl))
      _ = 127 * A := by simp
      _ < _ := hA
  have h := pk_modEq a 127
  unfold Nat.ModEq at h
  rw [FM_eq, h, Nat.mod_eq_of_lt hs]

theorem dot_VR_V (a b : ℕ → ℕ) (A Bm : ℕ) (ha : ∀ l < 127, a l ≤ A) (hb : ∀ l < 127, b l ≤ Bm)
    (hAB : 127 * (A * Bm) < 2 ^ 128) : E1G.dot (VR a) (V b) = ∑ l ∈ range 127, a l * b l := by
  show Nat.land (Nat.shiftRight (Nat.mul (VR a) (V b)) 16128) E1G.FM = _
  rw [show Nat.land (Nat.shiftRight (Nat.mul (VR a) (V b)) 16128) E1G.FM = E1G.fld (VR a * V b) 126 from rfl,
    dig_eq_fld, dig_mul _ b 127 127 126 (by norm_num)]
  · have e1 : ∑ l ∈ range 127, (if l ≤ 126 ∧ 126 - l < 127 then (fun j => a (126 - j)) l * b (126 - l) else 0)
        = ∑ l ∈ range 127, (fun i => a i * b i) (127 - 1 - l) := by
      apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
      rw [if_pos (by omega), show 127 - 1 - l = 126 - l by omega]
    rw [e1]; exact Finset.sum_range_reflect (fun i => a i * b i) 127
  · intro m _
    exact lt_of_le_of_lt (conv_le _ b 127 127 A Bm m (fun l hl => ha _ (by omega)) hb) hAB

theorem dot_VR_pk (a x : ℕ → ℕ) (A Bm : ℕ) (ha : ∀ l < 127, a l ≤ A) (hx : ∀ l < 128, x l ≤ Bm)
    (hAB : 127 * (A * Bm) < 2 ^ 128) : E1G.dot (VR a) (pk 128 x 128) = ∑ l ∈ range 127, a l * x l := by
  show Nat.land (Nat.shiftRight (Nat.mul (VR a) (pk 128 x 128)) 16128) E1G.FM = _
  rw [show Nat.land (Nat.shiftRight (Nat.mul (VR a) (pk 128 x 128)) 16128) E1G.FM = E1G.fld (VR a * pk 128 x 128) 126 from rfl,
    dig_eq_fld, dig_mul _ x 127 128 126 (by norm_num)]
  · have e1 : ∑ l ∈ range 127, (if l ≤ 126 ∧ 126 - l < 128 then (fun j => a (126 - j)) l * x (126 - l) else 0)
        = ∑ l ∈ range 127, (fun i => a i * x i) (127 - 1 - l) := by
      apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
      rw [if_pos (by omega), show 127 - 1 - l = 126 - l by omega]
    rw [e1]; exact Finset.sum_range_reflect (fun i => a i * x i) 127
  · intro m _
    exact lt_of_le_of_lt (conv_le _ x 127 128 A Bm m (fun l hl => ha _ (by omega)) hx) hAB

/-! ## Reversed masks -/

theorem and_nfmask_R (a : ℕ → ℕ) (ha : ∀ l < 127, a l < 2 ^ 128) (m mr : ℕ) (hm : m < 2 ^ 127) (hmr : mr < 2 ^ 127)
    (hrev : ∀ j < 127, mr.testBit j = m.testBit (126 - j)) :
    VR a &&& (ECT.FMALL ^^^ E1G.fmask mr) = VR (fun l => if m.testBit l then 0 else a l) := by
  rw [show VR a = V (fun j => a (126 - j)) from rfl, and_nfmask _ (fun l hl => ha _ (by omega)) mr hmr]
  apply V_congr; intro j hj
  rw [hrev j hj]

/-! ## The deficit `∑_{l ≥ lo} u_l (SC - t_l)⁺` -/

theorem testBit64 (x : ℕ) (hx : x < 2 ^ 65) : x.testBit 64 = decide (2 ^ 64 ≤ x) := by
  rw [Nat.testBit_eq_decide_div_mod_eq]
  have h2 : x / 2 ^ 64 < 2 := by
    rw [Nat.div_lt_iff_lt_mul (by positivity)]; calc x < 2 ^ 65 := hx
      _ = 2 * 2 ^ 64 := by norm_num
  by_cases h : 2 ^ 64 ≤ x
  · have : x / 2 ^ 64 = 1 := by
      have h1 : 1 ≤ x / 2 ^ 64 := (Nat.le_div_iff_mul_le (by positivity)).mpr (by simpa using h)
      omega
    rw [this, decide_eq_true h]; rfl
  · have : x / 2 ^ 64 = 0 := Nat.div_eq_of_lt (by omega)
    rw [this, decide_eq_false h]; rfl

theorem deficit_eq (t u : ℕ → ℕ) (U : ℕ) (ht : ∀ l < 127, t l < 2 ^ 64) (hu : ∀ l < 127, u l ≤ U)
    (hU : 127 * (U * 2 ^ 30) < 2 ^ 128) (lo : ℕ) :
    E1G.deficit (V t) (VR u) lo = ∑ l ∈ range 127, (if lo ≤ l then u l * (2 ^ 30 - t l) else 0) := by
  -- the fields of `D = DSCREP - T`
  set t' : ℕ → ℕ := fun l => if l < 127 then t l else 0 with ht'
  have ht'b : ∀ l, t' l < 2 ^ 64 := by
    intro l; simp only [ht']; split
    · exact ht l (by assumption)
    · norm_num
  set dd : ℕ → ℕ := fun l => 2 ^ 30 + 2 ^ 64 - t' l with hdd
  have hddb : ∀ l, dd l < 2 ^ 65 := by intro l; simp only [hdd]; have := ht'b l; omega
  have hD : ECT.DSCREP - V t = pk 128 dd 128 := by
    rw [DSCREP_eq, V_ext, pk_sub 128 _ _ 128 (fun l _ => by
      show (if l < 127 then t l else 0) ≤ 2 ^ 30 + 2 ^ 64
      split
      · next h => have := ht l h; omega
      · omega)]
  -- `G`: bit 64 of every field, i.e. `t_l ≤ SC`
  set g : ℕ → ℕ := fun l => if t' l ≤ 2 ^ 30 then 1 else 0 with hg
  have hG : (pk 128 dd 128 >>> 64) &&& ECT.REP = pk 128 g 128 := by
    apply Nat.eq_of_testBit_eq; intro p
    rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_REP,
      testBit_pk 128 (by norm_num) dd 128 (fun l _ => lt_trans (hddb l) (by norm_num)),
      testBit_pk 128 (by norm_num) g 128 (fun l _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
    by_cases h0 : p % 128 = 0
    · obtain ⟨l, rfl⟩ : ∃ l, p = 128 * l := ⟨p / 128, by omega⟩
      have e1 : (64 + 128 * l) / 128 = l := by omega
      have e2 : (64 + 128 * l) % 128 = 64 := by omega
      have e3 : 128 * l / 128 = l := by omega
      rw [e1, e2, e3, testBit64 _ (hddb l)]
      by_cases hl : l < 128
      · have h0' : 128 * l % 128 = 0 := by omega
        rw [h0']
        by_cases hc : t' l ≤ 2 ^ 30
        · have h1 : 2 ^ 64 ≤ dd l := by simp only [hdd]; omega
          have h2 : g l = 1 := by simp only [hg]; rw [if_pos hc]
          rw [h2, decide_eq_true h1, tb1]; simp [hl]
        · have h1 : ¬ (2 ^ 64 ≤ dd l) := by simp only [hdd]; omega
          have h2 : g l = 0 := by simp only [hg]; rw [if_neg hc]
          rw [h2, decide_eq_false h1]; simp [hl]
      · simp [hl]
    · have : (g (p / 128)).testBit (p % 128) = false := by
        simp only [hg]; split
        · rw [tb1]; simp [h0]
        · simp
      rw [this]; simp [h0]
  -- the masked deficit vector
  have hX : (pk 128 dd 128 &&& (pk 128 g 128 * E1G.M64)) &&& E1G.hif lo =
      pk 128 (fun l => if lo ≤ l then 2 ^ 30 - t' l else 0) 128 := by
    rw [M64_eq, ← pk_mul_const, pk_and 128 (by norm_num) _ _ 128 (fun l _ => lt_trans (hddb l) (by norm_num))
      (fun l _ => by simp only [hg]; split <;> norm_num), hif_eq,
      pk_and 128 (by norm_num) _ _ 128 (fun l _ => lt_of_le_of_lt Nat.and_le_left (lt_trans (hddb l) (by norm_num)))
      (fun l _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
    apply pk_congr; intro l _
    simp only [hg, hdd]
    by_cases h1 : lo ≤ l
    · rw [if_pos h1, if_pos h1]
      by_cases hc : t' l ≤ 2 ^ 30
      · rw [if_pos hc, one_mul]
        have e : 2 ^ 30 + 2 ^ 64 - t' l = (2 ^ 30 - t' l) + 2 ^ 64 * 1 := by omega
        have e' : (2 ^ 30 + 2 ^ 64 - t' l) &&& (2 ^ 64 - 1) = 2 ^ 30 - t' l := by
          rw [Nat.and_two_pow_sub_one_eq_mod, e, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (by omega)]
        rw [e', and_full _ (by omega)]
      · rw [if_neg hc, zero_mul, Nat.and_zero, Nat.zero_and, show 2 ^ 30 - t' l = 0 by omega]
    · rw [if_neg h1, if_neg h1, Nat.and_zero]
  show E1G.dot (VR u) (Nat.land (Nat.land (Nat.sub ECT.DSCREP (V t))
    (Nat.mul (Nat.land (Nat.shiftRight (Nat.sub ECT.DSCREP (V t)) 64) ECT.REP) E1G.M64)) (E1G.hif lo)) = _
  rw [show Nat.sub ECT.DSCREP (V t) = ECT.DSCREP - V t from rfl, hD,
    show Nat.land (Nat.land (pk 128 dd 128) (Nat.mul (Nat.land (Nat.shiftRight (pk 128 dd 128) 64) ECT.REP) E1G.M64)) (E1G.hif lo)
      = (pk 128 dd 128 &&& ((pk 128 dd 128 >>> 64) &&& ECT.REP) * E1G.M64) &&& E1G.hif lo from rfl, hG, hX,
    dot_VR_pk u _ U (2 ^ 30) hu (fun l _ => by split <;> omega) hU]
  apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
  simp only [ht', if_pos hl]
  split <;> simp

end E1GS
