module
public import R22Port.U_d41d8cd98f00
public import NNP.KindsA
public import KD.Canon
/-! # NNP.Kinds: soundness of the native PREFF, DOOM, TYPE checks and the suffix break

On a valid child frame `FrameOK O Ω S D N (natU U) d` of a node with top label `last` (`S >>> last = 1`):
* **`preffN_sound`**: an accepted PREFF record `(u, X)` kills child `u` for every decomposition (deficit fact);
* **`doomN_sound`**: an accepted DOOM record kills `u` for every decomposition of `Ω` in the rank-1 window `CaseK lo hi`
  (rank-1 labels `0..48`, hypothesis `hR1`);
* **`tyN_sound`**: an accepted TYPE record kills `u` for every decomposition, given `KD.TypeFacts` (ranks of `--rord 123`,
  hypothesis `hRk`);
* **`sufMask_sound`**: every child in the suffix-break mask is dead for `Ω`. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical BC4 BC5 RootSound
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- the kinds statics agree with the order -/
structure KStatOK (O : LabelOrder) (ks : KStatics) : Prop where
  vec : ∀ l, l < 511 → ks.vec.getD l 0 = O.vec l
  np : ∀ X, X < 512 → ks.np.getD X #[] = npOf ks.vec X
  rk : ∀ X, X < 512 → (ks.rk3.get! X).toNat = 3 * rkOf X

/-- `Spec.nType` in label coordinates -/
theorem nType_lab (A : R3RT.Spec.Dec22) (r : ℕ) :
    R3RT.Spec.nType A r = ((range 511).filter (fun l => Has O A l ∧ O.rk l = r)).card := by
  unfold R3RT.Spec.nType
  rw [NNP.KC.card_termsO O A (fun v => rkOf v = r)]
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range]
  constructor
  · rintro ⟨hl, h1, h2⟩; exact ⟨hl, h1, by rw [O.rk_spec l hl]; exact h2⟩
  · rintro ⟨hl, h1, h2⟩; exact ⟨hl, h1, by rw [← O.rk_spec l hl]; exact h2⟩

/-- the prefix labels in `[lo, hi)` (`hi ≤ 511`) are counted by `popIn` -/
theorem popIn_prefix (S' : Array UInt64) (lo hi : ℕ) (hhi : hi ≤ 511) (q : ℕ → Prop) [DecidablePred q]
    (hq : ∀ l, l < 511 → (q l ↔ lo ≤ l ∧ l < hi)) :
    ((range 511).filter (fun l => (natL S' 0 8).testBit l = true ∧ q l)).card = popIn S' lo hi := by
  rw [popIn_card _ _ _ (by omega)]
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range]
  constructor
  · rintro ⟨hl, h1, h2⟩; have := (hq l hl).1 h2; exact ⟨by omega, this.1, this.2, h1⟩
  · rintro ⟨hl, h1, h2, h3⟩; exact ⟨by omega, h3, (hq l (by omega)).2 ⟨h1, h2⟩⟩

/-! ## PREFF -/

theorem preffN_sound (ks : KStatics) (hK : KStatOK O ks) {S D N d last u X : ℕ} {U : ByteArray}
    (hF : FrameOK O Ω S D N (natU U) d) (hU : ∀ j, j < 512 → (U.get! j).toNat < 128) (hS : S >>> last = 1) (hd : d ≤ 21)
    (h : preffN ks U d u X = true) : ∀ A : R3RT.Spec.Dec22, ¬ Continues O A S last u := by
  intro A hA
  unfold preffN at h
  simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨hX0, hX⟩, hlt⟩, halt⟩ := h
  have hu5 : u < 511 := hA.2.1
  have hcard := hF.2.2.1
  have hdef := NNP.KC.deficit_labO O A X hX0 hX
  have hsp := NNP.KC.cont_splitO hS hA (fun l => par (O.vec l &&& X) = true)
  have hh := frame_hits hF (by omega) hU X hX
  have hpb : (if parN (ks.vec.getD u 0 &&& X) = true then 1 else 0) = (if par (O.vec u &&& X) = true then 1 else 0) := by
    rw [hK.vec u hu5, parN_eq _ (lt_of_le_of_lt Nat.and_le_right hX)]
  have hrk := hK.rk X hX
  have ht1 := NNP.KC.above_le_tailO hS hA d hcard (fun l => par (O.vec l &&& X) = true)
  unfold hits at hh
  rw [hh, hpb, hrk] at hlt halt
  rcases halt with h1 | h1
  · rw [hsp] at hdef; split_ifs at hdef hlt h1 <;> omega
  · have hmask : ((range 511).filter (fun l => u < l ∧ Has O A l ∧ par (O.vec l &&& X) = true)).card ≤
        popIn (ks.np.getD X #[]) (u + 1) 512 := by
      rw [popIn_card _ _ _ le_rfl, hK.np X hX]
      apply card_le_card
      intro l hl
      simp only [mem_filter, mem_range] at hl ⊢
      obtain ⟨hl5, hul, _, hp⟩ := hl
      refine ⟨by omega, by omega, by omega, ?_⟩
      rw [npOf_bit, decide_eq_true hl5, Bool.true_and, hK.vec l hl5, parN_eq _ (lt_of_le_of_lt Nat.and_le_right hX)]
      exact hp
    rw [hsp] at hdef; split_ifs at hdef hlt h1 <;> omega

/-! ## DOOM -/

/-- the available labels in `(u, 511)` outside the rank-1 interval: total minus the interval's -/
theorem avail_outside (D' : Array UInt64) (u r1lo r1hi : ℕ) (hr1hi : r1hi ≤ 511) (q : ℕ → Prop) [DecidablePred q]
    (hq : ∀ l, l < 511 → (q l ↔ r1lo ≤ l ∧ l < r1hi)) :
    ((range 511).filter (fun l => u < l ∧ (natL D' 0 8).testBit l = false ∧ ¬ q l)).card =
      availIn D' (u + 1) 511 - availIn D' (max (u + 1) r1lo) r1hi := by
  rw [availIn_card, availIn_card]
  have hsub : (range 511).filter (fun l => max (u + 1) r1lo ≤ l ∧ l < r1hi ∧ (natL D' 0 8).testBit l = false) ⊆
      (range 511).filter (fun l => u + 1 ≤ l ∧ l < 511 ∧ (natL D' 0 8).testBit l = false) := by
    intro l hl; simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨h1, h2, h3, h4⟩ := hl
    exact ⟨h1, le_trans (le_max_left _ _) h2, by omega, h4⟩
  rw [← card_sdiff_of_subset hsub]
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range, mem_sdiff]
  constructor
  · rintro ⟨hl, h1, h2, h3⟩
    refine ⟨⟨hl, by omega, hl, h2⟩, fun ⟨_, h4, h5, _⟩ => h3 ((hq l hl).2 ⟨le_trans (le_max_right _ _) h4, h5⟩)⟩
  · rintro ⟨⟨hl, h1, _, h2⟩, h3⟩
    refine ⟨hl, by omega, h2, fun hql => h3 ⟨hl, ?_, ((hq l hl).1 hql).2, h2⟩⟩
    exact max_le h1 ((hq l hl).1 hql).1

theorem doomN_sound (c : Cfg) (hR1 : ∀ l, l < 511 → (O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi)) (hr1hi : c.r1hi ≤ 511)
    {S' D' : Array UInt64} {N U d last u : ℕ}
    (hF : FrameOK O Ω (natL S' 0 8) (natL D' 0 8) N U d) (hS : natL S' 0 8 >>> last = 1) (hd : d ≤ 21)
    (h : doomN S' D' d u c = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → CaseK c.lo c.hi A → ¬ Continues O A (natL S' 0 8) last u := by
  intro A hΩ hC hA
  have hcard := hF.2.2.1
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  have hbel := NNP.KC.cont_belowO hS hA
  obtain ⟨hlo, hhi⟩ := hC
  rw [nType_lab (O := O) A 1] at hlo hhi
  have hsp := NNP.KC.cont_splitO hS hA (fun l => O.rk l = 1)
  have hpre := popIn_prefix S' c.r1lo c.r1hi hr1hi (fun l => O.rk l = 1) (fun l hl => by show O.rk l = 1 ↔ _; exact hR1 l hl)
  set t1 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ O.rk l = 1)).card with ht1
  set t2 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ ¬ O.rk l = 1)).card with ht2
  have hsum : t1 + t2 = 21 - d := by
    have hac := NNP.KC.above_cardO hS hA d hcard
    rw [show 21 - d = 22 - (d + 1) by omega, ← hac, ht1, ht2, ← card_union_of_disjoint]
    · apply congrArg Finset.card; ext l
      simp only [mem_union, mem_filter, mem_range]
      constructor
      · rintro (⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩) <;> exact ⟨hl, h1, h2⟩
      · rintro ⟨hl, h1, h2⟩
        by_cases h3 : O.rk l = 1
        · exact Or.inl ⟨hl, h1, h2, h3⟩
        · exact Or.inr ⟨hl, h1, h2, h3⟩
    · rw [disjoint_filter]; rintro l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩; exact h2 h1
  have hav : ∀ l, u < l → l < 511 → Has O A l → (natL D' 0 8).testBit l = false :=
    fun l hul hl hAl => frame_notD' hF hS hΩ hbel l (by omega) hl hAl
  have hRA : t1 ≤ availIn D' (max (u + 1) c.r1lo) c.r1hi := by
    rw [availIn_card]; apply card_le_card; intro l hl
    simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨hl5, hul, hAl, hr⟩ := hl
    have := (hR1 l hl5).1 hr
    exact ⟨hl5, by omega, this.2, hav l hul hl5 hAl⟩
  have hRB : t2 ≤ availIn D' (u + 1) 511 - availIn D' (max (u + 1) c.r1lo) c.r1hi := by
    rw [← avail_outside D' u c.r1lo c.r1hi hr1hi (fun l => O.rk l = 1) (fun l hl => hR1 l hl)]
    apply card_le_card; intro l hl
    simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨hl5, hul, hAl, hr⟩ := hl
    exact ⟨hl5, hul, hav l hul hl5 hAl, hr⟩
  have hu1 : (if O.rk u = 1 then 1 else 0) = (if c.r1lo ≤ u ∧ u < c.r1hi then 1 else 0) := by
    by_cases h1 : c.r1lo ≤ u ∧ u < c.r1hi
    · rw [if_pos ((hR1 u hu).2 h1), if_pos h1]
    · rw [if_neg (fun e => h1 ((hR1 u hu).1 e)), if_neg h1]
  rw [hsp, hpre, hu1] at hlo hhi
  unfold doomN winTestN at h
  simp only [Bool.or_eq_true, decide_eq_true_eq] at h
  rcases h with (h | h) | h <;> split_ifs at h hlo hhi <;> omega

/-! ## Node cut 7 -/

/-- **node cut 7**: an accepted window test at a valid frame refutes every decomposition of `Ω` in the window below the node -/
theorem winN_sound (c : Cfg) (hR1 : ∀ l, l < 511 → (O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi)) (hr1hi : c.r1hi ≤ 511)
    {S D' : Array UInt64} {N U d last : ℕ}
    (hF : FrameOK O Ω (natL S 0 8) (natL D' 0 8) N U d) (hS : natL S 0 8 >>> last = 1)
    (h : winN S D' d last c = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → CaseK c.lo c.hi A → ¬ Below O A (natL S 0 8) last := by
  intro A hΩ hC hA
  unfold winN at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hd, h⟩ := h
  have hcard := hF.2.2.1
  have hlastOf := KD.shr_one_lastOf hS
  have hB' : Below O A (natL S 0 8) (R3RT.Spec.lastOf (natL S 0 8)) := by rw [hlastOf]; exact hA
  obtain ⟨hlo, hhi⟩ := hC
  rw [nType_lab (O := O) A 1] at hlo hhi
  have hsp := NNP.KC.below_splitO hS hA (fun l => O.rk l = 1)
  have hpre := popIn_prefix S c.r1lo c.r1hi hr1hi (fun l => O.rk l = 1) (fun l hl => by show O.rk l = 1 ↔ _; exact hR1 l hl)
  set t1 := ((range 511).filter (fun l => last < l ∧ Has O A l ∧ O.rk l = 1)).card with ht1
  set t2 := ((range 511).filter (fun l => last < l ∧ Has O A l ∧ ¬ O.rk l = 1)).card with ht2
  have hsum : t1 + t2 = 22 - d := by
    have hac := NNP.KC.below_above_cardO hS hA d hcard
    rw [← hac, ht1, ht2, ← card_union_of_disjoint]
    · apply congrArg Finset.card; ext l
      simp only [mem_union, mem_filter, mem_range]
      constructor
      · rintro (⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩) <;> exact ⟨hl, h1, h2⟩
      · rintro ⟨hl, h1, h2⟩
        by_cases h3 : O.rk l = 1
        · exact Or.inl ⟨hl, h1, h2, h3⟩
        · exact Or.inr ⟨hl, h1, h2, h3⟩
    · rw [disjoint_filter]; rintro l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩; exact h2 h1
  have hav : ∀ l, last < l → l < 511 → Has O A l → (natL D' 0 8).testBit l = false :=
    fun l hll hl hAl => frame_notD' hF hS hΩ hB' l hll hl hAl
  have hRA : t1 ≤ availIn D' (max (last + 1) c.r1lo) c.r1hi := by
    rw [availIn_card]; apply card_le_card; intro l hl
    simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨hl5, hll, hAl, hr⟩ := hl
    have := (hR1 l hl5).1 hr
    exact ⟨hl5, by omega, this.2, hav l hll hl5 hAl⟩
  have hRB : t2 ≤ availIn D' (last + 1) 511 - availIn D' (max (last + 1) c.r1lo) c.r1hi := by
    rw [← avail_outside D' last c.r1lo c.r1hi hr1hi (fun l => O.rk l = 1) (fun l hl => hR1 l hl)]
    apply card_le_card; intro l hl
    simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨hl5, hll, hAl, hr⟩ := hl
    exact ⟨hl5, hll, hav l hll hl5 hAl, hr⟩
  rw [hsp, hpre] at hlo hhi
  unfold winTestN at h
  simp only [Bool.or_eq_true, decide_eq_true_eq] at h
  rcases h with (h | h) | h <;> omega

/-! ## TYPE -/

theorem tyN_sound (hRk : ∀ l, l < 511 → O.rk l = rk123 l) (hT : KD.TypeFacts) {S' : Array UInt64} {D N U d last u : ℕ}
    (hF : FrameOK O Ω (natL S' 0 8) D N U d) (hS : natL S' 0 8 >>> last = 1) (hd : d ≤ 21)
    (h : tyN S' d u = true) : ∀ A : R3RT.Spec.Dec22, ¬ Continues O A (natL S' 0 8) last u := by
  intro A hA
  have hcard := hF.2.2.1
  have hu : u < 511 := hA.2.1
  have hTA := hT A
  rw [← KD.nType_eq, ← KD.nType_eq, ← KD.nType_eq, nType_lab (O := O) A 1, nType_lab (O := O) A 2,
    nType_lab (O := O) A 3] at hTA
  have hsp1 := NNP.KC.cont_splitO hS hA (fun l => O.rk l = 1)
  have hsp2 := NNP.KC.cont_splitO hS hA (fun l => O.rk l = 2)
  have hsp3 := NNP.KC.cont_splitO hS hA (fun l => O.rk l = 3)
  have hrk : ∀ l, l < 511 → (O.rk l = 1 ↔ l < 49) ∧ (O.rk l = 2 ↔ 49 ≤ l ∧ l < 343) ∧ (O.rk l = 3 ↔ 343 ≤ l) := by
    intro l hl; rw [hRk l hl]; unfold rk123; split_ifs <;> omega
  have hp1 := popIn_prefix S' 0 49 (by norm_num) (fun l => O.rk l = 1) (fun l hl => by show O.rk l = 1 ↔ _; rw [(hrk l hl).1]; omega)
  have hp2 := popIn_prefix S' 49 343 (by norm_num) (fun l => O.rk l = 2) (fun l hl => (hrk l hl).2.1)
  have hp3 := popIn_prefix S' 343 511 (by norm_num) (fun l => O.rk l = 3) (fun l hl => by show O.rk l = 3 ↔ _; rw [(hrk l hl).2.2]; omega)
  set t1 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ O.rk l = 1)).card with ht1
  set t2 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ O.rk l = 2)).card with ht2
  set t3 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ O.rk l = 3)).card with ht3
  have hsum : t1 + t2 + t3 = 21 - d := by
    have hac := NNP.KC.above_cardO hS hA d hcard
    rw [show 21 - d = 22 - (d + 1) by omega, ← hac, ht1, ht2, ht3, ← card_union_of_disjoint, ← card_union_of_disjoint]
    · apply congrArg Finset.card; ext l
      simp only [mem_union, mem_filter, mem_range]
      constructor
      · rintro ((⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩) | ⟨hl, h1, h2, _⟩) <;> exact ⟨hl, h1, h2⟩
      · rintro ⟨hl, h1, h2⟩
        have := (hrk l hl)
        by_cases h3 : l < 49
        · exact Or.inl (Or.inl ⟨hl, h1, h2, this.1.2 h3⟩)
        · by_cases h4 : l < 343
          · exact Or.inl (Or.inr ⟨hl, h1, h2, this.2.1.2 ⟨by omega, h4⟩⟩)
          · exact Or.inr ⟨hl, h1, h2, this.2.2.2 (by omega)⟩
    all_goals first
      | (rw [Finset.disjoint_union_left]; constructor <;>
          (rw [disjoint_filter]; rintro l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩; rw [h1] at h2; simp at h2))
      | (rw [disjoint_filter]; rintro l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩; rw [h1] at h2; simp at h2)
  -- labels after `u` have rank at least `u`'s
  have hz1 : 49 ≤ u → t1 = 0 := by
    intro hu49; rw [ht1, card_eq_zero, filter_eq_empty_iff]
    rintro l hl ⟨hul, _, hr⟩; rw [mem_range] at hl; have := (hrk l hl).1.1 hr; omega
  have hz2 : 343 ≤ u → t2 = 0 := by
    intro hu343; rw [ht2, card_eq_zero, filter_eq_empty_iff]
    rintro l hl ⟨hul, _, hr⟩; rw [mem_range] at hl; have := (hrk l hl).2.1.1 hr; omega
  have hi1 : (if O.rk u = 1 then 1 else 0) = (if u < 49 then 1 else 0) := by
    by_cases h1 : u < 49
    · rw [if_pos ((hrk u hu).1.2 h1), if_pos h1]
    · rw [if_neg (fun e => h1 ((hrk u hu).1.1 e)), if_neg h1]
  have hi2 : (if O.rk u = 2 then 1 else 0) = (if 49 ≤ u ∧ u < 343 then 1 else 0) := by
    by_cases h1 : 49 ≤ u ∧ u < 343
    · rw [if_pos ((hrk u hu).2.1.2 h1), if_pos h1]
    · rw [if_neg (fun e => h1 ((hrk u hu).2.1.1 e)), if_neg h1]
  have hi3 : (if O.rk u = 3 then 1 else 0) = (if 343 ≤ u then 1 else 0) := by
    by_cases h1 : 343 ≤ u
    · rw [if_pos ((hrk u hu).2.2.2 h1), if_pos h1]
    · rw [if_neg (fun e => h1 ((hrk u hu).2.2.1 e)), if_neg h1]
  rw [hsp1, hsp2, hsp3, hp1, hp2, hp3, hi1, hi2, hi3] at hTA
  -- the type of `A` is one the record rules out
  unfold tyN at h
  simp only [] at h
  have hy : t1 < (if u < 49 then 21 - d + 1 else 1) := by split_ifs with h1 <;> [omega; (have := hz1 (by omega); omega)]
  have hx : t2 < (if u < 343 then 21 - d - t1 + 1 else 1) := by
    split_ifs with h1 <;> [omega; (have := hz2 (by omega); omega)]
  have hall := (allN_iff _ _).mp ((allN_iff _ _).mp h t1 hy) t2 hx
  have ht3' : 21 - d - t1 - t2 = t3 := by omega
  rw [ht3'] at hall
  have e1 : (popIn S' 0 49 + if u < 49 then 1 else 0) + t1 = popIn S' 0 49 + (if u < 49 then 1 else 0) + t1 := rfl
  have hty : typeOKN = KD.typeOK := rfl
  rw [hty] at hall
  have : KD.typeOK (popIn S' 0 49 + (if u < 49 then 1 else 0) + t1)
      (popIn S' 49 343 + (if 49 ≤ u ∧ u < 343 then 1 else 0) + t2) (popIn S' 343 511 + (if 343 ≤ u then 1 else 0) + t3) = true := by
    have e2 : ((if 49 ≤ u && u < 343 then 1 else 0) : ℕ) = (if 49 ≤ u ∧ u < 343 then 1 else 0) := by
      by_cases h1 : 49 ≤ u <;> by_cases h2 : u < 343 <;> simp [h1, h2]
    rw [← hTA]
  simp only [Bool.not_eq_true'] at hall
  have e2 : ((if 49 ≤ u && u < 343 then 1 else 0) : ℕ) = (if 49 ≤ u ∧ u < 343 then 1 else 0) := by
    by_cases h1 : 49 ≤ u <;> by_cases h2 : u < 343 <;> simp [h1, h2]
  rw [e2] at hall
  rw [hall] at this
  exact absurd this (by decide)

/-! ## The suffix break -/

theorem sufMask_bit (D : Array UInt64) (last nn u : ℕ) (h : (natL (sufMask D last nn) 0 8).testBit u = true) :
    last < sufStart D last nn ∧ sufStart D last nn ≤ u ∧ u < 511 ∧ availIn D (sufStart D last nn + 1) 511 < nn := by
  unfold sufMask at h
  simp only [] at h
  split at h
  · rename_i hc
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
    obtain ⟨⟨h1, h2⟩, h3⟩ := hc
    rw [natL_range_map, natF_testBit] at h
    by_cases hu : u < 512
    · rw [decide_eq_true (show u < 64 * 8 by omega), Bool.true_and, tb_and, fromW_bit _ _ _ (Nat.mod_lt _ (by norm_num)),
        aboveW_bit _ _ _ (Nat.mod_lt _ (by norm_num)) (by omega), show 64 * (u / 64) + u % 64 = u by omega] at h
      simp only [Bool.and_eq_true, decide_eq_true_eq] at h
      exact ⟨h1, h.1, h.2.2, h3⟩
    · rw [decide_eq_false (show ¬ u < 64 * 8 by omega), Bool.false_and] at h; exact absurd h (by decide)
  · rw [natL_zero8, Nat.zero_testBit] at h; exact absurd h (by decide)

theorem sufMask_sound {S N U d last u : ℕ} {D' : Array UInt64} (hF : FrameOK O Ω S (natL D' 0 8) N U d)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : (natL (sufMask D' last (21 - d)) 0 8).testBit u = true) :
    ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A S last u := by
  intro A hΩ hA
  obtain ⟨_, hu0, _, hav⟩ := sufMask_bit D' last (21 - d) u h
  have hcard := hF.2.2.1
  have hbel := NNP.KC.cont_belowO hS hA
  have hac := NNP.KC.above_cardO hS hA d hcard
  have hle : ((range 511).filter (fun l => u < l ∧ Has O A l)).card ≤ availIn D' (sufStart D' last (21 - d) + 1) 511 := by
    rw [availIn_card]; apply card_le_card; intro l hl
    simp only [mem_filter, mem_range] at hl ⊢
    obtain ⟨hl5, hul, hAl⟩ := hl
    exact ⟨hl5, by omega, hl5, frame_notD' hF hS hΩ hbel l (by have := hA.1; omega) hl5 hAl⟩
  omega

end NNP
