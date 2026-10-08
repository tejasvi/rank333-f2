module
public import R22Port.U_d41d8cd98f00
public import KD.Masks
public import Top.Root321
/-! # KD321.Base: counting lemmas over a label order (spec revision 6a), and the `--rord 321` instance

The kinds checkers of `KD` are stated for revision 5's order (`vecL`, rank-1 labels `0..48`). Here the same counting facts
are proved for **every** `LabelOrder` `O` (`R3RT.SpecO`): labels of a decomposition (`has_cardO`, `card_termsO`), the
first-factor type in label coordinates (`nType_O`), the deficit fact (`deficit_labO`), and the counts of a decomposition
continuing (or lying below) a node (`cont_splitO`, `above_cardO`, `below_splitO`, `below_above_cardO`); L1's packed counters
(`fld7_packUO`).

The `--rord 321` instance (`Top321.O = L5O.O321 Top321.labK321`): rank-1 labels are `462..510` (`rk1_321`), the mask `R1M321`
(labels `462..510`) and `NR1M321` (labels `0..461`), and `labN321` injective on codes (`labN321_inj`). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD321
open RootSound R3RT R3RT.SpecO BC4 BC5 Finset Classical

section order
variable (O : LabelOrder)

/-- every nonzero code is the code of a label -/
theorem vec_surj (v : ℕ) (h0 : 0 < v) (h : v < 512) : ∃ l, l < 511 ∧ O.vec l = v := by
  let I := (range 511).image O.vec
  have hsub : I ⊆ (range 512).filter (fun x => x ≠ 0) := by
    intro x hx
    obtain ⟨l, hl, rfl⟩ := mem_image.mp hx
    rw [mem_range] at hl
    simp only [mem_filter, mem_range]
    exact ⟨O.vec_lt l hl, O.vec_ne l hl⟩
  have hcardI : I.card = 511 := by
    rw [card_image_of_injOn]
    · simp
    · intro x hx y hy hxy
      exact O.vec_inj x y (by simpa using hx) (by simpa using hy) hxy
  have hcardF : ((range 512).filter (fun x => x ≠ 0)).card = 511 := by
    rw [Finset.filter_ne', Finset.card_erase_of_mem (by simp)]; simp
  have heq : I = (range 512).filter (fun x => x ≠ 0) := eq_of_subset_of_card_le hsub (by rw [hcardI, hcardF])
  have hv : v ∈ (range 512).filter (fun x => x ≠ 0) := by simp [h, Nat.pos_iff_ne_zero.mp h0]
  rw [← heq] at hv
  obtain ⟨l, hl, hlv⟩ := mem_image.mp hv
  exact ⟨l, mem_range.mp hl, hlv⟩

/-- the label of a code (511 for a code without one) -/
def labO (v : ℕ) : ℕ := if h : ∃ l, l < 511 ∧ O.vec l = v then Nat.find h else 511

theorem labO_spec (v : ℕ) (h0 : v ≠ 0) (h : v < 512) : labO O v < 511 ∧ O.vec (labO O v) = v := by
  have hex := vec_surj O v (Nat.pos_of_ne_zero h0) h
  unfold labO; rw [dif_pos hex]; exact Nat.find_spec hex

/-- the label of term `s` -/
def labTO (A : Spec.Dec22) (s : Fin 22) : ℕ := labO O (A.av s)

theorem labTO_spec (A : Spec.Dec22) (s : Fin 22) : labTO O A s < 511 ∧ O.vec (labTO O A s) = A.av s :=
  labO_spec O _ (A.ne s) (A.lt s)

theorem labTO_inj (A : Spec.Dec22) : Function.Injective (labTO O A) := by
  intro s t h
  apply A.inj
  rw [← (labTO_spec O A s).2, ← (labTO_spec O A t).2, h]

theorem has_iffO (A : Spec.Dec22) (l : ℕ) : Has O A l ↔ ∃ s, labTO O A s = l := by
  constructor
  · rintro ⟨hl, s, hs⟩
    refine ⟨s, O.vec_inj _ _ (labTO_spec O A s).1 hl ?_⟩
    rw [(labTO_spec O A s).2, hs]
  · rintro ⟨s, rfl⟩
    exact ⟨(labTO_spec O A s).1, s, (labTO_spec O A s).2.symm⟩

/-- a count over the terms is a count over the labels -/
theorem card_termsO (A : Spec.Dec22) (q : ℕ → Prop) [DecidablePred q] :
    (univ.filter (fun s : Fin 22 => q (A.av s))).card = ((range 511).filter (fun l => Has O A l ∧ q (O.vec l))).card := by
  apply Finset.card_bij (fun s _ => labTO O A s)
  · intro s hs
    simp only [mem_filter, mem_univ, true_and] at hs
    simp only [mem_filter, mem_range]
    refine ⟨(labTO_spec O A s).1, (has_iffO O A _).2 ⟨s, rfl⟩, ?_⟩
    rw [(labTO_spec O A s).2]; exact hs
  · intro s _ t _ h; exact labTO_inj O A h
  · intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨s, rfl⟩ := (has_iffO O A l).1 hl.2.1
    refine ⟨s, ?_, rfl⟩
    simp only [mem_filter, mem_univ, true_and]
    rw [← (labTO_spec O A s).2]; exact hl.2.2

/-- **a `Dec22` has 22 labels** in every order -/
theorem has_cardO (A : Spec.Dec22) : ((range 511).filter (fun l => Has O A l)).card = 22 := by
  have h := card_termsO O A (fun _ => True)
  simp only [and_true] at h
  rw [← h]; simp

/-- the first-factor type in label coordinates -/
theorem nType_O (A : Spec.Dec22) (r : ℕ) : Spec.nType A r = ((range 511).filter (fun l => Has O A l ∧ O.rk l = r)).card := by
  unfold Spec.nType
  rw [card_termsO O A (fun v => rkOf v = r)]
  apply KD.card_filter_congr; intro l hl; rw [mem_range] at hl
  rw [O.rk_spec l hl]

/-- **the deficit fact** in label coordinates -/
theorem deficit_labO (A : Spec.Dec22) (X : ℕ) (h0 : 0 < X) (hX : X < 512) :
    3 * rkOf X ≤ ((range 511).filter (fun l => Has O A l ∧ par (O.vec l &&& X) = true)).card :=
  le_of_le_of_eq (KD.deficit_fact A X h0 hX) (card_termsO O A (fun v => par (v &&& X) = true))

/-! ## A decomposition continuing a node `(S, last)` (`S >>> last = 1`) -/

theorem cont_hasO {A : Spec.Dec22} {S last u : ℕ} (h : Continues O A S last u) : Has O A u := by
  obtain ⟨_, hu, hb⟩ := h
  exact (hb u hu le_rfl).2 (by rw [KD.testBit_or_two_pow]; simp)

theorem cont_leO {A : Spec.Dec22} {S last u : ℕ} (h : Continues O A S last u) (l : ℕ) (hl : l ≤ u) :
    Has O A l ↔ (S.testBit l = true ∨ l = u) := by
  obtain ⟨_, hu, hb⟩ := h
  rw [hb l (lt_of_le_of_lt hl hu) hl, KD.testBit_or_two_pow]; simp

theorem cont_belowO {A : Spec.Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues O A S last u) :
    Below O A S last := by
  intro l hl hle
  have h1' : last < u := h.1
  rw [cont_leO O h l (by omega)]
  constructor
  · rintro (h1 | h1)
    · exact h1
    · omega
  · intro h1; exact Or.inl h1

theorem cont_splitO {A : Spec.Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues O A S last u) (q : ℕ → Prop)
    [DecidablePred q] :
    ((range 511).filter (fun l => Has O A l ∧ q l)).card =
      ((range 511).filter (fun l => S.testBit l = true ∧ q l)).card + (if q u then 1 else 0) +
      ((range 511).filter (fun l => u < l ∧ Has O A l ∧ q l)).card := by
  have hu : u < 511 := h.2.1
  have hlu : last < u := h.1
  have hS0 : ∀ l, u ≤ l → S.testBit l = false := by
    intro l hl
    rw [KD.shr_one_bit hS l (by omega)]
    have hne : l ≠ last := by omega
    simp [hne]
  have e1 : (range 511).filter (fun l => Has O A l ∧ q l) =
      ((range 511).filter (fun l => S.testBit l = true ∧ q l)) ∪
      (((range 511).filter (fun l => l = u ∧ q l)) ∪ ((range 511).filter (fun l => u < l ∧ Has O A l ∧ q l))) := by
    ext l; simp only [mem_filter, mem_range, mem_union]
    constructor
    · rintro ⟨hl, hA, hq⟩
      by_cases hle : l ≤ u
      · rcases (cont_leO O h l hle).1 hA with h1 | h1
        · exact Or.inl ⟨hl, h1, hq⟩
        · exact Or.inr (Or.inl ⟨hl, h1, hq⟩)
      · exact Or.inr (Or.inr ⟨hl, by omega, hA, hq⟩)
    · rintro (⟨hl, h1, hq⟩ | ⟨hl, h1, hq⟩ | ⟨hl, _, hA, hq⟩)
      · refine ⟨hl, ?_, hq⟩
        have hle : l ≤ u := by
          by_contra hc; push Not at hc; rw [hS0 l (le_of_lt hc)] at h1; exact absurd h1 (by decide)
        exact (cont_leO O h l hle).2 (Or.inl h1)
      · subst h1; exact ⟨hl, cont_hasO O h, hq⟩
      · exact ⟨hl, hA, hq⟩
  have hb : ((range 511).filter (fun l => l = u ∧ q l)).card = if q u then 1 else 0 := by
    by_cases hq : q u
    · rw [if_pos hq, card_eq_one]; refine ⟨u, ?_⟩; ext l
      simp only [mem_filter, mem_range, mem_singleton]
      constructor
      · rintro ⟨_, h1, _⟩; exact h1
      · rintro rfl; exact ⟨hu, rfl, hq⟩
    · rw [if_neg hq, card_eq_zero, filter_eq_empty_iff]; rintro l _ ⟨rfl, hq'⟩; exact hq hq'
  rw [e1, card_union_of_disjoint, card_union_of_disjoint, ← add_assoc, hb]
  · rw [disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; omega
  · rw [disjoint_union_right]; constructor
    · rw [disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; subst h2; rw [hS0 l le_rfl] at h1; exact absurd h1 (by decide)
    · rw [disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; rw [hS0 l (le_of_lt h2)] at h1; exact absurd h1 (by decide)

/-- the labels of a continuation above `u` number `22 - (d + 1)` -/
theorem above_cardO {A : Spec.Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues O A S last u) (d : ℕ)
    (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((range 511).filter (fun l => u < l ∧ Has O A l)).card = 22 - (d + 1) := by
  have h1 := cont_splitO O hS h (fun _ => True)
  simp only [and_true, if_true] at h1
  rw [has_cardO O A, hd] at h1
  have : ((range 511).filter (fun l => u < l ∧ Has O A l)).card =
      ((range 511).filter (fun l => u < l ∧ Has O A l ∧ True)).card := by simp
  omega

theorem above_le_tailO {A : Spec.Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues O A S last u) (d : ℕ)
    (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d) (q : ℕ → Prop) [DecidablePred q] :
    ((range 511).filter (fun l => u < l ∧ Has O A l ∧ q l)).card ≤ 22 - (d + 1) := by
  rw [← above_cardO O hS h d hd]
  apply card_le_card
  intro l; simp only [mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩

/-! ## A decomposition below a node -/

theorem below_splitO {A : Spec.Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below O A S last) (q : ℕ → Prop)
    [DecidablePred q] :
    ((range 511).filter (fun l => Has O A l ∧ q l)).card =
      ((range 511).filter (fun l => S.testBit l = true ∧ q l)).card +
      ((range 511).filter (fun l => last < l ∧ Has O A l ∧ q l)).card := by
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [KD.shr_one_bit hS l (by omega)]; simp; omega
  rw [← card_union_of_disjoint]
  · apply congrArg Finset.card; ext l
    simp only [mem_filter, mem_range, mem_union]
    constructor
    · rintro ⟨hl, hA, hq⟩
      by_cases hle : l ≤ last
      · exact Or.inl ⟨hl, (h l hl hle).1 hA, hq⟩
      · exact Or.inr ⟨hl, by omega, hA, hq⟩
    · rintro (⟨hl, h1, hq⟩ | ⟨hl, _, hA, hq⟩)
      · have hle : l ≤ last := by
          by_contra hc; push Not at hc; rw [hS0 l hc] at h1; exact absurd h1 (by decide)
        exact ⟨hl, (h l hl hle).2 h1, hq⟩
      · exact ⟨hl, hA, hq⟩
  · rw [disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; rw [hS0 l h2] at h1; exact absurd h1 (by decide)

theorem below_above_cardO {A : Spec.Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below O A S last) (d : ℕ)
    (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((range 511).filter (fun l => last < l ∧ Has O A l)).card = 22 - d := by
  have h1 := below_splitO O hS h (fun _ => True)
  simp only [and_true] at h1
  rw [has_cardO O A, hd] at h1
  omega

theorem below_le_tailO {A : Spec.Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below O A S last) (d : ℕ)
    (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d) (q : ℕ → Prop) [DecidablePred q] :
    ((range 511).filter (fun l => last < l ∧ Has O A l ∧ q l)).card ≤ 22 - d := by
  rw [← below_above_cardO O hS h d hd]
  apply card_le_card
  intro l; simp only [mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩

/-! ## L1's packed counters -/

theorem packUO_eq_pack (S : ℕ) : packU O S = L1.Packed.pack 7 (fun X => hits O S X) 512 := by
  unfold packU
  suffices ∀ (n : ℕ) (f : ℕ → ℕ), (∑ X ∈ range n, f X * 2 ^ (7 * X)) = L1.Packed.pack 7 f n by exact this 512 _
  intro n
  induction n with
  | zero => intro f; simp [L1.Packed.pack]
  | succ n ih =>
    intro f
    rw [Finset.sum_range_succ', L1.Packed.pack, ← ih (fun i => f (i + 1))]
    simp only [Nat.mul_zero, pow_zero, mul_one]
    rw [Finset.mul_sum, add_comm]
    congr 1
    refine Finset.sum_congr rfl (fun i _ => ?_)
    rw [show 7 * (i + 1) = 7 + 7 * i by ring, pow_add]; ring

theorem hitsO_le (S X d : ℕ) (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d) : hits O S X ≤ d := by
  rw [← hd]; unfold hits; apply card_le_card; intro l; simp only [mem_filter]; rintro ⟨h1, h2, _⟩; exact ⟨h1, h2⟩

theorem fld7_packUO (S X d : ℕ) (hX : X < 512) (hd : ((range 511).filter (fun l => S.testBit l = true)).card = d)
    (hd2 : d < 128) : KD.fld7 (packU O S) X = hits O S X := by
  have hfit : L1.Packed.Fits 7 (fun X => hits O S X) 512 := fun Y _ => lt_of_le_of_lt (hitsO_le O S Y d hd) (by omega)
  have := L1.Packed.field_pack hfit hX
  rw [L1.Packed.field_eq_ops] at this
  unfold KD.fld7; rw [packUO_eq_pack]; exact this

/-! ## Frames: what the dead mask gives above `last` -/

/-- a label of a decomposition below a valid frame, above `last`, is outside `D` -/
theorem frame_notD {Ω : Spec.Dec22 → Prop} {S D N U d last : ℕ} (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1)
    {A : Spec.Dec22} (hΩ : Ω A) (hA : Below O A S last) (l : ℕ) (hll : last < l) (hl : l < 511) (hAl : Has O A l) :
    D.testBit l = false := by
  have hlast := KD.shr_one_lastOf hS
  obtain ⟨_, _, _, _, hfr⟩ := hF
  have hbel : Below O A S (Spec.lastOf S) := by rw [hlast]; exact hA
  cases hDl : D.testBit l
  · rfl
  · exact absurd hAl ((hfr A hΩ hbel).1 l (by rw [hlast]; exact hll) hl hDl)

end order

/-! ## The `--rord 321` instance -/

/-- rank-1 labels of the 321 order: `462..510` -/
def R1M321 : ℕ := KD.geM 462
/-- labels of rank 2 or 3: `0..461` -/
def NR1M321 : ℕ := Nat.sub (Nat.shiftLeft 1 462) 1

theorem testBit_R1M321 (l : ℕ) : R1M321.testBit l = decide (462 ≤ l ∧ l < 511) := KD.testBit_geM 462 l
theorem nr1m321_eq : NR1M321 = 2 ^ 462 - 1 := by decide +kernel
theorem testBit_NR1M321 (l : ℕ) : NR1M321.testBit l = decide (l < 462) := by
  rw [nr1m321_eq, Nat.testBit_two_pow_sub_one]
theorem R1M321_lt : R1M321 < 2 ^ 511 := KD.geM_lt 462
theorem NR1M321_lt : NR1M321 < 2 ^ 511 := by rw [nr1m321_eq]; decide

theorem rk1_321 (l : ℕ) : Top321.O.rk l = 1 ↔ 462 ≤ l := by
  show L5O.rk321 l = 1 ↔ _
  unfold L5O.rk321; split_ifs <;> omega

theorem labN321_inj {x y : ℕ} (hx : x < 512) (hy : y < 512) (h : Top321.labN321 x = Top321.labN321 y) : x = y := by
  rcases Nat.eq_zero_or_pos x with rfl | hx0 <;> rcases Nat.eq_zero_or_pos y with rfl | hy0
  · rfl
  · exfalso
    have h0 : Top321.labN321 0 = 0 := by decide +kernel
    have := (Top321.inv_spec y hy0 hy).2.1; omega
  · exfalso
    have h0 : Top321.labN321 0 = 0 := by decide +kernel
    have := (Top321.inv_spec x hx0 hx).2.1; omega
  · have h1 := (Top321.inv_spec x hx0 hx).1
    have h2 := (Top321.inv_spec y hy0 hy).1
    rw [← h1, ← h2, h]

end KD321
