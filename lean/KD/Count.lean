module
public import R22Port.U_d41d8cd98f00
public import KD.Base
public import K2.XStep
public import L1.Packed
/-! # KD.Count: counting lemmas for a decomposition continuing a node

`Continues A S last u` (spec): `last < u < 511` and the labels of `A` up to `u` are exactly `S ∪ {u}`.  With `S >>> last = 1`
(the node's prefix mask has its top bit at `last`, as `node5` checks):
* `cont_below`: `A` lies below the node (`Below A S (lastOf S)`), `cont_has`: `u` is a label of `A`;
* `cont_split`: a count over the labels of `A` is the count over `S`, plus `[q u]`, plus the count above `u`;
* `above_le_tail`: at most `22 - (d + 1)` labels of `A` lie above `u` (`d` = number of prefix labels);
* `fld7_packU`: field `X` of L1's counters `packU S` is `hits S X` (fields below 128). -/
@[expose] public section
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

theorem shr_one_bit {S last : ℕ} (h : S >>> last = 1) (l : ℕ) (hl : last ≤ l) : S.testBit l = decide (l = last) := by
  have := Nat.testBit_shiftRight (x := S) (i := last) (j := l - last)
  rw [h, show last + (l - last) = l by omega] at this
  rw [← this]
  rcases Nat.eq_or_lt_of_le hl with rfl | hlt
  · simp
  · rw [show l - last = (l - last - 1) + 1 by omega, Nat.testBit_succ]; simp; omega

theorem shr_one_lastOf {S last : ℕ} (h : S >>> last = 1) : lastOf S = last := by
  unfold lastOf
  have hS : S ≠ 0 := by intro h0; rw [h0, Nat.zero_shiftRight] at h; exact absurd h (by decide)
  rw [Nat.log2_eq_iff hS]
  rw [Nat.shiftRight_eq_div_pow] at h
  constructor
  · by_contra hc; push Not at hc; rw [Nat.div_eq_of_lt hc] at h; exact absurd h (by decide)
  · by_contra hc; push Not at hc
    have : 2 ≤ S / 2 ^ last := by
      rw [Nat.le_div_iff_mul_le (Nat.two_pow_pos _)]; rw [pow_succ] at hc; linarith
    omega

theorem shr_one_lt {S last : ℕ} (h : S >>> last = 1) : S < 2 ^ (last + 1) := by
  rw [Nat.shiftRight_eq_div_pow] at h
  by_contra hc; push Not at hc
  have : 2 ≤ S / 2 ^ last := by
    rw [Nat.le_div_iff_mul_le (Nat.two_pow_pos _)]; rw [pow_succ] at hc; linarith
  omega

theorem testBit_or_two_pow (S u l : ℕ) : (S ||| 2 ^ u).testBit l = (S.testBit l || decide (l = u)) := by
  rw [Nat.testBit_or, Nat.testBit_two_pow]
  by_cases h : l = u
  · subst h; simp
  · have h' : ¬ u = l := fun e => h e.symm
    simp [h, h']

theorem cont_has {A : Dec22} {S last u : ℕ} (h : Continues A S last u) : A.Has u := by
  obtain ⟨_, hu, hb⟩ := h
  exact (hb u hu le_rfl).2 (by rw [testBit_or_two_pow]; simp)

theorem cont_le {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues A S last u) (l : ℕ) (hl : l ≤ u) :
    A.Has l ↔ (S.testBit l = true ∨ l = u) := by
  obtain ⟨hlu, hu, hb⟩ := h
  rw [hb l (lt_of_le_of_lt hl hu) hl, testBit_or_two_pow]; simp

theorem cont_below {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues A S last u) :
    Below A S (lastOf S) := by
  rw [shr_one_lastOf hS]
  intro l hl hle
  have h1' : last < u := h.1
  have hlu : l ≤ u := le_trans hle (le_of_lt h1')
  rw [cont_le hS h l hlu]
  constructor
  · rintro (h1 | h1)
    · exact h1
    · omega
  · intro h1; exact Or.inl h1

/-- labels of `A` above `last`: none in `S`, so `A.Has l` for `last < l ≤ u` only at `u` -/
theorem cont_split {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues A S last u) (q : ℕ → Prop)
    [DecidablePred q] :
    ((Finset.range 511).filter (fun l => A.Has l ∧ q l)).card =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)).card + (if q u then 1 else 0) +
      ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ q l)).card := by
  have hu : u < 511 := h.2.1
  have hlu : last < u := h.1
  have hS0 : ∀ l, u ≤ l → S.testBit l = false := by
    intro l hl
    have hl2 : last ≤ l := by omega
    rw [shr_one_bit hS l hl2]
    have hne : l ≠ last := by omega
    simp [hne]
  -- split at u
  have e1 : (Finset.range 511).filter (fun l => A.Has l ∧ q l) =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)) ∪
      (((Finset.range 511).filter (fun l => l = u ∧ q l)) ∪ ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ q l))) := by
    ext l; simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_union]
    constructor
    · rintro ⟨hl, hA, hq⟩
      by_cases hle : l ≤ u
      · rcases (cont_le hS h l hle).1 hA with h1 | h1
        · exact Or.inl ⟨hl, h1, hq⟩
        · exact Or.inr (Or.inl ⟨hl, h1, hq⟩)
      · exact Or.inr (Or.inr ⟨hl, by omega, hA, hq⟩)
    · rintro (⟨hl, h1, hq⟩ | ⟨hl, h1, hq⟩ | ⟨hl, _, hA, hq⟩)
      · refine ⟨hl, ?_, hq⟩
        have hle : l ≤ u := by by_contra hc; push Not at hc; rw [hS0 l (le_of_lt hc)] at h1; exact absurd h1 (by decide)
        exact (cont_le hS h l hle).2 (Or.inl h1)
      · subst h1; exact ⟨hl, cont_has h, hq⟩
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

/-- the labels of `A` above `u` number `22 - (d + 1)` -/
theorem above_card {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues A S last u) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((Finset.range 511).filter (fun l => u < l ∧ A.Has l)).card = 22 - (d + 1) := by
  have h1 := cont_split hS h (fun _ => True)
  simp only [and_true, if_true] at h1
  rw [has_card A, hd] at h1
  have : ((Finset.range 511).filter (fun l => u < l ∧ A.Has l)).card =
      ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ True)).card := by simp
  omega

theorem above_le_tail {A : Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues A S last u) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) (q : ℕ → Prop) [DecidablePred q] :
    ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ q l)).card ≤ 22 - (d + 1) := by
  rw [← above_card hS h d hd]
  apply Finset.card_le_card
  intro l; simp only [Finset.mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩

theorem above_le_mask {A : Dec22} {u : ℕ} (q : ℕ → Prop) [DecidablePred q] :
    ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ q l)).card ≤
      ((Finset.range 511).filter (fun l => u < l ∧ q l)).card := by
  apply Finset.card_le_card
  intro l; simp only [Finset.mem_filter]; rintro ⟨h1, h2, _, h4⟩; exact ⟨h1, h2, h4⟩

/-! ## L1's packed counters -/

/-- field `X` of 7-bit packed counters, kernel form -/
@[inline] def fld7 (U X : ℕ) : ℕ := Nat.land (Nat.shiftRight U (Nat.mul 7 X)) 127

theorem packU_eq_pack (S : ℕ) : packU S = L1.Packed.pack 7 (fun X => hits S X) 512 := by
  unfold packU
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

theorem hits_le (S X d : ℕ) (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) : hits S X ≤ d := by
  rw [← hd]; unfold hits; apply Finset.card_le_card; intro l; simp only [Finset.mem_filter]; rintro ⟨h1, h2, _⟩; exact ⟨h1, h2⟩

theorem fld7_packU (S X d : ℕ) (hX : X < 512) (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d)
    (hd2 : d < 128) : fld7 (packU S) X = hits S X := by
  have hfit : L1.Packed.Fits 7 (fun X => hits S X) 512 := fun Y _ => lt_of_le_of_lt (hits_le S Y d hd) (by omega)
  have := L1.Packed.field_pack hfit hX
  rw [L1.Packed.field_eq_ops] at this
  unfold fld7; rw [packU_eq_pack]; exact this

end KD
