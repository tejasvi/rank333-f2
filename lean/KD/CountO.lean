module
public import R22Port.U_d41d8cd98f00
public import KD.Count
public import KD.Cuts
public import R3RT.SpecO
public import L5.Sem5O
/-! # KD.CountO: `KD.Count` / `KD.Cuts`' counting lemmas over a label order `O` (spec revision 6a)

`Has O A l` (labels in `O`'s coordinates).  `labO O A s` is the label of term `s` (`O.vec` is a bijection onto the nonzero
codes, `L5O.vecL_surj`), so a count over the 22 terms is a count over labels (`card_termsO`); hence `has_cardO` (22 labels) and
`deficit_labO` (the deficit fact over `O`'s labels).  The rest are the order-free proofs of `KD.Count` / `KD.Cuts` with
`Has O`. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT.Spec (Dec22 lastOf DeficitFact)
open RootSound BC4 BC5 Classical

/-- the label of term `s` in the order `O` -/
def labO (O : R3RT.SpecO.LabelOrder) (A : Dec22) (s : Fin 22) : ℕ :=
  Classical.choose (L5O.vecL_surj (O := O) (A.av s) (A.ne s) (A.lt s))

theorem labO_spec (O : R3RT.SpecO.LabelOrder) (A : Dec22) (s : Fin 22) : labO O A s < 511 ∧ O.vec (labO O A s) = A.av s :=
  Classical.choose_spec (L5O.vecL_surj (O := O) (A.av s) (A.ne s) (A.lt s))

theorem labO_inj (O : R3RT.SpecO.LabelOrder) (A : Dec22) : Function.Injective (labO O A) := by
  intro s t h
  apply A.inj
  rw [← (labO_spec O A s).2, ← (labO_spec O A t).2, h]

theorem has_iffO (O : R3RT.SpecO.LabelOrder) (A : Dec22) (l : ℕ) : R3RT.SpecO.Has O A l ↔ ∃ s, labO O A s = l := by
  constructor
  · rintro ⟨hl, s, hs⟩
    refine ⟨s, O.vec_inj _ _ (labO_spec O A s).1 hl ?_⟩
    rw [(labO_spec O A s).2, hs]
  · rintro ⟨s, rfl⟩
    exact ⟨(labO_spec O A s).1, s, (labO_spec O A s).2.symm⟩

/-- a count over the terms is a count over `O`'s labels -/
theorem card_termsO (O : R3RT.SpecO.LabelOrder) (A : Dec22) (q : ℕ → Prop) [DecidablePred q] :
    (Finset.univ.filter (fun s : Fin 22 => q (A.av s))).card =
      ((Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l ∧ q (O.vec l))).card := by
  apply Finset.card_bij (fun s _ => labO O A s)
  · intro s hs
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs
    simp only [Finset.mem_filter, Finset.mem_range]
    refine ⟨(labO_spec O A s).1, (has_iffO O A _).2 ⟨s, rfl⟩, ?_⟩
    rw [(labO_spec O A s).2]; exact hs
  · intro s _ t _ h; exact labO_inj O A h
  · intro l hl
    simp only [Finset.mem_filter, Finset.mem_range] at hl
    obtain ⟨s, rfl⟩ := (has_iffO O A l).1 hl.2.1
    refine ⟨s, ?_, rfl⟩
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    rw [← (labO_spec O A s).2]; exact hl.2.2

theorem has_cardO (O : R3RT.SpecO.LabelOrder) (A : Dec22) :
    ((Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l)).card = 22 := by
  have h := card_termsO O A (fun _ => True)
  simp only [and_true] at h
  rw [← h]; simp

/-- **the deficit fact over `O`'s labels** -/
theorem deficit_labO (O : R3RT.SpecO.LabelOrder) (A : Dec22) (X : ℕ) (h0 : 0 < X) (hX : X < 512) :
    3 * rkOf X ≤ ((Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l ∧ par (O.vec l &&& X) = true)).card :=
  le_of_le_of_eq (deficit_fact A X h0 hX) (card_termsO O A (fun v => par (v &&& X) = true))

variable {O : R3RT.SpecO.LabelOrder}

theorem cont_hasO {A : Dec22} {S last u : ℕ} (h : R3RT.SpecO.Continues O A S last u) : R3RT.SpecO.Has O A u := by
  obtain ⟨_, hu, hb⟩ := h
  exact (hb u hu le_rfl).2 (by rw [testBit_or_two_pow]; simp)

theorem cont_leO {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Continues O A S last u) (l : ℕ)
    (hl : l ≤ u) : R3RT.SpecO.Has O A l ↔ (S.testBit l = true ∨ l = u) := by
  obtain ⟨hlu, hu, hb⟩ := h
  rw [hb l (lt_of_le_of_lt hl hu) hl, testBit_or_two_pow]; simp

theorem cont_belowO {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Continues O A S last u) :
    R3RT.SpecO.Below O A S (lastOf S) := by
  rw [shr_one_lastOf hS]
  intro l hl hle
  have h1' : last < u := h.1
  have hlu : l ≤ u := le_trans hle (le_of_lt h1')
  rw [cont_leO hS h l hlu]
  constructor
  · rintro (h1 | h1)
    · exact h1
    · omega
  · intro h1; exact Or.inl h1

theorem cont_splitO {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Continues O A S last u) (q : ℕ → Prop)
    [DecidablePred q] :
    ((Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l ∧ q l)).card =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)).card + (if q u then 1 else 0) +
      ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l ∧ q l)).card := by
  have hu : u < 511 := h.2.1
  have hlu : last < u := h.1
  have hS0 : ∀ l, u ≤ l → S.testBit l = false := by
    intro l hl
    have hl2 : last ≤ l := by omega
    rw [shr_one_bit hS l hl2]
    have hne : l ≠ last := by omega
    simp [hne]
  have e1 : (Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l ∧ q l) =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)) ∪
      (((Finset.range 511).filter (fun l => l = u ∧ q l)) ∪
        ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l ∧ q l))) := by
    ext l; simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_union]
    constructor
    · rintro ⟨hl, hA, hq⟩
      by_cases hle : l ≤ u
      · rcases (cont_leO hS h l hle).1 hA with h1 | h1
        · exact Or.inl ⟨hl, h1, hq⟩
        · exact Or.inr (Or.inl ⟨hl, h1, hq⟩)
      · exact Or.inr (Or.inr ⟨hl, by omega, hA, hq⟩)
    · rintro (⟨hl, h1, hq⟩ | ⟨hl, h1, hq⟩ | ⟨hl, _, hA, hq⟩)
      · refine ⟨hl, ?_, hq⟩
        have hle : l ≤ u := by by_contra hc; push Not at hc; rw [hS0 l (le_of_lt hc)] at h1; exact absurd h1 (by decide)
        exact (cont_leO hS h l hle).2 (Or.inl h1)
      · subst h1; exact ⟨hl, cont_hasO h, hq⟩
      · exact ⟨hl, hA, hq⟩
  have hb : ((Finset.range 511).filter (fun l => l = u ∧ q l)).card = if q u then 1 else 0 := by
    by_cases hq : q u
    · rw [if_pos hq, Finset.card_eq_one]; refine ⟨u, ?_⟩; ext l
      simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_singleton]
      constructor
      · rintro ⟨_, h1, _⟩; exact h1
      · rintro rfl; exact ⟨hu, rfl, hq⟩
    · rw [if_neg hq, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨rfl, hq'⟩; exact hq hq'
  rw [e1, Finset.card_union_of_disjoint, Finset.card_union_of_disjoint, ← add_assoc, hb]
  · rw [Finset.disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; omega
  · rw [Finset.disjoint_union_right]; constructor
    · rw [Finset.disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; subst h2; rw [hS0 l le_rfl] at h1; exact absurd h1 (by decide)
    · rw [Finset.disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; rw [hS0 l (le_of_lt h2)] at h1; exact absurd h1 (by decide)

theorem above_cardO {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Continues O A S last u) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l)).card = 22 - (d + 1) := by
  have h1 := cont_splitO hS h (fun _ => True)
  simp only [and_true, if_true] at h1
  rw [has_cardO O A, hd] at h1
  have : ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l)).card =
      ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l ∧ True)).card := by simp
  omega

theorem above_le_tailO {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Continues O A S last u) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) (q : ℕ → Prop) [DecidablePred q] :
    ((Finset.range 511).filter (fun l => u < l ∧ R3RT.SpecO.Has O A l ∧ q l)).card ≤ 22 - (d + 1) := by
  rw [← above_cardO hS h d hd]
  apply Finset.card_le_card
  intro l; simp only [Finset.mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩

theorem below_splitO {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Below O A S last) (q : ℕ → Prop)
    [DecidablePred q] :
    ((Finset.range 511).filter (fun l => R3RT.SpecO.Has O A l ∧ q l)).card =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)).card +
      ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l ∧ q l)).card := by
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [shr_one_bit hS l (by omega)]; simp; omega
  rw [← Finset.card_union_of_disjoint]
  · apply congrArg Finset.card; ext l
    simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_union]
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
  · rw [Finset.disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _⟩; rw [hS0 l h2] at h1; exact absurd h1 (by decide)

theorem below_above_cardO {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : R3RT.SpecO.Below O A S last) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((Finset.range 511).filter (fun l => last < l ∧ R3RT.SpecO.Has O A l)).card = 22 - d := by
  have h1 := below_splitO hS h (fun _ => True)
  simp only [and_true] at h1
  rw [has_cardO O A, hd] at h1
  omega

/-! ## L1's packed counters over `O` -/

theorem packU_eq_packO (S : ℕ) : R3RT.SpecO.packU O S = L1.Packed.pack 7 (fun X => R3RT.SpecO.hits O S X) 512 := by
  unfold R3RT.SpecO.packU
  suffices ∀ (n : ℕ) (f : ℕ → ℕ), (∑ X ∈ Finset.range n, f X * 2 ^ (7 * X)) = L1.Packed.pack 7 f n by exact this 512 _
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

theorem hits_leO (S X d : ℕ) (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) :
    R3RT.SpecO.hits O S X ≤ d := by
  rw [← hd]; unfold R3RT.SpecO.hits; apply Finset.card_le_card; intro l; simp only [Finset.mem_filter]
  rintro ⟨h1, h2, _⟩; exact ⟨h1, h2⟩

theorem fld7_packUO (S X d : ℕ) (hX : X < 512) (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d)
    (hd2 : d < 128) : fld7 (R3RT.SpecO.packU O S) X = R3RT.SpecO.hits O S X := by
  have hfit : L1.Packed.Fits 7 (fun X => R3RT.SpecO.hits O S X) 512 :=
    fun Y _ => lt_of_le_of_lt (hits_leO S Y d hd) (by omega)
  have := L1.Packed.field_pack hfit hX
  rw [L1.Packed.field_eq_ops] at this
  unfold fld7; rw [packU_eq_packO]; exact this

end KD
