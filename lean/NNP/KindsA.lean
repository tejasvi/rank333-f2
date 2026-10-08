module
public import R22Port.U_b298ee121d61
public import NNP.Root
public import NNP.CountO
public import NN.Kinds
public import S5.Masks
/-! # NNP.KindsA: views of the kinds records' native helpers

* `popIn_card`, `availIn_card`: the native counts are cardinalities of label sets;
* `parN_eq`: the native parity is `par` on 9-bit codes;
* `npOf_bit`: the built odd-pairing masks;
* `bit8_eq`: the native bit test;
* `frame_notD'`: a valid frame's dead labels above its top label are not in a decomposition below it. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## Counts -/

theorem popIn_card (m : Array UInt64) (lo hi : ℕ) (hhi : hi ≤ 512) :
    popIn m lo hi = ((range 512).filter (fun l => lo ≤ l ∧ l < hi ∧ (natL m 0 8).testBit l = true)).card := by
  unfold popIn
  rw [sumN_eq, sum_pop_eq, L5.pcnt_eq_card]
  have key : ∀ l, ((natF (fun k => m.getD k 0 &&& fromW lo k &&& ~~~(fromW hi k)) 8).testBit l = true) ↔
      (l < 512 ∧ lo ≤ l ∧ l < hi ∧ (natL m 0 8).testBit l = true) := by
    intro l
    rw [natF_testBit]
    by_cases hl : l < 512
    · have hj : l % 64 < 64 := Nat.mod_lt _ (by norm_num)
      have hl' : 64 * (l / 64) + l % 64 = l := by omega
      rw [decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and, tb_and, fromW_bit _ _ _ hj, tb_not,
        fromW_bit _ _ _ hj, hl', decide_eq_true hj, Bool.true_and, natL_testBit, decide_eq_true (show l < 64 * 8 by omega),
        Bool.true_and, getElem!_eq_getD', Nat.zero_add]
      cases (m.getD (l / 64) 0).toNat.testBit (l % 64) <;> simp <;> omega
    · rw [decide_eq_false (show ¬ l < 64 * 8 by omega), Bool.false_and]
      simp; intro h; omega
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range, show (64 * 8) = 512 from rfl, key]
  constructor
  · rintro ⟨_, h⟩; exact h
  · rintro ⟨hl, h⟩; exact ⟨hl, hl, h⟩

theorem availIn_card (D : Array UInt64) (lo hi : ℕ) :
    availIn D lo hi = ((range 511).filter (fun l => lo ≤ l ∧ l < hi ∧ (natL D 0 8).testBit l = false)).card := by
  unfold availIn
  rw [sumN_eq, sum_pop_eq, L5.pcnt_eq_card]
  have key : ∀ l, ((natF (fun k => availW D k &&& fromW lo k &&& ~~~(fromW hi k)) 8).testBit l = true) ↔
      (l < 511 ∧ lo ≤ l ∧ l < hi ∧ (natL D 0 8).testBit l = false) := by
    intro l
    rw [natF_testBit]
    by_cases hl : l < 512
    · have hj : l % 64 < 64 := Nat.mod_lt _ (by norm_num)
      have hk : l / 64 < 8 := by omega
      have hl' : 64 * (l / 64) + l % 64 = l := by omega
      unfold availW
      rw [decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and, tb_and, tb_and, tb_not,
        aboveW_bit _ _ _ hj hk, fromW_bit _ _ _ hj, tb_not, fromW_bit _ _ _ hj, hl', decide_eq_true hj, Bool.true_and,
        Bool.true_and, natL_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, getElem!_eq_getD',
        Nat.zero_add]
      cases (D.getD (l / 64) 0).toNat.testBit (l % 64) <;> simp <;> omega
    · rw [decide_eq_false (show ¬ l < 64 * 8 by omega), Bool.false_and]
      simp; intro h; omega
  have e : (range 512).filter (fun j => (natF (fun k => availW D k &&& fromW lo k &&& ~~~(fromW hi k)) 8).testBit j = true) =
      (range 511).filter (fun l => lo ≤ l ∧ l < hi ∧ (natL D 0 8).testBit l = false) := by
    ext l; simp only [mem_filter, mem_range, key]
    constructor
    · rintro ⟨_, h1, h2⟩; exact ⟨h1, h2⟩
    · rintro ⟨h1, h2⟩; exact ⟨by omega, h1, h2⟩
  rw [show (64 * 8) = 512 from rfl, e]

/-! ## Parity, odd-pairing masks, bits -/

theorem parBits_eq (x : ℕ) : ∀ k, parBits x k = S5.xorBits x k
  | 0 => rfl
  | k + 1 => by rw [parBits, parBits_eq x k]; rfl

theorem parN_eq (x : ℕ) (hx : x < 512) : parN x = BC5.par x := by
  unfold parN; rw [parBits_eq, S5.par_eq x hx]

theorem foldBits_bit (g : ℕ → Bool) : ∀ (n : ℕ), n ≤ 64 → ∀ j,
    ((List.range n).foldl (fun (w : UInt64) j => if g j then w ||| ((1 : UInt64) <<< j.toUInt64) else w) 0).toNat.testBit j
      = (decide (j < n) && g j)
  | 0, _, j => by simp
  | n + 1, hn, j => by
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    have ih := foldBits_bit g n (by omega) j
    split
    · rename_i hg
      rw [tb_or, ih, tb_one_shl _ _ (by omega)]
      by_cases hj : j = n
      · subst hj; simp [hg]
      · simp only [decide_eq_false hj, Bool.or_false]
        by_cases hjn : j < n
        · simp [hjn, show j < n + 1 by omega]
        · simp [hjn, show ¬ j < n + 1 by omega]
    · rename_i hg
      rw [ih]
      by_cases hj : j = n
      · subst hj; simp [hg]
      · by_cases hjn : j < n
        · simp [hjn, show j < n + 1 by omega]
        · simp [hjn, show ¬ j < n + 1 by omega]

theorem npOf_bit (vec : Array ℕ) (X l : ℕ) :
    (natL (npOf vec X) 0 8).testBit l = (decide (l < 511) && parN (vec.getD l 0 &&& X)) := by
  unfold npOf
  rw [natL_range_map, natF_testBit]
  by_cases hl : l < 512
  · rw [decide_eq_true (show l < 64 * 8 by omega), Bool.true_and,
      foldBits_bit (fun j => decide (64 * (l / 64) + j < 511) && parN (vec.getD (64 * (l / 64) + j) 0 &&& X)) 64 le_rfl,
      decide_eq_true (Nat.mod_lt _ (by norm_num)), Bool.true_and, show 64 * (l / 64) + l % 64 = l by omega]
  · rw [decide_eq_false (show ¬ l < 64 * 8 by omega), Bool.false_and, decide_eq_false (show ¬ l < 511 by omega),
      Bool.false_and]

theorem bit8_eq (m : Array UInt64) (l : ℕ) (hl : l < 512) : bit8 m l = (natL m 0 8).testBit l := by
  unfold bit8
  rw [bitTest _ _ (Nat.mod_lt _ (by norm_num)), natL_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and,
    getElem!_eq_getD', Nat.zero_add]

/-! ## Frames -/

/-- a valid frame's dead labels above its top label are not labels of a decomposition below it -/
theorem frame_notD' {S D N U d last : ℕ} (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1) {A : R3RT.Spec.Dec22}
    (hΩ : Ω A) (hB : Below O A S (R3RT.Spec.lastOf S)) (l : ℕ) (hl : last < l) (hl5 : l < 511) (hAl : Has O A l) :
    D.testBit l = false := by
  obtain ⟨_, _, _, _, hFA⟩ := hF
  cases h : D.testBit l
  · rfl
  · exact absurd hAl ((hFA A hΩ hB).1 l (by rw [KD.shr_one_lastOf hS]; exact hl) hl5 h)

/-- the hits of a valid frame's prefix are its counters -/
theorem frame_hits {S D N d : ℕ} {U : ByteArray} (hF : FrameOK O Ω S D N (natU U) d) (hd : d < 128)
    (hU : ∀ j, j < 512 → (U.get! j).toNat < 128) (X : ℕ) (hX : X < 512) : (U.get! X).toNat = hits O S X := by
  obtain ⟨_, _, hcard, hUeq, _⟩ := hF
  have h1 := fld_natU7 U hU 512 le_rfl X hX
  have h2 := NNP.KC.fld7_packUO (O := O) S X d hX hcard hd
  unfold natU at hUeq
  rw [← h1, hUeq, ← h2]
  show (packU O S >>> (7 * X)) % 128 = (packU O S >>> (7 * X)) &&& (2 ^ 7 - 1)
  rw [Nat.and_two_pow_sub_one_eq_mod]

end NNP
