module
public import R22Port.U_d41d8cd98f00
public import NLP.M8
public import S6.R1Mat
/-! # NLP.Trans: the native translate `M8.trans` is the kernel's `BC6s.trans`

Bit `u` of both is bit `u ^^^ v` of the argument (`S6.trans_testBit` for the kernel); both stay below `2^512`. -/
@[expose] public section
namespace NL
open Nat

/-- the facts behind one delta swap at distance `2^i` (`i < 6`) inside a word, for every bit position `j < 64` -/
def dswOk (i K j : Nat) : Bool :=
  bif j.testBit i then
    !K.testBit j && decide (2 ^ i ≤ j) && decide (j - 2 ^ i = j ^^^ 2 ^ i) && K.testBit (j - 2 ^ i)
  else
    K.testBit j && decide (2 ^ i + j = j ^^^ 2 ^ i) && (!decide (2 ^ i ≤ j) || !K.testBit (j - 2 ^ i))

theorem dsw_bit (w d K : UInt64) (i : Nat) (hi : i < 6) (hd : d.toNat = 2 ^ i)
    (hok : ∀ j < 64, dswOk i K.toNat j = true) (j : Nat) (hj : j < 64) :
    (M8.dsw w d K).toNat.testBit j = w.toNat.testBit (j ^^^ 2 ^ i) := by
  have hd64 : 2 ^ i % 64 = 2 ^ i := Nat.mod_eq_of_lt (by
    calc 2 ^ i < 2 ^ 6 := Nat.pow_lt_pow_right (by norm_num) hi
      _ = 64 := by norm_num)
  unfold M8.dsw
  rw [UInt64.toNat_or, UInt64.toNat_and, UInt64.toNat_shiftRight, UInt64.toNat_shiftLeft, UInt64.toNat_and, hd, hd64,
    Nat.testBit_or, Nat.testBit_and, Nat.testBit_shiftRight, Nat.testBit_mod_two_pow, Nat.testBit_shiftLeft,
    Nat.testBit_and]
  have h := hok j hj
  unfold dswOk at h
  cases hb : j.testBit i
  · rw [hb, cond_false] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, Bool.not_eq_true', decide_eq_false_iff_not] at h
    obtain ⟨⟨hk, he⟩, hl⟩ := h
    rw [hk, ← he]
    rcases hl with hl | hl
    · simp [hl, hj]
    · simp [hl, hj]
  · rw [hb, cond_true] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at h
    obtain ⟨⟨⟨hk, hge⟩, he⟩, hk'⟩ := h
    rw [hk, hk', ← he]
    simp [hge, hj]

theorem dsw_all : ∀ j < 64, dswOk 0 (0x5555555555555555 : UInt64).toNat j = true ∧
    dswOk 1 (0x3333333333333333 : UInt64).toNat j = true ∧ dswOk 2 (0x0f0f0f0f0f0f0f0f : UInt64).toNat j = true ∧
    dswOk 3 (0x00ff00ff00ff00ff : UInt64).toNat j = true ∧ dswOk 4 (0x0000ffff0000ffff : UInt64).toNat j = true ∧
    dswOk 5 (0x00000000ffffffff : UInt64).toNat j = true := by
  decide +kernel

/-- one conditional step of `tw` -/
theorem stepw_bit (w d K : UInt64) (i : Nat) (hi : i < 6) (hd : d.toNat = 2 ^ i) (hok : ∀ j < 64, dswOk i K.toNat j = true)
    (c : Bool) (j : Nat) (hj : j < 64) :
    (if c then M8.dsw w d K else w).toNat.testBit j = w.toNat.testBit (j ^^^ cond c (2 ^ i) 0) := by
  cases c
  · simp
  · simp only [if_true, cond_true]; exact dsw_bit w d K i hi hd hok j hj

theorem xor_lt64 (a b : Nat) (ha : a < 64) (hb : b < 64) : a ^^^ b < 64 :=
  Nat.xor_lt_two_pow (n := 6) ha hb

theorem cond_lt64 (c : Bool) (i : Nat) (hi : i < 6) : cond c (2 ^ i) 0 < 64 := by
  cases c
  · simp
  · simp only [cond_true]
    calc 2 ^ i < 2 ^ 6 := Nat.pow_lt_pow_right (by norm_num) hi
      _ = 64 := by norm_num

theorem low6_xor : ∀ v < 512,
    (cond ((v &&& 32) != 0) (2 ^ 5) 0 ^^^ (cond ((v &&& 16) != 0) (2 ^ 4) 0 ^^^ (cond ((v &&& 8) != 0) (2 ^ 3) 0 ^^^
      (cond ((v &&& 4) != 0) (2 ^ 2) 0 ^^^ (cond ((v &&& 2) != 0) (2 ^ 1) 0 ^^^ cond ((v &&& 1) != 0) (2 ^ 0) 0))))) =
      v &&& 63 := by
  decide +kernel

/-- **`tw` permutes the bits of a word by `v &&& 63`** -/
theorem tw_bit (w : UInt64) (v : Nat) (hv : v < 512) (j : Nat) (hj : j < 64) :
    (M8.tw w v).toNat.testBit j = w.toNat.testBit (j ^^^ (v &&& 63)) := by
  have h := dsw_all
  unfold M8.tw
  have c0 := cond_lt64 ((v &&& 1) != 0) 0 (by norm_num)
  have c1 := cond_lt64 ((v &&& 2) != 0) 1 (by norm_num)
  have c2 := cond_lt64 ((v &&& 4) != 0) 2 (by norm_num)
  have c3 := cond_lt64 ((v &&& 8) != 0) 3 (by norm_num)
  have c4 := cond_lt64 ((v &&& 16) != 0) 4 (by norm_num)
  have c5 := cond_lt64 ((v &&& 32) != 0) 5 (by norm_num)
  have j5 := xor_lt64 _ _ hj c5
  have j4 := xor_lt64 _ _ j5 c4
  have j3 := xor_lt64 _ _ j4 c3
  have j2 := xor_lt64 _ _ j3 c2
  have j1 := xor_lt64 _ _ j2 c1
  rw [stepw_bit _ _ _ 5 (by norm_num) rfl (fun j hj => (h j hj).2.2.2.2.2) _ _ hj,
    stepw_bit _ _ _ 4 (by norm_num) rfl (fun j hj => (h j hj).2.2.2.2.1) _ _ j5,
    stepw_bit _ _ _ 3 (by norm_num) rfl (fun j hj => (h j hj).2.2.2.1) _ _ j4,
    stepw_bit _ _ _ 2 (by norm_num) rfl (fun j hj => (h j hj).2.2.1) _ _ j3,
    stepw_bit _ _ _ 1 (by norm_num) rfl (fun j hj => (h j hj).2.1) _ _ j2,
    stepw_bit _ _ _ 0 (by norm_num) rfl (fun j hj => (h j hj).1) _ _ j1]
  congr 1
  rw [← low6_xor v hv]
  simp only [Nat.xor_assoc]

theorem trans_wd (x : M8) (v k : Nat) (hk : k < 8) :
    (x.trans v).wd k = M8.tw (x.wd (Nat.xor (Nat.land (Nat.shiftRight v 6) 7) k)) v := by
  unfold M8.trans
  interval_cases k <;> simp [M8.wd]

/-- **bit `u` of the native translate is bit `u ^^^ v`** -/
theorem trans_bit (x : M8) (v u : Nat) (hv : v < 512) (hu : u < 512) : (x.trans v).bit u = x.bit (u ^^^ v) := by
  have huv : u ^^^ v < 512 := Nat.xor_lt_two_pow (n := 9) hu hv
  rw [M8.bit_wd _ _ hu, trans_wd x v _ (by omega), tw_bit _ v hv _ (by omega), M8.bit_wd _ _ huv]
  have e1 : Nat.xor (Nat.land (Nat.shiftRight v 6) 7) (u / 64) = (u ^^^ v) / 64 := by
    have hv6 : Nat.land (Nat.shiftRight v 6) 7 = v / 64 := by
      show (v >>> 6) &&& 7 = v / 64
      rw [Nat.shiftRight_eq_div_pow, show (7 : Nat) = 2 ^ 3 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
      have : v / 2 ^ 6 < 2 ^ 3 := by omega
      rw [Nat.mod_eq_of_lt this]; norm_num
    rw [hv6]
    show v / 64 ^^^ u / 64 = (u ^^^ v) / 64
    have h6 : ∀ n : Nat, n / 64 = n >>> 6 := fun n => by rw [Nat.shiftRight_eq_div_pow]
    rw [h6, h6, h6, Nat.shiftRight_xor_distrib, Nat.xor_comm]
  have e2 : u % 64 ^^^ (v &&& 63) = (u ^^^ v) % 64 := by
    rw [show (63 : Nat) = 2 ^ 6 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod, show (64 : Nat) = 2 ^ 6 by norm_num,
      Nat.xor_mod_two_pow]
  rw [e1, e2]

/-! ## The kernel's `trans` stays below `2^512` -/

/-- a set bit of `KM_i` at `w` (`w < 512`) has bit `i` clear, so `w + 2^i < 512` -/
theorem kmOf_hi : ∀ i < 9, ∀ j < 2 ^ i, (S6.kmOf i).testBit (512 - 2 ^ i + j) = false := by decide +kernel

theorem kmOf_lt : ∀ i < 9, S6.kmOf i < 2 ^ 512 := by decide +kernel

theorem hsw_lt (S i : Nat) (hi : i < 9) (hS : S < 2 ^ 512) : BC6s.hsw S (2 ^ i) (S6.kmOf i) < 2 ^ 512 := by
  apply Nat.lt_pow_two_of_testBit
  intro u hu
  rw [S6.hsw_testBit]
  have hK := kmOf_lt i hi
  have hd : 2 ^ i ≤ 256 := by
    calc 2 ^ i ≤ 2 ^ 8 := Nat.pow_le_pow_right (by norm_num) (by omega)
      _ = 256 := by norm_num
  have h1 : (S6.kmOf i).testBit u = false :=
    Nat.testBit_lt_two_pow (lt_of_lt_of_le hK (Nat.pow_le_pow_right (by norm_num) hu))
  rw [h1, Bool.and_false, Bool.false_or]
  by_cases hge : u ≥ 2 ^ i
  · by_cases hlt : u - 2 ^ i < 512
    · have := kmOf_hi i hi (u - 2 ^ i - (512 - 2 ^ i)) (by omega)
      rw [show 512 - 2 ^ i + (u - 2 ^ i - (512 - 2 ^ i)) = u - 2 ^ i by omega] at this
      simp [this]
    · have := Nat.testBit_lt_two_pow (lt_of_lt_of_le hK (Nat.pow_le_pow_right (by norm_num) (show 512 ≤ u - 2 ^ i by omega)))
      simp [this]
  · simp [hge]

theorem stepT_lt (S : Nat) (b : Bool) (i : Nat) (hi : i < 9) (hS : S < 2 ^ 512) : S6.stepT S b i < 2 ^ 512 := by
  unfold S6.stepT; cases b
  · exact hS
  · exact hsw_lt S i hi hS

theorem trans_lt (S v : Nat) (hS : S < 2 ^ 512) : BC6s.trans S v < 2 ^ 512 := by
  rw [S6.trans_eq]
  exact stepT_lt _ _ 8 (by norm_num) (stepT_lt _ _ 7 (by norm_num) (stepT_lt _ _ 6 (by norm_num) (stepT_lt _ _ 5 (by norm_num)
    (stepT_lt _ _ 4 (by norm_num) (stepT_lt _ _ 3 (by norm_num) (stepT_lt _ _ 2 (by norm_num) (stepT_lt _ _ 1 (by norm_num)
      (stepT_lt _ _ 0 (by norm_num) hS))))))))

/-- **the native translate is the kernel's** -/
theorem M8.toNat_trans (x : M8) (v : Nat) (hv : v < 512) : (x.trans v).toNat = BC6s.trans x.toNat v :=
  M8.toNat_eq _ _ (trans_lt _ v x.toNat_lt) (fun u hu => by
    rw [trans_bit x v u hv hu, S6.trans_testBit _ v u hv hu, M8.testBit_toNat])

end NL
