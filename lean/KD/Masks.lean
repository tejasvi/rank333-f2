module
public import R22Port.U_d41d8cd98f00
public import KD.Count
/-! # KD.Masks: label masks and bit counts in kernel form

* `abv u` (labels `u+1 .. 510`), `geM b` (labels `b .. 510`), `R1M`, `R2M`, `R3M` (rank classes), `avM D W` (labels outside
  `D` and `W`), each with its `testBit` lemma.
* `remB_card_le`: `K2.remB x k = 0` means at most `k` bits (`card_bits_remB`).
* `popcF`: exact bit count with fuel (`popcF_eq`).
* `card_sub_bits`: a set of labels inside a mask has at most the mask's bit count. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

def abv (u : ℕ) : ℕ := Nat.shiftLeft (Nat.shiftRight M511 (Nat.succ u)) (Nat.succ u)
def geM (b : ℕ) : ℕ := Nat.shiftLeft (Nat.shiftRight M511 b) b
def R1M : ℕ := 562949953421311                      -- labels 0..48 (rank 1)
def R12M : ℕ := Nat.sub (Nat.shiftLeft 1 343) 1      -- labels 0..342 (rank <= 2)
def R2M : ℕ := Nat.xor R12M R1M
def R3M : ℕ := Nat.xor M511 R12M
def avM (D W : ℕ) : ℕ := Nat.xor M511 (Nat.land M511 (Nat.lor D W))

theorem testBit_geM (b l : ℕ) : (geM b).testBit l = decide (b ≤ l ∧ l < 511) := by
  unfold geM
  rw [show Nat.shiftLeft (Nat.shiftRight M511 b) b = (M511 >>> b) <<< b from rfl, Nat.testBit_shiftLeft]
  by_cases h : b ≤ l
  · rw [Nat.testBit_shiftRight, show b + (l - b) = l by omega, m511_bit]; simp [h]
  · simp [h]

theorem testBit_abv (u l : ℕ) : (abv u).testBit l = decide (u < l ∧ l < 511) := by
  have := testBit_geM (u + 1) l
  unfold abv; unfold geM at this; rw [show Nat.succ u = u + 1 from rfl, this]; simp [Nat.succ_le_iff]

theorem r1m_eq : R1M = 2 ^ 49 - 1 := by decide +kernel
theorem r12m_eq : R12M = 2 ^ 343 - 1 := by decide +kernel

theorem testBit_R1M (l : ℕ) : R1M.testBit l = decide (l < 49) := by rw [r1m_eq, Nat.testBit_two_pow_sub_one]
theorem testBit_R12M (l : ℕ) : R12M.testBit l = decide (l < 343) := by rw [r12m_eq, Nat.testBit_two_pow_sub_one]
theorem testBit_R2M (l : ℕ) : R2M.testBit l = decide (49 ≤ l ∧ l < 343) := by
  show (R12M ^^^ R1M).testBit l = _
  rw [Nat.testBit_xor, testBit_R12M, testBit_R1M]
  by_cases h1 : l < 49
  · simp [h1, show l < 343 by omega]
  · by_cases h2 : l < 343 <;> simp [h1, h2] <;> omega
theorem testBit_R3M (l : ℕ) : R3M.testBit l = decide (343 ≤ l ∧ l < 511) := by
  show (M511 ^^^ R12M).testBit l = _
  rw [Nat.testBit_xor, m511_bit, testBit_R12M]
  by_cases h1 : l < 343
  · simp [h1, show l < 511 by omega]
  · by_cases h2 : l < 511 <;> simp [h1, h2] <;> omega

theorem testBit_avM (D W l : ℕ) : (avM D W).testBit l = (decide (l < 511) && !D.testBit l && !W.testBit l) := by
  show (M511 ^^^ (M511 &&& (D ||| W))).testBit l = _
  rw [Nat.testBit_xor, Nat.testBit_and, Nat.testBit_or, m511_bit]
  cases decide (l < 511) <;> cases D.testBit l <;> cases W.testBit l <;> rfl

theorem rkL_lt (l : ℕ) : rkL l = 1 ↔ l < 49 := by unfold rkL; split_ifs <;> omega

/-! ## Bit counts -/

theorem remB_card_le {x k : ℕ} (hx : x < 2 ^ 511) (h : K2.remB x k = 0) : (K2.bitsB 511 x).card ≤ k := by
  have := K2.card_bits_remB 511 x k hx
  rw [h, K2.bitsB_zero] at this; simp at this; omega

/-- exact bit count with fuel (kernel form) -/
def popcF : ℕ → ℕ → ℕ
  | 0, _ => 0
  | f+1, x => cond (Nat.beq x 0) 0 (Nat.succ (popcF f (Nat.land x (Nat.sub x 1))))

theorem popcF_eqB (B f : ℕ) : ∀ x, x < 2 ^ B → (K2.bitsB B x).card ≤ f → popcF f x = (K2.bitsB B x).card := by
  induction f with
  | zero => intro x _ h; simp only [popcF]; omega
  | succ f ih =>
    intro x hx h
    by_cases h0 : x = 0
    · subst h0; simp [popcF, K2.bitsB_zero]
    · have hbeq : Nat.beq x 0 = false := by cases h : Nat.beq x 0; rfl; exact absurd (Nat.eq_of_beq_eq_true h) h0
      simp only [popcF, hbeq, cond_false]
      have hc := K2.card_bits_land_pred B x h0 hx
      have hpos := K2.card_bits_pos B x h0 hx
      rw [show Nat.land x (Nat.sub x 1) = x &&& (x - 1) from rfl,
        ih _ (lt_of_le_of_lt Nat.and_le_left hx) (by omega), hc]; omega

theorem popcF_eq (f x : ℕ) (hx : x < 2 ^ 511) (h : (K2.bitsB 511 x).card ≤ f) : popcF f x = (K2.bitsB 511 x).card :=
  popcF_eqB 511 f x hx h

/-- a set of labels whose members are bits of `x` has at most `x`'s bit count -/
theorem card_le_bits (s : Finset ℕ) (x : ℕ) (h : ∀ l ∈ s, l < 511 ∧ x.testBit l = true) : s.card ≤ (K2.bitsB 511 x).card := by
  apply Finset.card_le_card; intro l hl; rw [K2.mem_bitsB]; exact h l hl

/-- the labels above `u` with a bit of `m` (`m < 2^511`) number at most the bit count of `m >>> (u+1)` -/
theorem card_above_le_shift (m u : ℕ) (q : ℕ → Prop) [DecidablePred q] (hq : ∀ l, l < 511 → q l → m.testBit l = true) :
    ((Finset.range 511).filter (fun l => u < l ∧ q l)).card ≤ (K2.bitsB 511 (Nat.shiftRight m (Nat.succ u))).card := by
  apply Finset.card_le_card_of_injOn (fun l => l - (u + 1))
  · intro l hl
    simp only [Finset.coe_filter, Finset.mem_range, Set.mem_setOf_eq] at hl
    simp only [Finset.coe_filter, Finset.mem_range, Set.mem_setOf_eq, K2.bitsB]
    refine ⟨by omega, ?_⟩
    rw [show Nat.shiftRight m (Nat.succ u) = m >>> (u + 1) from rfl, Nat.testBit_shiftRight,
      show u + 1 + (l - (u + 1)) = l by omega]
    exact hq l hl.1 hl.2.2
  · intro a ha b hb hab
    simp only [Finset.coe_filter, Finset.mem_range, Set.mem_setOf_eq] at ha hb
    simp only at hab; omega

/-! ## Masks below 2^511 -/

theorem lt511_of_bits {x : ℕ} (h : ∀ i, 511 ≤ i → x.testBit i = false) : x < 2 ^ 511 := Nat.lt_pow_two_of_testBit x h

theorem land_M511_lt (x y : ℕ) (hy : y < 2 ^ 511) : x &&& y < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_right hy

theorem m511_lt : M511 < 2 ^ 511 := by rw [m511_eq]; exact Nat.sub_lt (Nat.two_pow_pos _) one_pos
theorem r1m_lt : R1M < 2 ^ 511 := by rw [r1m_eq]; decide
theorem abv_lt (u : ℕ) : abv u < 2 ^ 511 := lt511_of_bits (fun i hi => by rw [testBit_abv]; simp; omega)
theorem geM_lt (b : ℕ) : geM b < 2 ^ 511 := lt511_of_bits (fun i hi => by rw [testBit_geM]; simp; omega)
theorem avM_lt (D W : ℕ) : avM D W < 2 ^ 511 := lt511_of_bits (fun i hi => by rw [testBit_avM]; simp; omega)
theorem R2M_lt : R2M < 2 ^ 511 := lt511_of_bits (fun i hi => by rw [testBit_R2M]; simp; omega)
theorem R3M_lt : R3M < 2 ^ 511 := lt511_of_bits (fun i hi => by rw [testBit_R3M]; simp; omega)
theorem nperpL_lt (v : ℕ) : nperpL v < 2 ^ 511 := by
  unfold nperpL
  rw [show Nat.xor (Nat.land (Nat.shiftRight NPLL (Nat.mul 512 (Nat.land v 31))) M511)
      (Nat.land (Nat.shiftRight NPHL (Nat.mul 512 (Nat.shiftRight v 5))) M511) =
      ((NPLL >>> (512 * (v &&& 31))) &&& M511) ^^^ ((NPHL >>> (512 * (v >>> 5))) &&& M511) from rfl]
  apply lt511_of_bits; intro i hi
  rw [Nat.testBit_xor, Nat.testBit_and, Nat.testBit_and, m511_bit]; simp [show ¬ i < 511 by omega]

end KD
