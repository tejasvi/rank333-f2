module
public import R22Port.U_d41d8cd98f00
public import S6.R1Tab0
public import S6.R1Tab1
public import S6.R1Tab2
public import S6.R1Tab3
public import RootSound.Sem
/-! # Matrices behind the rank-1 claims

* `nv_mvT`, `nv_mvTt`: the Nat-level products are `T(X) u`, `T(X)ᵀ w`;
* the root record of `X` is exact (`root_col_iff`, `root_row_iff`, `root_inv`, `root_rank`), from S5's `root_fact` and
  the tables `root6_fact0..3`; `ker_fact`, `lker_fact`: the class masks `kerm`/`lkerm` hold kernel vectors;
* `Xm P`: the matrix of `xof P` (`nv_xof_mat`), whose transpose is `gof P` (`nv_gof_mat`); `corrP` adds `B Aᵀ`;
* `thru1_one`: one assigned term through `X` means `R(X) = T(X) + b0 c0ᵀ`;
* `trans_testBit`: `trans S v` is the translate `{s ^^^ v}`. -/
@[expose] public section
namespace S6
open BC4 BC5 BC6 BC6s S5 RootSound Matrix

theorem root6_all (X v : Nat) (hX : X < 512) (hv : v < 512) : root6OK X v = true := by
  rcases (by omega : X < 128 ∨ (128 ≤ X ∧ X < 256) ∨ (256 ≤ X ∧ X < 384) ∨ 384 ≤ X) with h | h | h | h
  · exact allLT_spec (allFrom_spec root6_fact0 X (by omega) (by omega)) v hv
  · exact allLT_spec (allFrom_spec root6_fact1 X h.1 (by omega)) v hv
  · exact allLT_spec (allFrom_spec root6_fact2 X h.1 (by omega)) v hv
  · exact allLT_spec (allFrom_spec root6_fact3 X h (by omega)) v hv

theorem testBit_shl9 (x i : Nat) : (x <<< 9).testBit (i + 9) = x.testBit i := by
  rw [Nat.testBit_shiftLeft]; simp

theorem resM_nil (X : Nat) : resM X [] = TX (toM3 X) := by simp [resM]

theorem resC_nil_eq (X : Nat) : resC X [] = Nat.xor (txc18 X) ID18 := rfl
theorem resR_nil_eq (X : Nat) : resR X [] = Nat.xor (txr18 X) ID18 := rfl

theorem tx_low (X h j : Nat) (hX : X < 512) (hh : h < 9) (hj : j < 9) :
    TX (toM3 X) ⟨j, hj⟩ ⟨h, hh⟩ = bitF (txc18 X) (18 * h + j) := by
  have e := congrFun (congrFun (resC_nil X hX).1 ⟨j, hj⟩) ⟨h, hh⟩
  rw [resM_nil] at e
  rw [← e, amat, resC_nil_eq]
  show bitF (txc18 X ^^^ ID18) (18 * h + j) = _
  rw [bitF_bf, bitF_bf, Nat.testBit_xor, id18_left h j hj, Bool.xor_false]

theorem txt_low (X h j : Nat) (hX : X < 512) (hh : h < 9) (hj : j < 9) :
    (TX (toM3 X))ᵀ ⟨j, hj⟩ ⟨h, hh⟩ = bitF (txr18 X) (18 * h + j) := by
  have e := congrFun (congrFun (resR_nil X hX).1 ⟨j, hj⟩) ⟨h, hh⟩
  rw [resM_nil] at e
  rw [← e, amat, resR_nil_eq]
  show bitF (txr18 X ^^^ ID18) (18 * h + j) = _
  rw [bitF_bf, bitF_bf, Nat.testBit_xor, id18_left h j hj, Bool.xor_false]

theorem nv_mvT (X u : Nat) (hX : X < 512) (hu : u < 512) : nv (mvT X u) = TX (toM3 X) *ᵥ nv u := by
  funext j
  show bitF (mvT X u) j.val = _
  rw [bitF_bf, mvT, xof_bf _ _ _ hu j.isLt, ← Fin.sum_univ_eq_sum_range]
  simp only [Matrix.mulVec, dotProduct]
  refine Finset.sum_congr rfl (fun h _ => ?_)
  rw [show 18 * h.val + (9 + j.val) = (18 * h.val + j.val) + 9 by ring, testBit_shl9, ← bitF_bf, tx_low X h j hX h.isLt j.isLt]
  rw [mul_comm]; rfl

theorem nv_mvTt (X w : Nat) (hX : X < 512) (hw : w < 512) : nv (mvTt X w) = (TX (toM3 X))ᵀ *ᵥ nv w := by
  funext j
  show bitF (mvTt X w) j.val = _
  rw [bitF_bf, mvTt, xof_bf _ _ _ hw j.isLt, ← Fin.sum_univ_eq_sum_range]
  simp only [Matrix.mulVec, dotProduct]
  refine Finset.sum_congr rfl (fun h _ => ?_)
  rw [show 18 * h.val + (9 + j.val) = (18 * h.val + j.val) + 9 by ring, testBit_shl9, ← bitF_bf, txt_low X h j hX h.isLt j.isLt]
  rw [mul_comm]; rfl

/-! ## The root record of `X` -/

/-- S5's root fact, unpacked: the root record is the elimination of `T(X)`, with its facts -/
theorem root_elim (X : Nat) (hX : X < 512) :
    ElimFacts (TX (toM3 X)) (elim (Nat.xor (txc18 X) ID18)) ∧
    rootP X = (elim (Nat.xor (txc18 X) ID18)).P ∧ rlm X = lmC (elim (Nat.xor (txc18 X) ID18)).P (elim (Nat.xor (txc18 X) ID18)).PM ∧
    rrm X = kerM (elim (Nat.xor (txc18 X) ID18)).M := by
  have hroot := allLT_spec root_fact X hX
  simp only [rootOK, Bool.and_eq_true, Nat.beq_eq] at hroot
  obtain ⟨⟨⟨⟨⟨h1, _⟩, h3⟩, h4⟩, _⟩, h6⟩ := hroot
  have hf := elim_facts (resC X []) (resC_nil X hX).2 (by rw [resC_nil_eq]; exact h6)
  rw [(resC_nil X hX).1, resM_nil, resC_nil_eq] at hf
  exact ⟨hf, h1, h3, h4⟩

theorem root_inv (X : Nat) (hX : X < 512) (w : Nat) (hw : w < 512) (hv : nv w ∈ LinearMap.range (TX (toM3 X)).mulVecLin) :
    TX (toM3 X) *ᵥ nv (xof (rootP X) w) = nv w := by
  obtain ⟨hf, hP, _, _⟩ := root_elim X hX
  rw [hP]; exact xof_inv hf w hw hv

theorem root_col_iff (X v : Nat) (hX : X < 512) (hv : v < 512) :
    (rlm X).testBit v = true ↔ nv v ∈ LinearMap.range (TX (toM3 X)).mulVecLin := by
  constructor
  · intro hb
    have h := root6_all X v hX hv
    simp only [root6OK, Bool.and_eq_true, Bool.or_eq_true, Bool.not_eq_true', beq_iff_eq] at h
    obtain ⟨⟨⟨h1, _⟩, _⟩, _⟩ := h
    rcases h1 with h1 | h1
    · rw [bit_eq] at h1; rw [h1] at hb; exact absurd hb Bool.false_ne_true
    · refine ⟨nv (xof (rootP X) v), ?_⟩
      rw [Matrix.mulVecLin_apply, ← nv_mvT X _ hX (xof_lt _ _), h1]
  · intro hr
    obtain ⟨hf, _, hl, _⟩ := root_elim X hX
    rw [hl]; exact lmC_of_range hf v hv hr

theorem root_row_iff (X w : Nat) (hX : X < 512) (hw : w < 512) :
    (rrm X).testBit w = true ↔ nv w ∈ LinearMap.range (TX (toM3 X))ᵀ.mulVecLin := by
  constructor
  · intro hb
    have h := root6_all X w hX hw
    simp only [root6OK, Bool.and_eq_true, Bool.or_eq_true, Bool.not_eq_true', beq_iff_eq] at h
    obtain ⟨⟨⟨_, h2⟩, _⟩, _⟩ := h
    rcases h2 with h2 | h2
    · rw [bit_eq] at h2; rw [h2] at hb; exact absurd hb Bool.false_ne_true
    · refine ⟨nv (gof (rootP X) w), ?_⟩
      rw [Matrix.mulVecLin_apply, ← nv_mvTt X _ hX (gof_lt _ _), h2]
  · intro hr
    obtain ⟨hf, _, _, hr'⟩ := root_elim X hX
    rw [hr']; exact kerM_of_range hf w hw hr

theorem ker_fact (X k : Nat) (hX : X < 512) (hk : k < 512) (h : (kerm X).testBit k = true) :
    TX (toM3 X) *ᵥ nv k = 0 := by
  have hh := root6_all X k hX hk
  simp only [root6OK, Bool.and_eq_true, Bool.or_eq_true, Bool.not_eq_true', beq_iff_eq] at hh
  obtain ⟨⟨_, h3⟩, _⟩ := hh
  rcases h3 with h3 | h3
  · rw [bit_eq] at h3; rw [h3] at h; exact absurd h Bool.false_ne_true
  · rw [← nv_mvT X k hX hk, h3]; funext i; simp [nv, bitF]

theorem lker_fact (X l : Nat) (hX : X < 512) (hl : l < 512) (h : (lkerm X).testBit l = true) :
    (TX (toM3 X))ᵀ *ᵥ nv l = 0 := by
  have hh := root6_all X l hX hl
  simp only [root6OK, Bool.and_eq_true, Bool.or_eq_true, Bool.not_eq_true', beq_iff_eq] at hh
  obtain ⟨_, h4⟩ := hh
  rcases h4 with h4 | h4
  · rw [bit_eq] at h4; rw [h4] at h; exact absurd h Bool.false_ne_true
  · rw [← nv_mvTt X l hX hl, h4]; funext i; simp [nv, bitF]

theorem rkt_fact : allLT 512 (fun X => X == 0 || rootRk X == 3 * rkOf X) = true := by decide +kernel

theorem root_rank (X : Nat) (hX : X < 512) (h0 : X ≠ 0) : (TX (toM3 X)).rank = rootRk X := by
  have h := allLT_spec rkt_fact X hX
  simp only [Bool.or_eq_true, beq_iff_eq, h0, false_or] at h
  rw [rank_TX X hX h0, h]

/-! ## The matrix of `xof P`, and `corrP` -/

/-- column `h` is the high half of slot `h` of `P` -/
def Xm (P : Nat) : Matrix (Fin 9) (Fin 9) F2 := fun j h => bitF P (18 * h.val + (9 + j.val))

theorem nv_xof_mat (P w : Nat) (hw : w < 512) : nv (xof P w) = Xm P *ᵥ nv w := by
  funext j
  show bitF (xof P w) j.val = _
  rw [bitF_bf, xof_bf _ _ _ hw j.isLt, ← Fin.sum_univ_eq_sum_range]
  simp only [Matrix.mulVec, dotProduct, Xm]
  refine Finset.sum_congr rfl (fun h _ => ?_)
  rw [mul_comm]; rfl

theorem nv_gof_mat (P c : Nat) (hc : c < 512) : nv (gof P c) = (Xm P)ᵀ *ᵥ nv c := by
  funext h
  show bitF (gof P c) h.val = _
  rw [bitF_bf, gof_bf _ _ _ hc h.isLt, ← Fin.sum_univ_eq_sum_range]
  simp only [Matrix.mulVec, dotProduct, Xm, Matrix.transpose_apply]
  refine Finset.sum_congr rfl (fun j _ => ?_)
  rw [mul_comm]; rfl

theorem shl9_lt (B : Nat) (hB : B < 512) : B <<< 9 < 2 ^ 18 := by
  rw [Nat.shiftLeft_eq]
  calc B * 2 ^ 9 < 512 * 2 ^ 9 := Nat.mul_lt_mul_of_pos_right hB (by positivity)
    _ = 2 ^ 18 := by norm_num

/-- **`corrP` adds `B Aᵀ`** to the matrix of `xof`. -/
theorem Xm_corrP (P A B : Nat) (hA : A < 512) (hB : B < 512) :
    Xm (corrP P A B) = Xm P + vecMulVec (nv B) (nv A) := by
  ext j h
  simp only [Xm, Matrix.add_apply, vecMulVec_apply, corrP, nv]
  show bitF (P ^^^ spr18 A * B <<< 9) (18 * h.val + (9 + j.val)) = _
  rw [bitF_bf, bitF_bf, bitF_bf, bitF_bf, Nat.testBit_xor, bf_xor]
  congr 1
  rw [sparse18_slot (spr18_sparse A hA) (shl9_lt B hB) h.val (9 + j.val) (by omega), spr18_bit A hA,
    show 9 + j.val = j.val + 9 by ring, testBit_shl9]
  have e : (18 * h.val % 18 = 0 ∧ 18 * h.val < 162) := ⟨by omega, by omega⟩
  rw [show 18 * h.val / 18 = h.val by omega]
  simp only [e, true_and, decide_true, Bool.true_and, bf_and, one_mul]
  ring

theorem nv_xor (a b : Nat) : nv (a ^^^ b) = nv a + nv b := by
  funext i; show bitF (a ^^^ b) i.val = bitF a i.val + bitF b i.val
  rw [bitF_bf, bitF_bf, bitF_bf, Nat.testBit_xor, bf_xor]

theorem nv_zero : nv 0 = 0 := by funext i; simp [nv, bitF]

theorem nv_cond (p : Bool) (k : Nat) : nv (cond p k 0) = (bf p) • nv k := by
  cases p
  · rw [cond_false, nv_zero, bf_false, zero_smul]
  · rw [cond_true, bf_true, one_smul]

/-! ## One assigned term through `X` -/

theorem thru1_cons (X : Nat) (e : Nat × Nat × Nat) (asg : Asg) :
    thru1 X (e :: asg) = cond (par (Nat.land e.1 X))
      (cond (Nat.beq (thru1 X asg).1 0) (1, e.2.1, e.2.2) (2, (thru1 X asg).2.1, (thru1 X asg).2.2)) (thru1 X asg) := rfl

def asgSum (X : Nat) (asg : Asg) : Matrix (Fin 9) (Fin 9) F2 :=
  (asg.map (fun e => if par (e.1 &&& X) = true then vecMulVec (nv e.2.1) (nv e.2.2) else 0)).sum

theorem resM_eq (X : Nat) (asg : Asg) : resM X asg = TX (toM3 X) + asgSum X asg := rfl

theorem thru1_spec (X : Nat) : ∀ asg : Asg, (∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) →
    ((thru1 X asg).1 = 0 → asgSum X asg = 0) ∧
    ((thru1 X asg).1 = 1 → asgSum X asg = vecMulVec (nv (thru1 X asg).2.1) (nv (thru1 X asg).2.2) ∧
      (thru1 X asg).2.1 < 512 ∧ (thru1 X asg).2.2 < 512) := by
  intro asg
  induction asg with
  | nil => intro _; exact ⟨fun _ => rfl, fun h => absurd (show (0 : Nat) = 1 from h) (by decide)⟩
  | cons e asg ih =>
    intro hasg
    obtain ⟨ih0, ih1⟩ := ih (fun e' he' => hasg e' (List.mem_cons_of_mem _ he'))
    have hs : asgSum X (e :: asg) =
        (if par (e.1 &&& X) = true then vecMulVec (nv e.2.1) (nv e.2.2) else 0) + asgSum X asg := by
      simp only [asgSum, List.map_cons, List.sum_cons]
    have hpe : par (Nat.land e.1 X) = par (e.1 &&& X) := rfl
    rw [thru1_cons, hpe, hs]
    cases hp : par (e.1 &&& X)
    · rw [cond_false, if_neg (by decide), zero_add]; exact ⟨ih0, ih1⟩
    · rw [cond_true, if_pos rfl]
      cases h0 : Nat.beq (thru1 X asg).1 0
      · rw [cond_false]
        exact ⟨fun h => absurd (show (2 : Nat) = 0 from h) (by decide), fun h => absurd (show (2 : Nat) = 1 from h) (by decide)⟩
      · rw [cond_true]
        refine ⟨fun h => absurd (show (1 : Nat) = 0 from h) (by decide), fun _ => ?_⟩
        have e0 : (thru1 X asg).1 = 0 := Nat.eq_of_beq_eq_true h0
        rw [ih0 e0, add_zero]
        exact ⟨rfl, (hasg e List.mem_cons_self).1, (hasg e List.mem_cons_self).2⟩

/-- **One assigned term through `X`**: `R(X) = T(X) + b0 c0ᵀ`, `b0, c0 < 512`. -/
theorem thru1_one (X : Nat) (asg : Asg) (hasg : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) (h1 : (thru1 X asg).1 = 1) :
    resM X asg = TX (toM3 X) + vecMulVec (nv (thru1 X asg).2.1) (nv (thru1 X asg).2.2) ∧
    (thru1 X asg).2.1 < 512 ∧ (thru1 X asg).2.2 < 512 := by
  obtain ⟨_, h⟩ := thru1_spec X asg hasg
  obtain ⟨hs, hb, hc⟩ := h h1
  exact ⟨by rw [resM_eq, hs], hb, hc⟩

theorem thru1_one_ne (X : Nat) (asg : Asg) (h1 : (thru1 X asg).1 = 1) : X ≠ 0 := by
  intro hX
  subst hX
  have : ∀ asg : Asg, (thru1 0 asg).1 = 0 := by
    intro asg
    induction asg with
    | nil => rfl
    | cons e asg ih =>
      rw [thru1_cons]
      have hp : par (Nat.land e.1 0) = false := by
        show par (e.1 &&& 0) = false
        rw [Nat.and_zero]; decide
      rw [hp, cond_false, ih]
  rw [this] at h1; exact absurd h1 (by decide)

/-! ## `trans` is the translate -/

theorem hsw_testBit (S d K u : Nat) : (hsw S d K).testBit u =
    ((S.testBit (d + u) && K.testBit u) || (decide (u ≥ d) && (S.testBit (u - d) && K.testBit (u - d)))) := by
  show (((S >>> d) &&& K) ||| ((S &&& K) <<< d)).testBit u = _
  rw [Nat.testBit_or, Nat.testBit_and, Nat.testBit_shiftRight, Nat.testBit_shiftLeft, Nat.testBit_and]

def kmOf (i : Nat) : Nat :=
  cond (Nat.beq i 0) KM0 (cond (Nat.beq i 1) KM1 (cond (Nat.beq i 2) KM2 (cond (Nat.beq i 3) KM3 (cond (Nat.beq i 4) KM4
    (cond (Nat.beq i 5) KM5 (cond (Nat.beq i 6) KM6 (cond (Nat.beq i 7) KM7 KM8)))))))

/-- the concrete facts behind one half swap at `(i, u)`, as a `Bool` -/
def swapOk (i u : Nat) : Bool :=
  bif u.testBit i then
    !(kmOf i).testBit u && decide (u ≥ 2 ^ i) && decide (u - 2 ^ i = u ^^^ 2 ^ i) && (kmOf i).testBit (u - 2 ^ i)
  else
    (kmOf i).testBit u && decide (2 ^ i + u = u ^^^ 2 ^ i) && (!decide (u ≥ 2 ^ i) || !(kmOf i).testBit (u - 2 ^ i))

theorem swapOk_all : allLT 9 (fun i => allLT 512 (swapOk i)) = true := by decide +kernel

theorem hsw_KM (S i u : Nat) (hi : i < 9) (hu : u < 512) :
    (hsw S (2 ^ i) (kmOf i)).testBit u = S.testBit (u ^^^ 2 ^ i) := by
  rw [hsw_testBit]
  have h := allLT_spec (allLT_spec swapOk_all i hi) u hu
  unfold swapOk at h
  cases hb : u.testBit i
  · rw [hb, cond_false] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, Bool.not_eq_true', decide_eq_false_iff_not] at h
    obtain ⟨⟨hk, he⟩, hl⟩ := h
    rw [hk, he]
    rcases hl with hl | hl
    · simp [hl]
    · simp [hl]
  · rw [hb, cond_true] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at h
    obtain ⟨⟨⟨hk, hge⟩, he⟩, hk'⟩ := h
    rw [hk, hk', he]
    simp [hge]

def stepT (S : Nat) (b : Bool) (i : Nat) : Nat := cond b (hsw S (2 ^ i) (kmOf i)) S

theorem stepT_testBit (S i u : Nat) (b : Bool) (hi : i < 9) (hu : u < 512) :
    (stepT S b i).testBit u = S.testBit (u ^^^ cond b (2 ^ i) 0) := by
  unfold stepT
  cases b
  · rw [cond_false, cond_false, Nat.xor_zero]
  · rw [cond_true, cond_true]; exact hsw_KM S i u hi hu

theorem trans_eq (S v : Nat) : trans S v = stepT (stepT (stepT (stepT (stepT (stepT (stepT (stepT (stepT S
    (bit v 0) 0) (bit v 1) 1) (bit v 2) 2) (bit v 3) 3) (bit v 4) 4) (bit v 5) 5) (bit v 6) 6) (bit v 7) 7) (bit v 8) 8 :=
  rfl

theorem xor_lt (u c : Nat) (hu : u < 512) (hc : c < 512) : u ^^^ c < 512 :=
  Nat.xor_lt_two_pow (n := 9) hu hc

theorem cond_lt (b : Bool) (i : Nat) (hi : i < 9) : cond b (2 ^ i) 0 < 512 := by
  cases b
  · rw [cond_false]; norm_num
  · rw [cond_true]
    calc 2 ^ i < 2 ^ 9 := Nat.pow_lt_pow_right (by norm_num) hi
      _ = 512 := by norm_num

theorem bits_xor : allLT 512 (fun v =>
    cond (bit v 8) (2 ^ 8) 0 ^^^ (cond (bit v 7) (2 ^ 7) 0 ^^^ (cond (bit v 6) (2 ^ 6) 0 ^^^ (cond (bit v 5) (2 ^ 5) 0 ^^^
      (cond (bit v 4) (2 ^ 4) 0 ^^^ (cond (bit v 3) (2 ^ 3) 0 ^^^ (cond (bit v 2) (2 ^ 2) 0 ^^^ (cond (bit v 1) (2 ^ 1) 0 ^^^
        cond (bit v 0) (2 ^ 0) 0))))))) == v) = true := by
  decide +kernel

/-- **`trans` is the translate**: bit `u` of `trans S v` is bit `u ^^^ v` of `S` (`u, v < 512`). -/
theorem trans_testBit (S v u : Nat) (hv : v < 512) (hu : u < 512) : (trans S v).testBit u = S.testBit (u ^^^ v) := by
  have c : ∀ j, j < 9 → cond (bit v j) (2 ^ j) 0 < 512 := fun j hj => cond_lt _ j hj
  have h8 := xor_lt u _ hu (c 8 (by norm_num))
  have h7 := xor_lt _ _ h8 (c 7 (by norm_num))
  have h6 := xor_lt _ _ h7 (c 6 (by norm_num))
  have h5 := xor_lt _ _ h6 (c 5 (by norm_num))
  have h4 := xor_lt _ _ h5 (c 4 (by norm_num))
  have h3 := xor_lt _ _ h4 (c 3 (by norm_num))
  have h2 := xor_lt _ _ h3 (c 2 (by norm_num))
  have h1 := xor_lt _ _ h2 (c 1 (by norm_num))
  rw [trans_eq, stepT_testBit _ 8 _ _ (by norm_num) hu, stepT_testBit _ 7 _ _ (by norm_num) h8,
    stepT_testBit _ 6 _ _ (by norm_num) h7, stepT_testBit _ 5 _ _ (by norm_num) h6,
    stepT_testBit _ 4 _ _ (by norm_num) h5, stepT_testBit _ 3 _ _ (by norm_num) h4,
    stepT_testBit _ 2 _ _ (by norm_num) h3, stepT_testBit _ 1 _ _ (by norm_num) h2,
    stepT_testBit _ 0 _ _ (by norm_num) h1]
  congr 1
  have hv' := allLT_spec bits_xor v hv
  rw [beq_iff_eq] at hv'
  conv_rhs => rw [← hv']
  simp only [Nat.xor_assoc]

end S6
