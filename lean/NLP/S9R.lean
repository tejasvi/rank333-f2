module
public import R22Port.U_d41d8cd98f00
public import NLP.S9
/-! # NLP.S9R: residual matrices and `gather` on slots -/
@[expose] public section
namespace NL
open Nat S5

/-! ## Residual matrices -/

theorem npar_land (a X : Nat) (hX : X < 512) : npar (Nat.land a X) = BC5.par (Nat.land a X) :=
  npar_eq _ (lt_of_le_of_lt Nat.and_le_right hX)

theorem resC_nil (X : Nat) : resC X [] = (TXCS.getD X default).xor ID18S := rfl
theorem resC_cons (X : Nat) (e : Nat × Nat × Nat) (r : Asg) :
    resC X (e :: r) = cond (npar (Nat.land e.1 X)) ((sprM e.2.2 e.2.1).xor (resC X r)) (resC X r) := rfl
theorem kresC_nil (X : Nat) : BC5.resC X [] = Nat.xor (BC5.txc18 X) BC4.ID18 := rfl
theorem kresC_cons (X : Nat) (e : Nat × Nat × Nat) (r : Asg) : BC5.resC X (e :: r) =
    cond (BC5.par (Nat.land e.1 X)) (Nat.xor (Nat.mul (BC5.spr18 e.2.2) e.2.1) (BC5.resC X r)) (BC5.resC X r) := rfl
theorem resR_nil (X : Nat) : resR X [] = (TXRS.getD X default).xor ID18S := rfl
theorem resR_cons (X : Nat) (e : Nat × Nat × Nat) (r : Asg) :
    resR X (e :: r) = cond (npar (Nat.land e.1 X)) ((sprM e.2.1 e.2.2).xor (resR X r)) (resR X r) := rfl
theorem kresR_nil (X : Nat) : BC5.resR X [] = Nat.xor (BC5.txr18 X) BC4.ID18 := rfl
theorem kresR_cons (X : Nat) (e : Nat × Nat × Nat) (r : Asg) : BC5.resR X (e :: r) =
    cond (BC5.par (Nat.land e.1 X)) (Nat.xor (Nat.mul (BC5.spr18 e.2.1) e.2.2) (BC5.resR X r)) (BC5.resR X r) := rfl

/-- **`resC` is the kernel's** -/
theorem resC_eq (X : Nat) (hX : X < 512) (asg : Asg) (h : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) :
    (resC X asg).toNat = BC5.resC X asg ∧ (resC X asg).WF := by
  induction asg with
  | nil =>
    obtain ⟨h1, h2⟩ := txc_fact X hX
    obtain ⟨h3, h4⟩ := id18_fact
    have w1 := S9.wf_of_wfb _ h2
    have w2 := S9.wf_of_wfb _ h4
    rw [resC_nil, kresC_nil]
    exact ⟨by rw [S9.toNat_xor _ _ w1 w2, h1, h3]; rfl, S9.xor_wf _ _ w1 w2⟩
  | cons e r ih =>
    obtain ⟨ih1, ih2⟩ := ih (fun e' he' => h e' (List.mem_cons_of_mem _ he'))
    obtain ⟨hb, hc⟩ := h e List.mem_cons_self
    have hb18 : e.2.1 < 2 ^ 18 := by omega
    rw [resC_cons, kresC_cons, npar_land _ _ hX]
    cases BC5.par (Nat.land e.1 X)
    · exact ⟨ih1, ih2⟩
    · exact ⟨by rw [cond_true, cond_true, S9.toNat_xor _ _ (sprM_wf _ _ hb18) ih2, sprM_eq _ _ hc hb18, ih1]; rfl,
        S9.xor_wf _ _ (sprM_wf _ _ hb18) ih2⟩

/-- **`resR` is the kernel's** -/
theorem resR_eq (X : Nat) (hX : X < 512) (asg : Asg) (h : ∀ e ∈ asg, e.2.1 < 512 ∧ e.2.2 < 512) :
    (resR X asg).toNat = BC5.resR X asg ∧ (resR X asg).WF := by
  induction asg with
  | nil =>
    obtain ⟨h1, h2⟩ := txr_fact X hX
    obtain ⟨h3, h4⟩ := id18_fact
    have w1 := S9.wf_of_wfb _ h2
    have w2 := S9.wf_of_wfb _ h4
    rw [resR_nil, kresR_nil]
    exact ⟨by rw [S9.toNat_xor _ _ w1 w2, h1, h3]; rfl, S9.xor_wf _ _ w1 w2⟩
  | cons e r ih =>
    obtain ⟨ih1, ih2⟩ := ih (fun e' he' => h e' (List.mem_cons_of_mem _ he'))
    obtain ⟨hb, hc⟩ := h e List.mem_cons_self
    have hc18 : e.2.2 < 2 ^ 18 := by omega
    rw [resR_cons, kresR_cons, npar_land _ _ hX]
    cases BC5.par (Nat.land e.1 X)
    · exact ⟨ih1, ih2⟩
    · exact ⟨by rw [cond_true, cond_true, S9.toNat_xor _ _ (sprM_wf _ _ hc18) ih2, sprM_eq _ _ hb hc18, ih1]; rfl,
        S9.xor_wf _ _ (sprM_wf _ _ hc18) ih2⟩

/-! ## `gather` -/

theorem gather_lt' (P : S9) (j : Nat) : gather P j < 512 := by
  unfold gather
  have hb : ∀ x, Nat.land (Nat.shiftRight x j) 1 < 2 := fun x => lt_of_le_of_lt Nat.and_le_right (by norm_num)
  have hm : ∀ x k, k ≤ 256 → Nat.mul (Nat.land (Nat.shiftRight x j) 1) k < 512 := fun x k hk => by
    have h1 : Nat.land (Nat.shiftRight x j) 1 ≤ 1 := by have := hb x; omega
    show Nat.land (Nat.shiftRight x j) 1 * k < 512
    calc Nat.land (Nat.shiftRight x j) 1 * k ≤ 1 * 256 := Nat.mul_le_mul h1 hk
      _ < 512 := by norm_num
  exact Nat.or_lt_two_pow (n := 9) (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow
    (Nat.or_lt_two_pow (Nat.or_lt_two_pow (Nat.or_lt_two_pow (by have := hb P.s0; norm_num; omega) (hm _ 2 (by norm_num)))
    (hm _ 4 (by norm_num))) (hm _ 8 (by norm_num))) (hm _ 16 (by norm_num))) (hm _ 32 (by norm_num))) (hm _ 64 (by norm_num)))
    (hm _ 128 (by norm_num))) (hm _ 256 (by norm_num))

theorem bit01 (x j : Nat) : Nat.land (Nat.shiftRight x j) 1 = if x.testBit j then 1 else 0 := by
  show (x >>> j) &&& 1 = _
  rw [Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow, Nat.testBit_eq_decide_div_mod_eq]
  have := Nat.mod_lt (x / 2 ^ j) (show 0 < 2 by norm_num)
  by_cases h2 : x / 2 ^ j % 2 = 1 <;> simp [h2] <;> omega

theorem tb_mul_lit (x j k e h : Nat) (he : k = 2 ^ e) :
    (Nat.mul (Nat.land (Nat.shiftRight x j) 1) k).testBit h = (decide (e = h) && x.testBit j) := by
  rw [bit01, he]
  show ((if x.testBit j then 1 else 0) * 2 ^ e).testBit h = _
  by_cases hx : x.testBit j
  · simp [hx, Nat.testBit_two_pow]
  · simp [hx]

theorem tb_bit0 (x j h : Nat) : (Nat.land (Nat.shiftRight x j) 1).testBit h = (decide (0 = h) && x.testBit j) := by
  have := tb_mul_lit x j 1 0 h (by norm_num)
  rw [← this]; show _ = (Nat.land (Nat.shiftRight x j) 1 * 1).testBit h; rw [Nat.mul_one]

theorem gather_bit' (P : S9) (j h : Nat) (hh : h < 9) : (gather P j).testBit h = (P.sl h).testBit j := by
  unfold gather
  simp only [Nat.testBit_or, tb_bit0, tb_mul_lit _ j 2 1 h (by norm_num), tb_mul_lit _ j 4 2 h (by norm_num),
    tb_mul_lit _ j 8 3 h (by norm_num), tb_mul_lit _ j 16 4 h (by norm_num), tb_mul_lit _ j 32 5 h (by norm_num),
    tb_mul_lit _ j 64 6 h (by norm_num), tb_mul_lit _ j 128 7 h (by norm_num), tb_mul_lit _ j 256 8 h (by norm_num)]
  interval_cases h <;> simp [S9.sl]

/-- **`gather` is the kernel's** -/
theorem gather_eq (P : S9) (hP : P.WF) (j : Nat) (hj : j < 18) : gather P j = BC5.gather P.toNat j := by
  apply Nat.eq_of_testBit_eq; intro h
  by_cases hh : h < 9
  · rw [gather_bit' P j h hh, S5.gather_bit, S9.testBit_toNat P hP h j hh hj]; simp [hh]
  · rw [tb_or_lt _ (gather_lt' P j) h hh, tb_or_lt _ (S5.gather_lt _ j) h hh]

end NL
