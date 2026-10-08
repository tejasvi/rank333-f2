module
public import R22Port.U_d41d8cd98f00
public import L5.Swar
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # `L1.orFold` and the window construction of `R3RT.node5`

* `orFold_bit`: a bit of `L1.orFold 10 (MB masked to nV slots) nV` is a bit of one of the first `nV` slots of `MB`.
* `winXS_bit`: slot `t` of the window `XS` holds the labels `l` with `w0 + t < l < 511`, `l ∉ D'` and `l ∉ N'[w0 + t]`. -/
namespace L5
open E1S Finset

theorem dig_testBit (B N v l : ℕ) : (dig B N v).testBit l = (decide (l < B) && N.testBit (B * v + l)) := by
  by_cases hl : l < B
  · simp [testBit_dig B N v l hl, hl]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (dig_lt B N v) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hl]

theorem dig_eq_ops (x i : ℕ) : Nat.land (Nat.shiftRight x (Nat.shiftLeft i 9)) L1.M512 = dig 512 x i := by
  rw [land_eq, shr_eq, shl_eq, M512_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftLeft_eq, Nat.shiftRight_eq_div_pow]
  unfold dig; rw [mul_comm i]

theorem dig_eq_ops' (x i : ℕ) : Nat.land (Nat.shiftRight x (Nat.mul 512 i)) L1.M512 = dig 512 x i := by
  rw [land_eq, shr_eq, nmul_eq, M512_eq, Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]; rfl

theorem mask_ops (x n : ℕ) : Nat.land x (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft n 9)) 1) = x % 2 ^ (512 * n) := by
  rw [land_eq, nsub_eq, shl_eq, shl_eq, Nat.shiftLeft_eq, Nat.shiftLeft_eq, Nat.one_mul, Nat.and_two_pow_sub_one_eq_mod,
    mul_comm n]

/-! ## orFold -/

theorem orFold_inv (Z : ℕ) (hZ : Z < 2 ^ 512) : ∀ fuel x n, n ≤ 2 ^ fuel →
    (∀ i l, (dig 512 x i).testBit l = true → Z.testBit l = true) →
    (∀ l, Z.testBit l = true → ∃ i < n, (dig 512 x i).testBit l = true) →
    L1.orFold fuel x n = Z := by
  have base : ∀ x n, n ≤ 1 → (∀ i l, (dig 512 x i).testBit l = true → Z.testBit l = true) →
      (∀ l, Z.testBit l = true → ∃ i < n, (dig 512 x i).testBit l = true) → Nat.land x L1.M512 = Z := by
    intro x n hn h1 h2
    rw [land_eq, M512_eq, Nat.and_two_pow_sub_one_eq_mod]
    have e : x % 2 ^ 512 = dig 512 x 0 := by unfold dig; simp
    rw [e]
    apply Nat.eq_of_testBit_eq; intro l
    cases hz : Z.testBit l
    · cases hd : (dig 512 x 0).testBit l
      · rfl
      · rw [h1 0 l hd] at hz; exact absurd hz (by decide)
    · obtain ⟨i, hi, hb⟩ := h2 l hz
      rw [show i = 0 by omega] at hb; exact hb
  intro fuel
  induction fuel with
  | zero => intro x n hn h1 h2; simp only [pow_zero] at hn; exact base x n hn h1 h2
  | succ fuel ih =>
    intro x n hn h1 h2
    rw [L1.orFold]
    cases hb : Nat.ble n 1
    · have hn2 : ¬ n ≤ 1 := Nat.not_le_of_not_ble_eq_true (by rw [hb]; decide)
      simp only [cond_false]
      have hhv : Nat.shiftRight (Nat.succ n) 1 = (n + 1) / 2 := by rw [shr_eq, Nat.shiftRight_eq_div_pow]
      rw [hhv]
      have hpow : 2 ^ (fuel + 1) = 2 * 2 ^ fuel := by rw [pow_succ]; ring
      apply ih
      · rw [hpow] at hn; omega
      · intro i l hl
        rw [lor_eq, shr_eq, nmul_eq, dig_testBit, Nat.testBit_or, Nat.testBit_shiftRight, Bool.and_eq_true,
          Bool.or_eq_true] at hl
        obtain ⟨hl1, hl2 | hl2⟩ := hl
        · apply h1 i l; rw [dig_testBit, hl1, hl2]; rfl
        · apply h1 (i + (n + 1) / 2) l
          rw [dig_testBit, hl1, Bool.true_and]
          have e : 512 * (i + (n + 1) / 2) + l = 512 * ((n + 1) / 2) + (512 * i + l) := by ring
          rw [e]; exact hl2
      · intro l hl
        obtain ⟨i, hi, hb'⟩ := h2 l hl
        have hl512 : l < 512 := by
          by_contra hc
          rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hZ (Nat.pow_le_pow_right (by norm_num) (by omega)))] at hl
          exact absurd hl (by decide)
        rw [dig_testBit] at hb'
        simp only [hl512, decide_true, Bool.true_and] at hb'
        by_cases hih : i < (n + 1) / 2
        · refine ⟨i, hih, ?_⟩
          rw [lor_eq, shr_eq, nmul_eq, dig_testBit, Nat.testBit_or, hb']; simp [hl512]
        · refine ⟨i - (n + 1) / 2, by omega, ?_⟩
          rw [lor_eq, shr_eq, nmul_eq, dig_testBit, Nat.testBit_or, Nat.testBit_shiftRight]
          have e : 512 * ((n + 1) / 2) + (512 * (i - (n + 1) / 2) + l) = 512 * i + l := by
            have : (n + 1) / 2 ≤ i := by omega
            rw [← Nat.add_assoc, ← Nat.mul_add, Nat.add_sub_cancel' this]
          rw [e, hb']; simp [hl512]
    · have hn1 : n ≤ 1 := Nat.le_of_ble_eq_true hb
      simp only [cond_true]
      exact base x n hn1 h1 h2

/-- or of the first `n` slots -/
def orS (x : ℕ) (n : ℕ) : ℕ := Nat.rec (motive := fun _ => ℕ) 0 (fun i acc => acc ||| dig 512 x i) n

theorem orS_testBit (x n l : ℕ) : (orS x n).testBit l = true ↔ ∃ i < n, (dig 512 x i).testBit l = true := by
  induction n with
  | zero => simp [orS]
  | succ n ih =>
    show (orS x n ||| dig 512 x n).testBit l = true ↔ _
    rw [Nat.testBit_or, Bool.or_eq_true, ih]
    constructor
    · rintro (⟨i, hi, h⟩ | h)
      · exact ⟨i, by omega, h⟩
      · exact ⟨n, by omega, h⟩
    · rintro ⟨i, hi, h⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
      · exact Or.inl ⟨i, hi, h⟩
      · exact Or.inr h

theorem orS_lt (x n : ℕ) : orS x n < 2 ^ 512 := by
  induction n with
  | zero => show 0 < 2 ^ 512; positivity
  | succ n ih => show orS x n ||| dig 512 x n < 2 ^ 512; exact Nat.or_lt_two_pow ih (dig_lt 512 x n)

/-- **orFold**: every bit of the or-fold of the first `nV` slots comes from one of them. -/
theorem orFold_bit (MB nV : ℕ) (hnV : nV ≤ 1024) (l : ℕ)
    (h : (L1.orFold 10 (Nat.land MB (Nat.sub (Nat.shiftLeft 1 (Nat.shiftLeft nV 9)) 1)) nV).testBit l = true) :
    ∃ i < nV, (dig 512 MB i).testBit l = true := by
  rw [mask_ops] at h
  have hd : ∀ i, dig 512 (MB % 2 ^ (512 * nV)) i = if i < nV then dig 512 MB i else 0 := by
    intro i; split
    · rename_i hi; rw [← pk_dig_mod 512 MB nV]; exact dig_pk 512 _ nV (fun j _ => dig_lt 512 MB j) i hi
    · rename_i hi; rw [← pk_dig_mod 512 MB nV]; exact dig_ge 512 (by norm_num) _ nV (fun j _ => dig_lt 512 MB j) i (by omega)
  rw [orFold_inv (orS (MB % 2 ^ (512 * nV)) nV) (orS_lt _ _) 10 _ nV (by norm_num; omega)
    (fun i l hl => by
      rw [hd] at hl; split at hl
      · rename_i hi; rw [orS_testBit]; exact ⟨i, hi, by rw [hd, if_pos hi]; exact hl⟩
      · simp at hl)
    (fun l hl => (orS_testBit _ _ _).mp hl)] at h
  obtain ⟨i, hi, hb⟩ := (orS_testBit _ _ _).mp h
  rw [hd, if_pos hi] at hb
  exact ⟨i, hi, hb⟩

/-! ## The window -/

/-- `node5`'s window of the children's free sets (copied from `R3RT.node5`) -/
def winXS (last D' N' : ℕ) : ℕ :=
  let w0 := Nat.succ last
  let W := Nat.sub 511 w0
  let CH := Nat.shiftLeft (Nat.shiftRight L1.M511 w0) w0
  let Fn := Nat.sub CH (Nat.land CH D')
  let REPW := Nat.shiftRight L1.REPALL (Nat.shiftLeft (Nat.sub 512 W) 9)
  let SPW := Nat.shiftRight L1.SP513 (Nat.mul 513 (Nat.sub 512 W))
  let UT := Nat.sub (Nat.add (Nat.mul L1.M511 REPW) REPW) (Nat.shiftLeft SPW (Nat.succ w0))
  let XA := Nat.land (Nat.mul Fn REPW) UT
  Nat.sub XA (Nat.land XA (Nat.shiftRight N' (Nat.shiftLeft w0 9)))

theorem testBit_pow_sub_pow (a b l : ℕ) (h : b ≤ a) : (2 ^ a - 2 ^ b).testBit l = decide (b ≤ l ∧ l < a) := by
  have e : 2 ^ a - 2 ^ b = (2 ^ (a - b) - 1) * 2 ^ b := by
    rw [Nat.sub_mul, Nat.one_mul, ← pow_add, Nat.sub_add_cancel h]
  rw [e, Nat.testBit_mul_two_pow, Nat.testBit_two_pow_sub_one]
  by_cases hb : b ≤ l
  · rw [decide_eq_true hb, Bool.true_and]; apply decide_eq_decide.mpr; constructor <;> intro h' <;> omega
  · simp [hb]

theorem REPW_eq (W : ℕ) (hW : W ≤ 512) : L1.REPALL >>> ((512 - W) <<< 9) = pk 512 (fun _ => 1) W := by
  have h := pk_shr_field 512 (fun _ => 1) (512 - W) W (fun _ _ => by norm_num)
  rw [show 512 - W + W = 512 by omega] at h
  rw [REPALL_eq, Nat.shiftLeft_eq, show (512 - W) * 2 ^ 9 = 512 * (512 - W) by ring, h]

theorem SPW_eq (W : ℕ) (hW : W ≤ 512) : L1.SP513 >>> (513 * (512 - W)) = pk 513 (fun _ => 1) W := by
  have h := pk_shr_field 513 (fun _ => 1) (512 - W) W (fun _ _ => by norm_num)
  rw [show 512 - W + W = 512 by omega] at h
  rw [SP513_eq, h]

theorem UT_eq (W w0 : ℕ) (hW : W + w0 ≤ 511) :
    L1.M511 * pk 512 (fun _ => 1) W + pk 512 (fun _ => 1) W - (pk 513 (fun _ => 1) W <<< (w0 + 1)) =
      pk 512 (fun t => 2 ^ 511 - 2 ^ (t + w0 + 1)) W := by
  have e1 : L1.M511 * pk 512 (fun _ => 1) W + pk 512 (fun _ => 1) W = pk 512 (fun _ => 2 ^ 511) W := by
    rw [M511_eq, show (2 ^ 511 - 1) * pk 512 (fun _ => 1) W + pk 512 (fun _ => 1) W = pk 512 (fun _ => 1) W * 2 ^ 511 by
      have : 1 ≤ 2 ^ 511 := Nat.one_le_two_pow
      zify [this]; ring, ← pk_mul_const]
    simp
  have e2 : pk 513 (fun _ => 1) W <<< (w0 + 1) = pk 512 (fun t => 2 ^ (t + w0 + 1)) W := by
    rw [Nat.shiftLeft_eq]; unfold pk; rw [Finset.sum_mul]
    apply sum_congr rfl; intro t _; rw [one_mul, ← pow_add, ← pow_add]; congr 1; ring
  rw [e1, e2, pk_sub]
  intro t ht; exact Nat.pow_le_pow_right (by norm_num) (by omega)

/-- **The window.** -/
theorem winXS_bit (last D' N' : ℕ) (hl : last < 511) (t : ℕ) (ht : t < 511 - (last + 1)) (l : ℕ) :
    (dig 512 (winXS last D' N') t).testBit l =
      (decide (last + 1 + t < l ∧ l < 511) && !D'.testBit l && !(dig 512 N' (last + 1 + t)).testBit l) := by
  have hCH : (L1.M511 >>> (last + 1)) <<< (last + 1) = 2 ^ 511 - 2 ^ (last + 1) := by
    apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.testBit_shiftLeft, Nat.testBit_shiftRight, M511_eq, Nat.testBit_two_pow_sub_one,
      testBit_pow_sub_pow _ _ _ (by omega)]
    by_cases hi : last + 1 ≤ i
    · rw [decide_eq_true (show i ≥ last + 1 from hi), Bool.true_and]; apply decide_eq_decide.mpr
      constructor <;> intro h' <;> omega
    · simp [hi]
  have hFnb : ∀ i, ((2 ^ 511 - 2 ^ (last + 1)) - ((2 ^ 511 - 2 ^ (last + 1)) &&& D')).testBit i =
      (decide (last + 1 ≤ i ∧ i < 511) && !D'.testBit i) := by
    intro i; rw [sub_and_testBit, testBit_pow_sub_pow _ _ _ (by omega)]
  have hFnlt : (2 ^ 511 - 2 ^ (last + 1)) - ((2 ^ 511 - 2 ^ (last + 1)) &&& D') < 2 ^ 512 := by
    apply Nat.lt_pow_two_of_testBit; intro i hi; rw [hFnb]; simp; omega
  set Fn := (2 ^ 511 - 2 ^ (last + 1)) - ((2 ^ 511 - 2 ^ (last + 1)) &&& D') with hFn
  set W := 511 - (last + 1) with hW
  have hXA : Fn * pk 512 (fun _ => 1) W &&& pk 512 (fun t => 2 ^ 511 - 2 ^ (t + (last + 1) + 1)) W =
      pk 512 (fun t => Fn &&& (2 ^ 511 - 2 ^ (t + (last + 1) + 1))) W := by
    rw [mul_comm, ← pk_mul_const, pk_and 512 (by norm_num) _ _ W (fun _ _ => by simpa using hFnlt)
      (fun t _ => lt_of_le_of_lt (Nat.sub_le _ _) (by norm_num))]
    simp
  set G : ℕ → ℕ := fun t => Fn &&& (2 ^ 511 - 2 ^ (t + (last + 1) + 1)) with hG
  have hGlt : ∀ t < W, G t < 2 ^ 512 := fun t _ => lt_of_le_of_lt Nat.and_le_left hFnlt
  have hXAlt : pk 512 G W < 2 ^ (512 * W) := pk_lt 512 G W hGlt
  have hY : pk 512 G W &&& (N' >>> ((last + 1) <<< 9)) = pk 512 (fun t => G t &&& dig 512 N' (last + 1 + t)) W := by
    have e : pk 512 G W &&& (N' >>> ((last + 1) <<< 9)) = pk 512 G W &&& ((N' >>> ((last + 1) <<< 9)) % 2 ^ (512 * W)) := by
      apply Nat.eq_of_testBit_eq; intro i; simp only [Nat.testBit_and, Nat.testBit_mod_two_pow]
      by_cases hi : i < 512 * W
      · simp [hi]
      · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hXAlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]; simp
    rw [e, ← pk_dig_mod 512 _ W, pk_and 512 (by norm_num) _ _ W hGlt (fun t _ => dig_lt 512 _ t)]
    apply pk_congr; intro t _
    rw [Nat.shiftLeft_eq, show (last + 1) * 2 ^ 9 = 512 * (last + 1) by ring, dig_shr]
  have hXS : pk 512 G W - pk 512 (fun t => G t &&& dig 512 N' (last + 1 + t)) W =
      pk 512 (fun t => G t - (G t &&& dig 512 N' (last + 1 + t))) W :=
    pk_sub 512 _ _ W (fun t _ => Nat.and_le_left)
  have hXSlt : ∀ t < W, G t - (G t &&& dig 512 N' (last + 1 + t)) < 2 ^ 512 :=
    fun t ht => lt_of_le_of_lt (Nat.sub_le _ _) (hGlt t ht)
  have hwin : winXS last D' N' = pk 512 (fun t => G t - (G t &&& dig 512 N' (last + 1 + t))) W := by
    unfold winXS
    simp only [land_eq, lor_eq, shr_eq, shl_eq, nsub_eq, nadd_eq, nmul_eq, Nat.succ_eq_add_one]
    rw [hCH, ← hFn, show 512 - W = 512 - (511 - (last + 1)) from rfl]
    rw [REPW_eq W (by omega), SPW_eq W (by omega), UT_eq W (last + 1) (by omega), hXA, hY, hXS]
  rw [hwin, dig_pk 512 _ W hXSlt t ht, sub_and_testBit, Nat.testBit_and, hFnb,
    testBit_pow_sub_pow _ _ _ (by omega)]
  by_cases h1 : last + 1 + t < l ∧ l < 511
  · rw [decide_eq_true (show last + 1 ≤ l ∧ l < 511 from ⟨by omega, h1.2⟩),
      decide_eq_true (show t + (last + 1) + 1 ≤ l ∧ l < 511 from ⟨by omega, h1.2⟩), decide_eq_true h1]
    simp only [Bool.true_and, Bool.and_true]
  · rw [decide_eq_false (show ¬ (t + (last + 1) + 1 ≤ l ∧ l < 511) by omega), decide_eq_false h1]
    simp only [Bool.false_and, Bool.and_false]

end L5
