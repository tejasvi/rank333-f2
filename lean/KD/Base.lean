module
public import R22Port.U_d41d8cd98f00
public import R3RT.L1v5Spec
public import RootSound.Sem
public import RootSound.Leaf
public import S6.LG
/-! # KD.Base: the semantic facts shared by the item-(e) kill-kind checkers

* `deficit_fact : R3RT.Spec.DeficitFact` — every decomposition has at least `3 rk X` first factors with odd pairing against
  a nonzero functional `X` (from `RootSound.resid_rank_le` and `RootSound.rank_TX`).
* Labels and terms: `labV` (the label of a nonzero vector, `labV_fact`), `card_terms` (a count over the 22 terms of a
  `Dec22` is a count over its labels), `has_card` (22 labels), `deficit_lab` (the deficit fact over labels).
* Ranks: `rkL l = rank (toM3 (vecL l))` is 1, 2, 3 on the label ranges [0,49), [49,343), [343,511) (`rkL_fact`). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

theorem par_eq_hitsOne (X x : ℕ) : par (x &&& X) = RootCheck.hitsOne X x := by
  have hP : RootCheck.PAR = BC4.PAR := by decide +kernel
  show BC5.bit BC4.PAR (x &&& X) = RootCheck.bit RootCheck.PAR (Nat.land X x)
  rw [hP]; show BC5.bit BC4.PAR (x &&& X) = RootCheck.bit BC4.PAR (X &&& x); rw [Nat.land_comm]; rfl

/-- **The deficit fact** (Lemma R part 1, `RootSound`): the spec's `DeficitFact`. -/
theorem deficit_fact : DeficitFact := by
  intro A X hX0 hX
  have h1 := resid_rank_le A.dec (toM3 X) ∅
  simp only [Finset.inter_empty, Finset.sum_empty, add_zero, Finset.sdiff_empty] at h1
  rw [rank_TX X hX (by omega)] at h1
  refine le_trans h1 (le_of_eq ?_)
  unfold hitSet
  congr 1; ext s
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  rw [pair_eq_one_iff X (A.av s) hX (A.lt s), par_eq_hitsOne]

/-! ## Labels -/

/-- the label of each vector (9-bit fields; vector 0 ↦ 511) -/
def LABV : Nat := 0x1855aab54a9d4aa22fa853ffdfdfe7ee9d4da67ea97f9fc52bef49a47dbeb47a37d3e745a27cbe343a17c3df41a07ba7fedf64fbd73d9e4efd5e9f479e7539174e26f369acd2662d994c7cde5f278e612f970b25b2c95caa522bf14a24fe193783bf25ef493bb23ee48bb721ed4823fd98f763af1deb473ab1bea46ba7198c45fa5d1e873e2d158a0aa271288c421e298773a1bcde6433970be542a13c9847238f0783414510481c0a0227e371600ffe270dfcfde13f1f7c17d7037ef97c6f9efbdde3db76f5dd6e5e8f3dc6dde4f1783bc4cee76bb1d625756db6ae9746d366e7d939b62e5d83935ee3d76b5c4e1d66adc0df6f375b8246db69b2236c6ab52d76b6a34ed5d33534ad3d234b46d1d1685a0cfd067d9ccd6632d942264b218e216367b3ac56267336c3cd3098399606632ebfcb2f97b955e65326bb5d64b22b95c6431eb75b2d568b3102c9621fc7637198b582bd5cadc56271187562ad54a95429d4ca50f291461d516194385c2283069fc127b029dc0272fe9b4d5f9337dbe262f697bd25af295bc252ee93bb5d6e97349245208f47235188b45071121bb95c6e16f4421d0c854220d048140068fe193f1f6dd6db65acf87b3d1e6d569b459cf077b3594ec75b258ce873b1584e471b057ce06faf576b95b371b4d86bad566b157351a4d06733194c8633118430173017cbc5d2e16c2c150a168b2582b958aa132a048a652289409e1127134204c25928920f2411c8c0e22910860d21104803f060f87a0b1e0ec74391c0286e091b0d46833190c410070301408030100401ff
def labV (v : Nat) : Nat := (LABV >>> (9 * v)) % 512

theorem labV_fact : S5.allLT 512 (fun v => v == 0 || (Nat.blt (labV v) 511 && vecL (labV v) == v)) = true := by
  decide +kernel

theorem labV_spec (v : Nat) (h0 : v ≠ 0) (hv : v < 512) : labV v < 511 ∧ vecL (labV v) = v := by
  have h := S5.allLT_spec labV_fact v hv
  simp only [Bool.or_eq_true, beq_iff_eq, Bool.and_eq_true, Nat.blt_eq] at h
  rcases h with h | ⟨h1, h2⟩
  · exact absurd h h0
  · exact ⟨h1, h2⟩

/-- the label of term `s` -/
def labT (A : Dec22) (s : Fin 22) : Nat := labV (A.av s)

theorem labT_spec (A : Dec22) (s : Fin 22) : labT A s < 511 ∧ vecL (labT A s) = A.av s :=
  labV_spec _ (A.ne s) (A.lt s)

theorem labT_inj (A : Dec22) : Function.Injective (labT A) := by
  intro s t h
  apply A.inj
  rw [← (labT_spec A s).2, ← (labT_spec A t).2, h]

theorem has_iff (A : Dec22) (l : Nat) : A.Has l ↔ ∃ s, labT A s = l := by
  constructor
  · rintro ⟨hl, s, hs⟩
    refine ⟨s, vecL_inj _ _ (labT_spec A s).1 hl ?_⟩
    rw [(labT_spec A s).2, hs]
  · rintro ⟨s, rfl⟩
    exact ⟨(labT_spec A s).1, s, (labT_spec A s).2.symm⟩

/-- a count over the terms is a count over the labels -/
theorem card_terms (A : Dec22) (q : Nat → Prop) [DecidablePred q] :
    (Finset.univ.filter (fun s : Fin 22 => q (A.av s))).card =
      ((Finset.range 511).filter (fun l => A.Has l ∧ q (vecL l))).card := by
  apply Finset.card_bij (fun s _ => labT A s)
  · intro s hs
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs
    simp only [Finset.mem_filter, Finset.mem_range]
    refine ⟨(labT_spec A s).1, (has_iff A _).2 ⟨s, rfl⟩, ?_⟩
    rw [(labT_spec A s).2]; exact hs
  · intro s _ t _ h; exact labT_inj A h
  · intro l hl
    simp only [Finset.mem_filter, Finset.mem_range] at hl
    obtain ⟨s, rfl⟩ := (has_iff A l).1 hl.2.1
    refine ⟨s, ?_, rfl⟩
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    rw [← (labT_spec A s).2]; exact hl.2.2

theorem has_card (A : Dec22) : ((Finset.range 511).filter (fun l => A.Has l)).card = 22 := by
  have h := card_terms A (fun _ => True)
  simp only [and_true] at h
  rw [← h]; simp

theorem deficit_lab (A : Dec22) (X : Nat) (h0 : 0 < X) (hX : X < 512) :
    3 * rkOf X ≤ ((Finset.range 511).filter (fun l => A.Has l ∧ par (vecL l &&& X) = true)).card := by
  exact le_of_le_of_eq (deficit_fact A X h0 hX) (card_terms A (fun v => par (v &&& X) = true))

/-! ## Ranks of labels -/

def rkL (l : Nat) : Nat := if l < 49 then 1 else if l < 343 then 2 else 3

theorem rkL_tab : S5.allLT 511 (fun l => BC6s.rk3 (vecL l) == rkL l) = true := by decide +kernel

theorem rkL_fact (l : Nat) (hl : l < 511) : (toM3 (vecL l)).rank = rkL l := by
  rw [← S6.rk3_rank _ (vecL_lt l)]
  have := S5.allLT_spec rkL_tab l hl
  simpa using this

theorem card_filter_congr {p q : ℕ → Prop} [DecidablePred p] [DecidablePred q] (s : Finset ℕ)
    (h : ∀ l ∈ s, p l ↔ q l) : (s.filter p).card = (s.filter q).card := by rw [Finset.filter_congr h]

theorem blt_true {a b : ℕ} (h : a < b) : Nat.blt a b = true := Nat.blt_eq.mpr h
theorem blt_false {a b : ℕ} (h : ¬ a < b) : Nat.blt a b = false := by
  cases hb : Nat.blt a b
  · rfl
  · exact absurd (Nat.blt_eq.mp hb) h
theorem beq_true {a b : ℕ} (h : Nat.beq a b = true) : a = b := Nat.eq_of_beq_eq_true h

end KD
