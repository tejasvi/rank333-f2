module
public import R22Port.U_6d73af0793e7
public import Mathlib
/-! # Bit-level semantics of the per-record tables `xtab`, `gtab` (BranchCheck v6)

`xtab P` (and `gtab P`) tabulate a linear map `j ↦ ⊕_{i ∈ j} H_i` over `j < 512` in 9-bit entries, by doubling: from
`T_0 = 0`, `T_{k+1} = T_k ||| ((T_k ^^^ H_k * R9 k) <<< 9·2^k)` with `R9 k = ∑_{j < 2^k} 2^(9j)`.  `dbl_entry`: entry `j`
of `T_k` is `⊕_{i < k, bit i of j} H_i` for `j < 2^k` (all `H_i < 512`).  With `H_i = x(e_i)` (the high half of slot `i`
of `P`) this is `xof P j`; with `H_i = g(e_i)` it is `gof P j` (B's `xof`/`gof` semantics). -/
@[expose] public section
namespace RootSound.DblBits

/-- entry `j` of a table of 9-bit entries -/
def tb (T j : Nat) : Nat := (T >>> (9 * j)) % 512

/-- `∑_{j < 2^k} 2^(9j)` -/
def R9 (k : Nat) : Nat := ∑ j ∈ Finset.range (2 ^ k), 2 ^ (9 * j)

/-- one doubling step -/
def dstep (T H k : Nat) : Nat := T ||| ((T ^^^ H * R9 k) <<< (9 * 2 ^ k))

/-- the table after `k` steps over the values `H 0, ..., H (k-1)` -/
def dbl (H : Nat → Nat) : Nat → Nat
  | 0 => 0
  | k + 1 => dstep (dbl H k) (H k) k

/-- the linear map on `j`: `⊕_{i < k, bit i of j} H_i` -/
def lin (H : Nat → Nat) : Nat → Nat → Nat
  | 0, _ => 0
  | k + 1, j => lin H k j ^^^ (if j.testBit k then H k else 0)

theorem testBit_tb (T j i : Nat) : (tb T j).testBit i = (decide (i < 9) && T.testBit (9 * j + i)) := by
  unfold tb
  rw [show (512 : Nat) = 2 ^ 9 by norm_num, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight]

theorem tb_lt (T j : Nat) : tb T j < 512 := Nat.mod_lt _ (by norm_num)

theorem eq_of_tb {a b : Nat} (ha : a < 512) (hb : b < 512) (h : ∀ i < 9, a.testBit i = b.testBit i) : a = b := by
  apply Nat.eq_of_testBit_eq
  intro i
  by_cases hi : i < 9
  · exact h i hi
  · have h9 : 9 ≤ i := Nat.le_of_not_lt hi
    rw [Nat.testBit_eq_false_of_lt (lt_of_lt_of_le ha (by
      calc 512 = 2 ^ 9 := by norm_num
        _ ≤ 2 ^ i := Nat.pow_le_pow_right (by norm_num) h9)),
      Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hb (by
      calc 512 = 2 ^ 9 := by norm_num
        _ ≤ 2 ^ i := Nat.pow_le_pow_right (by norm_num) h9))]

/-- `x ||| (y <<< s) < 2^(s+s)` for `x, y < 2^s` -/
theorem or_shift_lt {x y s : Nat} (hx : x < 2 ^ s) (hy : y < 2 ^ s) : x ||| y <<< s < 2 ^ (s + s) := by
  apply Nat.or_lt_two_pow
  · exact lt_of_lt_of_le hx (Nat.pow_le_pow_right (by norm_num) (by omega))
  · rw [Nat.shiftLeft_eq, pow_add]
    exact Nat.mul_lt_mul_of_pos_right hy (by positivity)

/-- `x + y * 2^s = x ||| y <<< s` for `x < 2^s` -/
theorem add_shift_eq_or {x y s : Nat} (hx : x < 2 ^ s) : x + y * 2 ^ s = x ||| y <<< s := by
  rw [Nat.shiftLeft_eq, add_comm, mul_comm, Nat.two_pow_add_eq_or_of_lt hx, Nat.lor_comm]

theorem R9_succ (k : Nat) : R9 (k + 1) = R9 k + R9 k * 2 ^ (9 * 2 ^ k) := by
  unfold R9
  rw [pow_succ, mul_two, Finset.sum_range_add, Finset.sum_mul]
  congr 1
  refine Finset.sum_congr rfl (fun j _ => ?_)
  rw [← pow_add]
  congr 1
  ring

/-- `H * R9 k` is `H` in each of the `2^k` 9-bit slots, and fits in them -/
theorem rep_spec (H : Nat) (hH : H < 512) : ∀ k, H * R9 k < 2 ^ (9 * 2 ^ k) ∧ ∀ j < 2 ^ k, tb (H * R9 k) j = H
  | 0 => by
    refine ⟨by simpa [R9] using hH, fun j hj => ?_⟩
    have : j = 0 := by simpa using hj
    subst this
    simp [R9, tb, Nat.mod_eq_of_lt hH]
  | k + 1 => by
    obtain ⟨hlt, hent⟩ := rep_spec H hH k
    set s := 9 * 2 ^ k with hs
    have hsplit : H * R9 (k + 1) = H * R9 k ||| (H * R9 k) <<< s := by
      rw [R9_succ, mul_add, ← mul_assoc]
      exact add_shift_eq_or hlt
    refine ⟨?_, fun j hj => ?_⟩
    · rw [hsplit]
      have h2 : 9 * 2 ^ (k + 1) = s + s := by rw [hs, pow_succ]; ring
      rw [h2]
      exact or_shift_lt hlt hlt
    · rw [hsplit]
      apply eq_of_tb (tb_lt _ _) hH
      intro i hi
      rw [testBit_tb, Nat.testBit_lor, Nat.testBit_shiftLeft]
      by_cases hj2 : j < 2 ^ k
      · have := hent j hj2
        have hti := congrArg (fun x => x.testBit i) this
        simp only [testBit_tb, hi, decide_true, Bool.true_and] at hti
        have hge : ¬ (9 * j + i ≥ s) := by rw [hs]; omega
        simp [hi, hti, hge]
      · have hj3 : j - 2 ^ k < 2 ^ k := by rw [pow_succ] at hj; omega
        have := hent (j - 2 ^ k) hj3
        have hti := congrArg (fun x => x.testBit i) this
        simp only [testBit_tb, hi, decide_true, Bool.true_and] at hti
        have hge : 9 * j + i ≥ s := by rw [hs]; omega
        have hidx : 9 * j + i - s = 9 * (j - 2 ^ k) + i := by rw [hs]; omega
        have hlow : (H * R9 k).testBit (9 * j + i) = false :=
          Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
        simp [hi, hge, hidx, hti, hlow]

/-- **Doubling tables**: `dbl H k < 2^(9·2^k)` and entry `j < 2^k` of `dbl H k` is `lin H k j`. -/
theorem dbl_spec (H : Nat → Nat) (hH : ∀ i, H i < 512) : ∀ k, dbl H k < 2 ^ (9 * 2 ^ k) ∧ ∀ j < 2 ^ k, tb (dbl H k) j = lin H k j
  | 0 => by
    refine ⟨by simp [dbl], fun j hj => ?_⟩
    have : j = 0 := by simpa using hj
    subst this
    simp [dbl, lin, tb]
  | k + 1 => by
    obtain ⟨hlt, hent⟩ := dbl_spec H hH k
    obtain ⟨rlt, rent⟩ := rep_spec (H k) (hH k) k
    set s := 9 * 2 ^ k with hs
    set T := dbl H k
    have hxlt : T ^^^ H k * R9 k < 2 ^ s := Nat.xor_lt_two_pow hlt rlt
    have hd : dbl H (k + 1) = T ||| (T ^^^ H k * R9 k) <<< s := rfl
    refine ⟨?_, fun j hj => ?_⟩
    · rw [hd]
      have h2 : 9 * 2 ^ (k + 1) = s + s := by rw [hs, pow_succ]; ring
      rw [h2]
      exact or_shift_lt hlt hxlt
    · rw [hd]
      have hlin_lt : ∀ k' j', lin H k' j' < 512 := by
        intro k'
        induction k' with
        | zero => intro j'; simp [lin]
        | succ k'' ih =>
          intro j'
          simp only [lin]
          split_ifs
          · exact Nat.xor_lt_two_pow (n := 9) (ih j') (hH k'')
          · simpa using ih j'
      apply eq_of_tb (tb_lt _ _) (hlin_lt _ _)
      intro i hi
      rw [testBit_tb, Nat.testBit_lor, Nat.testBit_shiftLeft]
      simp only [lin]
      by_cases hj2 : j < 2 ^ k
      · -- low half: entry of T; bit k of j is clear
        have hti := congrArg (fun x => x.testBit i) (hent j hj2)
        simp only [testBit_tb, hi, decide_true, Bool.true_and] at hti
        have hge : ¬ (9 * j + i ≥ s) := by rw [hs]; omega
        have hbk : j.testBit k = false := Nat.testBit_eq_false_of_lt hj2
        simp [hi, hti, hge, hbk]
      · -- high half: entry j - 2^k of T, xor H k; bit k of j is set
        have hj3 : j - 2 ^ k < 2 ^ k := by rw [pow_succ] at hj; omega
        have hti := congrArg (fun x => x.testBit i) (hent (j - 2 ^ k) hj3)
        have hri := congrArg (fun x => x.testBit i) (rent (j - 2 ^ k) hj3)
        simp only [testBit_tb, hi, decide_true, Bool.true_and] at hti hri
        have hge : 9 * j + i ≥ s := by rw [hs]; omega
        have hidx : 9 * j + i - s = 9 * (j - 2 ^ k) + i := by rw [hs]; omega
        have hlow : T.testBit (9 * j + i) = false :=
          Nat.testBit_eq_false_of_lt (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
        have hbk : j.testBit k = true := by
          have h1 : 2 ^ k ≤ j := Nat.le_of_not_lt hj2
          have h2 : j < 2 ^ (k + 1) := hj
          rw [Nat.testBit_eq_decide_div_mod_eq]
          have : j / 2 ^ k = 1 := by
            apply Nat.div_eq_of_lt_le <;> [rw [one_mul]; rw [pow_succ] at h2] <;> omega
          simp [this]
        -- lin H k j = lin H k (j - 2^k): bits below k agree
        have hlin_low : ∀ k' ≤ k, lin H k' j = lin H k' (j - 2 ^ k) := by
          intro k' hk'
          induction k' with
          | zero => simp [lin]
          | succ k'' ih =>
            simp only [lin]
            rw [ih (by omega)]
            congr 2
            have : (j - 2 ^ k).testBit k'' = j.testBit k'' := by
              have hj' : j = 2 ^ k + (j - 2 ^ k) := by omega
              conv_rhs => rw [hj']
              rw [Nat.testBit_two_pow_add_gt (by omega)]
            rw [this]
        rw [hlin_low k le_rfl]
        simp [hi, hge, hidx, hlow, hbk, Nat.testBit_xor, hti, hri]

end RootSound.DblBits
