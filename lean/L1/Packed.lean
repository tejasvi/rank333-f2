module
public import R22Port.U_d41d8cd98f00

/-! # Packed counters (r22/lean/DESIGN.md section 20)

Counters are fields of width `w` in one Nat: `pack w f n = f 0 + 2^w f 1 + ... + 2^(w(n-1)) f (n-1)`.

* `pack_add`: adding a packed vector is one Nat addition, with no condition (carries are the caller's business:
  `field_pack` needs every field below `2^w`).
* `field_pack`, `field_eq_ops`: field `i` is a shift and a mask.
* `land_guard`, `guard_all`, `guard_none`: with the guard bit `2^(w-1)` of every field, "every field ≥ 2^(w-1)" and
  "no field ≥ 2^(w-1)" are one AND and one comparison.
* `all_ge_iff`: counts `c i < 2^(w-1)` with offsets `2^(w-1) - k i` give "every count reaches its threshold `k i`" as
  one addition, one AND, one comparison (hyperplane needs; full rows `count = cap` of cited rows).
* `any_gt_iff`: offsets `2^(w-1) - 1 - cap i` give "some count exceeds its cap" (overfill) the same way.

Core Lean only. -/
@[expose] public section
namespace L1.Packed

/-- `n` fields of width `w`: `f 0 + 2^w * (f 1 + 2^w * (...))` -/
def pack (w : Nat) (f : Nat → Nat) : Nat → Nat
  | 0 => 0
  | n+1 => f 0 + 2 ^ w * pack w (fun i => f (i+1)) n

/-- field `i` of width `w` -/
def field (w P i : Nat) : Nat := P / 2 ^ (w * i) % 2 ^ w

/-- the guard mask: bit `w-1` of each of `n` fields -/
def guard (w n : Nat) : Nat := pack w (fun _ => 2 ^ (w-1)) n

/-- every field of `f` below `n` fits in `w` bits -/
def Fits (w : Nat) (f : Nat → Nat) (n : Nat) : Prop := ∀ i, i < n → f i < 2 ^ w

theorem fits_tail {w n : Nat} {f : Nat → Nat} (h : Fits w f (n+1)) : Fits w (fun i => f (i+1)) n :=
  fun i hi => h (i+1) (by omega)

theorem pack_lt {w : Nat} : ∀ {n : Nat} {f : Nat → Nat}, Fits w f n → pack w f n < 2 ^ (w * n)
  | 0, _, _ => by simp [pack]
  | n+1, f, h => by
    have h0 : f 0 < 2 ^ w := h 0 (by omega)
    have ih : pack w (fun i => f (i+1)) n + 1 ≤ 2 ^ (w * n) := pack_lt (fits_tail h)
    have e : 2 ^ (w * (n+1)) = 2 ^ w * 2 ^ (w * n) := by
      rw [Nat.mul_succ, Nat.pow_add, Nat.mul_comm]
    rw [e]; simp only [pack]
    have h2 : 2 ^ w * (pack w (fun i => f (i+1)) n + 1) ≤ 2 ^ w * 2 ^ (w * n) := Nat.mul_le_mul_left _ ih
    rw [Nat.mul_add, Nat.mul_one] at h2
    omega

/-- bulk addition: one Nat addition adds every field -/
theorem pack_add (w : Nat) : ∀ (n : Nat) (f g : Nat → Nat), pack w f n + pack w g n = pack w (fun i => f i + g i) n
  | 0, _, _ => rfl
  | n+1, f, g => by
    simp only [pack]
    rw [← pack_add w n (fun i => f (i+1)) (fun i => g (i+1)), Nat.mul_add]
    omega

theorem pack_congr {w : Nat} : ∀ {n : Nat} {f g : Nat → Nat}, (∀ i, i < n → f i = g i) → pack w f n = pack w g n
  | 0, _, _, _ => rfl
  | n+1, f, g, h => by
    simp only [pack]
    rw [h 0 (by omega), pack_congr (n := n) (f := fun i => f (i+1)) (g := fun i => g (i+1)) (fun i hi => h (i+1) (by omega))]

/-- field extraction -/
theorem field_pack {w : Nat} : ∀ {n : Nat} {f : Nat → Nat}, Fits w f n → ∀ {i : Nat}, i < n → field w (pack w f n) i = f i
  | 0, _, _, _, hi => absurd hi (Nat.not_lt_zero _)
  | n+1, f, h, i, hi => by
    have h0 : f 0 < 2 ^ w := h 0 (by omega)
    cases i with
    | zero =>
      simp only [field, Nat.mul_zero, Nat.pow_zero, Nat.div_one, pack]
      rw [Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt h0]
    | succ i =>
      have ih := field_pack (fits_tail h) (i := i) (by omega)
      simp only [field] at ih ⊢
      simp only [pack]
      rw [Nat.mul_succ, Nat.pow_add, Nat.mul_comm (2 ^ (w * i)) (2 ^ w), ← Nat.div_div_eq_div_mul,
        Nat.add_mul_div_left _ _ (Nat.two_pow_pos w), Nat.div_eq_of_lt h0, Nat.zero_add]
      exact ih

/-- the kernel-cheap form of a field: one shift, one mask -/
theorem field_eq_ops (w P i : Nat) : field w P i = Nat.land (Nat.shiftRight P (w * i)) (2 ^ w - 1) := by
  show _ = (P >>> (w * i)) &&& (2 ^ w - 1)
  rw [Nat.and_two_pow_sub_one_eq_mod, Nat.shiftRight_eq_div_pow]; rfl

/-- packed vectors with fitting fields are equal iff their fields are -/
theorem pack_eq_iff {w n : Nat} {f g : Nat → Nat} (hf : Fits w f n) (hg : Fits w g n) :
    pack w f n = pack w g n ↔ ∀ i, i < n → f i = g i := by
  constructor
  · intro h i hi
    rw [← field_pack hf hi, ← field_pack hg hi, h]
  · exact pack_congr

/-- AND of two numbers split at bit `w` -/
theorem land_split {w x y : Nat} (p q : Nat) (hx : x < 2 ^ w) (hy : y < 2 ^ w) :
    (x + 2 ^ w * p) &&& (y + 2 ^ w * q) = (x &&& y) + 2 ^ w * (p &&& q) := by
  apply Nat.eq_of_testBit_eq
  intro j
  have hxy : (x &&& y) < 2 ^ w := Nat.and_lt_two_pow x hy
  rw [Nat.testBit_and, Nat.add_comm x, Nat.add_comm y, Nat.add_comm (x &&& y),
    Nat.testBit_two_pow_mul_add _ hx, Nat.testBit_two_pow_mul_add _ hy, Nat.testBit_two_pow_mul_add _ hxy]
  by_cases hj : j < w
  · simp [hj, Nat.testBit_and]
  · simp [hj, Nat.testBit_and]

/-- bulk AND of packed vectors -/
theorem pack_land {w : Nat} : ∀ {n : Nat} {f g : Nat → Nat}, Fits w f n → Fits w g n →
    pack w f n &&& pack w g n = pack w (fun i => f i &&& g i) n
  | 0, _, _, _, _ => by simp [pack]
  | n+1, f, g, hf, hg => by
    simp only [pack]
    rw [land_split _ _ (hf 0 (by omega)) (hg 0 (by omega)), pack_land (fits_tail hf) (fits_tail hg)]

/-- bit `w-1` of a field below `2^w` -/
theorem land_top {w x : Nat} (hw : 0 < w) (hx : x < 2 ^ w) :
    x &&& 2 ^ (w-1) = if 2 ^ (w-1) ≤ x then 2 ^ (w-1) else 0 := by
  have e : 2 ^ w = 2 * 2 ^ (w-1) := by
    rw [← Nat.pow_succ']; congr 1; omega
  have hb : x.testBit (w-1) = decide (2 ^ (w-1) ≤ x) := by
    rw [Nat.testBit_eq_decide_div_mod_eq]
    have hp : 0 < 2 ^ (w-1) := Nat.two_pow_pos _
    by_cases h : 2 ^ (w-1) ≤ x
    · have hq : x / 2 ^ (w-1) = 1 := by
        apply Nat.le_antisymm
        · exact Nat.le_of_lt_succ ((Nat.div_lt_iff_lt_mul hp).2 (by omega))
        · exact (Nat.le_div_iff_mul_le hp).2 (by omega)
      simp [hq, h]
    · have hq : x / 2 ^ (w-1) = 0 := Nat.div_eq_of_lt (by omega)
      simp [hq, h]
  apply Nat.eq_of_testBit_eq
  intro j
  rw [Nat.testBit_and, Nat.testBit_two_pow]
  by_cases h : 2 ^ (w-1) ≤ x
  · simp only [h, if_true, Nat.testBit_two_pow]
    by_cases hj : w - 1 = j
    · subst hj; simp [hb, h]
    · simp [hj]
  · simp only [h, if_false, Nat.zero_testBit]
    by_cases hj : w - 1 = j
    · subst hj; simp [hb, h]
    · simp [hj]

theorem fits_guard {w : Nat} (hw : 0 < w) (n : Nat) : Fits w (fun _ => 2 ^ (w-1)) n :=
  fun _ _ => Nat.pow_lt_pow_right (by decide) (by omega)

/-- one AND isolates the guard bits -/
theorem land_guard {w n : Nat} {f : Nat → Nat} (hw : 0 < w) (hf : Fits w f n) :
    pack w f n &&& guard w n = pack w (fun i => if 2 ^ (w-1) ≤ f i then 2 ^ (w-1) else 0) n := by
  rw [guard, pack_land hf (fits_guard hw n)]
  exact pack_congr (fun i hi => land_top hw (hf i hi))

theorem fits_top {w n : Nat} {f : Nat → Nat} (hw : 0 < w) :
    Fits w (fun i => if 2 ^ (w-1) ≤ f i then 2 ^ (w-1) else 0) n := by
  intro i _
  have : 2 ^ (w-1) < 2 ^ w := Nat.pow_lt_pow_right (by decide) (by omega)
  dsimp only
  split <;> omega

/-- every field has its guard bit set -/
theorem guard_all {w n : Nat} {f : Nat → Nat} (hw : 0 < w) (hf : Fits w f n) :
    pack w f n &&& guard w n = guard w n ↔ ∀ i, i < n → 2 ^ (w-1) ≤ f i := by
  rw [land_guard hw hf, guard, pack_eq_iff (fits_top hw) (fits_guard hw n)]
  have hp : 0 < 2 ^ (w-1) := Nat.two_pow_pos _
  constructor
  · intro h i hi
    have := h i hi
    by_cases hc : 2 ^ (w-1) ≤ f i
    · exact hc
    · simp [hc] at this; omega
  · intro h i hi; simp [h i hi]

/-- no field has its guard bit set -/
theorem guard_none {w n : Nat} {f : Nat → Nat} (hw : 0 < w) (hf : Fits w f n) :
    pack w f n &&& guard w n = 0 ↔ ∀ i, i < n → f i < 2 ^ (w-1) := by
  have h0 : ∀ m : Nat, pack w (fun _ => 0) m = 0 := by
    intro m
    induction m with
    | zero => rfl
    | succ m ih => simp only [pack]; rw [ih]; simp
  have e : (pack w f n &&& guard w n = 0) ↔
      (pack w (fun i => if 2 ^ (w-1) ≤ f i then 2 ^ (w-1) else 0) n = pack w (fun _ => 0) n) := by
    rw [land_guard hw hf, h0]
  rw [e, pack_eq_iff (fits_top hw) (fun _ _ => Nat.two_pow_pos w)]
  have hp : 0 < 2 ^ (w-1) := Nat.two_pow_pos _
  constructor
  · intro h i hi
    have := h i hi
    by_cases hc : 2 ^ (w-1) ≤ f i
    · simp [hc] at this <;> omega
    · omega
  · intro h i hi
    have h1 := h i hi
    have h2 : ¬ (2 ^ (w-1) ≤ f i) := by omega
    simp only [h2, if_false]

/-- "every count reaches its threshold": counts `c i < 2^(w-1)`, thresholds `k i ≤ 2^(w-1)` -/
theorem all_ge_iff {w n : Nat} {c k : Nat → Nat} (hw : 0 < w) (hc : ∀ i, i < n → c i < 2 ^ (w-1))
    (hk : ∀ i, i < n → k i ≤ 2 ^ (w-1)) :
    (pack w c n + pack w (fun i => 2 ^ (w-1) - k i) n) &&& guard w n = guard w n ↔ ∀ i, i < n → k i ≤ c i := by
  have e : 2 ^ w = 2 * 2 ^ (w-1) := by rw [← Nat.pow_succ']; congr 1; omega
  have hfit : Fits w (fun i => c i + (2 ^ (w-1) - k i)) n := by
    intro i hi; dsimp only; have := hc i hi; have := hk i hi; omega
  rw [pack_add, guard_all hw hfit]
  constructor
  · intro h i hi; have h1 := h i hi; have := hk i hi; omega
  · intro h i hi; have := h i hi; have := hk i hi; omega

/-- "some count exceeds its cap": counts `c i < 2^(w-1)`, caps `cap i < 2^(w-1)` -/
theorem any_gt_iff {w n : Nat} {c cap : Nat → Nat} (hw : 0 < w) (hc : ∀ i, i < n → c i < 2 ^ (w-1))
    (hcap : ∀ i, i < n → cap i < 2 ^ (w-1)) :
    (pack w c n + pack w (fun i => 2 ^ (w-1) - 1 - cap i) n) &&& guard w n ≠ 0 ↔ ∃ i, i < n ∧ cap i < c i := by
  have e : 2 ^ w = 2 * 2 ^ (w-1) := by rw [← Nat.pow_succ']; congr 1; omega
  have hfit : Fits w (fun i => c i + (2 ^ (w-1) - 1 - cap i)) n := by
    intro i hi; dsimp only; have := hc i hi; have := hcap i hi; omega
  rw [pack_add, Ne, guard_none hw hfit]
  constructor
  · intro h
    apply Classical.byContradiction
    intro hne
    apply h
    intro i hi
    have h1 : ¬ (cap i < c i) := fun hlt => hne ⟨i, hi, hlt⟩
    have := hcap i hi
    omega
  · intro ⟨i, hi, hlt⟩ h
    have h2 := h i hi; have := hcap i hi
    omega

end L1.Packed
