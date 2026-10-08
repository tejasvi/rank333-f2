module
public import R22Port.U_d41d8cd98f00
public import MisF.Farkas
/-! # Packed digits: `L` fields of `B` bits in one natural number

`dig B N v` is field `v` of `N`; `pk B a L = ∑_{v < L} a v · 2^(B v)` packs `L` field values.  Packing is linear, and with
field values below `2^B` it is undone by `dig` (base-`2^B` representation).  Two masks are read bitwise: `N &&& TOP = 0`
bounds every field below `2^(B-1)`, `N &&& NOTUNIT = 0` makes every field 0 or 1. -/
@[expose] public section
namespace MisF
open Finset

def dig (B N v : ℕ) : ℕ := N / 2 ^ (B * v) % 2 ^ B
def pk (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : ℕ := ∑ v ∈ range L, a v * 2 ^ (B * v)
/-- the kernel-friendly form of `pk` (a recursor loop) -/
def pkL (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : ℕ := Nat.rec 0 (fun v acc => acc + a v * 2 ^ (B * v)) L

theorem pkL_eq (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : pkL B a L = pk B a L := by
  induction L with
  | zero => rfl
  | succ L ih => unfold pk at *; rw [Finset.sum_range_succ, ← ih]; rfl

theorem pk_succ (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : pk B a (L + 1) = pk B a L + a L * 2 ^ (B * L) := by
  unfold pk; rw [Finset.sum_range_succ]

theorem pk_add (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) : pk B (fun v => a v + b v) L = pk B a L + pk B b L := by
  unfold pk; rw [← Finset.sum_add_distrib]; congr 1; ext v; ring

theorem pk_mul (B : ℕ) (m : ℕ) (a : ℕ → ℕ) (L : ℕ) : pk B (fun v => m * a v) L = m * pk B a L := by
  unfold pk; rw [Finset.mul_sum]; congr 1; ext v; ring

theorem pk_zero (B L : ℕ) : pk B (fun _ => 0) L = 0 := by unfold pk; simp

theorem pk_congr (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, a v = b v) : pk B a L = pk B b L := by
  unfold pk; apply Finset.sum_congr rfl; intro v hv; rw [h v (Finset.mem_range.mp hv)]

theorem pk_lt (B : ℕ) (a : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, a v < 2 ^ B) : pk B a L < 2 ^ (B * L) := by
  induction L with
  | zero => simp [pk]
  | succ L ih =>
    rw [pk_succ]
    have h1 := ih (fun v hv => h v (by omega))
    have h2 : a L + 1 ≤ 2 ^ B := h L (by omega)
    have h3 : 2 ^ (B * (L + 1)) = 2 ^ B * 2 ^ (B * L) := by rw [Nat.mul_succ, pow_add, mul_comm]
    rw [h3]
    calc pk B a L + a L * 2 ^ (B * L) < 2 ^ (B * L) + a L * 2 ^ (B * L) := by omega
      _ = (a L + 1) * 2 ^ (B * L) := by ring
      _ ≤ 2 ^ B * 2 ^ (B * L) := Nat.mul_le_mul_right _ h2

/-- adding a multiple of `2^(B(w+1))` leaves field `w` alone -/
theorem dig_add_high (B N Y w : ℕ) : dig B (N + 2 ^ (B * (w + 1)) * Y) w = dig B N w := by
  unfold dig
  have hp : 2 ^ (B * (w + 1)) * Y = 2 ^ (B * w) * (2 ^ B * Y) := by rw [Nat.mul_succ, pow_add]; ring
  rw [hp, Nat.add_mul_div_left _ _ (by positivity), Nat.add_mul_mod_self_left]

theorem dig_pk (B : ℕ) (a : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, a v < 2 ^ B) : ∀ w < L, dig B (pk B a L) w = a w := by
  induction L with
  | zero => intro w hw; omega
  | succ L ih =>
    intro w hw
    rw [pk_succ]
    rcases (by omega : w < L ∨ w = L) with hwL | rfl
    · obtain ⟨k, hk⟩ : ∃ k, L = w + 1 + k := ⟨L - (w + 1), by omega⟩
      have : a L * 2 ^ (B * L) = 2 ^ (B * (w + 1)) * (a L * 2 ^ (B * k)) := by
        rw [hk, Nat.mul_add, pow_add]; ring
      rw [this, dig_add_high]
      exact ih (fun v hv => h v (by omega)) w hwL
    · unfold dig
      have hlow : pk B a w < 2 ^ (B * w) := pk_lt B a w (fun v hv => h v (by omega))
      rw [show pk B a w + a w * 2 ^ (B * w) = pk B a w + 2 ^ (B * w) * a w by ring,
        Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt hlow, Nat.zero_add,
        Nat.mod_eq_of_lt (h w (by omega))]

theorem dig_lt (B N v : ℕ) : dig B N v < 2 ^ B := Nat.mod_lt _ (by positivity)

theorem pk_dig_mod (B N : ℕ) : ∀ L, pk B (dig B N) L = N % 2 ^ (B * L) := by
  intro L
  induction L with
  | zero => simp [pk, Nat.mod_one]
  | succ L ih =>
    rw [pk_succ, ih]
    unfold dig
    have h3 : 2 ^ (B * (L + 1)) = 2 ^ (B * L) * 2 ^ B := by rw [Nat.mul_succ, pow_add]
    rw [h3, Nat.mod_mul]; ring

theorem pk_dig (B N L : ℕ) (h : N < 2 ^ (B * L)) : pk B (dig B N) L = N := by
  rw [pk_dig_mod, Nat.mod_eq_of_lt h]

/-- equal packings with small fields have equal fields -/
theorem pk_inj (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B)
    (h : pk B a L = pk B b L) : ∀ v < L, a v = b v := by
  intro v hv; rw [← dig_pk B a L ha v hv, ← dig_pk B b L hb v hv, h]

/-! ## Bits of a field -/

theorem testBit_dig (B N v j : ℕ) (hj : j < B) : (dig B N v).testBit j = N.testBit (B * v + j) := by
  unfold dig
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow]
  simp [hj, Nat.add_comm]

theorem lt_half_of_testBit {B x : ℕ} (hB : 0 < B) (hx : x < 2 ^ B) (hb : x.testBit (B - 1) = false) : x < 2 ^ (B - 1) := by
  by_contra hc
  push Not at hc
  have hB' : 2 ^ B = 2 * 2 ^ (B - 1) := by
    rw [← pow_succ']; congr 1; omega
  have hq : x / 2 ^ (B - 1) = 1 := by
    have h1 : 1 ≤ x / 2 ^ (B - 1) := (Nat.le_div_iff_mul_le (by positivity)).mpr (by simpa using hc)
    have h2 : x / 2 ^ (B - 1) < 2 := (Nat.div_lt_iff_lt_mul (by positivity)).mpr (by rw [hB'] at hx; linarith)
    omega
  rw [Nat.testBit_eq_decide_div_mod_eq, hq] at hb
  simp at hb

theorem le_one_of_testBit {B x : ℕ} (hx : x < 2 ^ B) (hb : ∀ j, 1 ≤ j → j < B → x.testBit j = false) : x ≤ 1 := by
  have h2 : x / 2 = 0 := by
    apply Nat.eq_of_testBit_eq
    intro i
    rw [Nat.zero_testBit, ← Nat.shiftRight_one, Nat.testBit_shiftRight]
    by_cases hi : 1 + i < B
    · exact hb (1 + i) (by omega) hi
    · apply Nat.testBit_lt_two_pow
      calc x < 2 ^ B := hx
        _ ≤ 2 ^ (1 + i) := Nat.pow_le_pow_right (by norm_num) (by omega)
  omega

/-- `N &&& TOP = 0`: every field of `N` is below `2^(B-1)` (`TOP` has field value `2^(B-1)` everywhere) -/
theorem dig_lt_half (B L N TOP : ℕ) (hB : 0 < B) (hTOP : TOP = pk B (fun _ => 2 ^ (B - 1)) L)
    (hand : N &&& TOP = 0) : ∀ v < L, dig B N v < 2 ^ (B - 1) := by
  intro v hv
  apply lt_half_of_testBit hB (dig_lt B N v)
  have ht : TOP.testBit (B * v + (B - 1)) = true := by
    rw [← testBit_dig B TOP v (B - 1) (by omega), hTOP,
      dig_pk B _ L (fun _ _ => Nat.pow_lt_pow_right (by norm_num) (by omega)) v hv]
    simp
  have h0 := congrArg (fun z => z.testBit (B * v + (B - 1))) hand
  simp only [Nat.testBit_and, ht, Bool.and_true, Nat.zero_testBit] at h0
  rw [testBit_dig B N v (B - 1) (by omega), h0]

/-- `N &&& NOTUNIT = 0`: every field of `N` is 0 or 1 (`NOTUNIT` has field value `2^B - 2` everywhere) -/
theorem dig_le_one (B L N NU : ℕ) (hNU : NU = pk B (fun _ => 2 ^ B - 2) L) (hand : N &&& NU = 0) :
    ∀ v < L, dig B N v ≤ 1 := by
  intro v hv
  apply le_one_of_testBit (dig_lt B N v)
  intro j hj1 hjB
  have hB : 2 ≤ 2 ^ B := by
    calc 2 = 2 ^ 1 := by norm_num
      _ ≤ 2 ^ B := Nat.pow_le_pow_right (by norm_num) (by omega)
  have ht : NU.testBit (B * v + j) = true := by
    rw [← testBit_dig B NU v j hjB, hNU, dig_pk B _ L (fun _ _ => by omega) v hv]
    -- bit j of 2^B - 2 (1 ≤ j < B) is set
    have : 2 ^ B - 2 = 2 * (2 ^ (B - 1) - 1) := by
      have : 2 ^ B = 2 * 2 ^ (B - 1) := by rw [← pow_succ']; congr 1; omega
      omega
    have h1 : 2 ^ B - 2 = 2 ^ 1 * (2 ^ (B - 1) - 1) := by rw [this]; ring
    rw [h1, Nat.testBit_two_pow_mul, Nat.testBit_two_pow_sub_one]
    simp only [ge_iff_le, Bool.and_eq_true, decide_eq_true_eq]
    omega
  have h0 := congrArg (fun z => z.testBit (B * v + j)) hand
  simp only [Nat.testBit_and, ht, Bool.and_true, Nat.zero_testBit] at h0
  rw [testBit_dig B N v j hjB, h0]

end MisF
