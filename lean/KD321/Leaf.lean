module
public import R22Port.U_d41d8cd98f00
public import KD321.Base
public import KD.Leaf
/-! # KD321.Leaf: main-search leaves (code 0) refuted by a v7 record, over a label order

`KD.leafBind` with the order's label function `lf` (`LfOK O lf`: a code `v < 512` with `lf v < 511` is nonzero and is the
code of label `lf v`).  For `--rord 321`: `lf321 v = (labN321 v + 511) % 512` (`lfOK321`; code 0 goes to 511).
* `leafBindO lf R S`: the v7 record `R` is a full-`T` leaf whose 22 terms are the codes of the labels of `S`;
* **`leaf_dead_ndO`**, **`leaf_node_dead_ndO`**: a refuted profile (`S5.NoDecomp`, e.g. from `S7.leafS7_sound`) bound to `S`
  leaves no decomposition with label set `S` and nonzero `b`, `c`; for a leaf node `(S, last)` with 22 labels, none below it. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD321
open RootSound R3RT R3RT.SpecO BC4 BC5 S5 S6 Finset Classical

/-- the order's label function on codes -/
structure LfOK (O : LabelOrder) (lf : ℕ → ℕ) : Prop where
  spec : ∀ v, v < 512 → lf v < 511 → v ≠ 0 ∧ O.vec (lf v) = v

/-- label mask of the first `n` packed terms -/
def lmaskO (lf : ℕ → ℕ) (T : ℕ) : ℕ → ℕ :=
  Nat.rec (motive := fun _ => ℕ) 0 (fun t acc => Nat.lor acc (Nat.shiftLeft 1 (lf (aT T t))))

/-- the v7 leaf record `R` is a full-`T` leaf whose 22 terms are the codes of the labels of `S` -/
def leafBindO (lf : ℕ → ℕ) (R S : ℕ) : Bool :=
  Nat.beq (leafN R) 22 && Nat.beq (leafDom6 R) ALLNZ && Nat.beq (lmaskO lf (leafT R) 22) S

theorem lmaskO_bit (lf : ℕ → ℕ) (T b : ℕ) : ∀ n, (lmaskO lf T n).testBit b = true ↔ ∃ t < n, lf (aT T t) = b := by
  intro n
  induction n with
  | zero => simp [lmaskO]
  | succ n ih =>
    show (lmaskO lf T n ||| 1 <<< lf (aT T n)).testBit b = true ↔ _
    rw [Nat.testBit_or, Bool.or_eq_true, ih, Nat.one_shiftLeft, Nat.testBit_two_pow]
    constructor
    · rintro (⟨t, ht, h⟩ | h)
      · exact ⟨t, by omega, h⟩
      · exact ⟨n, by omega, by simpa using h⟩
    · rintro ⟨t, ht, h⟩
      rcases Nat.lt_succ_iff_lt_or_eq.mp ht with h1 | h1
      · exact Or.inl ⟨t, h1, h⟩
      · subst h1; exact Or.inr (by simp [h])

section leaf
variable {O : LabelOrder} {lf : ℕ → ℕ}

theorem leaf_dead_ndO (hL : LfOK O lf) {R S : ℕ} (hnd : S5.NoDecomp (leafT R) (leafN R) (leafDom6 R))
    (hb : leafBindO lf R S = true) (hS511 : S < 2 ^ 511) :
    ∀ A : Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → (∀ l, l < 511 → (Has O A l ↔ S.testBit l = true)) → False := by
  intro A hnz hset
  unfold leafBindO at hb
  simp only [Bool.and_eq_true] at hb
  obtain ⟨⟨hN, hD⟩, hM⟩ := hb
  replace hN := Nat.eq_of_beq_eq_true hN
  replace hD := Nat.eq_of_beq_eq_true hD
  replace hM := Nat.eq_of_beq_eq_true hM
  rw [hN, hD] at hnd
  set T := leafT R with hTdef
  have hterm : ∀ t, t < 22 → lf (aT T t) < 511 ∧ S.testBit (lf (aT T t)) = true := by
    intro t ht
    have h1 : (lmaskO lf T 22).testBit (lf (aT T t)) = true := (lmaskO_bit lf T _ 22).2 ⟨t, ht, rfl⟩
    rw [hM] at h1
    refine ⟨?_, h1⟩
    by_contra hc; push Not at hc
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hS511 (Nat.pow_le_pow_right (by norm_num) hc))] at h1
    exact absurd h1 (by decide)
  have hcardS : ((range 511).filter (fun l => S.testBit l = true)).card = 22 := by
    rw [← has_cardO O A]; apply KD.card_filter_congr; intro l hl; rw [mem_range] at hl; exact (hset l hl).symm
  let lab : Fin 22 → ℕ := fun t => lf (aT T t.val)
  have himg : univ.image lab = (range 511).filter (fun l => S.testBit l = true) := by
    ext l; simp only [mem_image, mem_univ, true_and, mem_filter, mem_range]
    constructor
    · rintro ⟨t, rfl⟩; exact hterm t.val t.isLt
    · rintro ⟨hl, hbit⟩
      have h1 : (lmaskO lf T 22).testBit l = true := by rw [hM]; exact hbit
      obtain ⟨t, ht, e⟩ := (lmaskO_bit lf T l 22).1 h1
      exact ⟨⟨t, ht⟩, e⟩
  have hlinj : Function.Injective lab := by
    have hc : (univ.image lab).card = (univ : Finset (Fin 22)).card := by
      rw [himg, hcardS]; simp
    have hinj := Finset.card_image_iff.mp hc
    intro a b hab; exact hinj (Finset.mem_coe.mpr (Finset.mem_univ a)) (Finset.mem_coe.mpr (Finset.mem_univ b)) hab
  have hex : ∀ t : Fin 22, ∃ s : Fin 22, A.av s = aT T t.val := by
    intro t
    obtain ⟨hl, hbit⟩ := hterm t.val t.isLt
    obtain ⟨_, s, hs⟩ := (hset _ hl).2 hbit
    exact ⟨s, by rw [hs, (hL.spec _ (aT_lt T t.val) hl).2]⟩
  choose σ hσ using hex
  have hσinj : Function.Injective σ := by
    intro t t' h
    apply hlinj
    show lf (aT T t.val) = lf (aT T t'.val)
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

/-- **Leaf nodes.**  A leaf node `(S, last)` with 22 prefix labels and a bound record whose profile has no decomposition is
empty (for nonzero `b`, `c`). -/
theorem leaf_node_dead_ndO (hL : LfOK O lf) {R S last : ℕ} (hnd : S5.NoDecomp (leafT R) (leafN R) (leafDom6 R))
    (hb : leafBindO lf R S = true) (hS : S >>> last = 1) (hS511 : S < 2 ^ 511)
    (hcard : ((range 511).filter (fun l => S.testBit l = true)).card = 22) :
    ∀ A : Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below O A S last := by
  intro A hnz hA
  apply leaf_dead_ndO hL hnd hb hS511 A hnz
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [KD.shr_one_bit hS l (by omega)]; simp; omega
  have hab := below_above_cardO O hS hA 22 hcard
  intro l hl
  by_cases hll : l ≤ last
  · exact hA l hl hll
  · push Not at hll
    rw [hS0 l hll]
    simp only [Bool.false_eq_true, iff_false]
    intro hAl
    have : l ∈ (range 511).filter (fun l => last < l ∧ Has O A l) := by
      simp only [mem_filter, mem_range]; exact ⟨hl, hll, hAl⟩
    rw [Finset.card_eq_zero.mp (by omega : ((range 511).filter (fun l => last < l ∧ Has O A l)).card = 0)] at this
    exact absurd this (Finset.notMem_empty l)

theorem leaf_node_deadO (hL : LfOK O lf) {R S last : ℕ} (hR : BC7s.leafS R = true) (hb : leafBindO lf R S = true)
    (hS : S >>> last = 1) (hS511 : S < 2 ^ 511) (hcard : ((range 511).filter (fun l => S.testBit l = true)).card = 22) :
    ∀ A : Spec.Dec22, (∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) → ¬ Below O A S last :=
  leaf_node_dead_ndO hL (S7.leafS7_sound R hR) hb hS hS511 hcard

end leaf

/-! ## `--rord 321` -/

/-- the 321 label of a code (`labN321 v - 1`; code 0 goes to 511) -/
def lf321 (v : ℕ) : ℕ := Nat.mod (Nat.add (Top321.labN321 v) 511) 512

theorem lfOK321 : LfOK Top321.O lf321 where
  spec := fun v hv hl => by
    unfold lf321 at hl ⊢
    rw [show Nat.mod (Nat.add (Top321.labN321 v) 511) 512 = (Top321.labN321 v + 511) % 512 from rfl] at hl ⊢
    rcases Nat.eq_zero_or_pos v with rfl | h0
    · exfalso
      have h00 : Top321.labN321 0 = 0 := by decide +kernel
      rw [h00] at hl; norm_num at hl
    · obtain ⟨hvec, h1, h2⟩ := Top321.inv_spec v h0 hv
      refine ⟨Nat.pos_iff_ne_zero.mp h0, ?_⟩
      rw [show (Top321.labN321 v + 511) % 512 = Top321.labN321 v - 1 by omega]
      exact hvec

end KD321
