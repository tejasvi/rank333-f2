module
public import R22Port.U_d41d8cd98f00
public import NLP.S9R
public import S5.Elim
/-! # NLP.Elim: the native elimination on slots is the kernel's `BC5.elim`

`ESrel k n`: the kernel state `k` has the values of the native state `n` (`P`, `PM`, `rk`, `M`; the kernel's `DG`, `D18` are
functions of `PM`, see `S5.Pre`).  `stepE` preserves it, so `elim` does; `elimOk`, `lmC`, `kerM` then agree. -/
@[expose] public section
namespace NL
open Nat S5

def ESrel (k : BC5.ES) (n : ES) : Prop :=
  k.P = n.P.toNat ∧ k.PM = n.PM ∧ k.rk = n.rk ∧ k.M = n.M.toNat ∧ n.P.WF ∧ n.M.WF

/-- the first slot with bit `h` (the native pivot) -/
theorem pick_eq (M : S9) (h z0 : Nat) (hz0 : z0 < 9) (hf : nbit (M.sl z0) h = true)
    (hlow : ∀ z < z0, nbit (M.sl z) h = false) :
    (if nbit M.s0 h then M.s0 else if nbit M.s1 h then M.s1 else if nbit M.s2 h then M.s2 else if nbit M.s3 h then M.s3
      else if nbit M.s4 h then M.s4 else if nbit M.s5 h then M.s5 else if nbit M.s6 h then M.s6
      else if nbit M.s7 h then M.s7 else M.s8) = M.sl z0 := by
  interval_cases z0
  · simp only [S9.sl] at hf; simp [hf, S9.sl]
  · have h0 := hlow 0 (by norm_num); simp only [S9.sl] at hf h0; simp [hf, h0, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num)
    simp only [S9.sl] at hf h0 h1; simp [hf, h0, h1, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2; simp [hf, h0, h1, h2, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    have h3 := hlow 3 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2 h3; simp [hf, h0, h1, h2, h3, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    have h3 := hlow 3 (by norm_num); have h4 := hlow 4 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2 h3 h4; simp [hf, h0, h1, h2, h3, h4, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    have h3 := hlow 3 (by norm_num); have h4 := hlow 4 (by norm_num); have h5 := hlow 5 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2 h3 h4 h5; simp [hf, h0, h1, h2, h3, h4, h5, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    have h3 := hlow 3 (by norm_num); have h4 := hlow 4 (by norm_num); have h5 := hlow 5 (by norm_num)
    have h6 := hlow 6 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2 h3 h4 h5 h6; simp [hf, h0, h1, h2, h3, h4, h5, h6, S9.sl]
  · have h0 := hlow 0 (by norm_num); have h1 := hlow 1 (by norm_num); have h2 := hlow 2 (by norm_num)
    have h3 := hlow 3 (by norm_num); have h4 := hlow 4 (by norm_num); have h5 := hlow 5 (by norm_num)
    have h6 := hlow 6 (by norm_num); have h7 := hlow 7 (by norm_num)
    simp only [S9.sl] at hf h0 h1 h2 h3 h4 h5 h6 h7; simp [hf, h0, h1, h2, h3, h4, h5, h6, h7, S9.sl]

/-- the slots of a native pivot step -/
def puS (h p : Nat) (P : S9) (z : Nat) : Nat := Nat.lor (Nat.xor (P.sl z) (cond (nbit (P.sl z) h) p 0)) (cond (Nat.beq z h) p 0)
def muS (h p : Nat) (M : S9) (z : Nat) : Nat := cond (nbit (M.sl z) h) (Nat.xor (M.sl z) p) (M.sl z)

theorem stepE_flag (h : Nat) (s : ES) (z0 : Nat) (hz0 : z0 < 9) (hf : nbit (s.M.sl z0) h = true)
    (hlow : ∀ z < z0, nbit (s.M.sl z) h = false) :
    (∀ z < 9, (stepE h s).P.sl z = puS h (s.M.sl z0) s.P z) ∧ (∀ z < 9, (stepE h s).M.sl z = muS h (s.M.sl z0) s.M z) ∧
      (stepE h s).PM = Nat.lor s.PM (pw h) ∧ (stepE h s).rk = Nat.succ s.rk := by
  have hany : (nbit s.M.s0 h || nbit s.M.s1 h || nbit s.M.s2 h || nbit s.M.s3 h || nbit s.M.s4 h || nbit s.M.s5 h ||
      nbit s.M.s6 h || nbit s.M.s7 h || nbit s.M.s8 h) = true := by
    interval_cases z0 <;> simp_all [S9.sl]
  have hp := pick_eq s.M h z0 hz0 hf hlow
  unfold stepE
  simp only [hany, if_true, hp]
  refine ⟨fun z hz => ?_, fun z hz => ?_, ?_, ?_⟩
  · unfold puS; interval_cases z <;> rfl
  · unfold muS; interval_cases z <;> rfl
  all_goals first | rfl | trivial

theorem stepE_noflag (h : Nat) (s : ES) (hn : ∀ z < 9, nbit (s.M.sl z) h = false) : stepE h s = s := by
  have h0 := hn 0 (by norm_num); have h1 := hn 1 (by norm_num); have h2 := hn 2 (by norm_num)
  have h3 := hn 3 (by norm_num); have h4 := hn 4 (by norm_num); have h5 := hn 5 (by norm_num)
  have h6 := hn 6 (by norm_num); have h7 := hn 7 (by norm_num); have h8 := hn 8 (by norm_num)
  simp only [S9.sl] at h0 h1 h2 h3 h4 h5 h6 h7 h8
  unfold stepE
  simp [h0, h1, h2, h3, h4, h5, h6, h7, h8]

/-! ## Bits of one pivot step, both sides -/

theorem puS_bit (h p : Nat) (P : S9) (z j : Nat) :
    (puS h p P z).testBit j = (((P.sl z).testBit j ^^ ((P.sl z).testBit h && p.testBit j)) ||
      (decide (z = h) && p.testBit j)) := by
  unfold puS
  rw [Nat.lor_eq, Nat.testBit_or, Nat.xor_eq, Nat.testBit_xor, tb_cond0, tb_cond0, nbit_eq, beq_dec]

theorem muS_bit (h p : Nat) (M : S9) (z j : Nat) :
    (muS h p M z).testBit j = ((M.sl z).testBit j ^^ ((M.sl z).testBit h && p.testBit j)) := by
  unfold muS
  rw [nbit_eq]
  cases (M.sl z).testBit h
  · simp
  · simp [Nat.xor_eq, Nat.testBit_xor]

theorem puS_lt (h p : Nat) (P : S9) (hP : P.WF) (hp : p < 2 ^ 18) (z : Nat) : puS h p P z < 2 ^ 18 := by
  unfold puS
  exact Nat.or_lt_two_pow (Nat.xor_lt_two_pow (P.wf_sl hP z) (cond_lt _ _ _ hp)) (cond_lt _ _ _ hp)

theorem muS_lt (h p : Nat) (M : S9) (hM : M.WF) (hp : p < 2 ^ 18) (z : Nat) : muS h p M z < 2 ^ 18 := by
  unfold muS
  cases nbit (M.sl z) h
  · exact M.wf_sl hM z
  · exact Nat.xor_lt_two_pow (M.wf_sl hM z) hp

/-- the kernel's new `P` of a pivot step, slot by slot -/
theorem kP_bit (P p h z j : Nat) (hp : p < 2 ^ 18) (hj : j < 18) :
    (Nat.lor (Nat.xor P (Nat.mul (Nat.land (Nat.shiftRight P h) BC4.REP18) p)) (Nat.shiftLeft p (Nat.mul 18 h))).testBit
      (18 * z + j) = ((P.testBit (18 * z + j) ^^ (decide (z < 9) && P.testBit (18 * z + h) && p.testBit j)) ||
      (decide (z = h) && p.testBit j)) := by
  show ((P ^^^ ((P >>> h) &&& BC4.REP18) * p) ||| (p <<< (18 * h))).testBit (18 * z + j) = _
  rw [Nat.testBit_or, Nat.testBit_xor, sparse18_slot (cand_sparse P h) hp z j hj, cand_bit, shl_slot hp h z j hj]
  have e : h + 18 * z = 18 * z + h := by omega
  rw [e]
  by_cases hz : z < 9
  · simp [hz, show 18 * z % 18 = 0 by omega, show 18 * z < 162 by omega]
  · simp [hz, show ¬ (18 * z < 162) by omega]

theorem kM_bit (M p h z j : Nat) (hp : p < 2 ^ 18) (hj : j < 18) :
    (Nat.xor M (Nat.mul (Nat.land (Nat.shiftRight M h) BC4.REP18) p)).testBit (18 * z + j) =
      (M.testBit (18 * z + j) ^^ (decide (z < 9) && M.testBit (18 * z + h) && p.testBit j)) := by
  show (M ^^^ ((M >>> h) &&& BC4.REP18) * p).testBit (18 * z + j) = _
  rw [Nat.testBit_xor, sparse18_slot (cand_sparse M h) hp z j hj, cand_bit]
  have e : h + 18 * z = 18 * z + h := by omega
  rw [e]
  by_cases hz : z < 9
  · simp [hz, show 18 * z % 18 = 0 by omega, show 18 * z < 162 by omega]
  · simp [hz, show ¬ (18 * z < 162) by omega]

theorem cand_mul_lt (M p h : Nat) (hp : p < 2 ^ 18) : Nat.mul (Nat.land (Nat.shiftRight M h) BC4.REP18) p < 2 ^ 162 := by
  apply Nat.lt_pow_two_of_testBit; intro i hi
  show (((M >>> h) &&& BC4.REP18) * p).testBit i = false
  rw [testBit_sparse_mul (by norm_num) _ p hp (cand_sparse M h), cand_bit]
  simp [show ¬ (18 * (i / 18) < 162) by omega]

theorem kP_lt (P p h : Nat) (hP : P < 2 ^ 162) (hp : p < 2 ^ 18) (hh : h < 9) :
    Nat.lor (Nat.xor P (Nat.mul (Nat.land (Nat.shiftRight P h) BC4.REP18) p)) (Nat.shiftLeft p (Nat.mul 18 h)) < 2 ^ 162 := by
  apply Nat.or_lt_two_pow (Nat.xor_lt_two_pow hP (cand_mul_lt P p h hp))
  show p <<< (18 * h) < 2 ^ 162
  calc p <<< (18 * h) < 2 ^ (18 + 18 * h) := Nat.shiftLeft_lt hp
    _ ≤ 2 ^ 162 := Nat.pow_le_pow_right (by norm_num) (by omega)

/-- **one elimination step keeps the relation** -/
theorem stepE_rel (k : BC5.ES) (n : ES) (h : Nat) (hh : h < 9) (hr : ESrel k n) :
    ESrel (BC5.stepE h k) (stepE h n) := by
  obtain ⟨eP, ePM, erk, eM, wP, wM⟩ := hr
  rw [S5.stepE_eq]
  simp only [Nat.land_eq, Nat.shiftRight_eq']
  -- the kernel's candidate mask: bit 18 z is the native flag of slot z
  have hcand : ∀ i, ((k.M >>> h) &&& BC4.REP18).testBit i =
      (decide (i % 18 = 0 ∧ i < 162) && nbit (n.M.sl (i / 18)) h) := by
    intro i
    rw [cand_bit, nbit_eq, eM]
    by_cases hi : i % 18 = 0 ∧ i < 162
    · rw [show h + i = 18 * (i / 18) + h by omega, S9.testBit_toNat n.M wM _ _ (by omega) (by omega)]
      simp [hi]
    · simp [hi]
  by_cases hany : ∃ z, z < 9 ∧ nbit (n.M.sl z) h = true
  · classical
    let z0 := Nat.find hany
    have hz0 : z0 < 9 ∧ nbit (n.M.sl z0) h = true := Nat.find_spec hany
    have hlow : ∀ z < z0, nbit (n.M.sl z) h = false := fun z hz => by
      have := Nat.find_min hany hz
      simp only [not_and, Bool.not_eq_true] at this
      exact this (by omega)
    -- the lowest bit of the candidate mask is 18 z0
    have hc1 : ((k.M >>> h) &&& BC4.REP18).testBit (18 * z0) = true := by
      rw [hcand, show 18 * z0 / 18 = z0 by omega]; simp [hz0.2, show 18 * z0 < 162 by omega]
    have hc2 : ∀ i < 18 * z0, ((k.M >>> h) &&& BC4.REP18).testBit i = false := by
      intro i hi
      rw [hcand]
      by_cases hm : i % 18 = 0
      · rw [hlow (i / 18) (by omega)]; simp
      · simp [hm]
    obtain ⟨_, hlb⟩ := lowbit_spec hc1 hc2
    have hne : Nat.beq ((k.M >>> h) &&& BC4.REP18) 0 = false := by
      cases e : Nat.beq ((k.M >>> h) &&& BC4.REP18) 0
      · rfl
      · rw [Nat.eq_of_beq_eq_true e, Nat.zero_testBit] at hc1; exact absurd hc1 (by decide)
    rw [hne, cond_false]
    -- the pivot row
    have hp : Nat.land (Nat.div k.M (Nat.xor ((k.M >>> h) &&& BC4.REP18) (Nat.land ((k.M >>> h) &&& BC4.REP18)
        (Nat.pred ((k.M >>> h) &&& BC4.REP18))))) BC4.M18 = n.M.sl z0 := by
      show (k.M / (((k.M >>> h) &&& BC4.REP18) ^^^ (((k.M >>> h) &&& BC4.REP18) &&& (((k.M >>> h) &&& BC4.REP18) - 1))))
        &&& BC4.M18 = _
      rw [hlb, ← Nat.shiftRight_eq_div_pow, eM]
      exact S9.slot_toNat n.M wM z0 hz0.1
    obtain ⟨nP, nM, nPM, nrk⟩ := stepE_flag h n z0 hz0.1 hz0.2 hlow
    have hpl : n.M.sl z0 < 2 ^ 18 := n.M.wf_sl wM z0
    have wP' : (stepE h n).P.WF := S9.wf_of_sl _ (fun z hz => by rw [nP z hz]; exact puS_lt h _ n.P wP hpl z)
    have wM' : (stepE h n).M.WF := S9.wf_of_sl _ (fun z hz => by rw [nM z hz]; exact muS_lt h _ n.M wM hpl z)
    refine ⟨?_, ?_, ?_, ?_, wP', wM'⟩
    · show Nat.lor (Nat.xor k.P (Nat.mul (Nat.land (Nat.shiftRight k.P h) BC4.REP18) (Nat.land (Nat.div k.M
          (Nat.xor ((k.M >>> h) &&& BC4.REP18) (Nat.land ((k.M >>> h) &&& BC4.REP18) (Nat.pred ((k.M >>> h) &&& BC4.REP18)))))
          BC4.M18))) (Nat.shiftLeft (Nat.land (Nat.div k.M (Nat.xor ((k.M >>> h) &&& BC4.REP18)
          (Nat.land ((k.M >>> h) &&& BC4.REP18) (Nat.pred ((k.M >>> h) &&& BC4.REP18))))) BC4.M18) (Nat.mul 18 h)) = _
      rw [hp, eP]
      symm
      apply S9.toNat_eq _ wP' _ (kP_lt _ _ h (n.P.toNat_lt wP) hpl hh)
      intro z hz j hj
      rw [nP z hz, puS_bit, kP_bit _ _ h z j hpl hj, S9.testBit_toNat n.P wP z j hz hj,
        S9.testBit_toNat n.P wP z h hz (by omega)]
      simp [hz]
    · show Nat.lor k.PM (Nat.shiftLeft 1 h) = _
      rw [nPM, ePM, pw_fact h (by omega), Nat.shiftLeft_eq', Nat.one_shiftLeft]
    · show Nat.succ k.rk = _; rw [nrk, erk]
    · show Nat.xor k.M (Nat.mul ((k.M >>> h) &&& BC4.REP18) (Nat.land (Nat.div k.M
          (Nat.xor ((k.M >>> h) &&& BC4.REP18) (Nat.land ((k.M >>> h) &&& BC4.REP18) (Nat.pred ((k.M >>> h) &&& BC4.REP18)))))
          BC4.M18)) = _
      rw [hp]
      symm
      have hlt : Nat.xor k.M (Nat.mul (Nat.land (Nat.shiftRight k.M h) BC4.REP18) (n.M.sl z0)) < 2 ^ 162 :=
        Nat.xor_lt_two_pow (by rw [eM]; exact n.M.toNat_lt wM) (cand_mul_lt _ _ h hpl)
      apply S9.toNat_eq _ wM' _ hlt
      intro z hz j hj
      rw [nM z hz, muS_bit, kM_bit _ _ h z j hpl hj, eM, S9.testBit_toNat n.M wM z j hz hj,
        S9.testBit_toNat n.M wM z h hz (by omega)]
      simp [hz]
  · have hn : ∀ z < 9, nbit (n.M.sl z) h = false := fun z hz => by
      by_contra hc; exact hany ⟨z, hz, by simpa using hc⟩
    have h0 : (k.M >>> h) &&& BC4.REP18 = 0 := by
      apply Nat.eq_of_testBit_eq; intro i
      rw [hcand, Nat.zero_testBit]
      by_cases hi : i % 18 = 0 ∧ i < 162
      · rw [hn _ (by omega)]; simp
      · simp [hi]
    rw [h0, stepE_noflag h n hn]
    exact ⟨eP, ePM, erk, eM, wP, wM⟩

theorem S9.zero_toNat : S9.zero.toNat = 0 := by simp [S9.zero, S9.toNat]
theorem S9.zero_wf : S9.zero.WF := by simp [S9.zero, S9.WF]

theorem elim_unfold (M : Nat) : BC5.elim M = BC5.stepE 0 (BC5.stepE 1 (BC5.stepE 2 (BC5.stepE 3 (BC5.stepE 4 (BC5.stepE 5
    (BC5.stepE 6 (BC5.stepE 7 (BC5.stepE 8 ⟨0, 0, 0, 0, 0, M⟩)))))))) := rfl

/-- **the native elimination is the kernel's** -/
theorem elim_rel (M : S9) (hM : M.WF) : ESrel (BC5.elim M.toNat) (elim M) := by
  rw [elim_unfold]
  unfold elim
  have h0 : ESrel ⟨0, 0, 0, 0, 0, M.toNat⟩ ⟨S9.zero, 0, 0, M⟩ := ⟨S9.zero_toNat.symm, rfl, rfl, rfl, S9.zero_wf, hM⟩
  exact stepE_rel _ _ 0 (by norm_num) (stepE_rel _ _ 1 (by norm_num) (stepE_rel _ _ 2 (by norm_num) (stepE_rel _ _ 3
    (by norm_num) (stepE_rel _ _ 4 (by norm_num) (stepE_rel _ _ 5 (by norm_num) (stepE_rel _ _ 6 (by norm_num)
    (stepE_rel _ _ 7 (by norm_num) (stepE_rel _ _ 8 (by norm_num) h0))))))))

end NL
