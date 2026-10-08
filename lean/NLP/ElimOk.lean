module
public import R22Port.U_d41d8cd98f00
public import NLP.Elim
/-! # NLP.ElimOk: `elimOk`, `lmC`, `kerM` on slots are the kernel's -/
@[expose] public section
namespace NL
open Nat S5

theorem land_eq_zero_iff (x m : Nat) : x &&& m = 0 ↔ ∀ i, m.testBit i = true → x.testBit i = false := by
  constructor
  · intro h i hm
    have := congrArg (fun y => y.testBit i) h
    simp only [Nat.testBit_and, Nat.zero_testBit, hm, Bool.and_true] at this; exact this
  · intro h; apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.testBit_and, Nat.zero_testBit]
    cases hm : m.testBit i
    · simp
    · simp [h i hm]

theorem beq_true_iff (a b : Nat) : Nat.beq a b = true ↔ a = b := by rw [Nat.beq_eq]

theorem lt18_bits (y : Nat) (hy : y < 2 ^ 18) (j : Nat) (hj : ¬ j < 18) : y.testBit j = false :=
  Nat.testBit_lt_two_pow (lt_of_lt_of_le hy (Nat.pow_le_pow_right (by norm_num) (by omega)))

/-- slot form of (a): leftover left halves are 0 -/
theorem condA (M : S9) (hM : M.WF) :
    Nat.beq (Nat.land M.toNat BC4.LEFT9) 0 = true ↔ ∀ z < 9, Nat.land (M.sl z) 511 = 0 := by
  rw [beq_true_iff, Nat.land_eq, land_eq_zero_iff]
  constructor
  · intro h z hz
    rw [Nat.land_eq, land_eq_zero_iff]
    intro j hj
    rw [show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one] at hj
    simp only [decide_eq_true_eq] at hj
    have := h (18 * z + j) (by rw [left9_bit]; simp; omega)
    rwa [S9.testBit_toNat M hM z j hz (by omega)] at this
  · intro h i hi
    rw [left9_bit] at hi; simp only [decide_eq_true_eq] at hi
    have hz := h (i / 18) (by omega)
    rw [Nat.land_eq, land_eq_zero_iff] at hz
    have := hz (i % 18) (by rw [show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one]; simp; omega)
    rw [show i = 18 * (i / 18) + i % 18 by omega, S9.testBit_toNat M hM _ _ (by omega) (by omega)]; exact this

/-- slot form of (b): no left-half bit above the slot index -/
theorem condB (P : S9) (hP : P.WF) :
    Nat.beq (Nat.land P.toNat BC4.HM) 0 = true ↔
      ∀ z < 9, Nat.beq (Nat.shiftRight (Nat.land (P.sl z) 511) (Nat.succ z)) 0 = true := by
  rw [beq_true_iff, Nat.land_eq, land_eq_zero_iff]
  constructor
  · intro h z hz
    rw [beq_true_iff]
    apply Nat.eq_of_testBit_eq; intro t
    show ((P.sl z &&& 511) >>> (z + 1)).testBit t = _
    rw [Nat.testBit_shiftRight, Nat.testBit_and, show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one,
      Nat.zero_testBit]
    by_cases ht : z + 1 + t < 9
    · have := h (18 * z + (z + 1 + t)) (by rw [hm_bit]; simp; omega)
      rw [S9.testBit_toNat P hP z _ hz (by omega)] at this; simp [this]
    · simp [ht]
  · intro h i hi
    rw [hm_bit] at hi; simp only [decide_eq_true_eq] at hi
    have hz := h (i / 18) (by omega)
    rw [beq_true_iff] at hz
    have := congrArg (fun y => y.testBit (i % 18 - (i / 18 + 1))) hz
    simp only [Nat.zero_testBit] at this
    change ((P.sl (i / 18) &&& 511) >>> (i / 18 + 1)).testBit (i % 18 - (i / 18 + 1)) = false at this
    rw [Nat.testBit_shiftRight, Nat.testBit_and, show (511 : Nat) = 2 ^ 9 - 1 by norm_num, Nat.testBit_two_pow_sub_one,
      show i / 18 + 1 + (i % 18 - (i / 18 + 1)) = i % 18 by omega] at this
    rw [show i = 18 * (i / 18) + i % 18 by omega, S9.testBit_toNat P hP _ _ (by omega) (by omega)]
    simpa [show i % 18 < 9 by omega] using this

theorem dg_slot (DG PM z j : Nat) (hdg : ∀ i, DG.testBit i = (decide (i % 19 = 0) && PM.testBit (i / 19)))
    (hz : z < 9) (hj : j < 18) : DG.testBit (18 * z + j) = (decide (j = z) && PM.testBit z) := by
  rw [hdg]
  by_cases e : j = z
  · subst e; rw [show (18 * j + j) / 19 = j by omega]; simp [show (18 * j + j) % 19 = 0 by omega]
  · have : (18 * z + j) % 19 ≠ 0 := by omega
    simp [this, e]

/-- slot form of (c): pivot bits as `PM` says -/
theorem condC (P : S9) (hP : P.WF) (PM DG : Nat) (hpm : ∀ j, PM.testBit j = true → j < 9)
    (hdg : ∀ i, DG.testBit i = (decide (i % 19 = 0) && PM.testBit (i / 19))) :
    Nat.beq (Nat.land P.toNat (Nat.mul PM BC4.REP18)) DG = true ↔
      ∀ z < 9, Nat.beq (Nat.land (P.sl z) PM) (cond (nbit PM z) (pw z) 0) = true := by
  have hPM : PM < 2 ^ 18 := Nat.lt_pow_two_of_testBit _ (fun i hi => by
    cases h : PM.testBit i
    · rfl
    · exact absurd (hpm i h) (by omega))
  have hprod : ∀ i, (Nat.mul PM BC4.REP18).testBit i = (decide (i < 162) && PM.testBit (i % 18)) := by
    intro i
    show (PM * BC4.REP18).testBit i = _
    rw [Nat.mul_comm, testBit_sparse_mul (by norm_num) _ PM hPM rep18_sparse, rep18_bit]
    by_cases hi : i < 162
    · simp [hi, show 18 * (i / 18) % 18 = 0 by omega, show 18 * (i / 18) < 162 by omega]
    · simp [hi, show ¬ (18 * (i / 18) < 162) by omega]
  rw [beq_true_iff]
  constructor
  · intro h z hz
    rw [beq_true_iff]
    apply Nat.eq_of_testBit_eq; intro j
    have hb := congrArg (fun y => y.testBit (18 * z + j)) h
    simp only at hb
    rw [Nat.land_eq, Nat.testBit_and, hprod] at hb
    rw [Nat.land_eq, Nat.testBit_and, tb_cond0, pw_fact z (by omega), Nat.testBit_two_pow, nbit_eq]
    by_cases hj : j < 18
    · rw [S9.testBit_toNat P hP z j hz hj, dg_slot DG PM z j hdg hz hj, show (18 * z + j) % 18 = j by omega] at hb
      simp only [show 18 * z + j < 162 by omega, decide_true, Bool.true_and] at hb
      rw [hb]; by_cases e : j = z
      · subst e; simp
      · simp [e, Ne.symm e]
    · rw [lt18_bits _ (P.wf_sl hP z) j hj]
      have : z ≠ j := by omega
      simp [this]
  · intro h
    apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.land_eq, Nat.testBit_and, hprod]
    by_cases hi : i < 162
    · have hz := h (i / 18) (by omega)
      rw [beq_true_iff] at hz
      have hb := congrArg (fun y => y.testBit (i % 18)) hz
      simp only at hb
      rw [Nat.land_eq, Nat.testBit_and, tb_cond0, pw_fact _ (by omega), Nat.testBit_two_pow, nbit_eq] at hb
      rw [show i = 18 * (i / 18) + i % 18 by omega, S9.testBit_toNat P hP _ _ (by omega) (by omega),
        dg_slot DG PM _ _ hdg (by omega) (by omega), show (18 * (i / 18) + i % 18) % 18 = i % 18 by omega]
      simp only [show 18 * (i / 18) + i % 18 < 162 by omega, decide_true, Bool.true_and]
      rw [hb]
      by_cases e : i % 18 = i / 18
      · rw [e]; simp
      · simp [e, Ne.symm e]
    · rw [S9.testBit_hi P hP i (by omega), hdg]
      simp only [Bool.false_and]
      by_cases h19 : i % 19 = 0
      · have : PM.testBit (i / 19) = false := by
          cases hb : PM.testBit (i / 19)
          · rfl
          · exact absurd (hpm _ hb) (by omega)
        simp [this]
      · simp [h19]

/-- slot form of (d): zero off `PM` -/
theorem condD (P : S9) (hP : P.WF) (PM D18 : Nat) (hd : ∀ i, D18.testBit i = (decide (i % 18 = 0) && PM.testBit (i / 18))) :
    Nat.beq (Nat.land P.toNat (Nat.mul D18 BC4.M18)) P.toNat = true ↔ ∀ z < 9, (nbit PM z || Nat.beq (P.sl z) 0) = true := by
  have hm18 : BC4.M18 < 2 ^ 18 := by rw [m18_eq]; norm_num
  have hsp : ∀ i, D18.testBit i = true → i % 18 = 0 := fun i h => by rw [hd] at h; simp at h; exact h.1
  have hprod : ∀ i, (Nat.mul D18 BC4.M18).testBit i = (PM.testBit (i / 18) && decide (i % 18 < 18)) := by
    intro i
    show (D18 * BC4.M18).testBit i = _
    rw [testBit_sparse_mul (by norm_num) _ _ hm18 hsp, hd, m18_eq, Nat.testBit_two_pow_sub_one]
    simp [show 18 * (i / 18) % 18 = 0 by omega, show 18 * (i / 18) / 18 = i / 18 by omega]
  rw [beq_true_iff]
  constructor
  · intro h z hz
    rw [nbit_eq]
    cases hpz : PM.testBit z
    · simp only [Bool.false_or, beq_true_iff]
      apply Nat.eq_of_testBit_eq; intro j
      rw [Nat.zero_testBit]
      by_cases hj : j < 18
      · have hb := congrArg (fun y => y.testBit (18 * z + j)) h
        simp only at hb
        rw [Nat.land_eq, Nat.testBit_and, hprod, show (18 * z + j) / 18 = z by omega, hpz] at hb
        simp only [Bool.false_and, Bool.and_false] at hb
        rw [← S9.testBit_toNat P hP z j hz hj]; exact hb.symm
      · exact lt18_bits _ (P.wf_sl hP z) j hj
    · simp
  · intro h
    apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.land_eq, Nat.testBit_and, hprod]
    by_cases hi : i < 162
    · have hz := h (i / 18) (by omega)
      rw [nbit_eq] at hz
      cases hpz : PM.testBit (i / 18)
      · rw [hpz, Bool.false_or, beq_true_iff] at hz
        rw [show i = 18 * (i / 18) + i % 18 by omega, S9.testBit_toNat P hP _ _ (by omega) (by omega), hz]
        simp
      · simp [show i % 18 < 18 by omega]
    · rw [S9.testBit_hi P hP i (by omega)]; simp

theorem okP_iff (PM z x : Nat) :
    okP PM z x = true ↔ (Nat.beq (Nat.shiftRight (Nat.land x 511) (Nat.succ z)) 0 = true ∧
      Nat.beq (Nat.land x PM) (cond (nbit PM z) (pw z) 0) = true ∧ (nbit PM z || Nat.beq x 0) = true) := by
  unfold okP; simp only [Bool.and_eq_true, and_assoc]

/-- **native `elimOk` is the kernel's** (on related states; `Pre 0` gives the kernel's `DG`, `D18`) -/
theorem elimOk_eq (k : BC5.ES) (n : ES) (hr : ESrel k n) (hpre : Pre 0 k) : elimOk n = BC5.elimOk k := by
  obtain ⟨eP, ePM, erk, eM, wP, wM⟩ := hr
  have hpm : ∀ j, n.PM.testBit j = true → j < 9 := fun j hj => (hpre.pm j (by rw [ePM]; exact hj)).2
  have hdg : ∀ i, k.DG.testBit i = (decide (i % 19 = 0) && n.PM.testBit (i / 19)) := fun i => by rw [hpre.dg, ePM]
  have hd18 : ∀ i, k.D18.testBit i = (decide (i % 18 = 0) && n.PM.testBit (i / 18)) := fun i => by rw [hpre.d18, ePM]
  apply Bool.eq_iff_iff.mpr
  have hk : BC5.elimOk k = (Nat.beq (Nat.land k.M BC4.LEFT9) 0 && Nat.beq (Nat.land k.P BC4.HM) 0 &&
      Nat.beq (Nat.land k.P (Nat.mul k.PM BC4.REP18)) k.DG && Nat.beq (Nat.land k.P (Nat.mul k.D18 BC4.M18)) k.P) := rfl
  rw [hk, eM, eP, ePM]
  simp only [Bool.and_eq_true]
  rw [condA n.M wM, condB n.P wP, condC n.P wP n.PM k.DG hpm hdg, condD n.P wP n.PM k.D18 hd18]
  unfold elimOk
  simp only [Bool.and_eq_true, okP_iff]
  constructor
  · rintro ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨a0, a1⟩, a2⟩, a3⟩, a4⟩, a5⟩, a6⟩, a7⟩, a8⟩, p0⟩, p1⟩, p2⟩, p3⟩, p4⟩, p5⟩, p6⟩, p7⟩, p8⟩
    refine ⟨⟨⟨fun z hz => ?_, fun z hz => ?_⟩, fun z hz => ?_⟩, fun z hz => ?_⟩ <;>
    interval_cases z <;> simp_all [S9.sl, beq_true_iff]
  · rintro ⟨⟨⟨hA, hB⟩, hC⟩, hD⟩
    have a := fun z hz => (beq_true_iff _ _).mpr (hA z hz)
    refine ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨a 0 (by norm_num), a 1 (by norm_num)⟩, a 2 (by norm_num)⟩, a 3 (by norm_num)⟩,
      a 4 (by norm_num)⟩, a 5 (by norm_num)⟩, a 6 (by norm_num)⟩, a 7 (by norm_num)⟩, a 8 (by norm_num)⟩,
      ⟨hB 0 (by norm_num), hC 0 (by norm_num), hD 0 (by norm_num)⟩⟩, ⟨hB 1 (by norm_num), hC 1 (by norm_num),
      hD 1 (by norm_num)⟩⟩, ⟨hB 2 (by norm_num), hC 2 (by norm_num), hD 2 (by norm_num)⟩⟩, ⟨hB 3 (by norm_num),
      hC 3 (by norm_num), hD 3 (by norm_num)⟩⟩, ⟨hB 4 (by norm_num), hC 4 (by norm_num), hD 4 (by norm_num)⟩⟩,
      ⟨hB 5 (by norm_num), hC 5 (by norm_num), hD 5 (by norm_num)⟩⟩, ⟨hB 6 (by norm_num), hC 6 (by norm_num),
      hD 6 (by norm_num)⟩⟩, ⟨hB 7 (by norm_num), hC 7 (by norm_num), hD 7 (by norm_num)⟩⟩, ⟨hB 8 (by norm_num),
      hC 8 (by norm_num), hD 8 (by norm_num)⟩⟩

/-! ## `lmC`, `kerM` -/

theorem andn_perp (acc : M8) (v : Nat) (hv : v < 512) : (acc.andn (nperpM v)).toNat = Nat.land acc.toNat (BC5.perp v) := by
  rw [M8.toNat_andn, nperpM_fact v hv]; rfl

def kmK (M z acc : Nat) : Nat :=
  cond (Nat.beq (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) BC4.M18) 0) acc
    (Nat.land acc (BC5.perp (Nat.shiftRight (Nat.land (Nat.shiftRight M (Nat.mul 18 z)) BC4.M18) 9)))

theorem kerM_unfold (M : Nat) : BC5.kerM M = kmK M 0 (kmK M 1 (kmK M 2 (kmK M 3 (kmK M 4 (kmK M 5 (kmK M 6 (kmK M 7
    (kmK M 8 BC4.M512)))))))) := rfl

theorem kmStep_eq (M : S9) (hM : M.WF) (z : Nat) (hz : z < 9) (acc : M8) :
    (kmStep (M.sl z) acc).toNat = kmK M.toNat z acc.toNat := by
  unfold kmStep kmK
  rw [S9.slot_toNat M hM z hz]
  cases Nat.beq (M.sl z) 0
  · simp only [cond_false]
    have : Nat.shiftRight (M.sl z) 9 < 512 := by
      show M.sl z >>> 9 < 512; rw [Nat.shiftRight_eq_div_pow]; have := M.wf_sl hM z; omega
    exact andn_perp acc _ this
  · rfl

/-- **native `kerM` is the kernel's** -/
theorem kerM_eq (M : S9) (hM : M.WF) : (kerM M).toNat = BC5.kerM M.toNat := by
  rw [kerM_unfold]
  unfold kerM
  have h := fun z hz acc => kmStep_eq M hM z hz acc
  simp only [S9.sl] at h
  rw [h 0 (by norm_num), h 1 (by norm_num), h 2 (by norm_num), h 3 (by norm_num), h 4 (by norm_num), h 5 (by norm_num),
    h 6 (by norm_num), h 7 (by norm_num), h 8 (by norm_num), m512_fact]

def lmK (P PM j acc : Nat) : Nat :=
  cond (BC5.bit PM j) acc (Nat.land acc (BC5.perp (Nat.lor (BC5.gather P j) (Nat.shiftLeft 1 j))))

theorem lmC_unfold (P PM : Nat) : BC5.lmC P PM = lmK P PM 0 (lmK P PM 1 (lmK P PM 2 (lmK P PM 3 (lmK P PM 4 (lmK P PM 5
    (lmK P PM 6 (lmK P PM 7 (lmK P PM 8 BC4.M512)))))))) := rfl

theorem lmStep_eq (P : S9) (hP : P.WF) (PM j : Nat) (hj : j < 9) (acc : M8) :
    (lmStep P PM j acc).toNat = lmK P.toNat PM j acc.toNat := by
  unfold lmStep lmK
  rw [show nbit PM j = BC5.bit PM j from rfl]
  cases BC5.bit PM j
  · simp only [cond_false]
    rw [gather_eq P hP j (by omega), pw_fact j (by omega), Nat.shiftLeft_eq', Nat.one_shiftLeft]
    have hlt : Nat.lor (BC5.gather P.toNat j) (2 ^ j) < 512 := by
      rw [Nat.lor_eq]
      exact Nat.or_lt_two_pow (n := 9) (S5.gather_lt _ j) (Nat.pow_lt_pow_right (by norm_num) hj)
    exact andn_perp acc _ hlt
  · rfl

/-- **native `lmC` is the kernel's** -/
theorem lmC_eq (P : S9) (hP : P.WF) (PM : Nat) : (lmC P PM).toNat = BC5.lmC P.toNat PM := by
  rw [lmC_unfold]
  unfold lmC
  rw [lmStep_eq P hP PM 0 (by norm_num), lmStep_eq P hP PM 1 (by norm_num), lmStep_eq P hP PM 2 (by norm_num),
    lmStep_eq P hP PM 3 (by norm_num), lmStep_eq P hP PM 4 (by norm_num), lmStep_eq P hP PM 5 (by norm_num),
    lmStep_eq P hP PM 6 (by norm_num), lmStep_eq P hP PM 7 (by norm_num), lmStep_eq P hP PM 8 (by norm_num), m512_fact]

end NL
