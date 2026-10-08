module
public import R22Port.U_42f6258c22a3
public import NNP.Kill
public import NN.Node2
/-! # NNP.Kill2: an accepted kill of the r3 path kills its child (`killOK_sound` with explicit fields) -/
@[expose] public section
set_option maxHeartbeats 2000000
namespace NNP
open NN R3RT.SpecO
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- **an accepted kill record kills its child** -/
theorem killOK2_sound (tab : Tab) (hW : TabWF tab) (ids : Array Nat) (D' N' : Array UInt64) (w0 nV n1 m nu : Nat)
    (k : Kill) (S' last d : Nat)
    (hS : S' < 2 ^ 511) (hb : ∀ l, S'.testBit l = true → l ≤ last)
    (hcard : ((Finset.range 511).filter (fun l => S'.testBit l = true)).card = d)
    (hw0 : w0 = last + 1) (hnu : nu = 21 - d) (hm : m ≤ ids.size) (hn1 : nV + n1 ≤ m)
    (hR1 : ∀ p, nV ≤ p → p < nV + n1 → RowOK O Ω (dictRowV tab ids p % 2 ^ 511)
      (L5.pcnt 512 (dictRowV tab ids p &&& S') + 1))
    (hR2 : ∀ p, nV + n1 ≤ p → p < m → RowOK O Ω (dictRowV tab ids p % 2 ^ 511)
      (L5.pcnt 512 (dictRowV tab ids p &&& S') + 2))
    (hdead : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ l, last < l → l < 511 → (natL D' 0 8).testBit l = true → ¬ Has O A l)
    (hconf : ∀ A : R3RT.Spec.Dec22, Ω A → Below O A S' last →
      ∀ v w, v < 511 → w < 511 → S'.testBit v = false → S'.testBit w = false → v ≠ w →
        (natL N' 0 4096 >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w)
    (h : killOK2 tab ids D' N' w0 nV n1 m nu k = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A S' last k.u := by
  intro A hΩ hC
  unfold killOK2 at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨hwu, hu511⟩, hex⟩, hcv⟩, hcnt⟩ := h
  -- the child label
  set u := k.u with hudef
  set nX := k.ex.size with hnX
  set nC := k.cv.size with hnC
  set ix := fun (i : Nat) => k.ex.getD i 0 with hix
  set iy := fun (i : Nat) => k.cv.getD i 0 with hiy
  have hlu : last < u := by omega
  have hu64 : u / 64 < 8 := by omega
  have hum : u % 64 < 64 := Nat.mod_lt _ (by norm_num)
  have hdec : 64 * (u / 64) + u % 64 = u := by omega
  -- the rows
  set exR : Nat → Nat := fun i => if ix i < n1 then dictRowV tab ids (nV + ix i) else 0 with hexR
  set cvR : Nat → Nat := fun i => if nV + iy i < m then dictRowV tab ids (nV + iy i) else 0 with hcvR
  have hexb : ∀ i < nX, ix i < n1 ∧ (dictRowV tab ids (nV + ix i)).testBit u = true := by
    intro i hi
    have := (allN_iff _ _).mp hex i hi
    simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    obtain ⟨h1, h2⟩ := this
    rw [bitTest _ _ hum, dW_bit tab ids m _ _ _ hm hu64 hum, if_pos (by omega), hdec] at h2
    exact ⟨h1, h2⟩
  have hcvb : ∀ i < nC, (cvR i).testBit u = !decide (iy i < n1) ∧ nV + iy i < m := by
    intro i hi
    have := (allN_iff _ _).mp hcv i hi
    simp only [beq_iff_eq] at this
    rw [bitVal _ _ hum, dW_bit tab ids m _ _ _ hm hu64 hum, hdec] at this
    by_cases hc1 : iy i < n1
    · have hlt : nV + iy i < m := by omega
      rw [if_pos hc1, if_pos hlt] at this
      have hb0 : (dictRowV tab ids (nV + iy i)).testBit u = false := by
        by_contra hb1; rw [Bool.not_eq_false] at hb1; rw [if_pos hb1] at this; exact absurd this (by decide)
      refine ⟨?_, hlt⟩
      simp only [hcvR, if_pos hlt, hb0, decide_eq_true hc1, Bool.not_true]
    · rw [if_neg hc1] at this
      by_cases hlt : nV + iy i < m
      · rw [if_pos hlt] at this
        have hb1 : (dictRowV tab ids (nV + iy i)).testBit u = true := by
          by_contra hb0; rw [Bool.not_eq_true] at hb0; rw [if_neg (by rw [hb0]; decide)] at this
          exact absurd this (by decide)
        refine ⟨?_, hlt⟩
        simp only [hcvR, if_pos hlt, hb1, decide_eq_false hc1, Bool.not_false]
      · rw [if_neg hlt, Nat.zero_testBit, if_neg (by decide)] at this; exact absurd this (by decide)
  -- the window slot of u
  set x1 : Nat → UInt64 := fun k => aboveW (u + 1) k &&& ~~~(D'.getD k 0) &&& ~~~(N'.getD (8 * u + k) 0) with hx1
  set X1 := natF x1 8 with hX1def
  have hBl : Below O A S' last := L5O.cont_below A S' last u hC
  have hSfalse : ∀ l, last < l → S'.testBit l = false := by
    intro l hl; cases hbt : S'.testBit l
    · rfl
    · have := hb l hbt; omega
  have hHu : Has O A u := L5O.cont_has A S' last u hC
  have hX1 : ∀ l, u < l → Has O A l → X1.testBit l = true := by
    intro l hul hAl
    have hl511 : l < 511 := hAl.1
    have hD'l : (D'.getD (l / 64) 0).toNat.testBit (l % 64) = false := by
      have e : (natL D' 0 8).testBit l = (D'.getD (l / 64) 0).toNat.testBit (l % 64) := by
        rw [natL_testBit, decide_eq_true (by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add]
      rw [← e]
      cases hbt : (natL D' 0 8).testBit l
      · rfl
      · exact absurd hAl (hdead A hΩ hBl l (by omega) hl511 hbt)
    have hN'l : (N'.getD (8 * u + l / 64) 0).toNat.testBit (l % 64) = false := by
      have e : (natL N' 0 4096 >>> (512 * u)).testBit l = (N'.getD (8 * u + l / 64) 0).toNat.testBit (l % 64) := by
        rw [Nat.testBit_shiftRight, natL_testBit, decide_eq_true (by omega), Bool.true_and, getElem!_eq_getD',
          Nat.zero_add, show (512 * u + l) / 64 = 8 * u + l / 64 by omega, show (512 * u + l) % 64 = l % 64 by omega]
      rw [← e]
      cases hbt : (natL N' 0 4096 >>> (512 * u)).testBit l
      · rfl
      · exact absurd hAl (hconf A hΩ hBl u l hu511 hl511 (hSfalse u hlu) (hSfalse l (by omega)) (by omega) hbt hHu)
    rw [hX1def, natF_testBit, decide_eq_true (by omega), Bool.true_and]
    simp only [hx1, tb_and, tb_not, hD'l, hN'l, aboveW_bit _ _ _ (Nat.mod_lt l (by norm_num)) (show l / 64 < 8 by omega)]
    simp only [show 64 * (l / 64) + l % 64 = l by omega, decide_eq_true (show u + 1 ≤ l ∧ l < 511 by omega),
      decide_eq_true (Nat.mod_lt l (show 64 > 0 by norm_num)), Bool.not_false, Bool.and_true]
  -- the final free set
  set z : Nat → UInt64 := fun k =>
    orN (fun i => if ix i < n1 then dW tab ids m (nV + ix i) k else 0) nX |||
      orN (fun i => dW tab ids m (nV + iy i) k) nC with hz
  set yW : Nat → UInt64 := fun k => x1 k &&& ~~~(z k) with hyW
  set Y := natF yW 8 with hYdef
  have hzb : ∀ l, l < 512 → ((z (l / 64)).toNat.testBit (l % 64) = true ↔
      (∃ i < nX, (exR i).testBit l = true) ∨ (∃ i < nC, (cvR i).testBit l = true)) := by
    intro l hl
    have hk : l / 64 < 8 := by omega
    have hj : l % 64 < 64 := Nat.mod_lt _ (by norm_num)
    have hkl : 64 * (l / 64) + l % 64 = l := by omega
    simp only [hz, tb_or, Bool.or_eq_true, orN_testBit]
    apply or_congr
    · apply exists_congr; intro i; apply and_congr_right; intro _
      simp only [hexR]
      by_cases hi1 : ix i < n1
      · rw [if_pos hi1, if_pos hi1, dW_bit tab ids m _ _ _ hm hk hj, if_pos (by omega), hkl]
      · rw [if_neg hi1, if_neg hi1, tb_zero, Nat.zero_testBit]
    · apply exists_congr; intro i; apply and_congr_right; intro _
      simp only [hcvR]
      rw [dW_bit tab ids m _ _ _ hm hk hj, hkl]
  have hY : ∀ l, Y.testBit l = true ↔ X1.testBit l = true ∧ (∀ i < nX, (exR i).testBit l = false) ∧
      (∀ i < nC, (cvR i).testBit l = false) := by
    intro l
    by_cases hl : l < 512
    · rw [hYdef, hX1def, natF_testBit, natF_testBit, decide_eq_true (by omega), Bool.true_and, Bool.true_and]
      simp only [hyW, tb_and, tb_not, Bool.and_eq_true, Bool.not_eq_true', decide_eq_true_eq]
      have hzl := hzb l hl
      constructor
      · rintro ⟨hx, _, hzf⟩
        refine ⟨hx, fun i hi => ?_, fun i hi => ?_⟩
        · cases hbt : (exR i).testBit l
          · rfl
          · have := hzl.mpr (Or.inl ⟨i, hi, hbt⟩); rw [hzf] at this; exact absurd this (by decide)
        · cases hbt : (cvR i).testBit l
          · rfl
          · have := hzl.mpr (Or.inr ⟨i, hi, hbt⟩); rw [hzf] at this; exact absurd this (by decide)
      · rintro ⟨hx, hexf, hcvf⟩
        refine ⟨hx, Nat.mod_lt _ (by norm_num), ?_⟩
        cases hbt : (z (l / 64)).toNat.testBit (l % 64)
        · rfl
        · rcases hzl.mp hbt with ⟨i, hi, hb'⟩ | ⟨i, hi, hb'⟩
          · rw [hexf i hi] at hb'; exact absurd hb' (by decide)
          · rw [hcvf i hi] at hb'; exact absurd hb' (by decide)
    · rw [hYdef, hX1def, natF_testBit, natF_testBit, decide_eq_false (by omega), Bool.false_and, Bool.false_and]
      simp
  -- the count
  have hlow : ∀ k, k < (u + 1) / 64 → pop64 (yW k) = 0 := by
    intro k hk
    have : yW k = 0 := by
      apply UInt64.toNat.inj
      apply Nat.eq_of_testBit_eq; intro j
      simp only [hyW, hx1, tb_and]
      by_cases hj : j < 64
      · rw [aboveW_bit _ _ _ hj (by omega), decide_eq_false (by omega)]; simp
      · rw [tb_lt64 _ _ (by omega)]; simp [tb_lt64 _ _ (by omega : 64 ≤ j)]
    rw [this, pop64_eq]; simp [L5.pcnt_zero_x]
  have hpc : sumFrom (fun k => pop64 (yW k)) ((u + 1) / 64) 8 = L5.pcnt 512 Y := by
    rw [sumFrom_eq, hYdef, show (512 : Nat) = 64 * 8 by norm_num, ← sum_pop_eq]
    rw [← Finset.sum_range_add_sum_Ico _ (show (u + 1) / 64 ≤ 8 by omega)]
    rw [Finset.sum_eq_zero (fun k hk => hlow k (Finset.mem_range.mp hk)), Nat.zero_add]
  have hcount : L5.pcnt 512 Y + nC < 21 - d := by
    have := hcnt; rw [hpc, hnu] at this; exact this
  -- the rows' validity
  have hex' : ∀ i < nX, (exR i).testBit u = true ∧ RowOK O Ω (exR i % 2 ^ 511) (L5.pcnt 512 (exR i &&& S') + 1) := by
    intro i hi
    obtain ⟨h1, h2⟩ := hexb i hi
    simp only [hexR, if_pos h1]
    exact ⟨h2, hR1 _ (by omega) (by omega)⟩
  have hcv' : ∀ i < nC, RowOK O Ω (cvR i % 2 ^ 511) (L5.pcnt 512 (cvR i &&& S') + 1 + ((cvR i).testBit u).toNat) := by
    intro i hi
    obtain ⟨h1, h2⟩ := hcvb i hi
    rw [h1]
    simp only [hcvR, if_pos h2]
    by_cases hc1 : iy i < n1
    · rw [decide_eq_true hc1]; simp only [Bool.not_true, Bool.toNat_false, Nat.add_zero]
      exact hR1 _ (by omega) (by omega)
    · rw [decide_eq_false hc1]; simp only [Bool.not_false, Bool.toNat_true]
      exact hR2 _ (by omega) h2
  exact L5O.kill_dead A hΩ S' last u d hS hb hcard hC X1 Y nX nC exR cvR hX1 hex' hcv' hY hcount

end NNP
