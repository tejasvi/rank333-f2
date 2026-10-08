module
public import R22Port.U_d41d8cd98f00
public import E1P.Pk
public import E1P.Check
/-! # E1's packed vectors: 255 label fields of 256 bits

`V a` (forward, field `l` at `256 l`) and `VR a` (reversed, field `l` at `256 (254 - l)`).  The checker's primitives
are fieldwise maps or sums on them: `fld_V`, `spread_V`, `fmask_V`, the masks (`and_fmask`, `and_nfmask`, `and_hif`),
`fsum_V`, `dot_VR_V` and `deficit_eq` (no carries when the fields are small). -/
@[expose] public section
namespace E1PS
open Finset

abbrev V (a : ℕ → ℕ) : ℕ := pk 256 a 255
abbrev VR (a : ℕ → ℕ) : ℕ := pk 256 (fun j => a (254 - j)) 255

theorem FM_eq : E1P.FM = 2 ^ 256 - 1 := by decide
theorem M64_eq : E1P.M64 = 2 ^ 64 - 1 := by decide
theorem M255_eq : E1P.M255 = 2 ^ 255 - 1 := by decide
theorem SC_eq : E1P.SC = 2 ^ 30 := by decide

theorem ite_lt (c : Prop) [Decidable c] (x y K : ℕ) (hx : x < K) (hy : y < K) : (if c then x else y) < K := by
  split <;> assumption
theorem tb1 (i : ℕ) : Nat.testBit 1 i = decide (i = 0) := by
  by_cases h : i = 0
  · subst h; rfl
  · have : Nat.testBit 1 i ≠ true := fun h' => h (Nat.testBit_one_eq_true_iff_self_eq_zero.mp h')
    simp only [ne_eq, Bool.not_eq_true] at this
    simp [h, this]

theorem rd_eq (k S : ℕ) : E1P.rd k S = S % 2 ^ k := by
  show Nat.land S (Nat.sub (Nat.shiftLeft 1 k) 1) = _
  rw [show Nat.shiftLeft 1 k = 2 ^ k from Nat.one_shiftLeft k]
  exact Nat.and_two_pow_sub_one_eq_mod S k
theorem sk_eq (k S : ℕ) : E1P.sk k S = S / 2 ^ k := Nat.shiftRight_eq_div_pow S k

theorem REP_eq : ECTP.REP = pk 256 (fun _ => 1) 256 := by
  rw [← pkL_eq]; decide +kernel
theorem SPM_eq : ECTP.SPM = pk 255 (fun _ => 1) 256 := by
  rw [← pkL_eq]; decide +kernel
theorem FMALL_eq : ECTP.FMALL = pk 256 (fun _ => 2 ^ 256 - 1) 256 := by
  rw [← pkL_eq]; decide +kernel
theorem DSCREP_eq : ECTP.DSCREP = pk 256 (fun _ => 2 ^ 30 + 2 ^ 64) 256 := by
  rw [← pkL_eq]; decide +kernel

/-- a 255-field packing as a 256-field packing -/
theorem V_ext (a : ℕ → ℕ) : V a = pk 256 (fun l => if l < 255 then a l else 0) 256 := by
  rw [pk_succ, if_neg (by omega), zero_mul, Nat.add_zero]
  apply pk_congr; intro v hv; rw [if_pos hv]

theorem dig_eq_fld (v l : ℕ) : E1P.fld v l = dig 256 v l := by
  show (v >>> (256 * l)) &&& E1P.FM = _
  rw [FM_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]; rfl

theorem fld_V (a : ℕ → ℕ) (h : ∀ l < 255, a l < 2 ^ 256) (l : ℕ) (hl : l < 255) : E1P.fld (V a) l = a l := by
  rw [dig_eq_fld]; exact dig_pk 256 a 255 h l hl

theorem fld_VR (a : ℕ → ℕ) (h : ∀ l < 255, a l < 2 ^ 256) (l : ℕ) (hl : l < 255) :
    E1P.fld (VR a) (254 - l) = a l := by
  rw [dig_eq_fld, dig_pk 256 _ 255 (fun j hj => h _ (by omega)) _ (by omega), show 254 - (254 - l) = l by omega]

theorem V_lt (a : ℕ → ℕ) (h : ∀ l < 255, a l < 2 ^ 256) : V a < 2 ^ (256 * 255) := pk_lt 256 a 255 h

/-! ## Units -/

theorem one_V (l : ℕ) (hl : l < 255) : E1P.one l = V (fun j => if j = l then 1 else 0) := by
  show (1 : ℕ) <<< (256 * l) = pk 256 _ 255
  rw [Nat.one_shiftLeft]
  unfold pk
  rw [Finset.sum_eq_single l]
  · simp
  · intro j _ hj; simp [hj]
  · intro h; exact absurd (Finset.mem_range.mpr hl) h

theorem oner_VR (l : ℕ) (hl : l < 255) : E1P.oner l = VR (fun j => if j = l then 1 else 0) := by
  show (1 : ℕ) <<< (256 * (254 - l)) = pk 256 _ 255
  rw [Nat.one_shiftLeft]
  unfold pk
  rw [Finset.sum_eq_single (254 - l)]
  · simp only [show 254 - (254 - l) = l by omega, if_true, one_mul]
  · intro j hj hj'; rw [Finset.mem_range] at hj
    show (if 254 - j = l then 1 else 0) * 2 ^ (256 * j) = 0
    rw [if_neg (by omega), zero_mul]
  · intro h; exact absurd (Finset.mem_range.mpr (by omega)) h

theorem V_add (a b : ℕ → ℕ) : V a + V b = V (fun l => a l + b l) := pk_add' 256 a b 255
theorem VR_add (a b : ℕ → ℕ) : VR a + VR b = VR (fun l => a l + b l) := pk_add' 256 _ _ 255
theorem V_sub (a b : ℕ → ℕ) (h : ∀ l < 255, b l ≤ a l) : V a - V b = V (fun l => a l - b l) := pk_sub 256 a b 255 h
theorem VR_sub (a b : ℕ → ℕ) (h : ∀ l < 255, b l ≤ a l) : VR a - VR b = VR (fun l => a l - b l) :=
  pk_sub 256 _ _ 255 (fun l hl => h _ (by omega))
theorem V_mul (a : ℕ → ℕ) (c : ℕ) : V a * c = V (fun l => a l * c) := (pk_mul_const 256 c a 255).symm
theorem VR_mul (a : ℕ → ℕ) (c : ℕ) : VR a * c = VR (fun l => a l * c) := (pk_mul_const 256 c _ 255).symm
theorem V_zero : V (fun _ => 0) = 0 := pk_zero 256 255
theorem VR_zero : VR (fun _ => 0) = 0 := pk_zero 256 255

theorem V_congr (a b : ℕ → ℕ) (h : ∀ l < 255, a l = b l) : V a = V b := pk_congr 256 a b 255 h
theorem VR_congr (a b : ℕ → ℕ) (h : ∀ l < 255, a l = b l) : VR a = VR b :=
  pk_congr 256 _ _ 255 (fun j hj => h _ (by omega))

theorem V_inj (a b : ℕ → ℕ) (ha : ∀ l < 255, a l < 2 ^ 256) (hb : ∀ l < 255, b l < 2 ^ 256) (h : V a = V b) :
    ∀ l < 255, a l = b l := pk_inj 256 a b 255 ha hb h

/-! ## Spread and masks -/

theorem testBit_SPMm (m : ℕ) (hm : m < 2 ^ 255) (p : ℕ) :
    (m * ECTP.SPM).testBit p = (decide (p / 255 < 256) && m.testBit (p % 255)) := by
  rw [SPM_eq, mul_comm, ← pk_mul_const]
  rw [testBit_pk 255 (by norm_num) _ 256 (fun v _ => by simpa using hm)]
  simp

theorem testBit_REP (p : ℕ) : ECTP.REP.testBit p = (decide (p / 256 < 256) && decide (p % 256 = 0)) := by
  rw [REP_eq, testBit_pk 256 (by norm_num) _ 256 (fun v _ => by norm_num)]
  rw [tb1]

theorem spread_V (m : ℕ) (hm : m < 2 ^ 255) : E1P.spread m = V (fun l => if m.testBit l then 1 else 0) := by
  show (m * ECTP.SPM &&& ECTP.REP) = _
  have hb : ∀ v < 255, (fun l => if m.testBit l then 1 else 0) v < 2 ^ 256 := fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_and, testBit_SPMm m hm, testBit_REP,
    testBit_pk 256 (by norm_num) _ 255 hb]
  by_cases h0 : p % 256 = 0
  · obtain ⟨l, rfl⟩ : ∃ l, p = 256 * l := ⟨p / 256, by omega⟩
    have e1 : 256 * l / 256 = l := by omega
    rw [e1]
    by_cases hl : l < 255
    · have e2 : 256 * l / 255 = l := by omega
      have e3 : 256 * l % 255 = l := by omega
      rw [e2, e3]
      cases hb' : m.testBit l <;> simp [hl, show l < 256 by omega, h0]
    · have hl' : l < 256 ∨ 256 ≤ l := by omega
      rcases hl' with hl' | hl'
      · have e2 : 256 * l / 255 = 256 := by omega
        simp [hl, e2]
      · simp [hl, show ¬ (l < 256) by omega]
  · have : (if m.testBit (p / 256) then 1 else 0 : ℕ).testBit (p % 256) = false := by
      split
      · rw [tb1]; simp [h0]
      · simp
    rw [this]; simp [h0]

theorem fmask_V (m : ℕ) (hm : m < 2 ^ 255) : E1P.fmask m = V (fun l => if m.testBit l then 2 ^ 256 - 1 else 0) := by
  show Nat.mul (E1P.spread m) E1P.FM = _
  rw [spread_V m hm, FM_eq, show Nat.mul (V _) (2 ^ 256 - 1) = V _ * (2 ^ 256 - 1) from rfl, V_mul]
  apply V_congr; intro l _; dsimp only; split <;> simp

theorem and_full (x : ℕ) (hx : x < 2 ^ 256) : x &&& (2 ^ 256 - 1) = x := by
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.mod_eq_of_lt hx]

theorem and_fmask (a : ℕ → ℕ) (ha : ∀ l < 255, a l < 2 ^ 256) (m : ℕ) (hm : m < 2 ^ 255) :
    V a &&& E1P.fmask m = V (fun l => if m.testBit l then a l else 0) := by
  rw [fmask_V m hm, pk_and 256 (by norm_num) _ _ 255 ha (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
  apply V_congr; intro l hl; dsimp only
  split
  · exact and_full _ (ha l hl)
  · simp

theorem nfmask_eq (m : ℕ) (hm : m < 2 ^ 255) :
    ECTP.FMALL ^^^ E1P.fmask m = pk 256 (fun l => if l < 255 ∧ m.testBit l then 0 else 2 ^ 256 - 1) 256 := by
  rw [fmask_V m hm, V_ext, FMALL_eq,
    pk_xor 256 (by norm_num) _ _ 256 (fun v _ => by norm_num)
      (fun v _ => ite_lt _ _ _ _ (ite_lt _ _ _ _ (by norm_num) (by norm_num)) (by norm_num))]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 255
  · by_cases h2 : m.testBit l
    · simp [h1, h2]
    · simp [h1, h2]
  · simp [h1]

theorem and_nfmask (a : ℕ → ℕ) (ha : ∀ l < 255, a l < 2 ^ 256) (m : ℕ) (hm : m < 2 ^ 255) :
    V a &&& (ECTP.FMALL ^^^ E1P.fmask m) = V (fun l => if m.testBit l then 0 else a l) := by
  have ha' : ∀ v < 256, (fun l => if l < 255 then a l else 0) v < 2 ^ 256 := by
    intro v _; dsimp only; split
    · exact ha v (by assumption)
    · norm_num
  rw [nfmask_eq m hm, V_ext, pk_and 256 (by norm_num) _ _ 256 ha' (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)), V_ext]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 255
  · by_cases h2 : m.testBit l
    · simp [h1, h2]
    · simp only [h1, h2, if_true, and_false, if_false, Bool.false_eq_true]; exact and_full _ (ha l h1)
  · simp [h1]

theorem hif_eq (lo : ℕ) : E1P.hif lo = pk 256 (fun l => if lo ≤ l then 2 ^ 256 - 1 else 0) 256 := by
  show Nat.shiftLeft (Nat.shiftRight ECTP.FMALL (Nat.mul 256 lo)) (Nat.mul 256 lo) = _
  apply Nat.eq_of_testBit_eq; intro p
  rw [show Nat.shiftLeft (Nat.shiftRight ECTP.FMALL (Nat.mul 256 lo)) (Nat.mul 256 lo) =
    (ECTP.FMALL >>> (256 * lo)) <<< (256 * lo) from rfl, Nat.testBit_shiftLeft, Nat.testBit_shiftRight, FMALL_eq,
    testBit_pk 256 (by norm_num) _ 256 (fun v _ => by norm_num),
    testBit_pk 256 (by norm_num) _ 256 (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
  by_cases h : 256 * lo ≤ p
  · have e1 : (256 * lo + (p - 256 * lo)) / 256 = p / 256 := by omega
    have e2 : (256 * lo + (p - 256 * lo)) % 256 = p % 256 := by omega
    rw [e1, e2]
    have h2 : lo ≤ p / 256 := by omega
    simp [h, h2]
  · have h2 : ¬ (lo ≤ p / 256) := by omega
    simp [h, h2]

theorem and_hif (a : ℕ → ℕ) (ha : ∀ l < 255, a l < 2 ^ 256) (lo : ℕ) :
    V a &&& E1P.hif lo = V (fun l => if lo ≤ l then a l else 0) := by
  have ha' : ∀ v < 256, (fun l => if l < 255 then a l else 0) v < 2 ^ 256 := by
    intro v _; dsimp only; split
    · exact ha v (by assumption)
    · norm_num
  rw [hif_eq, V_ext, pk_and 256 (by norm_num) _ _ 256 ha' (fun v _ => ite_lt _ _ _ _ (by norm_num) (by norm_num)), V_ext]
  apply pk_congr; intro l _; dsimp only
  by_cases h1 : l < 255
  · by_cases h2 : lo ≤ l
    · simp only [h1, h2, if_true]; exact and_full _ (ha l h1)
    · simp [h1, h2]
  · simp [h1]

/-! ## Sums and dot products -/

/-- one field of a product of packings, when every field of the convolution is small -/
theorem dig_mul (a b : ℕ → ℕ) (L1 L2 m0 : ℕ) (hm0 : m0 < L1 + L2)
    (hc : ∀ m < L1 + L2, ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0) < 2 ^ 256) :
    dig 256 (pk 256 a L1 * pk 256 b L2) m0 = ∑ l ∈ range L1, (if l ≤ m0 ∧ m0 - l < L2 then a l * b (m0 - l) else 0) := by
  rw [pk_mul_pk]; exact dig_pk 256 _ (L1 + L2) hc m0 hm0

theorem conv_le (a b : ℕ → ℕ) (L1 L2 A Bm m : ℕ) (ha : ∀ l < L1, a l ≤ A) (hb : ∀ l < L2, b l ≤ Bm) :
    ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0) ≤ L1 * (A * Bm) := by
  calc ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0)
      ≤ ∑ l ∈ range L1, A * Bm := by
        apply Finset.sum_le_sum; intro l hl; rw [Finset.mem_range] at hl
        split
        · exact Nat.mul_le_mul (ha l hl) (hb _ (by omega))
        · exact Nat.zero_le _
    _ = L1 * (A * Bm) := by rw [Finset.sum_const, Finset.card_range, smul_eq_mul]

/-- a packing is congruent to the sum of its fields modulo `2^256 - 1` -/
theorem pk_modEq (a : ℕ → ℕ) (L : ℕ) : pk 256 a L ≡ ∑ l ∈ range L, a l [MOD 2 ^ 256 - 1] := by
  induction L with
  | zero => simp only [pk, Finset.range_zero, Finset.sum_empty]; exact Nat.ModEq.refl 0
  | succ L ih =>
    rw [pk_succ, Finset.sum_range_succ]
    have h0 : 2 ^ 256 ≡ 1 [MOD 2 ^ 256 - 1] := by unfold Nat.ModEq; norm_num
    have h1 : 2 ^ (256 * L) ≡ 1 [MOD 2 ^ 256 - 1] := by rw [pow_mul]; simpa using h0.pow L
    exact ih.add (by simpa using h1.mul_left (a L))

theorem fsum_V (a : ℕ → ℕ) (A : ℕ) (ha : ∀ l < 255, a l ≤ A) (hA : 255 * A < 2 ^ 256 - 1) :
    E1P.fsum (V a) = ∑ l ∈ range 255, a l := by
  show pk 256 a 255 % E1P.FM = _
  have hs : ∑ l ∈ range 255, a l < 2 ^ 256 - 1 :=
    calc ∑ l ∈ range 255, a l ≤ ∑ _l ∈ range 255, A := Finset.sum_le_sum (fun l hl => ha l (Finset.mem_range.mp hl))
      _ = 255 * A := by simp
      _ < _ := hA
  have h := pk_modEq a 255
  unfold Nat.ModEq at h
  rw [FM_eq, h, Nat.mod_eq_of_lt hs]

theorem dot_VR_V (a b : ℕ → ℕ) (A Bm : ℕ) (ha : ∀ l < 255, a l ≤ A) (hb : ∀ l < 255, b l ≤ Bm)
    (hAB : 255 * (A * Bm) < 2 ^ 256) : E1P.dot (VR a) (V b) = ∑ l ∈ range 255, a l * b l := by
  show Nat.land (Nat.shiftRight (Nat.mul (VR a) (V b)) 65024) E1P.FM = _
  rw [show Nat.land (Nat.shiftRight (Nat.mul (VR a) (V b)) 65024) E1P.FM = E1P.fld (VR a * V b) 254 from rfl,
    dig_eq_fld, dig_mul _ b 255 255 254 (by norm_num)]
  · have e1 : ∑ l ∈ range 255, (if l ≤ 254 ∧ 254 - l < 255 then (fun j => a (254 - j)) l * b (254 - l) else 0)
        = ∑ l ∈ range 255, (fun i => a i * b i) (255 - 1 - l) := by
      apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
      rw [if_pos (by omega), show 255 - 1 - l = 254 - l by omega]
    rw [e1]; exact Finset.sum_range_reflect (fun i => a i * b i) 255
  · intro m _
    exact lt_of_le_of_lt (conv_le _ b 255 255 A Bm m (fun l hl => ha _ (by omega)) hb) hAB

theorem dot_VR_pk (a x : ℕ → ℕ) (A Bm : ℕ) (ha : ∀ l < 255, a l ≤ A) (hx : ∀ l < 256, x l ≤ Bm)
    (hAB : 255 * (A * Bm) < 2 ^ 256) : E1P.dot (VR a) (pk 256 x 256) = ∑ l ∈ range 255, a l * x l := by
  show Nat.land (Nat.shiftRight (Nat.mul (VR a) (pk 256 x 256)) 65024) E1P.FM = _
  rw [show Nat.land (Nat.shiftRight (Nat.mul (VR a) (pk 256 x 256)) 65024) E1P.FM = E1P.fld (VR a * pk 256 x 256) 254 from rfl,
    dig_eq_fld, dig_mul _ x 255 256 254 (by norm_num)]
  · have e1 : ∑ l ∈ range 255, (if l ≤ 254 ∧ 254 - l < 256 then (fun j => a (254 - j)) l * x (254 - l) else 0)
        = ∑ l ∈ range 255, (fun i => a i * x i) (255 - 1 - l) := by
      apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
      rw [if_pos (by omega), show 255 - 1 - l = 254 - l by omega]
    rw [e1]; exact Finset.sum_range_reflect (fun i => a i * x i) 255
  · intro m _
    exact lt_of_le_of_lt (conv_le _ x 255 256 A Bm m (fun l hl => ha _ (by omega)) hx) hAB

/-! ## Reversed masks -/

theorem and_nfmask_R (a : ℕ → ℕ) (ha : ∀ l < 255, a l < 2 ^ 256) (m mr : ℕ) (hm : m < 2 ^ 255) (hmr : mr < 2 ^ 255)
    (hrev : ∀ j < 255, mr.testBit j = m.testBit (254 - j)) :
    VR a &&& (ECTP.FMALL ^^^ E1P.fmask mr) = VR (fun l => if m.testBit l then 0 else a l) := by
  rw [show VR a = V (fun j => a (254 - j)) from rfl, and_nfmask _ (fun l hl => ha _ (by omega)) mr hmr]
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

theorem deficit_eq (t u : ℕ → ℕ) (U : ℕ) (ht : ∀ l < 255, t l < 2 ^ 64) (hu : ∀ l < 255, u l ≤ U)
    (hU : 255 * (U * 2 ^ 30) < 2 ^ 256) (lo : ℕ) :
    E1P.deficit (V t) (VR u) lo = ∑ l ∈ range 255, (if lo ≤ l then u l * (2 ^ 30 - t l) else 0) := by
  -- the fields of `D = DSCREP - T`
  set t' : ℕ → ℕ := fun l => if l < 255 then t l else 0 with ht'
  have ht'b : ∀ l, t' l < 2 ^ 64 := by
    intro l; simp only [ht']; split
    · exact ht l (by assumption)
    · norm_num
  set dd : ℕ → ℕ := fun l => 2 ^ 30 + 2 ^ 64 - t' l with hdd
  have hddb : ∀ l, dd l < 2 ^ 65 := by intro l; simp only [hdd]; have := ht'b l; omega
  have hD : ECTP.DSCREP - V t = pk 256 dd 256 := by
    rw [DSCREP_eq, V_ext, pk_sub 256 _ _ 256 (fun l _ => by
      show (if l < 255 then t l else 0) ≤ 2 ^ 30 + 2 ^ 64
      split
      · next h => have := ht l h; omega
      · omega)]
  -- `G`: bit 64 of every field, i.e. `t_l ≤ SC`
  set g : ℕ → ℕ := fun l => if t' l ≤ 2 ^ 30 then 1 else 0 with hg
  have hG : (pk 256 dd 256 >>> 64) &&& ECTP.REP = pk 256 g 256 := by
    apply Nat.eq_of_testBit_eq; intro p
    rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_REP,
      testBit_pk 256 (by norm_num) dd 256 (fun l _ => lt_trans (hddb l) (by norm_num)),
      testBit_pk 256 (by norm_num) g 256 (fun l _ => ite_lt _ _ _ _ (by norm_num) (by norm_num))]
    by_cases h0 : p % 256 = 0
    · obtain ⟨l, rfl⟩ : ∃ l, p = 256 * l := ⟨p / 256, by omega⟩
      have e1 : (64 + 256 * l) / 256 = l := by omega
      have e2 : (64 + 256 * l) % 256 = 64 := by omega
      have e3 : 256 * l / 256 = l := by omega
      rw [e1, e2, e3, testBit64 _ (hddb l)]
      by_cases hl : l < 256
      · have h0' : 256 * l % 256 = 0 := by omega
        rw [h0']
        by_cases hc : t' l ≤ 2 ^ 30
        · have h1 : 2 ^ 64 ≤ dd l := by simp only [hdd]; omega
          have h2 : g l = 1 := by simp only [hg]; rw [if_pos hc]
          rw [h2, decide_eq_true h1, tb1]; simp [hl]
        · have h1 : ¬ (2 ^ 64 ≤ dd l) := by simp only [hdd]; omega
          have h2 : g l = 0 := by simp only [hg]; rw [if_neg hc]
          rw [h2, decide_eq_false h1]; simp [hl]
      · simp [hl]
    · have : (g (p / 256)).testBit (p % 256) = false := by
        simp only [hg]; split
        · rw [tb1]; simp [h0]
        · simp
      rw [this]; simp [h0]
  -- the masked deficit vector
  have hX : (pk 256 dd 256 &&& (pk 256 g 256 * E1P.M64)) &&& E1P.hif lo =
      pk 256 (fun l => if lo ≤ l then 2 ^ 30 - t' l else 0) 256 := by
    rw [M64_eq, ← pk_mul_const, pk_and 256 (by norm_num) _ _ 256 (fun l _ => lt_trans (hddb l) (by norm_num))
      (fun l _ => by simp only [hg]; split <;> norm_num), hif_eq,
      pk_and 256 (by norm_num) _ _ 256 (fun l _ => lt_of_le_of_lt Nat.and_le_left (lt_trans (hddb l) (by norm_num)))
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
  show E1P.dot (VR u) (Nat.land (Nat.land (Nat.sub ECTP.DSCREP (V t))
    (Nat.mul (Nat.land (Nat.shiftRight (Nat.sub ECTP.DSCREP (V t)) 64) ECTP.REP) E1P.M64)) (E1P.hif lo)) = _
  rw [show Nat.sub ECTP.DSCREP (V t) = ECTP.DSCREP - V t from rfl, hD,
    show Nat.land (Nat.land (pk 256 dd 256) (Nat.mul (Nat.land (Nat.shiftRight (pk 256 dd 256) 64) ECTP.REP) E1P.M64)) (E1P.hif lo)
      = (pk 256 dd 256 &&& ((pk 256 dd 256 >>> 64) &&& ECTP.REP) * E1P.M64) &&& E1P.hif lo from rfl, hG, hX,
    dot_VR_pk u _ U (2 ^ 30) hu (fun l _ => by split <;> omega) hU]
  apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
  simp only [ht', if_pos hl]
  split <;> simp

end E1PS
