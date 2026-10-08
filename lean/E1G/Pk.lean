module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import ECTables
/-! # Packed vectors for the E1 soundness proof

`pk B a L = ∑_{v < L} a v · 2^(B v)` packs `L` fields of `B` bits; `dig B N v` reads field `v`.  With fields below
`2^B` the packing is undone by `dig` (`dig_pk`) and is bitwise (`testBit_pk`), so `&&&`, `|||`, `^^^` act fieldwise
(`pk_and`, `pk_xor`).  Products of packings are convolutions (`pk_mul_pk`); with small fields there are no carries, so
one field of a product is a dot product (`dig_mul`). -/
@[expose] public section
namespace E1GS
open Finset

def dig (B N v : ℕ) : ℕ := N / 2 ^ (B * v) % 2 ^ B
def pk (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : ℕ := ∑ v ∈ range L, a v * 2 ^ (B * v)
/-- the kernel-friendly form of `pk` -/
def pkL (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : ℕ := Nat.rec 0 (fun v acc => acc + a v * 2 ^ (B * v)) L

theorem pkL_eq (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : pkL B a L = pk B a L := by
  induction L with
  | zero => rfl
  | succ L ih => unfold pk at *; rw [Finset.sum_range_succ, ← ih]; rfl

theorem pk_succ (B : ℕ) (a : ℕ → ℕ) (L : ℕ) : pk B a (L + 1) = pk B a L + a L * 2 ^ (B * L) := by
  unfold pk; rw [Finset.sum_range_succ]

theorem pk_add (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) : pk B (fun v => a v + b v) L = pk B a L + pk B b L := by
  unfold pk; rw [← Finset.sum_add_distrib]; congr 1; ext v; ring

theorem pk_mul_const (B : ℕ) (m : ℕ) (a : ℕ → ℕ) (L : ℕ) : pk B (fun v => a v * m) L = pk B a L * m := by
  unfold pk; rw [Finset.sum_mul]; congr 1; ext v; ring

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

theorem dig_ge (B : ℕ) (hB : 0 < B) (a : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, a v < 2 ^ B) (w : ℕ) (hw : L ≤ w) :
    dig B (pk B a L) w = 0 := by
  unfold dig
  have h1 := pk_lt B a L h
  have h2 : 2 ^ (B * L) ≤ 2 ^ (B * w) := Nat.pow_le_pow_right (by norm_num) (Nat.mul_le_mul_left _ hw)
  rw [Nat.div_eq_of_lt (by omega), Nat.zero_mod]

theorem testBit_dig (B N v j : ℕ) (hj : j < B) : (dig B N v).testBit j = N.testBit (B * v + j) := by
  unfold dig
  rw [Nat.testBit_mod_two_pow, Nat.testBit_div_two_pow]
  simp [hj, Nat.add_comm]

/-- bits of a packing: position `B v + j` is bit `j` of field `v` -/
theorem testBit_pk (B : ℕ) (hB : 0 < B) (a : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, a v < 2 ^ B) (p : ℕ) :
    (pk B a L).testBit p = (decide (p / B < L) && (a (p / B)).testBit (p % B)) := by
  have hp : p = B * (p / B) + p % B := (Nat.div_add_mod p B).symm
  have hj : p % B < B := Nat.mod_lt _ hB
  rw [hp, ← testBit_dig B _ _ _ hj, ← hp]
  by_cases hv : p / B < L
  · rw [dig_pk B a L h _ hv]; simp [hv]
  · rw [dig_ge B hB a L h _ (by omega)]; simp [hv]

theorem pk_ext (B : ℕ) (hB : 0 < B) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B)
    (h : ∀ v < L, a v = b v) : pk B a L = pk B b L := pk_congr B a b L h

theorem pk_inj (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B)
    (h : pk B a L = pk B b L) : ∀ v < L, a v = b v := by
  intro v hv; rw [← dig_pk B a L ha v hv, ← dig_pk B b L hb v hv, h]

/-- a number below `2^(B L)` is the packing of its fields -/
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

theorem dig_lt (B N v : ℕ) : dig B N v < 2 ^ B := Nat.mod_lt _ (by positivity)

/-! ## Bitwise operations act fieldwise -/

theorem pk_and (B : ℕ) (hB : 0 < B) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B) :
    pk B a L &&& pk B b L = pk B (fun v => a v &&& b v) L := by
  have hab : ∀ v < L, (a v &&& b v) < 2 ^ B := fun v hv => lt_of_le_of_lt Nat.and_le_left (ha v hv)
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_and, testBit_pk B hB a L ha, testBit_pk B hB b L hb, testBit_pk B hB _ L hab, Nat.testBit_and]
  cases decide (p / B < L) <;> simp

theorem pk_xor (B : ℕ) (hB : 0 < B) (a b : ℕ → ℕ) (L : ℕ) (ha : ∀ v < L, a v < 2 ^ B) (hb : ∀ v < L, b v < 2 ^ B) :
    pk B a L ^^^ pk B b L = pk B (fun v => a v ^^^ b v) L := by
  have hab : ∀ v < L, (a v ^^^ b v) < 2 ^ B := fun v hv => Nat.xor_lt_two_pow (ha v hv) (hb v hv)
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_xor, testBit_pk B hB a L ha, testBit_pk B hB b L hb, testBit_pk B hB _ L hab, Nat.testBit_xor]
  cases decide (p / B < L) <;> simp

/-- adding packings with no field overflow is fieldwise -/
theorem pk_add' (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) : pk B a L + pk B b L = pk B (fun v => a v + b v) L :=
  (pk_add B a b L).symm

/-- subtracting fieldwise smaller packings is fieldwise -/
theorem pk_sub (B : ℕ) (a b : ℕ → ℕ) (L : ℕ) (h : ∀ v < L, b v ≤ a v) :
    pk B a L - pk B b L = pk B (fun v => a v - b v) L := by
  have e : pk B a L = pk B (fun v => a v - b v) L + pk B b L := by
    rw [← pk_add]; apply pk_congr; intro v hv; have := h v hv; omega
  omega

/-! ## Products: convolutions -/

/-- `∑_{m < M} [l ≤ m ∧ m - l < K] g (m - l) = ∑_{k < K} g k` when `l + K ≤ M` -/
theorem sum_shift (g : ℕ → ℕ) (l K M : ℕ) (h : l + K ≤ M) :
    ∑ m ∈ range M, (if l ≤ m ∧ m - l < K then g (m - l) else 0) = ∑ k ∈ range K, g k := by
  obtain ⟨r, rfl⟩ : ∃ r, M = l + K + r := ⟨M - (l + K), by omega⟩
  rw [Finset.sum_range_add, Finset.sum_range_add]
  have e1 : ∑ m ∈ range l, (if l ≤ m ∧ m - l < K then g (m - l) else 0) = 0 := by
    apply Finset.sum_eq_zero; intro m hm; rw [Finset.mem_range] at hm; rw [if_neg (by omega)]
  have e2 : ∑ x ∈ range r, (if l ≤ l + K + x ∧ l + K + x - l < K then g (l + K + x - l) else 0) = 0 := by
    apply Finset.sum_eq_zero; intro m _; rw [if_neg (by omega)]
  rw [e1, e2, Nat.zero_add, Nat.add_zero]
  apply Finset.sum_congr rfl; intro k hk; rw [Finset.mem_range] at hk
  rw [if_pos (by omega), show l + k - l = k by omega]

/-- the product of two packings is the packing of their convolution -/
theorem pk_mul_pk (B : ℕ) (a b : ℕ → ℕ) (L1 L2 : ℕ) :
    pk B a L1 * pk B b L2 =
      pk B (fun m => ∑ l ∈ range L1, (if l ≤ m ∧ m - l < L2 then a l * b (m - l) else 0)) (L1 + L2) := by
  unfold pk
  rw [Finset.sum_mul]
  simp_rw [Finset.mul_sum]
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm (s := range (L1 + L2))]
  apply Finset.sum_congr rfl; intro l hl; rw [Finset.mem_range] at hl
  have := sum_shift (fun k => a l * b k * 2 ^ (B * (l + k))) l L2 (L1 + L2) (by omega)
  simp only at this
  calc ∑ i ∈ range L2, a l * 2 ^ (B * l) * (b i * 2 ^ (B * i))
      = ∑ k ∈ range L2, a l * b k * 2 ^ (B * (l + k)) := by
        apply Finset.sum_congr rfl; intro k _; rw [Nat.mul_add, pow_add]; ring
    _ = _ := this.symm
    _ = _ := by
        apply Finset.sum_congr rfl; intro m _
        by_cases hc : l ≤ m ∧ m - l < L2
        · rw [if_pos hc, if_pos hc, show l + (m - l) = m by omega]
        · rw [if_neg hc, if_neg hc, zero_mul]

end E1GS
