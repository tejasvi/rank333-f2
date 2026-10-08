module
public import R22Port.U_d41d8cd98f00
public import NNP.Dict
/-! # NNP.Statics: the static tables built from the Nat constants have those constants as views

* `limbsN_get`: limb `j` of `limbsOfNat n k` is bits `[64j, 64j+64)` of `n`; `natL_limbsOfNat`: the view is `n % 2^(64k)`;
* `natU_unpack7N`: the unpacked counters' view is `n % 2^3584`;
* `c2tV_build`, `hV_build`, `sufV_build`: under `staticsOK` (the bounds, checked once per process) the views of
  `buildStatics c2tN conf1N hN sufN rk3` are the constants themselves. -/
@[expose] public section
set_option maxHeartbeats 1000000
namespace NNP
open NN

theorem limbsN_length : ∀ (k n : Nat), (limbsN k n).length = k
  | 0, _ => by simp [limbsN]
  | 1, _ => by simp [limbsN]
  | k + 2, n => by
    rw [limbsN, List.length_append, limbsN_length, limbsN_length]
    omega

theorem limbsN_get : ∀ (k n j : Nat) (hj : j < (limbsN k n).length), (limbsN k n)[j] = (n >>> (64 * j)).toUInt64
  | 0, _, j, hj => by simp [limbsN] at hj
  | 1, n, j, hj => by
    simp only [limbsN, List.length_singleton] at hj
    have : j = 0 := by omega
    subst this; simp [limbsN]
  | k + 2, n, j, hj => by
    have hlen := limbsN_length (k + 2) n
    simp only [limbsN] at hj ⊢
    rw [List.getElem_append]
    have hl1 := limbsN_length ((k + 2) / 2) (n % 2 ^ (64 * ((k + 2) / 2)))
    split
    · rename_i hjl
      rw [limbsN_get]
      apply UInt64.toNat.inj
      rw [Nat.toUInt64_eq, Nat.toUInt64_eq, UInt64.toNat_ofNat', UInt64.toNat_ofNat']
      apply Nat.eq_of_testBit_eq; intro i
      rw [Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, Nat.testBit_shiftRight,
        Nat.testBit_mod_two_pow]
      by_cases hi : i < 64
      · rw [hl1] at hjl
        rw [decide_eq_true hi, decide_eq_true (show 64 * j + i < 64 * ((k + 2) / 2) by omega)]
        simp
      · simp [hi]
    · rename_i hjl
      rw [limbsN_get, ← Nat.shiftRight_add, hl1]
      congr 2
      rw [hl1] at hjl; omega

theorem limbsOfNat_size (n k : Nat) : (limbsOfNat n k).size = k := by
  unfold limbsOfNat; simp [limbsN_length]

theorem natL_limbsOfNat (n k : Nat) : natL (limbsOfNat n k) 0 k = n % 2 ^ (64 * k) := by
  apply Nat.eq_of_testBit_eq; intro i
  rw [natL_testBit, Nat.testBit_mod_two_pow, Nat.zero_add]
  by_cases hi : i < 64 * k
  · simp only [decide_eq_true hi, Bool.true_and]
    have hj : i / 64 < (limbsN k n).length := by rw [limbsN_length]; omega
    have e : (limbsOfNat n k)[i / 64]! = (limbsN k n)[i / 64] := by
      unfold limbsOfNat; simp [hj]
    rw [e, limbsN_get, Nat.toUInt64_eq, UInt64.toNat_ofNat', Nat.testBit_mod_two_pow, decide_eq_true
      (Nat.mod_lt _ (by norm_num)), Bool.true_and, Nat.testBit_shiftRight, show 64 * (i / 64) + i % 64 = i by omega]
  · simp only [decide_eq_false hi, Bool.false_and]

theorem unpack7N_get (n X : Nat) (hX : X < 512) : ((unpack7N n).get! X).toNat = (n >>> (7 * X)) % 128 := by
  unfold unpack7N
  show (((Array.range 512).map fun X => (fieldL (limbsOfNat n 56) 0 (7 * X) 7).toUInt8)[X]!).toNat = _
  rw [Array.getElem!_eq_getD, getD_range_map, if_pos hX, fieldL_eq _ _ _ (by norm_num), limbsOfNat_size,
    natL_limbsOfNat]
  have hlt : ((n % 2 ^ (64 * 56)) >>> (7 * X)) % 2 ^ 7 < 2 ^ 8 :=
    lt_of_lt_of_le (Nat.mod_lt _ (by positivity)) (by norm_num)
  rw [Nat.toUInt8_eq, UInt8.toNat_ofNat', Nat.mod_eq_of_lt hlt, show (2 : Nat) ^ 7 = 128 by norm_num]
  rw [show (128 : Nat) = 2 ^ 7 by norm_num]
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, Nat.testBit_shiftRight,
    Nat.testBit_mod_two_pow]
  by_cases hi : i < 7
  · simp [hi, show 7 * X + i < 64 * 56 by omega]
  · simp [hi]

theorem mod_two_pow_add (n a b : Nat) : n % 2 ^ (a + b) = n % 2 ^ a + ((n >>> a) % 2 ^ b) * 2 ^ a := by
  rw [Nat.add_comm (n % 2 ^ a), Nat.mul_comm]
  apply Nat.eq_of_testBit_eq; intro i
  rw [Nat.testBit_two_pow_mul_add _ (Nat.mod_lt _ (by positivity)), Nat.testBit_mod_two_pow]
  by_cases hi : i < a
  · rw [if_pos hi, Nat.testBit_mod_two_pow, decide_eq_true hi, decide_eq_true (by omega)]
  · rw [if_neg hi, Nat.testBit_mod_two_pow, Nat.testBit_shiftRight, show a + (i - a) = i by omega]
    congr 1; exact decide_eq_decide.mpr (by omega)

theorem natU7_unpack7N (n : Nat) : ∀ m, m ≤ 512 → natU7 (unpack7N n) m = n % 2 ^ (7 * m)
  | 0, _ => by simp [natU7, Nat.mod_one]
  | m + 1, hm => by
    rw [natU7, natU7_unpack7N n m (by omega), unpack7N_get n m (by omega), show 7 * (m + 1) = 7 * m + 7 by ring,
      mod_two_pow_add, show (128 : Nat) = 2 ^ 7 by norm_num]

theorem natU_unpack7N (n : Nat) : natU (unpack7N n) = n % 2 ^ 3584 := natU7_unpack7N n 512 le_rfl

/-! ## The views of the built statics -/

theorem staticsOK_spec {c2tN : Array Nat} {conf1N : Nat} {hN sufN : Array Nat} (h : staticsOK c2tN conf1N hN sufN = true) :
    c2tN.size = 511 ∧ hN.size = 511 ∧ sufN.size = 511 ∧ (∀ l < 511, c2tN.getD l 0 < 2 ^ 262144) ∧
      conf1N < 2 ^ 262144 ∧ (∀ l < 511, hN.getD l 0 < 2 ^ 3584) ∧ (∀ l < 511, sufN.getD l 0 < 2 ^ 3584) := by
  unfold staticsOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, Array.all_eq_true] at h
  obtain ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  have lt_of_shr : ∀ x k : Nat, x >>> k = 0 → x < 2 ^ k := fun x k hx => L5O.lt_of_shr_zero x k hx
  refine ⟨h1, h2, h3, fun l hl => ?_, lt_of_shr _ _ h5, fun l hl => ?_, fun l hl => ?_⟩
  · rw [getD_lt _ _ _ (by omega)]
    have := h4 l (by omega); exact lt_of_shr _ _ (by simpa using this)
  · rw [getD_lt _ _ _ (by omega)]
    have := h6 l (by omega); exact lt_of_shr _ _ (by simpa using this)
  · rw [getD_lt _ _ _ (by omega)]
    have := h7 l (by omega); exact lt_of_shr _ _ (by simpa using this)

theorem c2tV_build {c2tN : Array Nat} {conf1N : Nat} {hN sufN : Array Nat} (rk3 : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) (l : Nat) (hl : l < 511) :
    c2tV (buildStatics c2tN conf1N hN sufN rk3) l = c2tN.getD l 0 := by
  obtain ⟨h1, _, _, h4, _⟩ := staticsOK_spec h
  unfold c2tV buildStatics
  simp only []
  rw [getD_lt _ _ _ (by simp; omega), Array.getElem_map, natL_limbsOfNat, ← getD_lt _ _ 0 (by omega),
    Nat.mod_eq_of_lt (h4 l hl)]

theorem hV_build {c2tN : Array Nat} {conf1N : Nat} {hN sufN : Array Nat} (rk3 : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) (l : Nat) (hl : l < 511) :
    hV (buildStatics c2tN conf1N hN sufN rk3) l = hN.getD l 0 := by
  obtain ⟨_, h2, _, _, _, h6, _⟩ := staticsOK_spec h
  unfold hV buildStatics
  simp only []
  rw [getD_lt _ _ _ (by simp; omega), Array.getElem_map, natU_unpack7N, ← getD_lt _ _ 0 (by omega),
    Nat.mod_eq_of_lt (h6 l hl)]

theorem sufV_build {c2tN : Array Nat} {conf1N : Nat} {hN sufN : Array Nat} (rk3 : ByteArray)
    (h : staticsOK c2tN conf1N hN sufN = true) (l : Nat) (hl : l < 511) :
    sufV (buildStatics c2tN conf1N hN sufN rk3) l = sufN.getD l 0 := by
  obtain ⟨_, _, h3, _, _, _, h7⟩ := staticsOK_spec h
  unfold sufV buildStatics
  simp only []
  rw [getD_lt _ _ _ (by simp; omega), Array.getElem_map, natU_unpack7N, ← getD_lt _ _ 0 (by omega),
    Nat.mod_eq_of_lt (h7 l hl)]

end NNP
