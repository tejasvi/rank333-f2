module
public import R22Port.U_d41d8cd98f00
public import S5.Leaf
public import RootSound.LemmaG
public import BranchCheck6s
public import S6.RkCert
/-! # Lemma G in the S5 framework

For a full-`T` leaf (`dom = ALLNZ`) a hypothetical solution `(b, c)` of the leaf is a decomposition of `<3,3,3>`
(`isDecomp_of_full`), so `RootSound.LemmaG` gives `rank b_t, rank c_t ≥ rank a_t - Δ` with `Δ = ∑ rank a_s - 27 ≥ 0`.
The checker's tables: `rk3 v = rank (toM3 v)` (`rk3_rank`, GL3 certificates `RKC`), `RGE[k] = {v | rk3 v ≥ k}`
(`rge_fact`); `needP` packs `rk3 a_t - Δ` in 2-bit fields (`needP_field`).  `lg_root`: the true factors pass every
term's Lemma G mask; `lg_sym`: the GL3 move of the `sym` root keeps that (ranks are invariant). -/
@[expose] public section
namespace S6
open BC4 BC5 BC6 BC6s S5 RootSound Matrix

/-! ## Ranks of 3x3 matrices -/

def dmat (r : Nat) : Nat := cond (Nat.beq r 0) 0 (cond (Nat.beq r 1) 1 (cond (Nat.beq r 2) 17 273))

def rkcOK (v : Nat) : Bool :=
  let w := (RKC >>> (36 * v)) % 2 ^ 36
  mul3 (w % 512) ((w >>> 9) % 512) == 273 && mul3 ((w >>> 18) % 512) ((w >>> 27) % 512) == 273 &&
    mul3 (mul3 (w % 512) v) ((w >>> 18) % 512) == dmat (rk3 v)

theorem rkc_fact : allLT 512 rkcOK = true := by decide +kernel

theorem rk3_lt (v : Nat) : rk3 v < 4 := by
  show (RK3 >>> (2 * v)) &&& 3 < 4
  exact lt_of_le_of_lt Nat.and_le_right (by norm_num)

theorem toM3_dmat0 : toM3 (dmat 0) = Matrix.diagonal (fun i : Fin 3 => if i.val < 0 then 1 else 0) := by
  ext i j; fin_cases i <;> fin_cases j <;> decide
theorem toM3_dmat1 : toM3 (dmat 1) = Matrix.diagonal (fun i : Fin 3 => if i.val < 1 then 1 else 0) := by
  ext i j; fin_cases i <;> fin_cases j <;> decide
theorem toM3_dmat2 : toM3 (dmat 2) = Matrix.diagonal (fun i : Fin 3 => if i.val < 2 then 1 else 0) := by
  ext i j; fin_cases i <;> fin_cases j <;> decide
theorem toM3_dmat3 : toM3 (dmat 3) = Matrix.diagonal (fun i : Fin 3 => if i.val < 3 then 1 else 0) := by
  ext i j; fin_cases i <;> fin_cases j <;> decide

theorem rank_dmat (r : Nat) (hr : r < 4) : (toM3 (dmat r)).rank = r := by
  interval_cases r
  · rw [toM3_dmat0, Matrix.rank_diagonal]; decide
  · rw [toM3_dmat1, Matrix.rank_diagonal]; decide
  · rw [toM3_dmat2, Matrix.rank_diagonal]; decide
  · rw [toM3_dmat3, Matrix.rank_diagonal]; decide

theorem rank_mul_units {A P Q P' Q' : M3} (hP : P * P' = 1) (hQ : Q * Q' = 1) : (P * A * Q).rank = A.rank := by
  rw [Matrix.rank_mul_eq_left_of_isUnit_det Q _ (Matrix.isUnit_det_of_right_inverse hQ),
    Matrix.rank_mul_eq_right_of_isUnit_det P _ (Matrix.isUnit_det_of_right_inverse hP)]

/-- **The rank table**: `rk3 v = rank (toM3 v)`. -/
theorem rk3_rank (v : Nat) (hv : v < 512) : rk3 v = (toM3 v).rank := by
  have h := allLT_spec rkc_fact v hv
  unfold rkcOK at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  set w := (RKC >>> (36 * v)) % 2 ^ 36
  have hP : toM3 (w % 512) * toM3 ((w >>> 9) % 512) = 1 := by rw [← toM3_mul3, h1, toM3_273]
  have hQ : toM3 ((w >>> 18) % 512) * toM3 ((w >>> 27) % 512) = 1 := by rw [← toM3_mul3, h2, toM3_273]
  have e : toM3 (dmat (rk3 v)) = toM3 (w % 512) * toM3 v * toM3 ((w >>> 18) % 512) := by
    rw [← h3, toM3_mul3, toM3_mul3]
  rw [← rank_mul_units (A := toM3 v) hP hQ, ← e, rank_dmat _ (rk3_lt v)]

/-! ## The masks `RGE` and the packed needs -/

theorem rge_fact : allLT 4 (fun k => allLT 512 (fun v =>
    ((RGE >>> (512 * k)) &&& M512).testBit v == decide (k ≤ rk3 v))) = true := by decide +kernel

theorem lgMask_eq (need t : Nat) : lgMask need t = (RGE >>> (512 * ((need >>> (2 * t)) &&& 3))) &&& M512 := rfl

theorem lgMask_bit (need t v : Nat) (hv : v < 512) :
    (lgMask need t).testBit v = decide ((need >>> (2 * t)) &&& 3 ≤ rk3 v) := by
  rw [lgMask_eq]
  have hk : (need >>> (2 * t)) &&& 3 < 4 := lt_of_le_of_lt Nat.and_le_right (by norm_num)
  have := allLT_spec (allLT_spec rge_fact _ hk) v hv
  simpa using this

theorem rkSum_eq (T : Nat) : ∀ n, rkSum T n = ∑ s ∈ Finset.range n, rk3 (aT T s) := by
  intro n
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [Finset.sum_range_succ, ← ih]
    rfl

/-- one doubling of the packed needs: the new field sits above the old ones -/
theorem needP_succ (T n D : Nat) :
    needP T (n + 1) D = needP T n D ||| (rk3 (aT T n) - D) <<< (2 * n) := rfl

theorem needP_lt (T D : Nat) : ∀ n, needP T n D < 2 ^ (2 * n) := by
  intro n
  induction n with
  | zero => show 0 < _; norm_num
  | succ n ih =>
    rw [needP_succ]
    apply Nat.or_lt_two_pow
    · exact lt_of_lt_of_le ih (Nat.pow_le_pow_right (by norm_num) (by omega))
    · rw [Nat.shiftLeft_eq, show 2 * (n + 1) = 2 + 2 * n by ring, pow_add]
      exact Nat.mul_lt_mul_of_pos_right (lt_of_le_of_lt (Nat.sub_le _ _) (lt_of_lt_of_eq (rk3_lt _) (by norm_num)))
        (by positivity)

/-- **Field `t` of the packed needs** is `rk3 a_t - D`. -/
theorem needP_field (T D : Nat) : ∀ n t, t < n → (needP T n D >>> (2 * t)) &&& 3 = rk3 (aT T t) - D := by
  intro n
  induction n with
  | zero => intro t ht; omega
  | succ n ih =>
    intro t ht
    have hv : rk3 (aT T t) - D < 4 := lt_of_le_of_lt (Nat.sub_le _ _) (rk3_lt _)
    apply Nat.eq_of_testBit_eq
    intro i
    rw [needP_succ, Nat.testBit_and, Nat.testBit_shiftRight, Nat.testBit_or, Nat.testBit_shiftLeft]
    rw [show (3 : Nat) = 2 ^ 2 - 1 by norm_num, Nat.testBit_two_pow_sub_one]
    by_cases hi : i < 2
    · simp only [hi, decide_true, Bool.and_true]
      rcases Nat.lt_succ_iff_lt_or_eq.mp ht with htn | htn
      · -- an old field: the new one starts above it
        have hlow : decide (2 * t + i ≥ 2 * n) = false := by simp; omega
        rw [hlow, Bool.false_and, Bool.or_false]
        have := congrArg (fun x => x.testBit i) (ih t htn)
        simp only [Nat.testBit_and, Nat.testBit_shiftRight, show (3 : Nat) = 2 ^ 2 - 1 by norm_num,
          Nat.testBit_two_pow_sub_one, hi, decide_true, Bool.and_true] at this
        exact this
      · -- the new field: the old part is below it
        subst htn
        have hold : (needP T t D).testBit (2 * t + i) = false :=
          Nat.testBit_eq_false_of_lt (lt_of_lt_of_le (needP_lt T D t) (Nat.pow_le_pow_right (by norm_num) (by omega)))
        rw [hold, Bool.false_or, show 2 * t + i - 2 * t = i by omega]
        simp
    · simp only [hi, decide_false, Bool.and_false]
      exact (Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hv (by
        calc 4 = 2 ^ 2 := by norm_num
          _ ≤ 2 ^ i := Nat.pow_le_pow_right (by norm_num) (by omega)))).symm

/-! ## A full-`T` solution is a decomposition -/

theorem par_single (a p : Nat) (ha : a < 512) (hp : p < 9) : par (a &&& 2 ^ p) = a.testBit p := by
  have hlt : a &&& 2 ^ p < 512 := lt_of_le_of_lt Nat.and_le_left ha
  rw [par_eq _ hlt]
  have key : ∀ k, xorBits (a &&& 2 ^ p) k = (decide (p < k) && a.testBit p) := by
    intro k
    induction k with
    | zero => rfl
    | succ k ih =>
      show xor (xorBits (a &&& 2 ^ p) k) ((a &&& 2 ^ p).testBit k) = _
      rw [ih, Nat.testBit_and, Nat.testBit_two_pow]
      by_cases hk : p = k
      · subst hk; simp
      · rw [decide_eq_false hk, Bool.and_false, Bool.xor_false]
        by_cases hk2 : p < k
        · rw [decide_eq_true hk2, decide_eq_true (show p < k + 1 by omega)]
        · rw [decide_eq_false hk2, decide_eq_false (show ¬ p < k + 1 by omega)]
  rw [key]; simp [hp]

theorem nv_eq_toM3 (v : Nat) (j k : Fin 3) : nv v (ix j k) = toM3 v j k := rfl

/-- **A solution of a full-`T` leaf is a decomposition of `<3,3,3>`.** -/
theorem isDecomp_of_full (T n : Nat) (b c : Nat → Nat)
    (hd : ∀ X, X < 512 → ALLNZ.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range n).filter (fun t => par (aT T t &&& X) = true), vecMulVec (nv (b t)) (nv (c t))) :
    IsDecomp (fun s : Fin n => toM3 (aT T s)) (fun s => toM3 (b s)) (fun s => toM3 (c s)) := by
  intro i j j' k k' i'
  have hX : 2 ^ (3 * i.val + j.val) < 512 := by
    calc 2 ^ (3 * i.val + j.val) < 2 ^ 9 := Nat.pow_lt_pow_right (by norm_num) (by omega)
      _ = 512 := by norm_num
  have hnz : ALLNZ.testBit (2 ^ (3 * i.val + j.val)) = true := by
    rw [allnz_bit]; exact decide_eq_true ⟨by positivity, hX⟩
  have h := congrFun (congrFun (hd _ hX hnz) (ix j' k)) (ix k' i')
  rw [Matrix.sum_apply] at h
  simp only [vecMulVec_apply] at h
  -- left side: the entry of T(e_ij)
  have hl : TX (toM3 (2 ^ (3 * i.val + j.val))) (ix j' k) (ix k' i') =
      if j = j' ∧ k = k' ∧ i = i' then 1 else 0 := by
    rw [TX_ix]
    by_cases hkk : k = k'
    · rw [if_pos hkk]
      simp only [toM3, bitF, Nat.testBit_two_pow]
      by_cases e : i = i' ∧ j = j'
      · obtain ⟨rfl, rfl⟩ := e; simp [hkk]
      · have : ¬ (3 * i.val + j.val = 3 * i'.val + j'.val) := by
          intro h3; apply e; constructor <;> apply Fin.ext <;> omega
        rw [if_neg (by simpa using this)]
        rw [if_neg]; rintro ⟨h1, h2, h3⟩; exact e ⟨h3, h1⟩
    · rw [if_neg hkk, if_neg (fun e => hkk e.2.1)]
  rw [hl] at h
  rw [h, Finset.sum_filter, Finset.sum_range]
  refine Finset.sum_congr rfl (fun s _ => ?_)
  rw [par_single _ _ (aT_lt T s) (by omega), nv_eq_toM3, nv_eq_toM3]
  show bitF (aT T s) (3 * i.val + j.val) * toM3 (b s) j' k * toM3 (c s) k' i' = _
  rw [bitF_bf]
  cases (aT T s).testBit (3 * i.val + j.val) <;> simp [bf]

/-! ## The Lemma G facts at the root -/

/-- **Lemma G at the root**: for a solution of a full-`T` leaf with `27 ≤ ∑ rk3 a_s`, the true factors pass every term's
mask, and in fact `27 ≤ ∑ rk3 a_s` always holds. -/
theorem lg_root (T n : Nat) (b c : Nat → Nat) (hbc : BC n b c)
    (hd : ∀ X, X < 512 → ALLNZ.testBit X = true →
      TX (toM3 X) = ∑ t ∈ (Finset.range n).filter (fun t => par (aT T t &&& X) = true), vecMulVec (nv (b t)) (nv (c t))) :
    27 ≤ rkSum T n ∧ ∀ t, t < n →
      (lgMask (needP T n (rkSum T n - 27)) t).testBit (b t) = true ∧
      (lgMask (needP T n (rkSum T n - 27)) t).testBit (c t) = true := by
  have hD := isDecomp_of_full T n b c hd
  have hsum : rkSum T n = ∑ s : Fin n, (toM3 (aT T s)).rank := by
    rw [rkSum_eq, Finset.sum_range]
    exact Finset.sum_congr rfl (fun s _ => rk3_rank _ (aT_lt T s))
  have hsplit := LemmaG.split_flattening hD
  refine ⟨by rw [hsum]; exact hsplit, fun t ht => ?_⟩
  have hb := LemmaG.lemmaG_b hD ⟨t, ht⟩
  have hc := LemmaG.lemmaG_c hD ⟨t, ht⟩
  simp only at hb hc
  rw [← hsum, ← rk3_rank _ (aT_lt T t)] at hb hc
  rw [← rk3_rank _ (hbc t ht).2.1] at hb
  rw [← rk3_rank _ (hbc t ht).2.2.2] at hc
  rw [lgMask_bit _ _ _ (hbc t ht).2.1, lgMask_bit _ _ _ (hbc t ht).2.2.2, needP_field T _ n t ht]
  constructor <;> apply decide_eq_true <;> omega

/-- **GL3 move, with the ranks**: as `S5.sym_transform`, and every `b'_u`, `c'_u` has the rank of `b_u`, `c_u`. -/
theorem sym_transform_rk {T n dom ACT : Nat} {b c : Nat → Nat} (hbc : BC n b c) (hd : HD T n dom b c ACT []) (t : Nat)
    (ht : t < n) : ∃ b' c' : Nat → Nat, BC n b' c' ∧ HD T n dom b' c' ACT [] ∧ ORBM.testBit (b' t) = true ∧
      ∀ u, u < n → rk3 (b' u) = rk3 (b u) ∧ rk3 (c' u) = rk3 (c u) := by
  have hv := allLT_spec orb_fact (b t) (hbc t ht).2.1
  have hb0 : (b t == 0) = false := by
    have := (hbc t ht).1; cases e : (b t == 0)
    · rfl
    · rw [beq_iff_eq] at e; omega
  rw [hb0, Bool.false_or] at hv
  obtain ⟨p, hp, hpo⟩ := anyL_spec hv
  have hinv := allL_spec g3_fact p hp
  rw [beq_iff_eq] at hinv
  have hSS : toM3 p.1 * toM3 p.2 = 1 := by rw [← toM3_mul3, hinv, toM3_273]
  have hSS' : toM3 p.2 * toM3 p.1 = 1 := mul_eq_one_comm.mp hSS
  have hlt : ∀ x y, mul3 x y < 512 := fun x y => lt_of_lt_of_eq (mkB_lt _ 9) (by norm_num)
  refine ⟨fun u => mul3 (b u) p.1, fun u => mul3 p.2 (c u), ?_, ?_, hpo, ?_⟩
  · intro u hu
    obtain ⟨h1, h2, h3, h4⟩ := hbc u hu
    refine ⟨Nat.pos_of_ne_zero (fun e => ?_), hlt _ _, Nat.pos_of_ne_zero (fun e => ?_), hlt _ _⟩
    · have h0 : toM3 (b u) * toM3 p.1 = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (b u) = 0 := by
        rw [← Matrix.mul_one (toM3 (b u)), ← hSS, ← Matrix.mul_assoc, h0, Matrix.zero_mul]
      have := eq_zero_of_toM3 _ h2 this; omega
    · have h0 : toM3 p.2 * toM3 (c u) = 0 := by rw [← toM3_mul3]; simp only at e; rw [e, toM3_zero]
      have : toM3 (c u) = 0 := by
        rw [← Matrix.one_mul (toM3 (c u)), ← hSS, Matrix.mul_assoc, h0, Matrix.mul_zero]
      have := eq_zero_of_toM3 _ h4 this; omega
  · intro X hX hdom
    have h := hd X hX hdom
    have e0 : resM X [] = TX (toM3 X) := by simp [resM]
    rw [e0] at h ⊢
    exact sym_sum (toM3 X) _ b c p.1 p.2 hSS' h
  · intro u hu
    obtain ⟨_, h2, _, h4⟩ := hbc u hu
    constructor
    · rw [rk3_rank _ (hlt _ _), rk3_rank _ h2, toM3_mul3,
        Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hSS)]
    · rw [rk3_rank _ (hlt _ _), rk3_rank _ h4, toM3_mul3,
        Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hSS')]

end S6
