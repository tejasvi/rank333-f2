module
public import R22Port.U_d41d8cd98f00
public import GS.Bits2
/-! # L0, part 3: stride-32 packs as sums (`pk32`), `nz32`, `Base.pack`

`pk32 f n = ∑_{k<n} f k * 2^(32k)`.  With fields below `2^32` its bits are the fields' bits (`testBit_pk32`), its fields are
the `f k` (`fld_pk32`), and sums of packs are packs of sums (`pk32_add`), which is how carry-free SWAR additions are
read. -/
@[expose] public section
namespace GS
open G Finset

def pk32 (f : ℕ → ℕ) (n : ℕ) : ℕ := ∑ k ∈ range n, f k * 2 ^ (32 * k)

theorem pk32_succ (f : ℕ → ℕ) (n : ℕ) : pk32 f (n + 1) = pk32 f n + f n * 2 ^ (32 * n) := by
  unfold pk32; rw [Finset.sum_range_succ]

theorem pk32_zero (f : ℕ → ℕ) : pk32 f 0 = 0 := by simp [pk32]

theorem pk32_lt (f : ℕ → ℕ) (n : ℕ) (hf : ∀ k < n, f k < 2 ^ 32) : pk32 f n < 2 ^ (32 * n) := by
  induction n with
  | zero => simp [pk32]
  | succ n ih =>
    rw [pk32_succ]
    have h1 := ih (fun k hk => hf k (by omega))
    have h2 : f n ≤ 2 ^ 32 - 1 := by have := hf n (by omega); omega
    have hp : 2 ^ (32 * (n + 1)) = 2 ^ (32 * n) * 2 ^ 32 := by rw [Nat.mul_succ, pow_add]
    calc pk32 f n + f n * 2 ^ (32 * n) < 2 ^ (32 * n) + (2 ^ 32 - 1) * 2 ^ (32 * n) :=
          Nat.add_lt_add_of_lt_of_le h1 (Nat.mul_le_mul_right _ h2)
      _ = 2 ^ (32 * (n + 1)) := by rw [hp]; rw [Nat.sub_mul, Nat.one_mul]; have := Nat.one_le_two_pow (n := 32 * n); omega

theorem testBit_pk32 (f : ℕ → ℕ) (n p : ℕ) (hf : ∀ k < n, f k < 2 ^ 32) :
    (pk32 f n).testBit p = (decide (p / 32 < n) && (f (p / 32)).testBit (p % 32)) := by
  induction n generalizing p with
  | zero => simp [pk32]
  | succ n ih =>
    have hlt := pk32_lt f n (fun k hk => hf k (by omega))
    rw [pk32_succ, Nat.add_comm, Nat.mul_comm (f n), Nat.testBit_two_pow_mul_add (f n) hlt]
    by_cases hp : p < 32 * n
    · rw [if_pos hp, ih p (fun k hk => hf k (by omega))]
      have h1 : p / 32 < n := by omega
      have h2 : p / 32 < n + 1 := by omega
      simp [h1, h2]
    · rw [if_neg hp]
      by_cases hp2 : p < 32 * (n + 1)
      · have e1 : p / 32 = n := by omega
        have e2 : p - 32 * n = p % 32 := by omega
        rw [e2]; simp [e1]
      · have e1 : ¬ (p / 32 < n + 1) := by omega
        have hb : 32 ≤ p - 32 * n := by omega
        rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le (hf n (by omega)) (Nat.pow_le_pow_right (by norm_num) hb))]
        simp [e1]

theorem fld_pk32 (f : ℕ → ℕ) (n k : ℕ) (hf : ∀ k < n, f k < 2 ^ 32) (hk : k < n) : fld (pk32 f n) k = f k := by
  apply Nat.eq_of_testBit_eq; intro j
  rw [testBit_fld]
  by_cases hj : j < 32
  · rw [testBit_pk32 f n _ hf]
    have e1 : (32 * k + j) / 32 = k := by omega
    have e2 : (32 * k + j) % 32 = j := by omega
    simp [hj, e1, e2, hk]
  · have : (f k).testBit j = false := Nat.testBit_eq_false_of_lt
      (lt_of_lt_of_le (hf k hk) (Nat.pow_le_pow_right (by norm_num) (by omega)))
    simp [hj, this]

theorem pk32_add (f g : ℕ → ℕ) (n : ℕ) : pk32 f n + pk32 g n = pk32 (fun k => f k + g k) n := by
  unfold pk32; rw [← Finset.sum_add_distrib]; apply Finset.sum_congr rfl; intro k _; ring

theorem pk32_mul (c : ℕ) (f : ℕ → ℕ) (n : ℕ) : c * pk32 f n = pk32 (fun k => c * f k) n := by
  unfold pk32; rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro k _; ring

theorem rep32_pk (m : ℕ) : rep32 m = pk32 (fun _ => 1) m := by
  induction m with
  | zero => rw [rep32_zero, pk32_zero]
  | succ m ih => rw [rep32_succ, pk32_succ, ih, Nat.one_mul]

/-- every stride-32 number below `2^(32n)` is the pack of its fields -/
theorem eq_pk32 (P n : ℕ) (hP : P < 2 ^ (32 * n)) : P = pk32 (fld P) n := by
  have hf : ∀ k < n, fld P k < 2 ^ 32 := fun k _ => Nat.mod_lt _ (by norm_num)
  apply Nat.eq_of_testBit_eq; intro p
  rw [testBit_pk32 (fld P) n p hf, testBit_fld]
  by_cases hp : p / 32 < n
  · have e : 32 * (p / 32) + p % 32 = p := by omega
    simp [hp, Nat.mod_lt p (show 0 < 32 by norm_num), e]
  · rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hP (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hp]

/-! ## `nz32` -/

/-- bit `32k` of `nz32 z (rep32 m)` (`k < m`, fields of `z` below `2^31`) says that field `k` is nonzero; no other bits -/
theorem testBit_nz32 (g : ℕ → ℕ) (m p : ℕ) (hg : ∀ k < m, g k < 2 ^ 31) :
    (nz32 (pk32 g m) (rep32 m)).testBit p = (decide (p / 32 < m) && decide (p % 32 = 0) && decide (g (p / 32) ≠ 0)) := by
  unfold nz32
  show ((((pk32 g m) + 2147483647 * rep32 m) >>> 31) &&& rep32 m).testBit p = _
  rw [rep32_pk, pk32_mul, pk32_add]
  have hb : ∀ k < m, g k + 2147483647 * 1 < 2 ^ 32 := fun k hk => by have := hg k hk; omega
  rw [Nat.testBit_and, Nat.testBit_shiftRight, testBit_pk32 _ m _ hb, ← rep32_pk, testBit_rep32]
  by_cases hm : p / 32 < m
  · by_cases h0 : p % 32 = 0
    · have e1 : (31 + p) / 32 = p / 32 := by omega
      have e2 : (31 + p) % 32 = 31 := by omega
      rw [e1, e2]
      have hgk := hg (p / 32) hm
      have : (g (p / 32) + 2147483647 * 1).testBit 31 = decide (g (p / 32) ≠ 0) := by
        rw [Nat.testBit_eq_decide_div_mod_eq]
        rcases Nat.eq_zero_or_pos (g (p / 32)) with hz | hz
        · rw [hz]; decide
        · have h1 : (g (p / 32) + 2147483647 * 1) / 2 ^ 31 = 1 :=
            Nat.div_eq_of_lt_le (by norm_num; omega) (by norm_num; omega)
          rw [h1]; simp [Nat.pos_iff_ne_zero.mp hz]
      rw [this]; simp [hm, h0]
    · simp [h0]
  · simp [hm]

/-! ## `Base.pack` -/

/-- `pack f L k acc`: `acc` with `f (L.get i)` in field `k + i` -/
theorem pack_eq (f : ℕ → ℕ) : ∀ (L : List ℕ) (k acc : ℕ), (∀ x ∈ L, f x < 2 ^ 32) → acc < 2 ^ (32 * k) →
    pack f L k acc = acc + ∑ i ∈ range L.length, f (L.getD i 0) * 2 ^ (32 * (k + i))
  | [], k, acc, _, _ => by simp [pack]
  | x :: xs, k, acc, hf, hacc => by
    show pack f xs (Nat.succ k) (Nat.lor acc (Nat.shiftLeft (f x) (Nat.mul 32 k))) = _
    have hx : f x < 2 ^ 32 := hf x (List.mem_cons_self)
    have hlor : Nat.lor acc (Nat.shiftLeft (f x) (Nat.mul 32 k)) = acc + f x * 2 ^ (32 * k) := by
      show acc ||| (f x <<< (32 * k)) = _
      rw [Nat.lor_comm, ← Nat.shiftLeft_add_eq_or_of_lt hacc, Nat.shiftLeft_eq]
      ring
    rw [hlor]
    have hacc' : acc + f x * 2 ^ (32 * k) < 2 ^ (32 * Nat.succ k) := by
      have hp : 2 ^ (32 * Nat.succ k) = 2 ^ (32 * k) * 2 ^ 32 := by rw [Nat.mul_succ, pow_add]
      have h2 : f x ≤ 2 ^ 32 - 1 := by omega
      calc acc + f x * 2 ^ (32 * k) < 2 ^ (32 * k) + (2 ^ 32 - 1) * 2 ^ (32 * k) :=
            Nat.add_lt_add_of_lt_of_le hacc (Nat.mul_le_mul_right _ h2)
        _ = 2 ^ (32 * Nat.succ k) := by rw [hp, Nat.sub_mul, Nat.one_mul]; have := Nat.one_le_two_pow (n := 32 * k); omega
    rw [pack_eq f xs (Nat.succ k) _ (fun y hy => hf y (List.mem_cons_of_mem _ hy)) hacc']
    simp only [List.length_cons]
    rw [Finset.sum_range_succ']
    simp only [List.getD_cons_succ, List.getD_cons_zero, Nat.add_zero]
    have : ∀ i, 32 * (Nat.succ k + i) = 32 * (k + (i + 1)) := fun i => by rw [Nat.succ_eq_add_one]; ring
    simp only [this]
    ring

end GS

#print axioms GS.testBit_pk32
#print axioms GS.testBit_nz32
#print axioms GS.pack_eq
