module
public import R22Port.U_d41d8cd98f00
public import L5.Fold
public import R3RT.L1v5
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # The kill rule of `L1.kill4` / `R3RT.kills5`

* `excl_sem`, `cover_sem`: the reference loops (exclusion rows removed from `X`, `u` in every exclusion row; cover rows
  or-ed into `C`, side test on `u`, one count per reference).
* `kill4_sem`: one kill gives its final free set `Y = X1 ∖ ⋃ excl ∖ ⋃ cover` (`KillFacts`) in slot `j` of `KS` and its
  cover count in bits `496..` of slot `j` of `NC`.
* `kills5_sem`: `R3RT.kills5 = true` gives, for every kill `kr ∈ ks`, `KillFacts` and `|Y| + nC < nu` (the final 16-bit
  popcount and guard test, at most 512 kills). -/
namespace L5
open E1S Finset

/-! ## Reference loops -/

theorem idx_eq (rr : ℕ) : Nat.land rr 1023 = rr % 1024 := by
  rw [land_eq, show (1023 : ℕ) = 2 ^ 10 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]

theorem excl_succ (ME n rr X A : ℕ) (k : ℕ → ℕ → ℕ → Bool) :
    L1.excl ME (n + 1) rr X A k = L1.excl ME n (Nat.shiftRight rr 10)
      (Nat.sub X (Nat.land X (Nat.land (Nat.shiftRight ME (Nat.shiftLeft (Nat.land rr 1023) 9)) L1.M512)))
      (Nat.land A (Nat.land (Nat.shiftRight ME (Nat.shiftLeft (Nat.land rr 1023) 9)) L1.M512)) k := rfl

theorem excl_zero (ME rr X A : ℕ) (k : ℕ → ℕ → ℕ → Bool) : L1.excl ME 0 rr X A k = k rr X A := rfl

theorem excl_sem (ME : ℕ) : ∀ n rr X A (k : ℕ → ℕ → ℕ → Bool), L1.excl ME n rr X A k = true →
    ∃ Xf Af, k (rr >>> (10 * n)) Xf Af = true ∧
      (∀ l, Xf.testBit l = true ↔
        X.testBit l = true ∧ ∀ i < n, (dig 512 ME ((rr >>> (10 * i)) % 1024)).testBit l = false) ∧
      (∀ l, Af.testBit l = true →
        A.testBit l = true ∧ ∀ i < n, (dig 512 ME ((rr >>> (10 * i)) % 1024)).testBit l = true) := by
  intro n
  induction n with
  | zero =>
    intro rr X A k h
    rw [excl_zero] at h
    exact ⟨X, A, by simpa using h, fun l => by simp, fun l hl => ⟨hl, fun i hi => absurd hi (by omega)⟩⟩
  | succ n ih =>
    intro rr X A k h
    rw [excl_succ, dig_eq_ops, idx_eq] at h
    obtain ⟨Xf, Af, hk, hX, hA⟩ := ih _ _ _ k h
    refine ⟨Xf, Af, ?_, ?_, ?_⟩
    · rw [shr_eq, ← Nat.shiftRight_add] at hk; rw [show 10 * (n + 1) = 10 + 10 * n by ring]; exact hk
    · intro l
      rw [hX l, nsub_eq, land_eq, sub_and_testBit, Bool.and_eq_true, Bool.not_eq_true']
      constructor
      · rintro ⟨⟨h1, h2⟩, h3⟩
        refine ⟨h1, fun i hi => ?_⟩
        rcases i with _ | i
        · simpa using h2
        · have := h3 i (by omega); rw [shr_eq, ← Nat.shiftRight_add] at this
          rw [show 10 * (i + 1) = 10 + 10 * i by ring]; exact this
      · rintro ⟨h1, h2⟩
        refine ⟨⟨h1, by simpa using h2 0 (by omega)⟩, fun i hi => ?_⟩
        have := h2 (i + 1) (by omega)
        rw [shr_eq, ← Nat.shiftRight_add, show 10 + 10 * i = 10 * (i + 1) by ring]; exact this
    · intro l hl
      obtain ⟨h1, h2⟩ := hA l hl
      rw [land_eq, Nat.testBit_and, Bool.and_eq_true] at h1
      refine ⟨h1.1, fun i hi => ?_⟩
      rcases i with _ | i
      · simpa using h1.2
      · have := h2 i (by omega); rw [shr_eq, ← Nat.shiftRight_add] at this
        rw [show 10 * (i + 1) = 10 + 10 * i by ring]; exact this

theorem cover_succ (MC u b1 n rr C nc : ℕ) (k : ℕ → ℕ → Bool) :
    L1.cover MC u b1 (n + 1) rr C nc k =
      (Nat.beq (Nat.land (Nat.shiftRight (Nat.land (Nat.shiftRight MC (Nat.shiftLeft (Nat.land rr 1023) 9)) L1.M512) u) 1)
        (cond (Nat.blt (Nat.land rr 1023) b1) 0 1) &&
        L1.cover MC u b1 n (Nat.shiftRight rr 10)
          (Nat.lor C (Nat.land (Nat.shiftRight MC (Nat.shiftLeft (Nat.land rr 1023) 9)) L1.M512)) (Nat.succ nc) k) := rfl

theorem cover_zero (MC u b1 rr C nc : ℕ) (k : ℕ → ℕ → Bool) : L1.cover MC u b1 0 rr C nc k = k C nc := rfl

theorem bit_test (m u : ℕ) : Nat.land (Nat.shiftRight m u) 1 = (m.testBit u).toNat := by
  rw [Nat.toNat_testBit, land_eq, shr_eq, Nat.shiftRight_eq_div_pow, Nat.and_one_is_mod]

theorem cover_sem (MC u b1 : ℕ) : ∀ n rr C nc (k : ℕ → ℕ → Bool), L1.cover MC u b1 n rr C nc k = true →
    (∀ i < n, (dig 512 MC ((rr >>> (10 * i)) % 1024)).testBit u = !decide ((rr >>> (10 * i)) % 1024 < b1)) ∧
    ∃ Cf, k Cf (nc + n) = true ∧
      (∀ l, Cf.testBit l = true ↔ C.testBit l = true ∨ ∃ i < n, (dig 512 MC ((rr >>> (10 * i)) % 1024)).testBit l = true) := by
  intro n
  induction n with
  | zero =>
    intro rr C nc k h
    rw [cover_zero] at h
    exact ⟨fun i hi => absurd hi (by omega), C, h, fun l => by simp⟩
  | succ n ih =>
    intro rr C nc k h
    rw [cover_succ, dig_eq_ops, idx_eq, Bool.and_eq_true, bit_test] at h
    obtain ⟨h0, h1⟩ := h
    obtain ⟨hs, Cf, hk, hC⟩ := ih _ _ _ k h1
    have hside : (dig 512 MC (rr % 1024)).testBit u = !decide (rr % 1024 < b1) := by
      rw [Nat.beq_eq] at h0
      cases hb : Nat.blt (rr % 1024) b1
      · rw [hb, cond_false] at h0
        have : ¬ rr % 1024 < b1 := fun h' => by rw [Nat.blt_eq.mpr h'] at hb; exact absurd hb (by decide)
        rw [decide_eq_false this]
        cases ht : (dig 512 MC (rr % 1024)).testBit u <;> simp_all
      · rw [hb, cond_true] at h0
        rw [decide_eq_true (Nat.blt_eq.mp hb)]
        cases ht : (dig 512 MC (rr % 1024)).testBit u <;> simp_all
    refine ⟨fun i hi => ?_, Cf, by rw [show nc + (n + 1) = Nat.succ nc + n by omega]; exact hk, fun l => ?_⟩
    · rcases i with _ | i
      · simpa using hside
      · have := hs i (by omega); rw [shr_eq, ← Nat.shiftRight_add] at this
        rw [show 10 * (i + 1) = 10 + 10 * i by ring]; exact this
    · rw [hC l, lor_eq, Nat.testBit_or, Bool.or_eq_true]
      constructor
      · rintro ((h2 | h2) | ⟨i, hi, h2⟩)
        · exact Or.inl h2
        · exact Or.inr ⟨0, by omega, by simpa using h2⟩
        · refine Or.inr ⟨i + 1, by omega, ?_⟩
          rw [shr_eq, ← Nat.shiftRight_add] at h2; rw [show 10 * (i + 1) = 10 + 10 * i by ring]; exact h2
      · rintro (h2 | ⟨i, hi, h2⟩)
        · exact Or.inl (Or.inl h2)
        · rcases i with _ | i
          · exact Or.inl (Or.inr (by simpa using h2))
          · refine Or.inr ⟨i, by omega, ?_⟩
            rw [shr_eq, ← Nat.shiftRight_add, show 10 + 10 * i = 10 * (i + 1) by ring]; exact h2

/-! ## One kill -/

/-- what one kill record `kr` establishes: `u = kr % 512` is a child in the window, the exclusion rows (block `ME`) all
contain `u`, the cover rows (block `MC`) pass the side test, and `Y` is the window slot of `u` minus all their labels -/
def KillFacts (XS w0 ME MC b1 kr Y : ℕ) : Prop :=
  w0 ≤ kr % 512 ∧ kr % 512 < 511 ∧
  (∀ i < (kr >>> 9) % 32, (dig 512 ME ((kr >>> 19 >>> (10 * i)) % 1024)).testBit (kr % 512) = true) ∧
  (∀ i < (kr >>> 14) % 32, (dig 512 MC ((kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024)).testBit (kr % 512) =
      !decide ((kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024 < b1)) ∧
  (∀ l, Y.testBit l = true ↔ (dig 512 XS (kr % 512 - w0)).testBit l = true ∧
      (∀ i < (kr >>> 9) % 32, (dig 512 ME ((kr >>> 19 >>> (10 * i)) % 1024)).testBit l = false) ∧
      (∀ i < (kr >>> 14) % 32, (dig 512 MC ((kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024)).testBit l = false))

theorem m512_bit (l : ℕ) : L1.M512.testBit l = decide (l < 512) := by
  rw [M512_eq, Nat.testBit_two_pow_sub_one]

theorem f5_eq (kr s w : ℕ) (hw : w = 2 ^ s - 1) : Nat.land (Nat.shiftRight kr 9) w = (kr >>> 9) &&& w := rfl

theorem kill4_sem (XS w0 ME MC b1 kr j KS NC : ℕ) (k : ℕ → ℕ → Bool) (h : L1.kill4 XS w0 ME MC b1 kr j KS NC k = true) :
    ∃ Y, KillFacts XS w0 ME MC b1 kr Y ∧ Y < 2 ^ 512 ∧
      k (KS ||| (Y <<< (512 * j))) (NC ||| (((kr >>> 14) % 32) <<< (512 * j + 496))) = true := by
  have hu : Nat.land kr 511 = kr % 512 := by
    rw [land_eq, show (511 : ℕ) = 2 ^ 9 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  have hnX : Nat.land (Nat.shiftRight kr 9) 31 = (kr >>> 9) % 32 := by
    rw [land_eq, shr_eq, show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  have hnC : Nat.land (Nat.shiftRight kr 14) 31 = (kr >>> 14) % 32 := by
    rw [land_eq, shr_eq, show (31 : ℕ) = 2 ^ 5 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  unfold L1.kill4 at h
  simp only [] at h
  rw [hu, hnX, hnC, nsub_eq, dig_eq_ops, Bool.and_eq_true, Bool.and_eq_true,
    show Nat.shiftRight kr 19 = kr >>> 19 from rfl] at h
  have e_i : ∀ i, (kr >>> 19 >>> (10 * ((kr >>> 9) % 32))) >>> (10 * i) = kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i)) :=
    fun i => by rw [Nat.mul_add, Nat.shiftRight_add]
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  have hw0 : w0 ≤ kr % 512 := Nat.le_of_ble_eq_true h1
  have hu511 : kr % 512 < 511 := Nat.blt_eq.mp h2
  obtain ⟨Xf, Af, hk, hX, hA⟩ := excl_sem ME _ _ _ _ _ h3
  rw [Bool.and_eq_true, Nat.beq_eq, bit_test] at hk
  obtain ⟨hAu, hcov⟩ := hk
  have hAu' : Af.testBit (kr % 512) = true := by
    cases hb : Af.testBit (kr % 512) <;> simp_all
  obtain ⟨_, hAu''⟩ := hA _ hAu'
  obtain ⟨hside, Cf, hk2, hC⟩ := cover_sem MC _ b1 _ _ _ _ _ hcov
  have hXf : Xf < 2 ^ 512 := by
    apply Nat.lt_pow_two_of_testBit; intro i hi
    cases hb : Xf.testBit i
    · rfl
    · have := ((hX i).mp hb).1; rw [dig_testBit] at this; simp at this; omega
  refine ⟨Xf - (Xf &&& Cf), ⟨hw0, hu511, hAu'', ?_, ?_⟩, lt_of_le_of_lt (Nat.sub_le _ _) hXf, ?_⟩
  · intro i hi
    have := hside i hi
    rw [e_i] at this
    exact this
  · intro l
    rw [sub_and_testBit, Bool.and_eq_true, hX l, Bool.not_eq_true', ← Bool.not_eq_true]
    constructor
    · rintro ⟨⟨h4, h5⟩, h6⟩
      refine ⟨h4, h5, fun i hi => ?_⟩
      cases hb : (dig 512 MC ((kr >>> 19 >>> (10 * ((kr >>> 9) % 32 + i))) % 1024)).testBit l
      · rfl
      · exfalso; apply h6; rw [hC l]; refine Or.inr ⟨i, hi, ?_⟩
        rw [e_i]; exact hb
    · rintro ⟨h4, h5, h6⟩
      refine ⟨⟨h4, h5⟩, fun hc => ?_⟩
      rw [hC l] at hc
      rcases hc with hc | ⟨i, hi, hc⟩
      · simp at hc
      · have := h6 i hi
        rw [e_i] at hc
        rw [this] at hc; exact absurd hc (by decide)
  · rw [lor_eq, lor_eq, shl_eq, shl_eq, shl_eq, nadd_eq, Nat.zero_add, nsub_eq, land_eq] at hk2
    rw [show (j <<< 9) = 512 * j by rw [Nat.shiftLeft_eq]; ring] at hk2
    exact hk2

/-! ## The final test -/

theorem pk_zero_ext (B : ℕ) (F : ℕ → ℕ) (j L : ℕ) (hj : j ≤ L) :
    pk B F j = pk B (fun s => if s < j then F s else 0) L := by
  have h := pk_split B (fun s => if s < j then F s else 0) j (L - j)
  rw [show j + (L - j) = L by omega] at h
  rw [h]
  have hz : pk B (fun i => (fun s => if s < j then F s else 0) (j + i)) (L - j) = 0 := by
    rw [show (fun i => (fun s => if s < j then F s else 0) (j + i)) = fun _ => 0 from by funext i; simp]
    exact pk_zero B _
  rw [hz, Nat.mul_zero, Nat.add_zero]
  apply pk_congr; intro s hs; rw [if_pos hs]

theorem guard_sem (j nu : ℕ) (Ks ncs : ℕ → ℕ) (hj : j ≤ 512) (hnu : nu ≤ 32768)
    (hKs : ∀ s < j, Ks s < 2 ^ 512) (hncs : ∀ s < j, ncs s ≤ 31)
    (h : Nat.beq (Nat.land (Nat.add (Nat.add (L1.pcF31 (pk 512 Ks j)) (pk 512 (fun s => ncs s * 2 ^ 496) j))
      (Nat.mul (Nat.sub 32768 nu) (Nat.shiftRight L1.REPF31 (Nat.shiftLeft (Nat.sub 512 j) 9)))) L1.GUARD) 0 = true) :
    ∀ s < j, pcnt 512 (Ks s) + ncs s < nu := by
  have hKSlt : pk 512 Ks j < 2 ^ (8 * 32768) :=
    lt_of_lt_of_le (pk_lt 512 Ks j hKs) (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hdig : ∀ s, dig 512 (pk 512 Ks j) s = if s < j then Ks s else 0 := by
    intro s; split
    · rename_i hs; exact dig_pk 512 Ks j hKs s hs
    · rename_i hs; exact dig_ge 512 (by norm_num) Ks j hKs s (by omega)
  have e1 : L1.pcF31 (pk 512 Ks j) = pk 512 (fun s => (if s < j then pcnt 512 (Ks s) else 0) * 2 ^ 496) 512 := by
    rw [pcF31_eq _ hKSlt]; apply pk_congr; intro s _; rw [hdig]; split <;> simp [pcnt_zero_x]
  have e2 : pk 512 (fun s => ncs s * 2 ^ 496) j = pk 512 (fun s => (if s < j then ncs s else 0) * 2 ^ 496) 512 := by
    rw [pk_zero_ext 512 _ j 512 hj]; apply pk_congr; intro s _; split <;> simp
  have e3 : L1.REPF31 >>> ((512 - j) <<< 9) = pk 512 (fun s => (if s < j then 1 else 0) * 2 ^ 496) 512 := by
    have h := pk_shr_field 512 (fun _ => 2 ^ 496) (512 - j) j (fun _ _ => by norm_num)
    rw [show 512 - j + j = 512 by omega] at h
    rw [REPF31_eq, Nat.shiftLeft_eq, show (512 - j) * 2 ^ 9 = 512 * (512 - j) by ring, h, pk_zero_ext 512 _ j 512 hj]
    apply pk_congr; intro s _; split <;> simp
  have e4 : (32768 - nu) * pk 512 (fun s => (if s < j then 1 else 0) * 2 ^ 496) 512 =
      pk 512 (fun s => (if s < j then 32768 - nu else 0) * 2 ^ 496) 512 := by
    rw [mul_comm, ← pk_mul_const]; apply pk_congr; intro s _; split <;> ring
  have hF : ∀ s < 512, ((if s < j then pcnt 512 (Ks s) else 0) + (if s < j then ncs s else 0) +
      (if s < j then 32768 - nu else 0)) * 2 ^ 496 < 2 ^ 512 := by
    intro s _
    have hb : (if s < j then pcnt 512 (Ks s) else 0) + (if s < j then ncs s else 0) + (if s < j then 32768 - nu else 0)
        < 2 ^ 16 := by
      split
      · rename_i hs; have := pcnt_le 512 (Ks s); have := hncs s hs; norm_num; omega
      · norm_num
    calc _ < 2 ^ 16 * 2 ^ 496 := Nat.mul_lt_mul_of_pos_right hb (by positivity)
      _ = 2 ^ 512 := by norm_num
  have hsum : L1.pcF31 (pk 512 Ks j) + pk 512 (fun s => ncs s * 2 ^ 496) j +
      (32768 - nu) * (L1.REPF31 >>> ((512 - j) <<< 9)) = pk 512 (fun s => ((if s < j then pcnt 512 (Ks s) else 0) +
        (if s < j then ncs s else 0) + (if s < j then 32768 - nu else 0)) * 2 ^ 496) 512 := by
    rw [e1, e2, e3, e4, pk_add', pk_add']; apply pk_congr; intro s _; ring
  rw [Nat.beq_eq] at h
  simp only [land_eq, nadd_eq, nmul_eq, nsub_eq, shr_eq, shl_eq] at h
  rw [hsum, GUARD_eq, pk_and 512 (by norm_num) _ _ 512 hF (fun _ _ => by norm_num)] at h
  intro s hs
  have hz := congrArg (fun x => dig 512 x s) h
  simp only at hz
  rw [dig_pk 512 _ 512 (fun t _ => lt_of_le_of_lt Nat.and_le_left (hF t ‹_›)) s (by omega)] at hz
  rw [show dig 512 0 s = 0 by simp [dig]] at hz
  rw [if_pos hs, if_pos hs, if_pos hs] at hz
  have hb := congrArg (fun x => x.testBit 511) hz
  simp only [Nat.testBit_and, Nat.testBit_two_pow_self, Bool.and_true, Nat.zero_testBit, Nat.testBit_mul_two_pow] at hb
  simp only [show (496 : ℕ) ≤ 511 by norm_num, decide_true, Bool.true_and, show 511 - 496 = 15 by norm_num] at hb
  have hlt : pcnt 512 (Ks s) + ncs s + (32768 - nu) < 2 ^ 16 := by
    have := pcnt_le 512 (Ks s); have := hncs s hs; norm_num; omega
  have h15 : pcnt 512 (Ks s) + ncs s + (32768 - nu) < 2 ^ 15 := by
    by_contra hc
    have hge : 2 ^ 15 ≤ pcnt 512 (Ks s) + ncs s + (32768 - nu) := by omega
    have : (pcnt 512 (Ks s) + ncs s + (32768 - nu)).testBit 15 = true := by
      rw [Nat.testBit_eq_decide_div_mod_eq]
      simp only [decide_eq_true_eq]
      have h1 : (pcnt 512 (Ks s) + ncs s + (32768 - nu)) / 2 ^ 15 = 1 := by
        apply Nat.div_eq_of_lt_le <;> norm_num at hlt hge ⊢ <;> omega
      rw [h1]
    rw [this] at hb; exact absurd hb (by decide)
  norm_num at h15; omega

/-! ## All kills of a node -/

/-- the list recursion of `R3RT.kills5` -/
def k5F (XS w0 ME MC b1 nu : ℕ) (ks : List ℕ) : ℕ → ℕ → ℕ → Bool :=
  List.rec (motive := fun _ => ℕ → ℕ → ℕ → Bool)
    (fun j KS NC => Nat.ble j 512 && Nat.beq (Nat.land (Nat.add (Nat.add (L1.pcF31 KS) NC)
        (Nat.mul (Nat.sub 32768 nu) (Nat.shiftRight L1.REPF31 (Nat.shiftLeft (Nat.sub 512 j) 9)))) L1.GUARD) 0)
    (fun kr _ ih j KS NC => L1.kill4 XS w0 ME MC b1 kr j KS NC (fun KS' NC' => ih (Nat.succ j) KS' NC'))
    ks

theorem kills5_eq (XS w0 ME MC b1 nu : ℕ) (ks : List ℕ) :
    R3RT.kills5 XS w0 ME MC b1 nu ks = k5F XS w0 ME MC b1 nu ks 0 0 0 := rfl

theorem k5F_sem (XS w0 ME MC b1 nu : ℕ) (hnu : nu ≤ 32768) : ∀ (ks : List ℕ) (j : ℕ) (Ks ncs : ℕ → ℕ),
    (∀ s < j, Ks s < 2 ^ 512) → (∀ s < j, ncs s ≤ 31) →
    k5F XS w0 ME MC b1 nu ks j (pk 512 Ks j) (pk 512 (fun s => ncs s * 2 ^ 496) j) = true →
    ∃ Kf ncf : ℕ → ℕ, (∀ s < j, Kf s = Ks s ∧ ncf s = ncs s) ∧ (∀ s < j + ks.length, pcnt 512 (Kf s) + ncf s < nu) ∧
      ∀ t < ks.length, KillFacts XS w0 ME MC b1 (ks.getD t 0) (Kf (j + t)) ∧ ncf (j + t) = (ks.getD t 0 >>> 14) % 32 := by
  intro ks
  induction ks with
  | nil =>
    intro j Ks ncs hKs hncs h
    have h' : (Nat.ble j 512 && Nat.beq (Nat.land (Nat.add (Nat.add (L1.pcF31 (pk 512 Ks j))
        (pk 512 (fun s => ncs s * 2 ^ 496) j))
        (Nat.mul (Nat.sub 32768 nu) (Nat.shiftRight L1.REPF31 (Nat.shiftLeft (Nat.sub 512 j) 9)))) L1.GUARD) 0) = true := h
    rw [Bool.and_eq_true] at h'
    have hj : j ≤ 512 := Nat.le_of_ble_eq_true h'.1
    refine ⟨Ks, ncs, fun s _ => ⟨rfl, rfl⟩, ?_, fun t ht => absurd ht (by simp)⟩
    simp only [List.length_nil, Nat.add_zero]
    exact guard_sem j nu Ks ncs hj hnu hKs hncs h'.2
  | cons kr rest ih =>
    intro j Ks ncs hKs hncs h
    have h' : L1.kill4 XS w0 ME MC b1 kr j (pk 512 Ks j) (pk 512 (fun s => ncs s * 2 ^ 496) j)
        (fun KS' NC' => k5F XS w0 ME MC b1 nu rest (Nat.succ j) KS' NC') = true := h
    obtain ⟨Y, hKF, hY, hk⟩ := kill4_sem _ _ _ _ _ _ _ _ _ _ h'
    set Ks' : ℕ → ℕ := fun s => if s = j then Y else Ks s with hKs'
    set ncs' : ℕ → ℕ := fun s => if s = j then (kr >>> 14) % 32 else ncs s with hncs'
    have hKS : pk 512 Ks j ||| (Y <<< (512 * j)) = pk 512 Ks' (j + 1) := by
      rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt (pk_lt 512 Ks j hKs), Nat.shiftLeft_eq, pk_succ,
        pk_congr 512 Ks' Ks j (fun s hs => by simp only [hKs']; rw [if_neg (by omega)]),
        show Ks' j = Y by simp [hKs']]
      ring
    have hNCc : (kr >>> 14) % 32 ≤ 31 := by have := Nat.mod_lt (kr >>> 14) (show 0 < 32 by norm_num); omega
    have hNC : pk 512 (fun s => ncs s * 2 ^ 496) j ||| (((kr >>> 14) % 32) <<< (512 * j + 496)) =
        pk 512 (fun s => ncs' s * 2 ^ 496) (j + 1) := by
      have hlt : pk 512 (fun s => ncs s * 2 ^ 496) j < 2 ^ (512 * j) := pk_lt 512 _ j (fun s hs => by
        have := hncs s hs
        calc ncs s * 2 ^ 496 < 2 ^ 16 * 2 ^ 496 := Nat.mul_lt_mul_of_pos_right (by omega) (by positivity)
          _ = 2 ^ 512 := by norm_num)
      have e : ((kr >>> 14) % 32) <<< (512 * j + 496) = ((kr >>> 14) % 32 * 2 ^ 496) <<< (512 * j) := by
        rw [Nat.shiftLeft_eq, Nat.shiftLeft_eq, pow_add]; ring
      rw [e, Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hlt, Nat.shiftLeft_eq, pk_succ,
        pk_congr 512 (fun s => ncs' s * 2 ^ 496) (fun s => ncs s * 2 ^ 496) j
          (fun s hs => by simp only [hncs']; rw [if_neg (by omega)]),
        show ncs' j = (kr >>> 14) % 32 by simp [hncs']]
      ring
    rw [hKS, hNC] at hk
    obtain ⟨Kf, ncf, hpre, hall, hkf⟩ := ih (j + 1) Ks' ncs'
      (fun s hs => by
        simp only [hKs']; by_cases hsj : s = j
        · rw [if_pos hsj]; exact hY
        · rw [if_neg hsj]; exact hKs s (by omega))
      (fun s hs => by
        simp only [hncs']; by_cases hsj : s = j
        · rw [if_pos hsj]; exact hNCc
        · rw [if_neg hsj]; exact hncs s (by omega)) hk
    refine ⟨Kf, ncf, fun s hs => ?_, ?_, fun t ht => ?_⟩
    · have := hpre s (by omega); rw [hKs', hncs'] at this; simp only [if_neg (show s ≠ j by omega)] at this; exact this
    · simp only [List.length_cons]; intro s hs; exact hall s (by omega)
    · rcases t with _ | t
      · have := hpre j (by omega); rw [hKs', hncs'] at this; simp only [if_true] at this
        simp only [List.getD_cons_zero, Nat.add_zero]
        rw [this.1, this.2]; exact ⟨hKF, rfl⟩
      · have := hkf t (by simp at ht; omega)
        simp only [List.getD_cons_succ]
        rw [show j + (t + 1) = j + 1 + t by ring]; exact this

/-- **The kills of a node**: every kill record `kr ∈ ks` has its `KillFacts` with `|Y| + nC < nu`. -/
theorem kills5_sem (XS w0 ME MC b1 nu : ℕ) (ks : List ℕ) (hnu : nu ≤ 32768)
    (h : R3RT.kills5 XS w0 ME MC b1 nu ks = true) :
    ∀ kr ∈ ks, ∃ Y, KillFacts XS w0 ME MC b1 kr Y ∧ pcnt 512 Y + (kr >>> 14) % 32 < nu := by
  rw [kills5_eq] at h
  have h0 : k5F XS w0 ME MC b1 nu ks 0 (pk 512 (fun _ => 0) 0) (pk 512 (fun s => (fun _ => 0) s * 2 ^ 496) 0) = true := by
    simpa [pk] using h
  obtain ⟨Kf, ncf, _, hall, hkf⟩ := k5F_sem XS w0 ME MC b1 nu hnu ks 0 _ _ (fun s hs => absurd hs (by omega))
    (fun s hs => absurd hs (by omega)) h0
  intro kr hkr
  obtain ⟨t, ht, rfl⟩ := List.getElem_of_mem hkr
  have hg : ks.getD t 0 = ks[t] := by simp [List.getD_eq_getElem?_getD, ht]
  obtain ⟨hK, hn⟩ := hkf t ht
  rw [hg, Nat.zero_add] at hK hn
  refine ⟨Kf t, hK, ?_⟩
  have := hall t (by omega)
  rw [← hn]; exact this

end L5
