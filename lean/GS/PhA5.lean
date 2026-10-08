module
public import R22Port.U_d41d8cd98f00
public import GS.PhA4
/-! # Track A, part 5: offsets, record decoding, the field checks (`bFields`, `cmpRecs`, `cmpV3`), `checkA2a` -/
@[expose] public section
namespace GS
open G G.A2 G.LS G.Acc G.V2 Finset

/-! ## offsets and widths -/

theorem offsL_length : ∀ (L : List ℕ) (acc : ℕ), (offsL L acc).length = L.length
  | [], _ => rfl
  | _ :: L, acc => by show (offsL L _).length + 1 = L.length + 1; rw [offsL_length L]

theorem offsL_getD : ∀ (L : List ℕ) (acc i : ℕ), i < L.length →
    (offsL L acc).getD i 0 = acc + ∑ i' ∈ range i, pc32 (L.getD i' 0)
  | [], _, i, h => absurd h (Nat.not_lt_zero _)
  | M :: L, acc, i, h => by
    show (acc :: offsL L (Nat.add acc (pc32 M))).getD i 0 = _
    rcases i with _ | i
    · simp
    · simp only [List.getD_cons_succ]
      rw [offsL_getD L _ i (by simp at h; omega), Finset.sum_range_succ']
      simp only [List.getD_cons_succ, List.getD_cons_zero]
      show acc + pc32 M + _ = _; ring

theorem sumPc_eq : ∀ L : List ℕ, sumPc L = ∑ i ∈ range L.length, pc32 (L.getD i 0)
  | [] => rfl
  | M :: L => by
    show pc32 M + sumPc L = _
    rw [sumPc_eq L, List.length_cons, Finset.sum_range_succ']
    simp only [List.getD_cons_succ, List.getD_cons_zero]; ring

theorem bmL_length (t0 d a r : ℕ) : ∀ n V, (bmL t0 d a r n V).length = n
  | 0, _ => rfl
  | n + 1, V => by show (bmL t0 d a r n _).length + 1 = n + 1; rw [bmL_length t0 d a r n]

theorem bmL_getD (t0 d a r : ℕ) : ∀ n V i, i < n → (bmL t0 d a r n V).getD i 0 = bmaskF t0 d a (V + i) r
  | 0, _, i, h => absurd h (Nat.not_lt_zero _)
  | n + 1, V, i, h => by
    show (bmaskF t0 d a V r :: bmL t0 d a r n (Nat.succ V)).getD i 0 = _
    rcases i with _ | i
    · simp
    · simp only [List.getD_cons_succ]
      rw [bmL_getD t0 d a r n _ i (by omega)]; congr 1; omega

theorem rankM_lt_cntM {M B : ℕ} (h : M.testBit (32 * B) = true) : rankM M B < cntM M := by
  unfold cntM rankM
  apply Finset.card_lt_card
  refine ⟨fun k hk => ?_, fun hsub => ?_⟩
  · simp only [mem_filter, mem_range] at hk ⊢
    exact ⟨by have := lt_of_testBit32 h; omega, hk.2⟩
  · have : B ∈ (range (M + 1)).filter (fun k => M.testBit (32 * k) = true) := by
      simp only [mem_filter, mem_range]; exact ⟨lt_of_testBit32 h, h⟩
    have := hsub this
    simp only [mem_filter, mem_range] at this; omega

/-- a vertex position is below the width -/
theorem vpos_lt (BmL : List ℕ) (hm : ∀ i < BmL.length, MOK (BmL.getD i 0)) (i B : ℕ) (hi : i < BmL.length)
    (hB : (BmL.getD i 0).testBit (32 * B) = true) :
    vpos (BmL.getD i 0) ((offsL BmL 0).getD i 0) B < sumPc BmL := by
  unfold vpos
  rw [pc32_low _ _ (hm i hi), offsL_getD BmL 0 i hi, sumPc_eq]
  have h1 := rankM_lt_cntM hB
  rw [← pc32_eq _ (hm i hi)] at h1
  have h2 : ∑ i' ∈ range i, pc32 (BmL.getD i' 0) + pc32 (BmL.getD i 0) ≤ ∑ i' ∈ range BmL.length, pc32 (BmL.getD i' 0) := by
    rw [← Finset.sum_range_succ]
    exact Finset.sum_le_sum_of_subset (Finset.range_subset_range.mpr (by omega))
  calc 0 + ∑ i' ∈ range i, pc32 (BmL.getD i' 0) + rankM (BmL.getD i 0) B
      = ∑ i' ∈ range i, pc32 (BmL.getD i' 0) + rankM (BmL.getD i 0) B := by rw [Nat.zero_add]
    _ < ∑ i' ∈ range i, pc32 (BmL.getD i' 0) + pc32 (BmL.getD i 0) := Nat.add_lt_add_left h1 _
    _ ≤ _ := h2

/-! ## records -/

theorem testBit_shl' (x s p : ℕ) : (Nat.shiftLeft x s).testBit p = (decide (s ≤ p) && x.testBit (p - s)) := by
  show (x <<< s).testBit p = _
  rw [Nat.testBit_shiftLeft]

theorem testBit_lor (a b p : ℕ) : (Nat.lor a b).testBit p = (a.testBit p || b.testBit p) := Nat.testBit_or a b p

theorem testBit_lt_of {x n p : ℕ} (hx : x < 2 ^ n) (hp : n ≤ p) : x.testBit p = false :=
  Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) hp))

/-- the bits of a record -/
theorem testBit_mkRec (b w a y0 y1 v p : ℕ) (hb : b < 2 ^ 32) (hw : w < 2 ^ 16) (ha : a < 2 ^ 16) (hy0 : y0 < 2 ^ 32)
    (hy1 : y1 < 2 ^ 32) :
    (mkRec b w a y0 y1 v).testBit p =
      if p < 32 then b.testBit p else if p < 48 then w.testBit (p - 32) else if p < 64 then a.testBit (p - 48)
      else if p < 96 then y0.testBit (p - 64) else if p < 128 then y1.testBit (p - 96) else v.testBit (p - 128) := by
  unfold mkRec
  simp only [testBit_lor, testBit_shl']
  show (b.testBit p || ((decide (32 ≤ p) && w.testBit (p - 32)) || ((decide (48 ≤ p) && a.testBit (p - 48)) ||
    ((decide (64 ≤ p) && y0.testBit (p - 64)) || ((decide (96 ≤ p) && y1.testBit (p - 96)) ||
      (decide (128 ≤ p) && v.testBit (p - 128))))))) = _
  by_cases h1 : p < 32
  · rw [if_pos h1]
    simp [show ¬ 32 ≤ p by omega, show ¬ 48 ≤ p by omega, show ¬ 64 ≤ p by omega, show ¬ 96 ≤ p by omega,
      show ¬ 128 ≤ p by omega]
  · rw [if_neg h1, testBit_lt_of hb (by omega)]
    by_cases h2 : p < 48
    · rw [if_pos h2]
      simp [show 32 ≤ p by omega, show ¬ 48 ≤ p by omega, show ¬ 64 ≤ p by omega, show ¬ 96 ≤ p by omega,
        show ¬ 128 ≤ p by omega]
    · rw [if_neg h2, testBit_lt_of hw (show 16 ≤ p - 32 by omega)]
      by_cases h3 : p < 64
      · rw [if_pos h3]
        simp [show 48 ≤ p by omega, show ¬ 64 ≤ p by omega, show ¬ 96 ≤ p by omega, show ¬ 128 ≤ p by omega]
      · rw [if_neg h3, testBit_lt_of ha (show 16 ≤ p - 48 by omega)]
        by_cases h4 : p < 96
        · rw [if_pos h4]
          simp [show 64 ≤ p by omega, show ¬ 96 ≤ p by omega, show ¬ 128 ≤ p by omega]
        · rw [if_neg h4, testBit_lt_of hy0 (show 32 ≤ p - 64 by omega)]
          by_cases h5 : p < 128
          · rw [if_pos h5]
            simp [show 96 ≤ p by omega, show ¬ 128 ≤ p by omega]
          · rw [if_neg h5, testBit_lt_of hy1 (show 32 ≤ p - 96 by omega)]
            simp [show 128 ≤ p by omega]

theorem field_of {r n : ℕ} (s x : ℕ) (hx : x < 2 ^ n) (h : ∀ j < n, r.testBit (s + j) = x.testBit j) :
    Nat.land (Nat.shiftRight r s) (2 ^ n - 1) = x := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [land_bit, Nat.testBit_two_pow_sub_one]
  show ((r >>> s).testBit j && decide (j < n)) = _
  rw [Nat.testBit_shiftRight]
  by_cases hj : j < n
  · simp [hj, h j hj]
  · simp [hj, testBit_lt_of hx (Nat.le_of_not_lt hj)]

structure RecDec (r b w a y0 y1 v : ℕ) : Prop where
  bs : rBstart r = b
  wd : rWidth r = w
  aa : rA r = a
  y0 : rYU0 r = y0
  y1 : rYU1 r = y1
  lc : rLoc r = v

theorem mkRec_dec (b w a y0 y1 v : ℕ) (hb : b < 2 ^ 32) (hw : w < 2 ^ 16) (ha : a < 2 ^ 16) (hy0 : y0 < 2 ^ 32)
    (hy1 : y1 < 2 ^ 32) : RecDec (mkRec b w a y0 y1 v) b w a y0 y1 v := by
  have hT := fun p => testBit_mkRec b w a y0 y1 v p hb hw ha hy0 hy1
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · unfold rBstart
    have := field_of (r := mkRec b w a y0 y1 v) (n := 32) 0 b hb (fun j hj => by rw [hT, if_pos (by omega)]; simp)
    simpa [Nat.shiftRight_zero] using this
  · unfold rWidth
    exact field_of 32 w hw (fun j hj => by rw [hT, if_neg (by omega), if_pos (by omega)]; congr 1; omega)
  · unfold rA
    exact field_of 48 a ha (fun j hj => by rw [hT, if_neg (by omega), if_neg (by omega), if_pos (by omega)]; congr 1; omega)
  · unfold rYU0
    exact field_of 64 y0 hy0 (fun j hj => by
      rw [hT, if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos (by omega)]; congr 1; omega)
  · unfold rYU1
    exact field_of 96 y1 hy1 (fun j hj => by
      rw [hT, if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos (by omega)]; congr 1; omega)
  · unfold rLoc
    apply Nat.eq_of_testBit_eq; intro j
    show ((mkRec b w a y0 y1 v) >>> 128).testBit j = _
    rw [Nat.testBit_shiftRight, hT]
    rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega)]
    rw [Nat.add_sub_cancel_left]

/-! ## fields of parts -/

theorem yuF_lt (d a C U q : ℕ) (hd : d ≤ 2) (hC : C < 512) (hq : Rc a q < 8) : yuF d a C U q < 2 ^ 29 := by
  unfold yuF
  show get32 (YL (Rc a q)) C ||| (G.A2.rowD d U q <<< 27) < 2 ^ 29
  rw [YL_ok _ hq _ hC, rowD_eq]
  exact Nat.or_lt_two_pow (lt_trans (yvec_lt _ _) (by norm_num)) (shl27_lt _ d hd (row_lt _ _ _))

theorem xvF_lt (d a B V q : ℕ) (hd : d ≤ 2) (hB : B < 512) (hq : Lc a q < 8) : xvF d a B V q < 2 ^ 29 := by
  unfold xvF
  show get32 (XL (Lc a q)) B ||| (G.A2.rowD d V q <<< 27) < 2 ^ 29
  rw [XL_ok _ hq _ hB, rowD_eq]
  exact Nat.or_lt_two_pow (lt_trans (xvec_lt _ _) (by norm_num)) (shl27_lt _ d hd (row_lt _ _ _))

theorem yuF_state (d : ℕ) (s : State) (q : ℕ) (hC : s.C < 512) : yuF d s.a s.C s.U q = yuS d s q := by
  unfold yuF yuS
  show get32 (YL (Rc s.a q)) s.C ||| (G.A2.rowD d s.U q <<< 27) = _
  rw [YL_ok _ (Rc_lt _ _) _ hC, rowD_eq]

theorem xvF_state (d : ℕ) (s : State) (q : ℕ) (hB : s.B < 512) : xvF d s.a s.B s.V q = xvS d s q := by
  unfold xvF xvS
  show get32 (XL (Lc s.a q)) s.B ||| (G.A2.rowD d s.V q <<< 27) = _
  rw [XL_ok _ (Lc_lt _ _) _ hB, rowD_eq]

/-! ## the field checks -/

theorem bFields_spec (d : ℕ) (o : Orb2) : ∀ (b : ℕ) (es : List ℕ), bFields d o b es = true → ∀ i < es.length,
    get32 o.PB2X0 (b + i) = xvF d (eA (es.getD i 0)) (eX (es.getD i 0)) (eW (es.getD i 0)) 0 ∧
    get32 o.PB2X1 (b + i) = xvF d (eA (es.getD i 0)) (eX (es.getD i 0)) (eW (es.getD i 0)) 1
  | b, [], _ => by simp
  | b, e :: es, h => by
    have h' : (Nat.beq (get32 o.PB2X0 b) (xvF d (eA e) (eX e) (eW e) 0) &&
      Nat.beq (get32 o.PB2X1 b) (xvF d (eA e) (eX e) (eW e) 1) && bFields d o (Nat.succ b) es) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨h1, h2⟩, h3⟩ := h'
    intro i hi
    rcases i with _ | i
    · simp only [Nat.add_zero, List.getD_cons_zero]
      exact ⟨Nat.eq_of_beq_eq_true h1, Nat.eq_of_beq_eq_true h2⟩
    · simp only [List.getD_cons_succ]
      have := bFields_spec d o (Nat.succ b) es h3 i (by simp at hi; omega)
      rw [show b + (i + 1) = Nat.succ b + i by omega]; exact this

theorem recG_eq (o : Orb2) (c : ℕ) : recG o c = recOf (o.CH.getD (Nat.shiftRight c 8) 0) (Nat.land c 255) := by
  unfold recG
  rw [show Nat.shiftRight c 8 = c / 256 from Nat.shiftRight_eq_div_pow c 8]
  rw [show Nat.land c 255 = c % 256 from Nat.and_two_pow_sub_one_eq_mod c 8]

theorem cmpRecs_spec (o : Orb2) (PY0 PY1 : ℕ) : ∀ (c : ℕ) (recs : List ℕ), cmpRecs o PY0 PY1 c recs = true → ∀ i < recs.length,
    recG o (c + i) = recs.getD i 0 ∧ get32 PY0 (c + i) = rYU0 (recs.getD i 0) ∧ get32 PY1 (c + i) = rYU1 (recs.getD i 0)
  | c, [], _ => by simp
  | c, r :: rs, h => by
    have h' : (Nat.beq (recOf (o.CH.getD (Nat.shiftRight c 8) 0) (Nat.land c 255)) r &&
      Nat.beq (get32 PY0 c) (rYU0 r) && Nat.beq (get32 PY1 c) (rYU1 r) && cmpRecs o PY0 PY1 (Nat.succ c) rs) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := h'
    intro i hi
    rcases i with _ | i
    · simp only [Nat.add_zero, List.getD_cons_zero]
      exact ⟨by rw [recG_eq]; exact Nat.eq_of_beq_eq_true h1, Nat.eq_of_beq_eq_true h2, Nat.eq_of_beq_eq_true h3⟩
    · simp only [List.getD_cons_succ]
      have := cmpRecs_spec o PY0 PY1 (Nat.succ c) rs h4 i (by simp at hi; omega)
      rw [show c + (i + 1) = Nat.succ c + i by omega]; exact this

theorem cmpV3_spec (o : Orb2) : ∀ (v : ℕ) (ts : List ℕ), cmpV3 o v ts = true → ∀ i < ts.length,
    v3term o (v + i) = ts.getD i 0 ∧
    get32 o.V3Y0 (v + i) = fYU (ts.getD i 0) 0 ∧ get32 o.V3Y1 (v + i) = fYU (ts.getD i 0) 1 ∧
    get32 o.V3Y2 (v + i) = fYU (ts.getD i 0) 2 ∧ get32 o.V3X0 (v + i) = fXV (ts.getD i 0) 0 ∧
    get32 o.V3X1 (v + i) = fXV (ts.getD i 0) 1 ∧ get32 o.V3X2 (v + i) = fXV (ts.getD i 0) 2 ∧
    get32 o.V3A (v + i) = fA (ts.getD i 0)
  | v, [], _ => by simp
  | v, t :: ts, h => by
    have h' : (Nat.beq (v3term o v) t &&
      Nat.beq (get32 o.V3Y0 v) (fYU t 0) && Nat.beq (get32 o.V3Y1 v) (fYU t 1) && Nat.beq (get32 o.V3Y2 v) (fYU t 2) &&
      Nat.beq (get32 o.V3X0 v) (fXV t 0) && Nat.beq (get32 o.V3X1 v) (fXV t 1) && Nat.beq (get32 o.V3X2 v) (fXV t 2) &&
      Nat.beq (get32 o.V3A v) (fA t) && cmpV3 o (Nat.succ v) ts) = true := h
    simp only [Bool.and_eq_true] at h'
    obtain ⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩ := h'
    intro i hi
    rcases i with _ | i
    · simp only [Nat.add_zero, List.getD_cons_zero]
      exact ⟨Nat.eq_of_beq_eq_true h1, Nat.eq_of_beq_eq_true h2, Nat.eq_of_beq_eq_true h3, Nat.eq_of_beq_eq_true h4,
        Nat.eq_of_beq_eq_true h5, Nat.eq_of_beq_eq_true h6, Nat.eq_of_beq_eq_true h7, Nat.eq_of_beq_eq_true h8⟩
    · simp only [List.getD_cons_succ]
      have := cmpV3_spec o (Nat.succ v) ts h9 i (by simp at hi; omega)
      rw [show v + (i + 1) = Nat.succ v + i by omega]; exact this

end GS

#print axioms GS.mkRec_dec
#print axioms GS.vpos_lt
#print axioms GS.cmpRecs_spec
