module
public import R22Port.U_d41d8cd98f00
public import L5.Kill
public import R3RT.SpecO
@[expose] public section
set_option maxHeartbeats 4000000
set_option exponentiation.threshold 1000000
set_option maxRecDepth 100000
/-! # Decompositions in label coordinates: counting facts for the L1 v5 soundness proof

* `labs_card`: a `Dec22` has exactly 22 labels.
* `row_count`: a valid row holding `E` prefix labels admits at most `cap - E` further labels of a decomposition below the
  prefix.
* prefix bookkeeping (`card_or_pow`, `lastOf_or`, `packU_or`, `below_parent`, `T_card`).
* `kill_dead`: the counting argument of a kill (exclusion rows, cover rows, final free set). -/
noncomputable section
namespace L5O
open E1S Finset R3RT.Spec RootSound BC4 BC5 Classical L5
variable {O : R3RT.SpecO.LabelOrder} {Ω : Dec22 → Prop}

/-! ## Labels of a decomposition -/

theorem vecL_surj (c : ℕ) (hc0 : c ≠ 0) (hc : c < 512) : ∃ l < 511, O.vec l = c := by
  have hsub : (range 511).image O.vec ⊆ (range 512).erase 0 := by
    intro x hx; rw [mem_image] at hx; obtain ⟨l, hl, rfl⟩ := hx; rw [mem_range] at hl
    rw [mem_erase, mem_range]; exact ⟨O.vec_ne l hl, O.vec_lt l hl⟩
  have hcard : ((range 512).erase 0).card ≤ ((range 511).image O.vec).card := by
    rw [card_image_of_injOn (fun a ha b hb h => O.vec_inj a b (mem_range.mp ha) (mem_range.mp hb) h)]
    simp
  have heq := eq_of_subset_of_card_le hsub hcard
  have : c ∈ (range 512).erase 0 := by rw [mem_erase, mem_range]; exact ⟨hc0, hc⟩
  rw [← heq, mem_image] at this
  obtain ⟨l, hl, h⟩ := this; exact ⟨l, mem_range.mp hl, h⟩

/-- the label set of `A` -/
def labs (O : R3RT.SpecO.LabelOrder) (A : Dec22) : Finset ℕ := (range 511).filter (fun l => R3RT.SpecO.Has O A l)

theorem mem_labs (A : Dec22) (l : ℕ) : l ∈ labs O A ↔ R3RT.SpecO.Has O A l := by
  unfold labs; rw [mem_filter, mem_range]
  exact ⟨fun h => h.2, fun h => ⟨h.1, h⟩⟩

theorem labs_card (A : Dec22) : (labs O A).card = 22 := by
  have himg : (labs O A).image O.vec = Finset.univ.image A.av := by
    ext c; simp only [mem_image, mem_labs, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨l, hHas, rfl⟩; obtain ⟨_, s, hs⟩ := hHas; exact ⟨s, hs⟩
    · rintro ⟨s, rfl⟩
      obtain ⟨l, hl, hv⟩ := vecL_surj (A.av s) (A.ne s) (A.lt s)
      exact ⟨l, ⟨hl, s, hv.symm⟩, hv⟩
  have h1 : ((labs O A).image O.vec).card = (labs O A).card :=
    card_image_of_injOn (fun a ha b hb h => O.vec_inj a b ((mem_labs A a).mp ha).1 ((mem_labs A b).mp hb).1 h)
  rw [← h1, himg, card_image_of_injective _ A.inj]; simp

/-! ## Rows -/

theorem pcnt_and_eq (R S' : ℕ) (hS : S' < 2 ^ 511) :
    pcnt 512 (R &&& S') = ((range 511).filter (fun l => R.testBit l = true ∧ S'.testBit l = true)).card := by
  rw [pcnt_eq_card]
  congr 1; ext l; simp only [mem_filter, mem_range, Nat.testBit_and, Bool.and_eq_true]
  constructor
  · rintro ⟨hl, h1, h2⟩; refine ⟨?_, h1, h2⟩
    by_contra hc
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hS (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h2
    exact absurd h2 (by decide)
  · rintro ⟨hl, h1, h2⟩; exact ⟨by omega, h1, h2⟩

/-- **Row counting.** -/
theorem row_count (A : Dec22) (hΩ : Ω A) (S' last R c : ℕ) (hS : S' < 2 ^ 511) (hb : ∀ l, S'.testBit l = true → l ≤ last)
    (hB : R3RT.SpecO.Below O A S' last) (hR : R3RT.SpecO.RowOK O Ω (R % 2 ^ 511) c) (F : Finset ℕ)
    (hF : ∀ l ∈ F, R3RT.SpecO.Has O A l ∧ R.testBit l = true ∧ S'.testBit l = false) :
    pcnt 512 (R &&& S') + F.card ≤ c := by
  rw [pcnt_and_eq R S' hS]
  have hsub : ((range 511).filter (fun l => R.testBit l = true ∧ S'.testBit l = true)) ∪ F ⊆ R3RT.SpecO.inMask O A (R % 2 ^ 511) := by
    intro l hl
    rw [mem_union] at hl
    simp only [R3RT.SpecO.inMask, mem_filter, mem_range, Nat.testBit_mod_two_pow]
    rcases hl with hl | hl
    · simp only [mem_filter, mem_range] at hl
      obtain ⟨hl1, hl2, hl3⟩ := hl
      exact ⟨hl1, by simp [hl1, hl2], (hB l hl1 (hb l hl3)).mpr hl3⟩
    · obtain ⟨hl1, hl2, _⟩ := hF l hl
      exact ⟨hl1.1, by simp [hl1.1, hl2], hl1⟩
  have hdisj : Disjoint ((range 511).filter (fun l => R.testBit l = true ∧ S'.testBit l = true)) F := by
    rw [Finset.disjoint_left]; intro l h1 h2
    simp only [mem_filter] at h1; have := (hF l h2).2.2; rw [h1.2.2] at this; exact absurd this (by decide)
  calc _ = (((range 511).filter (fun l => R.testBit l = true ∧ S'.testBit l = true)) ∪ F).card :=
        (card_union_of_disjoint hdisj).symm
    _ ≤ (R3RT.SpecO.inMask O A (R % 2 ^ 511)).card := card_le_card hsub
    _ ≤ c := hR A hΩ

/-! ## Prefixes -/

theorem lt_of_shr_zero (S last : ℕ) (h : S >>> last = 0) : S < 2 ^ last := by
  rw [Nat.shiftRight_eq_div_pow] at h
  by_contra hc
  have := Nat.div_pos (by omega : 2 ^ last ≤ S) (by positivity : 0 < 2 ^ last)
  omega

theorem testBit_or_pow (S last l : ℕ) : (S ||| 2 ^ last).testBit l = (S.testBit l || decide (l = last)) := by
  rw [Nat.testBit_or, Nat.testBit_two_pow]; congr 1; exact decide_eq_decide.mpr ⟨Eq.symm, Eq.symm⟩

theorem or_pow_eq (S last : ℕ) (hS : S < 2 ^ last) : S ||| 2 ^ last = 2 ^ last + S := by
  rw [Nat.lor_comm, ← Nat.mul_one (2 ^ last), ← Nat.two_pow_add_eq_or_of_lt hS]

theorem card_or_pow (S last : ℕ) (hS : S < 2 ^ last) (hl : last < 511) :
    ((range 511).filter (fun l => (S ||| 2 ^ last).testBit l = true)).card =
      ((range 511).filter (fun l => S.testBit l = true)).card + 1 := by
  have e : (range 511).filter (fun l => (S ||| 2 ^ last).testBit l = true) =
      insert last ((range 511).filter (fun l => S.testBit l = true)) := by
    ext l; simp only [mem_filter, mem_range, mem_insert, testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq]
    constructor
    · rintro ⟨hl1, h | h⟩
      · exact Or.inr ⟨hl1, h⟩
      · exact Or.inl h
    · rintro (h | ⟨hl1, h⟩)
      · exact ⟨by omega, Or.inr h⟩
      · exact ⟨hl1, Or.inl h⟩
  rw [e, card_insert_of_notMem]
  simp only [mem_filter, not_and]; intro _
  rw [Nat.testBit_lt_two_pow hS]; decide

theorem lastOf_or (S last : ℕ) (hS : S < 2 ^ last) : lastOf (S ||| 2 ^ last) = last := by
  unfold lastOf
  have hne : S ||| 2 ^ last ≠ 0 := by rw [or_pow_eq S last hS]; positivity
  apply le_antisymm
  · have := (Nat.log2_lt hne).mpr (show S ||| 2 ^ last < 2 ^ (last + 1) by rw [or_pow_eq S last hS, pow_succ]; omega)
    omega
  · exact (Nat.le_log2 hne).mpr (by rw [or_pow_eq S last hS]; omega)

theorem lastOf_lt (S last : ℕ) (h0 : 0 < S) (hS : S < 2 ^ last) : lastOf S < last :=
  (Nat.log2_lt (by omega)).mpr hS

theorem bits_le_lastOf (S l : ℕ) (h : S.testBit l = true) : l ≤ lastOf S := by
  have hne : S ≠ 0 := by rintro rfl; simp at h
  by_contra hc
  have := (Nat.log2_lt hne).mp (by unfold lastOf at hc; omega : S.log2 < l)
  rw [Nat.testBit_lt_two_pow this] at h; exact absurd h (by decide)

theorem hits_or (S last X : ℕ) (hS : S.testBit last = false) (hl : last < 511) :
    R3RT.SpecO.hits O (S ||| 2 ^ last) X = R3RT.SpecO.hits O S X + (if par (O.vec last &&& X) = true then 1 else 0) := by
  unfold R3RT.SpecO.hits
  by_cases hp : par (O.vec last &&& X) = true
  · rw [if_pos hp]
    have e : (range 511).filter (fun p => (S ||| 2 ^ last).testBit p = true ∧ par (O.vec p &&& X) = true) =
        insert last ((range 511).filter (fun p => S.testBit p = true ∧ par (O.vec p &&& X) = true)) := by
      ext p; simp only [mem_filter, mem_range, mem_insert, testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq]
      constructor
      · rintro ⟨hp1, h | h, h2⟩
        · exact Or.inr ⟨hp1, h, h2⟩
        · exact Or.inl h
      · rintro (rfl | ⟨hp1, h, h2⟩)
        · exact ⟨hl, Or.inr rfl, hp⟩
        · exact ⟨hp1, Or.inl h, h2⟩
    rw [e, card_insert_of_notMem]
    simp only [mem_filter, not_and]; intro _ h; rw [hS] at h; exact absurd h (by decide)
  · rw [if_neg hp, Nat.add_zero]
    congr 1; ext p; simp only [mem_filter, mem_range, testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq]
    constructor
    · rintro ⟨hp1, h | rfl, h2⟩
      · exact ⟨hp1, h, h2⟩
      · exact absurd h2 hp
    · rintro ⟨hp1, h, h2⟩; exact ⟨hp1, Or.inl h, h2⟩

theorem packU_or (S last h : ℕ) (hS : S.testBit last = false) (hl : last < 511) (hh : R3RT.SpecO.HOK O last h) :
    R3RT.SpecO.packU O (S ||| 2 ^ last) = R3RT.SpecO.packU O S + h := by
  unfold R3RT.SpecO.packU; rw [hh, ← sum_add_distrib]; apply sum_congr rfl; intro X _
  rw [hits_or S last X hS hl]; ring

/-! ## R3RT.SpecO.Below O a node -/

theorem below_parent (A : Dec22) (S last : ℕ) (hB : R3RT.SpecO.Below O A (S ||| 2 ^ last) last) (hS0 : 0 < S) (hS : S < 2 ^ last) :
    R3RT.SpecO.Below O A S (lastOf S) := by
  intro l hl hle
  have hlt := lastOf_lt S last hS0 hS
  have := hB l hl (by omega)
  rw [testBit_or_pow] at this; simp only [show l ≠ last by omega, decide_false, Bool.or_false] at this; exact this

theorem below_has_last (A : Dec22) (S last : ℕ) (hB : R3RT.SpecO.Below O A (S ||| 2 ^ last) last) (hl : last < 511) : R3RT.SpecO.Has O A last :=
  (hB last hl le_rfl).mpr (by rw [testBit_or_pow]; simp)

theorem cont_below (A : Dec22) (S' last u : ℕ) (h : R3RT.SpecO.Continues O A S' last u) : R3RT.SpecO.Below O A S' last := by
  obtain ⟨hlu, hu, hB⟩ := h
  intro l hl hle
  have := hB l hl (by omega)
  rw [testBit_or_pow] at this; simp only [show l ≠ u by omega, decide_false, Bool.or_false] at this; exact this

theorem cont_has (A : Dec22) (S' last u : ℕ) (h : R3RT.SpecO.Continues O A S' last u) : R3RT.SpecO.Has O A u :=
  (h.2.2 u h.2.1 le_rfl).mpr (by rw [testBit_or_pow]; simp)

/-- the labels of a continuing decomposition above `u`: there are `21 - d` of them -/
theorem T_card (A : Dec22) (S' last u d : ℕ) (hb : ∀ l, S'.testBit l = true → l ≤ last)
    (hcard : ((range 511).filter (fun l => S'.testBit l = true)).card = d) (hC : R3RT.SpecO.Continues O A S' last u) :
    ((labs O A).filter (fun l => u < l)).card = 21 - d := by
  obtain ⟨hlu, hu, hB⟩ := hC
  have hSu : S' < 2 ^ u := by
    apply Nat.lt_pow_two_of_testBit; intro i hi
    cases h : S'.testBit i
    · rfl
    · have := hb i h; omega
  have hlow : (labs O A).filter (fun l => ¬ u < l) = (range 511).filter (fun l => (S' ||| 2 ^ u).testBit l = true) := by
    ext l; simp only [mem_filter, mem_labs, mem_range, not_lt]
    constructor
    · rintro ⟨hH, hle⟩; exact ⟨hH.1, (hB l hH.1 hle).mp hH⟩
    · rintro ⟨hl, hbit⟩
      have hle : l ≤ u := by
        rw [testBit_or_pow, Bool.or_eq_true, decide_eq_true_eq] at hbit
        rcases hbit with h | h
        · have := hb l h; omega
        · omega
      exact ⟨(hB l hl hle).mpr hbit, hle⟩
  have hsplit := card_filter_add_card_filter_not (s := labs O A) (p := fun l => u < l)
  rw [labs_card, hlow, card_or_pow S' u hSu hu, hcard] at hsplit
  omega

/-! ## The counting argument of a kill -/

/-- **A kill.** A decomposition continuing the node with child `u` puts its `21 - d` labels above `u` into the window
slot `X1`; an exclusion row (cap `E + 1`, holding `u`) contains none of them; a cover row (cap `E + 1`, or `E + 2` when it
holds `u`) at most one; so `21 - d ≤ |Y| + nC` for the final free set `Y`, against the kill test. -/
theorem kill_dead (A : Dec22) (hΩ : Ω A) (S' last u d : ℕ) (hS : S' < 2 ^ 511) (hb : ∀ l, S'.testBit l = true → l ≤ last)
    (hcard : ((range 511).filter (fun l => S'.testBit l = true)).card = d) (hC : R3RT.SpecO.Continues O A S' last u)
    (X1 Y nX nC : ℕ) (exR cvR : ℕ → ℕ)
    (hX1 : ∀ l, u < l → R3RT.SpecO.Has O A l → X1.testBit l = true)
    (hex : ∀ i < nX, (exR i).testBit u = true ∧ R3RT.SpecO.RowOK O Ω (exR i % 2 ^ 511) (pcnt 512 (exR i &&& S') + 1))
    (hcv : ∀ i < nC, R3RT.SpecO.RowOK O Ω (cvR i % 2 ^ 511) (pcnt 512 (cvR i &&& S') + 1 + ((cvR i).testBit u).toNat))
    (hY : ∀ l, Y.testBit l = true ↔ X1.testBit l = true ∧ (∀ i < nX, (exR i).testBit l = false) ∧
      (∀ i < nC, (cvR i).testBit l = false))
    (hcount : pcnt 512 Y + nC < 21 - d) : False := by
  have hBl := cont_below A S' last u hC
  have hHu := cont_has A S' last u hC
  have hlu := hC.1
  have hS'u : S'.testBit u = false := by
    cases h : S'.testBit u
    · rfl
    · have := hb u h; omega
  set T := (labs O A).filter (fun l => u < l) with hT
  have hTc : T.card = 21 - d := T_card A S' last u d hb hcard hC
  have hTmem : ∀ l ∈ T, R3RT.SpecO.Has O A l ∧ u < l ∧ S'.testBit l = false := by
    intro l hl; rw [hT, mem_filter, mem_labs] at hl
    refine ⟨hl.1, hl.2, ?_⟩
    cases h : S'.testBit l
    · rfl
    · have := hb l h; omega
  -- exclusion rows hold no label of `T`
  have hTex : ∀ l ∈ T, ∀ i < nX, (exR i).testBit l = false := by
    intro l hl i hi
    cases h : (exR i).testBit l
    · rfl
    · exfalso
      obtain ⟨hu, hR⟩ := hex i hi
      have hlu' : l ≠ u := by have := (hTmem l hl).2.1; omega
      have := row_count A hΩ S' last (exR i) _ hS hb hBl hR {u, l} (by
        intro x hx; rw [mem_insert, mem_singleton] at hx
        rcases hx with rfl | rfl
        · exact ⟨hHu, hu, hS'u⟩
        · exact ⟨(hTmem x hl).1, h, (hTmem x hl).2.2⟩)
      rw [card_pair hlu'.symm] at this; omega
  -- a cover row holds at most one label of `T`
  have hTcv : ∀ i < nC, (T.filter (fun l => (cvR i).testBit l = true)).card ≤ 1 := by
    intro i hi
    have hR := hcv i hi
    cases hu : (cvR i).testBit u
    · have := row_count A hΩ S' last (cvR i) _ hS hb hBl hR (T.filter (fun l => (cvR i).testBit l = true)) (by
        intro x hx; rw [mem_filter] at hx; exact ⟨(hTmem x hx.1).1, hx.2, (hTmem x hx.1).2.2⟩)
      rw [hu] at this; simp at this; omega
    · have hnot : u ∉ T.filter (fun l => (cvR i).testBit l = true) := by
        intro hx; rw [mem_filter] at hx; have := (hTmem u hx.1).2.1; omega
      have := row_count A hΩ S' last (cvR i) _ hS hb hBl hR (insert u (T.filter (fun l => (cvR i).testBit l = true))) (by
        intro x hx; rw [mem_insert] at hx
        rcases hx with rfl | hx
        · exact ⟨hHu, hu, hS'u⟩
        · rw [mem_filter] at hx; exact ⟨(hTmem x hx.1).1, hx.2, (hTmem x hx.1).2.2⟩)
      rw [card_insert_of_notMem hnot, hu] at this; simp at this; omega
  -- `T ⊆ Y ∪ ⋃ cover rows`
  have hcover : T ⊆ T.filter (fun l => Y.testBit l = true) ∪
      (range nC).biUnion (fun i => T.filter (fun l => (cvR i).testBit l = true)) := by
    intro l hl
    rw [mem_union]
    by_cases hc : ∀ i < nC, (cvR i).testBit l = false
    · left; rw [mem_filter]
      refine ⟨hl, (hY l).mpr ⟨hX1 l (hTmem l hl).2.1 (hTmem l hl).1, hTex l hl, hc⟩⟩
    · right; push Not at hc; obtain ⟨i, hi, hb'⟩ := hc
      rw [mem_biUnion]; refine ⟨i, mem_range.mpr hi, ?_⟩
      rw [mem_filter]; exact ⟨hl, by simpa using hb'⟩
  have hY' : (T.filter (fun l => Y.testBit l = true)).card ≤ pcnt 512 Y := by
    rw [pcnt_eq_card]; apply card_le_card
    intro l hl; rw [mem_filter] at hl ⊢
    have := (mem_labs A l).mp (mem_filter.mp hl.1).1
    exact ⟨mem_range.mpr (by have := this.1; omega), hl.2⟩
  have hbu : ((range nC).biUnion (fun i => T.filter (fun l => (cvR i).testBit l = true))).card ≤ nC := by
    calc _ ≤ ∑ i ∈ range nC, (T.filter (fun l => (cvR i).testBit l = true)).card := card_biUnion_le
      _ ≤ ∑ i ∈ range nC, 1 := sum_le_sum (fun i hi => hTcv i (mem_range.mp hi))
      _ = nC := by simp
  have := le_trans (card_le_card hcover) (card_union_le _ _)
  omega

end L5O
