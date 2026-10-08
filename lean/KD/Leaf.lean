module
public import R22Port.U_d41d8cd98f00
public import KD.Canon
public import KD.Cuts
public import S7.Leaf7
/-! # KD.Leaf: main-search leaf records refuted by the v7 leaf checker (leaf2, `BC7s.leafS`)

A leaf of the main search is a node with 22 labels `S`.  The leaf tier refutes its profile with a v7 record `R` (a full-`T`
leaf: `leafDom6 R = ALLNZ`, `leafN R = 22`, the 22 first factors packed in `leafT R`, in any order).
* `leafBind R S`: the record's terms are exactly the vectors of the labels of `S` (`lmask`: the OR of `2^(labV a_t)`).
* **`leaf_dead`**: an accepted, bound record leaves no decomposition whose label set is `S` and whose `b`, `c` factors are
  nonzero (`S7.leafS7_sound`, `S5.noDecomp_full`; the terms of the decomposition are permuted into the record's order).
* `leaf_node_dead`: the same for a leaf node `(S, last)` of depth 22 (`Below A S last` fixes all 22 labels).
The nonzero `b`, `c` hypothesis is the v7 theorem's; at the top level it holds because a zero factor leaves at most 21 terms
(Rudich-Rousseau's bound 22). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 S5 S6 Classical

/-- label mask of the first `n` packed terms -/
def lmask (T : ℕ) : ℕ → ℕ :=
  Nat.rec (motive := fun _ => ℕ) 0 (fun t acc => Nat.lor acc (Nat.shiftLeft 1 (labV (aT T t))))

/-- the v7 leaf record `R` is a full-`T` leaf whose 22 terms are the vectors of the labels of `S` -/
def leafBind (R S : ℕ) : Bool :=
  Nat.beq (leafN R) 22 && Nat.beq (leafDom6 R) ALLNZ && Nat.beq (lmask (leafT R) 22) S

theorem lmask_bit (T b : ℕ) : ∀ n, (lmask T n).testBit b = true ↔ ∃ t < n, labV (aT T t) = b := by
  intro n
  induction n with
  | zero => simp [lmask]
  | succ n ih =>
    show (lmask T n ||| 1 <<< labV (aT T n)).testBit b = true ↔ _
    rw [Nat.testBit_or, Bool.or_eq_true, ih, Nat.one_shiftLeft, Nat.testBit_two_pow]
    constructor
    · rintro (⟨t, ht, h⟩ | h)
      · exact ⟨t, by omega, h⟩
      · exact ⟨n, by omega, by simpa using h⟩
    · rintro ⟨t, ht, h⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp ht with h1 | h1
      · exact Or.inl ⟨t, h1, h⟩
      · subst h1; exact Or.inr (by simp [h])

theorem labV_zero : labV 0 = 511 := by decide +kernel

theorem labV_lt_spec {v : ℕ} (hv : v < 512) (hl : labV v < 511) : v ≠ 0 ∧ vecL (labV v) = v := by
  have h0 : v ≠ 0 := by intro e; rw [e, labV_zero] at hl; omega
  exact ⟨h0, (labV_spec v h0 hv).2⟩

/-- **Leaf records, from the refutation itself.**  If the profile of a record bound to `S` has no decomposition
(`S5.NoDecomp`, e.g. `S7.leafS7_sound` or the split-leaf tier's `S7X.leafSplit_sound'`), no decomposition with label set `S`
and nonzero `b`, `c` exists. -/
theorem leaf_dead_nd {R S : ℕ} (hnd : S5.NoDecomp (leafT R) (leafN R) (leafDom6 R)) (hb : leafBind R S = true)
    (hS511 : S < 2 ^ 511) :
    ∀ A : Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → (∀ l, l < 511 → (A.Has l ↔ S.testBit l = true)) → False := by
  intro A hnz hset
  unfold leafBind at hb
  simp only [Bool.and_eq_true] at hb
  obtain ⟨⟨hN, hD⟩, hM⟩ := hb
  replace hN := Nat.eq_of_beq_eq_true hN
  replace hD := Nat.eq_of_beq_eq_true hD
  replace hM := Nat.eq_of_beq_eq_true hM
  rw [hN, hD] at hnd
  set T := leafT R with hTdef
  -- every term is the vector of a label of S
  have hterm : ∀ t, t < 22 → labV (aT T t) < 511 ∧ S.testBit (labV (aT T t)) = true := by
    intro t ht
    have h1 : (lmask T 22).testBit (labV (aT T t)) = true := (lmask_bit T _ 22).2 ⟨t, ht, rfl⟩
    rw [hM] at h1
    refine ⟨?_, h1⟩
    by_contra hc; push Not at hc
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hS511 (Nat.pow_le_pow_right (by norm_num) hc))] at h1
    exact absurd h1 (by decide)
  -- the labels of the terms are distinct: 22 terms onto the 22 labels of S
  have hcardS : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = 22 := by
    rw [← has_card A]; apply card_filter_congr; intro l hl; rw [Finset.mem_range] at hl; exact (hset l hl).symm
  let lab : Fin 22 → ℕ := fun t => labV (aT T t.val)
  have himg : Finset.univ.image lab = (Finset.range 511).filter (fun l => S.testBit l = true) := by
    ext l; simp only [Finset.mem_image, Finset.mem_univ, true_and, Finset.mem_filter, Finset.mem_range]
    constructor
    · rintro ⟨t, rfl⟩; exact hterm t.val t.isLt
    · rintro ⟨hl, hbit⟩
      have h1 : (lmask T 22).testBit l = true := by rw [hM]; exact hbit
      obtain ⟨t, ht, e⟩ := (lmask_bit T l 22).1 h1
      exact ⟨⟨t, ht⟩, e⟩
  have hlinj : Function.Injective lab := by
    have hc : (Finset.univ.image lab).card = (Finset.univ : Finset (Fin 22)).card := by
      rw [himg, hcardS]; simp
    have hinj := Finset.card_image_iff.mp hc
    intro a b hab; exact hinj (Finset.mem_coe.mpr (Finset.mem_univ a)) (Finset.mem_coe.mpr (Finset.mem_univ b)) hab
  -- the term of A carrying each record term
  have hex : ∀ t : Fin 22, ∃ s : Fin 22, A.av s = aT T t.val := by
    intro t
    obtain ⟨hl, hbit⟩ := hterm t.val t.isLt
    obtain ⟨_, s, hs⟩ := (hset _ hl).2 hbit
    exact ⟨s, by rw [hs, (labV_lt_spec (aT_lt T t.val) hl).2]⟩
  choose σ hσ using hex
  have hσinj : Function.Injective σ := by
    intro t t' h
    apply hlinj
    show labV (aT T t.val) = labV (aT T t'.val)
    rw [← hσ t, ← hσ t', h]
  have hσbij : Function.Bijective σ := Finite.injective_iff_bijective.mp hσinj
  let e := Equiv.ofBijective σ hσbij
  have hdec : IsDecomp (fun t : Fin 22 => toM3 (aT T t.val)) (fun t => A.b (σ t)) (fun t => A.c (σ t)) := by
    intro i j j' k k' i'
    have h := A.dec i j j' k k' i'
    have h2 := Equiv.sum_comp e (fun s => toM3 (A.av s) i j * A.b s j' k * A.c s k' i')
    refine Eq.trans ?_ (h2.trans h)
    refine Finset.sum_congr rfl (fun t _ => ?_)
    show toM3 (aT T t.val) i j * A.b (σ t) j' k * A.c (σ t) k' i' = toM3 (A.av (σ t)) i j * A.b (σ t) j' k * A.c (σ t) k' i'
    rw [hσ t]
  exact noDecomp_full hnd (fun t => A.b (σ t)) (fun t => A.c (σ t)) (fun t => hnz (σ t)) hdec

/-- **Leaf records.**  An accepted v7 record bound to `S` refutes every decomposition with label set `S` and nonzero
`b`, `c`. -/
theorem leaf_dead {R S : ℕ} (hR : BC7s.leafS R = true) (hb : leafBind R S = true) (hS511 : S < 2 ^ 511) :
    ∀ A : Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → (∀ l, l < 511 → (A.Has l ↔ S.testBit l = true)) → False :=
  leaf_dead_nd (S7.leafS7_sound R hR) hb hS511

/-- **Leaf nodes, from the refutation itself.**  A leaf node `(S, last)` with 22 prefix labels and a bound record whose profile
has no decomposition is empty (for nonzero `b`, `c`). -/
theorem leaf_node_dead_nd {R S last : ℕ} (hnd : S5.NoDecomp (leafT R) (leafN R) (leafDom6 R)) (hb : leafBind R S = true)
    (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = 22) :
    ∀ A : Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below A S last := by
  intro A hnz hA
  apply leaf_dead_nd hnd hb hS511 A hnz
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [shr_one_bit hS l (by omega)]; simp; omega
  have hab := below_above_card hS hA 22 hcard
  intro l hl
  by_cases hll : l ≤ last
  · exact hA l hl hll
  · push Not at hll
    rw [hS0 l hll]
    simp only [Bool.false_eq_true, iff_false]
    intro hAl
    have : l ∈ (Finset.range 511).filter (fun l => last < l ∧ A.Has l) := by
      simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨hl, hll, hAl⟩
    rw [Finset.card_eq_zero.mp (by omega : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l)).card = 0)] at this
    exact absurd this (Finset.notMem_empty l)

/-- **Leaf nodes.**  A leaf node `(S, last)` with 22 prefix labels and an accepted bound v7 record is empty (for nonzero
`b`, `c`). -/
theorem leaf_node_dead {R S last : ℕ} (hR : BC7s.leafS R = true) (hb : leafBind R S = true) (hS : S >>> last = 1)
    (hS511 : S < 2 ^ 511) (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = 22) :
    ∀ A : Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below A S last :=
  leaf_node_dead_nd (S7.leafS7_sound R hR) hb hS hS511 hcard

end KD
