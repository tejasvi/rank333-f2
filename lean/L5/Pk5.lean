module
public import R22Port.U_d41d8cd98f00
public import E1.Pk
@[expose] public section
set_option maxHeartbeats 2000000
/-! # Packed-vector lemmas for the L1 v5 soundness proof

Generic facts about `E1S.pk` / `E1S.dig` used by the SWAR popcounts, the byte gather, the window construction and the
kill test of `L1.node4` / `R3RT.node5`:
* `pcnt n x`: the number of set bits of `x` below `n`;
* splitting a packing (`pk_split`), whole-field shifts (`pk_shr_field`), sub-field shifts (`pk_shr`, `pk_shr_and`);
* regrouping `k` fields of `B` bits into one field of `B k` bits (`pk_regroup`, `dig_regroup`);
* repeated constants (`pk_const_of_mul`: a constant is a packing if one multiplication says so). -/
namespace L5
open E1S Finset

/-! ## Notation bridges (the checkers are written with `Nat.land` etc.) -/
theorem land_eq (a b : ℕ) : Nat.land a b = a &&& b := rfl
theorem lor_eq (a b : ℕ) : Nat.lor a b = a ||| b := rfl
theorem shr_eq (a b : ℕ) : Nat.shiftRight a b = a >>> b := rfl
theorem shl_eq (a b : ℕ) : Nat.shiftLeft a b = a <<< b := rfl
theorem nsub_eq (a b : ℕ) : Nat.sub a b = a - b := rfl
theorem nadd_eq (a b : ℕ) : Nat.add a b = a + b := rfl
theorem nmul_eq (a b : ℕ) : Nat.mul a b = a * b := rfl
theorem ndiv_eq (a b : ℕ) : Nat.div a b = a / b := rfl

/-! ## Popcounts -/

/-- the number of set bits of `x` below `n` -/
def pcnt (n x : ℕ) : ℕ := Nat.rec (motive := fun _ => ℕ) 0 (fun j acc => acc + (x.testBit j).toNat) n

theorem pcnt_succ (n x : ℕ) : pcnt (n + 1) x = pcnt n x + (x.testBit n).toNat := rfl
theorem pcnt_zero (x : ℕ) : pcnt 0 x = 0 := rfl

theorem pcnt_eq_sum (n x : ℕ) : pcnt n x = ∑ j ∈ range n, (x.testBit j).toNat := by
  induction n with
  | zero => rfl
  | succ n ih => rw [pcnt_succ, ih, sum_range_succ]

theorem pcnt_eq_card (n x : ℕ) : pcnt n x = ((range n).filter (fun j => x.testBit j = true)).card := by
  rw [pcnt_eq_sum, card_filter]
  apply sum_congr rfl; intro j _; cases x.testBit j <;> rfl

theorem pcnt_congr (n x y : ℕ) (h : ∀ j < n, x.testBit j = y.testBit j) : pcnt n x = pcnt n y := by
  rw [pcnt_eq_sum, pcnt_eq_sum]; apply sum_congr rfl; intro j hj; rw [h j (mem_range.mp hj)]

theorem pcnt_le (n x : ℕ) : pcnt n x ≤ n := by
  induction n with
  | zero => exact le_refl 0
  | succ n ih => rw [pcnt_succ]; have : (x.testBit n).toNat ≤ 1 := Bool.toNat_le _; omega

theorem pcnt_add (a b x : ℕ) : pcnt (a + b) x = pcnt a x + pcnt b (x >>> a) := by
  rw [pcnt_eq_sum, pcnt_eq_sum, pcnt_eq_sum, sum_range_add]
  congr 1; apply sum_congr rfl; intro j _; rw [Nat.testBit_shiftRight]

theorem pcnt_mod (n x : ℕ) : pcnt n (x % 2 ^ n) = pcnt n x := by
  apply pcnt_congr; intro j hj; rw [Nat.testBit_mod_two_pow]; simp [hj]

theorem pcnt_mono (n x y : ℕ) (h : ∀ j < n, x.testBit j = true → y.testBit j = true) : pcnt n x ≤ pcnt n y := by
  rw [pcnt_eq_sum, pcnt_eq_sum]; apply sum_le_sum; intro j hj
  have := h j (mem_range.mp hj); cases hx : x.testBit j <;> cases hy : y.testBit j <;> simp_all

theorem pcnt_zero_x (n : ℕ) : pcnt n 0 = 0 := by
  rw [pcnt_eq_sum]; simp

/-! ## Splitting, shifting and regrouping packings -/

theorem pk_split (B : ℕ) (Q : ℕ → ℕ) (k L : ℕ) :
    pk B Q (k + L) = pk B Q k + 2 ^ (B * k) * pk B (fun i => Q (k + i)) L := by
  unfold pk; rw [sum_range_add, mul_sum]; congr 1; apply sum_congr rfl; intro i _; rw [Nat.mul_add, pow_add]; ring

theorem pk_shr_field (B : ℕ) (Q : ℕ → ℕ) (k L : ℕ) (h : ∀ i < k, Q i < 2 ^ B) :
    pk B Q (k + L) >>> (B * k) = pk B (fun i => Q (k + i)) L := by
  rw [Nat.shiftRight_eq_div_pow, pk_split, Nat.add_mul_div_left _ _ (by positivity), Nat.div_eq_of_lt (pk_lt B Q k h),
    Nat.zero_add]

theorem pk_mod (B : ℕ) (Q : ℕ → ℕ) (k L : ℕ) (h : ∀ i < k, Q i < 2 ^ B) : pk B Q (k + L) % 2 ^ (B * k) = pk B Q k := by
  rw [pk_split, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (pk_lt B Q k h)]

theorem pcnt_pk (B : ℕ) (Q : ℕ → ℕ) (L : ℕ) (h : ∀ i < L, Q i < 2 ^ B) :
    pcnt (B * L) (pk B Q L) = ∑ i ∈ range L, pcnt B (Q i) := by
  induction L with
  | zero => simp [pcnt_zero]
  | succ L ih =>
    have hL : ∀ i < L, Q i < 2 ^ B := fun i hi => h i (by omega)
    rw [sum_range_succ, ← ih hL, show B * (L + 1) = B * L + B by ring, pcnt_add]
    have e1 : pk B Q (L + 1) % 2 ^ (B * L) = pk B Q L := pk_mod B Q L 1 hL
    have e2 : pk B Q (L + 1) >>> (B * L) = Q L := by
      rw [pk_shr_field B Q L 1 hL]; unfold pk; simp
    rw [← pcnt_mod (B * L) (pk B Q (L + 1)), e1, e2]

/-- regroup `k n` fields of `B` bits into `n` fields of `B k` bits -/
theorem pk_regroup (B k : ℕ) (Q : ℕ → ℕ) (n : ℕ) :
    pk B Q (k * n) = pk (B * k) (fun i => pk B (fun j => Q (k * i + j)) k) n := by
  induction n with
  | zero => simp [pk]
  | succ n ih =>
    rw [show k * (n + 1) = k * n + k by ring, pk_split, ih, pk_succ]
    rw [show B * (k * n) = B * k * n by ring, mul_comm (2 ^ (B * k * n))]

/-- a field of `B k` bits is the packing of its `k` fields of `B` bits -/
theorem dig_regroup (B k x i : ℕ) : dig (B * k) x i = pk B (fun j => dig B x (k * i + j)) k := by
  have h1 := pk_dig_mod B (x / 2 ^ (B * k * i)) k
  have e : dig (B * k) x i = x / 2 ^ (B * k * i) % 2 ^ (B * k) := rfl
  rw [e, ← h1]
  apply pk_congr; intro j _
  unfold dig
  rw [Nat.div_div_eq_div_mul, ← pow_add, show B * k * i + B * j = B * (k * i + j) by ring]

/-! ## Repeated constants -/

theorem pk_const_mul (B c L : ℕ) : pk B (fun _ => c) L * (2 ^ B - 1) = c * (2 ^ (B * L) - 1) := by
  induction L with
  | zero => simp [pk]
  | succ L ih =>
    rw [pk_succ, add_mul, ih]
    have h1 : 1 ≤ 2 ^ (B * L) := Nat.one_le_two_pow
    have h2 : 1 ≤ 2 ^ B := Nat.one_le_two_pow
    have h3 : 1 ≤ 2 ^ (B * (L + 1)) := Nat.one_le_two_pow
    zify [h1, h2, h3]
    rw [show B * (L + 1) = B * L + B by ring, pow_add]; ring

/-- a constant `K` is the packing of `L` copies of `c` when `K (2^B - 1) = c (2^(B L) - 1)` (one multiplication) -/
theorem pk_const_of_mul (B c L K : ℕ) (hB : 0 < B) (h : K * (2 ^ B - 1) = c * (2 ^ (B * L) - 1)) :
    K = pk B (fun _ => c) L := by
  have hpos : 0 < 2 ^ B - 1 := by have := Nat.one_lt_two_pow hB.ne'; omega
  apply Nat.eq_of_mul_eq_mul_right hpos; rw [h, pk_const_mul]

/-! ## Sub-field shifts -/

theorem divmod_eq (B q r : ℕ) (hr : r < B) : (B * q + r) / B = q ∧ (B * q + r) % B = r := by
  have hB : 0 < B := by omega
  constructor
  · rw [Nat.add_comm, Nat.add_mul_div_left _ _ hB, Nat.div_eq_of_lt hr, Nat.zero_add]
  · rw [Nat.add_comm, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hr]

/-- bit `j` of `2^a y + z` with `z < 2^a` -/
theorem testBit_hi_lo (a y z j : ℕ) (hz : z < 2 ^ a) :
    (z + y * 2 ^ a).testBit j = if j < a then z.testBit j else y.testBit (j - a) := by
  rw [show z + y * 2 ^ a = 2 ^ a * y + z by ring, Nat.testBit_two_pow_mul_add _ hz]

/-- shifting a packing right by `s ≤ B` bits: field `i` takes the low `s` bits of field `i + 1` on top -/
theorem pk_shr (B s : ℕ) (hB : 0 < B) (hs : s ≤ B) (X : ℕ → ℕ) (L : ℕ) (hX : ∀ i < L, X i < 2 ^ B) :
    pk B X L >>> s = pk B (fun i => X i >>> s + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s)) L := by
  have hlo : ∀ i < L, X i >>> s < 2 ^ (B - s) := by
    intro i hi; rw [Nat.shiftRight_eq_div_pow, Nat.div_lt_iff_lt_mul (by positivity), ← pow_add, Nat.sub_add_cancel hs]
    exact hX i hi
  have hY : ∀ i, (if i + 1 < L then X (i + 1) % 2 ^ s else 0) < 2 ^ s := by
    intro i; split
    · exact Nat.mod_lt _ (by positivity)
    · positivity
  have hF : ∀ i < L, X i >>> s + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s) < 2 ^ B := by
    intro i hi
    have h1 := hlo i hi
    have h2 := hY i
    have e : 2 ^ B = 2 ^ s * 2 ^ (B - s) := by rw [← pow_add, Nat.add_sub_cancel' hs]
    rw [e]
    calc X i >>> s + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s)
        < 2 ^ (B - s) + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s) := by omega
      _ = ((if i + 1 < L then X (i + 1) % 2 ^ s else 0) + 1) * 2 ^ (B - s) := by ring
      _ ≤ 2 ^ s * 2 ^ (B - s) := Nat.mul_le_mul_right _ h2
  apply Nat.eq_of_testBit_eq; intro p
  rw [Nat.testBit_shiftRight, testBit_pk B hB X L hX, testBit_pk B hB _ L hF]
  obtain ⟨q, j, hjB, rfl⟩ : ∃ q j, j < B ∧ p = B * q + j := ⟨p / B, p % B, Nat.mod_lt _ hB, (Nat.div_add_mod p B).symm⟩
  rw [(divmod_eq B q j hjB).1, (divmod_eq B q j hjB).2]
  by_cases hjs : j + s < B
  · have e := divmod_eq B q (j + s) hjs
    rw [show s + (B * q + j) = B * q + (j + s) by omega, e.1, e.2]
    by_cases hqL : q < L
    · simp only [hqL, decide_true, Bool.true_and]
      rw [testBit_hi_lo _ _ _ _ (hlo q hqL), if_pos (by omega), Nat.testBit_shiftRight, Nat.add_comm s j]
    · simp [hqL]
  · have e := divmod_eq B (q + 1) (j + s - B) (by omega)
    rw [show s + (B * q + j) = B * (q + 1) + (j + s - B) by rw [Nat.mul_add]; omega, e.1, e.2]
    by_cases hqL : q + 1 < L
    · simp only [hqL, show q < L by omega, decide_true, Bool.true_and, if_true]
      rw [testBit_hi_lo _ _ _ _ (hlo q (by omega)), if_neg (by omega), Nat.testBit_mod_two_pow]
      rw [show j - (B - s) = j + s - B by omega]
      simp only [show j + s - B < s by omega, decide_true, Bool.true_and]
    · simp only [hqL, decide_false, Bool.false_and]
      by_cases hq' : q < L
      · simp only [hq', decide_true, Bool.true_and, if_false, zero_mul, Nat.add_zero]
        exact (Nat.testBit_lt_two_pow (lt_of_lt_of_le (hlo q hq') (Nat.pow_le_pow_right (by norm_num) (by omega)))).symm
      · simp [hq']

/-- shift by `s` bits, then mask each field with `M < 2^(B - s)`: fieldwise -/
theorem pk_shr_and (B s : ℕ) (hB : 0 < B) (hs : s ≤ B) (X : ℕ → ℕ) (L M : ℕ) (hX : ∀ i < L, X i < 2 ^ B)
    (hM : M < 2 ^ (B - s)) :
    (pk B X L >>> s) &&& pk B (fun _ => M) L = pk B (fun i => (X i >>> s) &&& M) L := by
  have hlo : ∀ i < L, X i >>> s < 2 ^ (B - s) := by
    intro i hi; rw [Nat.shiftRight_eq_div_pow, Nat.div_lt_iff_lt_mul (by positivity), ← pow_add, Nat.sub_add_cancel hs]
    exact hX i hi
  have hMB : M < 2 ^ B := lt_of_lt_of_le hM (Nat.pow_le_pow_right (by norm_num) (by omega))
  rw [pk_shr B s hB hs X L hX]
  have hF : ∀ i < L, X i >>> s + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s) < 2 ^ B := by
    intro i hi
    have e := congrArg (fun y => y.testBit 0) (pk_shr B s hB hs X L hX)
    -- bound from the packing identity's field bound (recomputed)
    have h1 := hlo i hi
    have h2 : (if i + 1 < L then X (i + 1) % 2 ^ s else 0) < 2 ^ s := by
      split
      · exact Nat.mod_lt _ (by positivity)
      · positivity
    have e2 : 2 ^ B = 2 ^ s * 2 ^ (B - s) := by rw [← pow_add, Nat.add_sub_cancel' hs]
    rw [e2]
    calc X i >>> s + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s)
        < 2 ^ (B - s) + (if i + 1 < L then X (i + 1) % 2 ^ s else 0) * 2 ^ (B - s) := by omega
      _ = ((if i + 1 < L then X (i + 1) % 2 ^ s else 0) + 1) * 2 ^ (B - s) := by ring
      _ ≤ 2 ^ s * 2 ^ (B - s) := Nat.mul_le_mul_right _ h2
  rw [pk_and B hB _ _ L hF (fun _ _ => hMB)]
  apply pk_congr; intro i hi
  apply Nat.eq_of_testBit_eq; intro j
  rw [Nat.testBit_and, Nat.testBit_and, testBit_hi_lo _ _ _ _ (hlo i hi)]
  split
  · rfl
  · have : M.testBit j = false := Nat.testBit_lt_two_pow
      (lt_of_lt_of_le hM (Nat.pow_le_pow_right (by norm_num) (by omega)))
    rw [this, Bool.and_false, Bool.and_false]

/-- product with a run of ones: sliding-window sums -/
theorem pk_mul_ones (B : ℕ) (P : ℕ → ℕ) (L K : ℕ) :
    pk B P L * pk B (fun _ => 1) K = pk B (fun m => ∑ l ∈ range L, if l ≤ m ∧ m - l < K then P l else 0) (L + K) := by
  rw [pk_mul_pk]; apply pk_congr; intro m _; apply sum_congr rfl; intro l _; split <;> simp

end L5
