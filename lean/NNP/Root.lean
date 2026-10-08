module
public import R22Port.U_61e634908821
public import NNP.Node2
public import NN.Conv
public import KD.Count
/-! # NNP.Root: the frame of an item root's parent is valid (`NN.rootFrameN`)

`rootFrameN st tab pre Dh wit` builds the frame of the prefix `pre` (the item root's parent): `S` = the prefix bits, `N` = the
cap-1 table with the prefix labels' cap-2 tables, `U` = the prefix counters, and `D` = the header's inherited dead mask `Dh` plus
the labels in `N`-conflict with a prefix label (`KD.rootFrame_okU`'s dead labels).  `Dh` is validated by witness rows of the
item table: each full at the prefix, their union containing `Dh` outside the prefix.

**`rootFrameN_ok`**: an accepted root frame satisfies `FrameOK O Ω`, given the static facts (`Conf1OK`, `C2OK`, `HOK`) and the
item table's `TabOK`.  The dead labels of `Dh` are dead because a row full at the prefix has no further label in a
decomposition below the prefix (`L5O.row_count`); the conflict labels as in `KD.rootFrame_okU`, using the empty self slots of
the cap-2 tables, which the native check `c2selfOK` verifies. -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## The prefix -/

theorem incrOK_spec (pre : Array ℕ) (h : incrOK pre = true) :
    (∀ i < pre.size, pre.getD i 0 < 511) ∧ (∀ i j, i < j → j < pre.size → pre.getD i 0 < pre.getD j 0) := by
  unfold incrOK at h
  have h' := (allN_iff _ _).mp h
  refine ⟨fun i hi => ?_, ?_⟩
  · have := h' i hi; simp only [Bool.and_eq_true, decide_eq_true_eq] at this; exact this.1
  · intro i j hij hj
    induction j with
    | zero => omega
    | succ j ih =>
      have := h' (j + 1) hj
      simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, beq_iff_eq, Nat.add_sub_cancel] at this
      have hstep : pre.getD j 0 < pre.getD (j + 1) 0 := by
        rcases this.2 with h0 | h0
        · omega
        · exact h0
      rcases Nat.lt_succ_iff_lt_or_eq.mp hij with h1 | h1
      · exact lt_trans (ih h1 (by omega)) hstep
      · subst h1; exact hstep

theorem mem_toList_getD (pre : Array ℕ) (l : ℕ) : l ∈ pre.toList ↔ ∃ i < pre.size, pre.getD i 0 = l := by
  rw [Array.mem_toList_iff, Array.mem_iff_getElem]
  constructor
  · rintro ⟨i, hi, rfl⟩; exact ⟨i, hi, by rw [getD_lt _ _ _ hi]⟩
  · rintro ⟨i, hi, rfl⟩; exact ⟨i, hi, by rw [getD_lt _ _ _ hi]⟩

theorem setBits_view : ∀ (ps : List ℕ) (S : Array UInt64), (∀ p ∈ ps, p < 512) →
    ∀ l, (natL (setBits S ps) 0 8).testBit l = ((natL S 0 8).testBit l || decide (l ∈ ps))
  | [], S, _, l => by simp [setBits]
  | p :: ps, S, h, l => by
    unfold setBits
    rw [setBits_view ps _ (fun q hq => h q (List.mem_cons_of_mem _ hq)), setBit8_view' _ _ (h p List.mem_cons_self),
      Nat.testBit_or, Nat.testBit_two_pow]
    by_cases h1 : l = p
    · subst h1; simp
    · have h2 : ¬ p = l := fun e => h1 e.symm
      simp [h1, h2]

/-- the prefix bits: label `l` is set iff it is a prefix label -/
theorem prefix_bit (pre : Array ℕ) (h511 : ∀ i < pre.size, pre.getD i 0 < 511) (l : ℕ) :
    (natL (setBits #[0, 0, 0, 0, 0, 0, 0, 0] pre.toList) 0 8).testBit l = true ↔ ∃ i < pre.size, pre.getD i 0 = l := by
  have hlt : ∀ p ∈ pre.toList, p < 512 := by
    intro p hp; obtain ⟨i, hi, rfl⟩ := (mem_toList_getD pre p).mp hp; have := h511 i hi; omega
  rw [setBits_view _ _ hlt, natL_zero8, Nat.zero_testBit, Bool.false_or, decide_eq_true_iff, mem_toList_getD]

theorem one_testBit' (i : ℕ) : (1 : ℕ).testBit i = decide (i = 0) := by
  cases i with
  | zero => simp
  | succ i => simp [Nat.testBit_succ]

/-- the facts of the prefix bits `S`: bounds, top label, count -/
theorem prefix_facts (pre : Array ℕ) (hpos : 0 < pre.size) (h511 : ∀ i < pre.size, pre.getD i 0 < 511)
    (hinc : ∀ i j, i < j → j < pre.size → pre.getD i 0 < pre.getD j 0) :
    let S := natL (setBits #[0, 0, 0, 0, 0, 0, 0, 0] pre.toList) 0 8
    let last := pre.getD (pre.size - 1) 0
    0 < S ∧ S < 2 ^ 511 ∧ S >>> last = 1 ∧ R3RT.Spec.lastOf S = last ∧
      ((range 511).filter (fun l => S.testBit l = true)).card = pre.size ∧
      (∀ l, S.testBit l = true → l ≤ last) := by
  intro S last
  have hbit := prefix_bit pre h511
  have hle : ∀ i < pre.size, pre.getD i 0 ≤ last := by
    intro i hi
    rcases Nat.lt_or_ge i (pre.size - 1) with h1 | h1
    · exact le_of_lt (hinc i (pre.size - 1) h1 (by omega))
    · have : i = pre.size - 1 := by omega
      subst this; exact le_rfl
  have hbits_le : ∀ l, S.testBit l = true → l ≤ last := by
    intro l hl; obtain ⟨i, hi, rfl⟩ := (hbit l).mp hl; exact hle i hi
  have hlast_bit : S.testBit last = true := (hbit last).mpr ⟨pre.size - 1, by omega, rfl⟩
  have hl511 : last < 511 := h511 _ (by omega)
  have hS511 : S < 2 ^ 511 := by
    apply Nat.lt_pow_two_of_testBit; intro i hi
    cases h : S.testBit i
    · rfl
    · have := hbits_le i h; omega
  have hshr : S >>> last = 1 := by
    apply Nat.eq_of_testBit_eq; intro i
    rw [Nat.testBit_shiftRight, one_testBit']
    by_cases hi : i = 0
    · subst hi; simp [hlast_bit]
    · rw [decide_eq_false hi]
      cases h : S.testBit (last + i)
      · rfl
      · have := hbits_le _ h; omega
  have hS0 : 0 < S := by
    rcases Nat.eq_zero_or_pos S with h | h
    · rw [h, Nat.zero_testBit] at hlast_bit; exact absurd hlast_bit (by decide)
    · exact h
  have hcard : ((range 511).filter (fun l => S.testBit l = true)).card = pre.size := by
    have e : (range 511).filter (fun l => S.testBit l = true) = (range pre.size).image (fun i => pre.getD i 0) := by
      ext l
      simp only [mem_filter, mem_range, mem_image]
      constructor
      · rintro ⟨_, hl⟩; obtain ⟨i, hi, rfl⟩ := (hbit l).mp hl; exact ⟨i, hi, rfl⟩
      · rintro ⟨i, hi, rfl⟩; exact ⟨h511 i hi, (hbit _).mpr ⟨i, hi, rfl⟩⟩
    rw [e, card_image_of_injOn, card_range]
    intro i hi j hj hij
    simp only [coe_range, Set.mem_Iio] at hi hj
    by_contra hne
    rcases Nat.lt_or_gt_of_ne hne with h1 | h1
    · have := hinc i j h1 hj; simp only at hij; omega
    · have := hinc j i h1 hi; simp only at hij; omega
  exact ⟨hS0, hS511, hshr, KD.shr_one_lastOf hshr, hcard, hbits_le⟩

/-! ## The conflict table and the counters -/

theorem orTabs_view (st : Statics) : ∀ (ps : List ℕ) (N : Array UInt64) (b : ℕ),
    (natL (orTabs st N ps) 0 4096).testBit b = true ↔
      ((natL N 0 4096).testBit b = true ∨ ∃ p ∈ ps, (c2tV st p).testBit b = true)
  | [], N, b => by simp [orTabs]
  | p :: ps, N, b => by
    unfold orTabs
    rw [orTabs_view st ps _ b]
    have e : natL (orArr N (st.c2t.getD p #[])) 0 4096 = natL N 0 4096 ||| c2tV st p := by
      unfold orArr; rw [conf_view]; rfl
    rw [e, Nat.testBit_or, Bool.or_eq_true]
    constructor
    · rintro ((h | h) | ⟨q, hq, h⟩)
      · exact Or.inl h
      · exact Or.inr ⟨p, List.mem_cons_self, h⟩
      · exact Or.inr ⟨q, List.mem_cons_of_mem _ hq, h⟩
    · rintro (h | ⟨q, hq, h⟩)
      · exact Or.inl (Or.inl h)
      · rcases List.mem_cons.mp hq with rfl | hq
        · exact Or.inl (Or.inr h)
        · exact Or.inr ⟨q, hq, h⟩

theorem natU7_zeroU : ∀ n, n ≤ 512 → natU7 zeroU n = 0
  | 0, _ => rfl
  | n + 1, h => by
    rw [natU7, natU7_zeroU n (by omega)]
    have : zeroU.get! n = 0 := by
      show (Array.replicate 512 (0 : UInt8))[n]! = 0
      rw [Array.getElem!_eq_getD, Array.getD, dif_pos (by simp; omega)]; simp
    rw [this]; simp

theorem natU_zeroU : natU zeroU = 0 := natU7_zeroU 512 le_rfl

theorem packU_zero (O : LabelOrder) : packU O 0 = 0 := by
  unfold packU
  apply Finset.sum_eq_zero; intro X _
  unfold hits; simp

/-- the counters of a label list are the packed hits of the prefix -/
theorem sumU_packU (st : Statics) (hH : ∀ p, p < 511 → HOK O p (hV st p)) (ps : List ℕ) :
    ∀ (S : Array UInt64) (U U' : ByteArray), ps.Nodup →
      (∀ p ∈ ps, p < 511 ∧ (natL S 0 8).testBit p = false) → natU U = packU O (natL S 0 8) →
      sumU st U ps = some U' → natU U' = packU O (natL (setBits S ps) 0 8) := by
  induction ps with
  | nil =>
    intro S U U' _ _ hU h
    have hUU : U = U' := by simpa [sumU] using h
    subst hUU; exact hU
  | cons p ps ih =>
    intro S U U' hnd hps hU h
    have hsu : sumU st U (p :: ps) = if addUOK U (st.h.getD p ByteArray.empty) = true then
        sumU st (addU U (st.h.getD p ByteArray.empty)) ps else none := rfl
    rw [hsu] at h
    split at h
    · rename_i hok
      have hsb : setBits S (p :: ps) = setBits (setBit8 S p) ps := rfl
      rw [hsb]
      obtain ⟨hp511, hpS⟩ := hps p List.mem_cons_self
      have hS' : natL (setBit8 S p) 0 8 = natL S 0 8 ||| 2 ^ p := setBit8_view' S p (by omega)
      refine ih (setBit8 S p) _ U' (List.nodup_cons.mp hnd).2 ?_ ?_ h
      · intro q hq
        obtain ⟨hq511, hqS⟩ := hps q (List.mem_cons_of_mem _ hq)
        have hqp : q ≠ p := fun e => (List.nodup_cons.mp hnd).1 (e ▸ hq)
        refine ⟨hq511, ?_⟩
        rw [hS', Nat.testBit_or, hqS, Nat.testBit_two_pow, Bool.false_or, decide_eq_false (Ne.symm hqp)]
      · have hhv : natU (st.h.getD p ByteArray.empty) = hV st p := rfl
        rw [addU_view _ _ hok, hS', L5O.packU_or _ _ _ hpS hp511 (hH p hp511), hU, hhv]
    · exact absurd h (by simp)

/-! ## The dead mask -/

theorem rootD_bit (pre : Array ℕ) (Dh N : Array UInt64) (l : ℕ) (hl : l < 512) :
    (natL ((Array.range 8).map fun k => Dh.getD k 0 ||| orN (fun i => N.getD (8 * pre.getD i 0 + k) 0) pre.size) 0 8).testBit l
      = true ↔ (Dh.getD (l / 64) 0).toNat.testBit (l % 64) = true ∨
        ∃ i < pre.size, (N.getD (8 * pre.getD i 0 + l / 64) 0).toNat.testBit (l % 64) = true := by
  rw [natL_range_map, natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_or, Bool.or_eq_true,
    orN_testBit]

/-- a bit of a slot of a 4096-limb table -/
theorem slot_bit (N : Array UInt64) (q l : ℕ) (hq : q < 511) (hl : l < 512) :
    (N.getD (8 * q + l / 64) 0).toNat.testBit (l % 64) = (natL N 0 4096 >>> (512 * q)).testBit l := by
  rw [Nat.testBit_shiftRight, natL_testBit, decide_eq_true (show 512 * q + l < 64 * 4096 by omega), Bool.true_and,
    getElem!_eq_getD', Nat.zero_add]
  have h1 : (512 * q + l) / 64 = 8 * q + l / 64 := by omega
  have h2 : (512 * q + l) % 64 = l % 64 := by omega
  rw [h1, h2]

theorem c2selfOK_spec (st : Statics) (h : c2selfOK st = true) (l : ℕ) (hl : l < 511) (w : ℕ) (hw : w < 512) :
    (c2tV st l >>> (512 * l)).testBit w = false := by
  unfold c2selfOK at h
  have h1 := (allN_iff _ _).mp ((allN_iff _ _).mp h l hl) (w / 64) (by omega)
  simp only [beq_iff_eq] at h1
  unfold c2tV
  rw [← slot_bit _ l w hl hw, h1]; simp

/-! ## Rows -/

theorem card_two_le' (s : Finset ℕ) (a b : ℕ) (ha : a ∈ s) (hb : b ∈ s) (hab : a ≠ b) : 2 ≤ s.card := by
  have : ({a, b} : Finset ℕ) ⊆ s := by intro x hx; simp at hx; rcases hx with rfl | rfl <;> assumption
  have := card_le_card this; rw [card_pair hab] at this; exact this

theorem card_three_le' (s : Finset ℕ) (a b c : ℕ) (ha : a ∈ s) (hb : b ∈ s) (hc : c ∈ s) (hab : a ≠ b) (hac : a ≠ c)
    (hbc : b ≠ c) : 3 ≤ s.card := by
  have : ({a, b, c} : Finset ℕ) ⊆ s := by intro x hx; simp at hx; rcases hx with rfl | rfl | rfl <;> assumption
  have := card_le_card this
  rw [card_insert_of_notMem (by simp [hab, hac]), card_pair hbc] at this; exact this

/-! ## The root frame -/

theorem toList_getElem_getD (pre : Array ℕ) (i : ℕ) (hi : i < pre.toList.length) :
    pre.toList[i] = pre.getD i 0 := by
  rw [Array.getElem_toList, getD_lt _ _ _ (by simpa using hi)]

theorem toList_nodup (pre : Array ℕ) (hinc : ∀ i j, i < j → j < pre.size → pre.getD i 0 < pre.getD j 0) :
    pre.toList.Nodup := by
  have hp : pre.toList.Pairwise (· < ·) := by
    rw [List.pairwise_iff_getElem]
    intro i j hi hj hij
    rw [toList_getElem_getD pre i hi, toList_getElem_getD pre j hj]
    exact hinc i j hij (by simpa using hj)
  exact hp.imp (fun h => Nat.ne_of_lt h)

/-- a bit of the header's dead mask outside the prefix lies in a witness row -/
theorem witCover_bit (Dh S : Array UInt64) (f : ℕ → UInt64) (n k j : ℕ) (hj : j < 64)
    (h : (Dh.getD k 0 &&& ~~~(S.getD k 0) &&& ~~~(orN f n)) = 0) (hD : (Dh.getD k 0).toNat.testBit j = true)
    (hS : (S.getD k 0).toNat.testBit j = false) : ∃ i < n, (f i).toNat.testBit j = true := by
  have hb := congrArg (fun x : UInt64 => x.toNat.testBit j) h
  simp only [] at hb
  rw [tb_and, tb_and, tb_not, tb_not, hD, hS, decide_eq_true hj] at hb
  apply (orN_testBit f n j).mp
  cases h' : (orN f n).toNat.testBit j
  · rw [h'] at hb; simp at hb
  · rfl

/-- a decomposition below a prefix has no label of a row full at the prefix outside it -/
theorem full_row_dead (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab) (A : R3RT.Spec.Dec22) (hΩ : Ω A)
    (S last w l : ℕ) (hS511 : S < 2 ^ 511) (hb : ∀ l, S.testBit l = true → l ≤ last) (hB : Below O A S last)
    (hfull : L5.pcnt 512 (rowT tab w &&& S) = capOf tab w) (hrow : (rowT tab w).testBit l = true)
    (hSl : S.testBit l = false) : ¬ Has O A l := by
  intro hAl
  have hR : RowOK O Ω (rowT tab w % 2 ^ 511) (capOf tab w) := by
    rw [Nat.mod_eq_of_lt (rowT_lt tab hW w)]; exact rowOK_tab tab hT hW w
  have hrc := L5O.row_count A hΩ S last (rowT tab w) (capOf tab w) hS511 hb hB hR {l}
    (by intro l' hl'; rw [mem_singleton] at hl'; rw [hl']; exact ⟨hAl, hrow, hSl⟩)
  rw [card_singleton] at hrc
  omega

/-- **the frame of an item root's parent is valid** -/
theorem rootFrameN_ok (st : Statics) (tab : Tab) (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab)
    (hc1 : Conf1OK O Ω (natL st.conf1 0 4096)) (hc2 : ∀ p, p < 511 → C2OK O Ω p (c2tV st p))
    (hH : ∀ p, p < 511 → HOK O p (hV st p))
    (pre : Array ℕ) (Dh : Array UInt64) (wit : Array ℕ) (fr : Frame) (h : rootFrameN st tab pre Dh wit = some fr) :
    FrameOK O Ω (natL fr.S 0 8) (natL fr.D 0 8) (natL fr.N 0 4096) (natU fr.U) fr.d ∧
      natL fr.S 0 8 = natL (setBits #[0, 0, 0, 0, 0, 0, 0, 0] pre.toList) 0 8 ∧ fr.d = pre.size := by
  unfold rootFrameN at h
  simp only [] at h
  split at h
  · exact absurd h (by simp)
  rename_i hchk
  simp only [Bool.not_eq_true', Bool.not_eq_false, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hchk
  obtain ⟨⟨⟨hpos, hinc⟩, _⟩, hself⟩ := hchk
  split at h
  · exact absurd h (by simp)
  rename_i U hU
  split at h
  swap
  · exact absurd h (by simp)
  rename_i hw
  simp only [Bool.and_eq_true] at hw
  obtain ⟨hfull, hcov⟩ := hw
  simp only [Option.some.injEq] at h
  subst h
  obtain ⟨h511, hinc'⟩ := incrOK_spec pre hinc
  generalize hSarr : setBits #[0, 0, 0, 0, 0, 0, 0, 0] pre.toList = Sarr at hfull hcov
  generalize hNarr : orTabs st st.conf1 pre.toList = Narr
  have hfacts := prefix_facts pre hpos h511 hinc'
  have hbit := prefix_bit pre h511
  rw [hSarr] at hfacts hbit
  generalize hSdef : natL Sarr 0 8 = S at hfacts hbit
  generalize hlastdef : pre.getD (pre.size - 1) 0 = last at hfacts
  obtain ⟨hS0, hS511, _, hlastOf, hcard, hbits_le⟩ := hfacts
  have hnd := toList_nodup pre hinc'
  have hmem : ∀ p ∈ pre.toList, p < 511 ∧ S.testBit p = true := by
    intro p hp
    obtain ⟨i, hi, rfl⟩ := (mem_toList_getD pre p).mp hp
    exact ⟨h511 i hi, (hbit _).mpr ⟨i, hi, rfl⟩⟩
  have hlast511 : last < 511 := by rw [← hlastdef]; exact h511 _ (by omega)
  -- the counters
  have hUv : natU U = packU O S := by
    have := sumU_packU st hH pre.toList #[0, 0, 0, 0, 0, 0, 0, 0] zeroU U hnd ?_ ?_ hU
    · rw [hSarr, hSdef] at this; exact this
    · intro p hp; refine ⟨(hmem p hp).1, ?_⟩; rw [natL_zero8, Nat.zero_testBit]
    · rw [natU_zeroU, natL_zero8, packU_zero]
  refine ⟨⟨hS0, hS511, hcard, hUv, fun A hΩ hB => ?_⟩, rfl, rfl⟩
  rw [hlastOf] at hB
  have hpreHas : ∀ p, S.testBit p = true → Has O A p := fun p hp =>
    (hB p (by have := hbits_le p hp; omega) (hbits_le p hp)).mpr hp
  have hSabove : ∀ l, last < l → S.testBit l = false := by
    intro l hl; cases h' : S.testBit l
    · rfl
    · have := hbits_le l h'; omega
  -- conflicts in the root conflict table
  have hconf : ∀ v w, v < 511 → w < 511 → S.testBit w = false → v ≠ w →
      (natL Narr 0 4096 >>> (512 * v)).testBit w = true → Has O A v → ¬ Has O A w := by
    intro v w hv hw hSw hvw hb hAv hAw
    rw [Nat.testBit_shiftRight, ← hNarr] at hb
    rcases (orTabs_view st pre.toList st.conf1 _).mp hb with h1 | ⟨p, hp, h2⟩
    · obtain ⟨m, hm, hmv, hmw⟩ := hc1 v w hv hw (Ne.symm hvw) (by rw [Nat.testBit_shiftRight]; exact h1)
      have hc := card_two_le' (inMask O A m) v w
        (by simp only [inMask, mem_filter, mem_range]; exact ⟨hv, hmv, hAv⟩)
        (by simp only [inMask, mem_filter, mem_range]; exact ⟨hw, hmw, hAw⟩) hvw
      have := hm A hΩ; omega
    · obtain ⟨hp511, hSp⟩ := hmem p hp
      have hpw : w ≠ p := by intro e; rw [e, hSp] at hSw; exact absurd hSw (by decide)
      by_cases hpv : v = p
      · subst hpv
        have := c2selfOK_spec st hself v hp511 w (by omega)
        rw [Nat.testBit_shiftRight, h2] at this; exact absurd this (by decide)
      · obtain ⟨m, hm, hmp, hmv, hmw⟩ := hc2 p hp511 v w hv hw hpw (Ne.symm hvw) (by rw [Nat.testBit_shiftRight]; exact h2)
        have hc := card_three_le' (inMask O A m) p v w
          (by simp only [inMask, mem_filter, mem_range]; exact ⟨hp511, hmp, hpreHas p hSp⟩)
          (by simp only [inMask, mem_filter, mem_range]; exact ⟨hv, hmv, hAv⟩)
          (by simp only [inMask, mem_filter, mem_range]; exact ⟨hw, hmw, hAw⟩)
          (Ne.symm hpv) (Ne.symm hpw) hvw
        have := hm A hΩ; omega
  refine ⟨?_, fun v w hv hw _ hSw hvw hb hAv => hconf v w hv hw hSw hvw hb hAv⟩
  -- the dead labels
  intro l hl hl511 hDl
  rw [hlastOf] at hl
  rcases (rootD_bit pre Dh Narr l (by omega)).mp hDl with h1 | ⟨i, hi, h2⟩
  · -- a label of the header's dead mask: in a witness row full at the prefix
    have hk := (allN_iff _ _).mp hcov (l / 64) (by omega)
    simp only [beq_iff_eq] at hk
    have hSk : (Sarr.getD (l / 64) 0).toNat.testBit (l % 64) = false := by
      have := natL_testBit Sarr 8 0 l
      rw [decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add, hSdef] at this
      rw [← this]; exact hSabove l hl
    obtain ⟨j, hj1, hj2⟩ := witCover_bit Dh Sarr _ wit.size (l / 64) (l % 64) (Nat.mod_lt _ (by norm_num)) hk h1 hSk
    have hrow : (rowT tab (wit.getD j 0)).testBit l = true := by
      rw [rowT_testBit, decide_eq_true (show l < 512 by omega), Bool.true_and]; exact hj2
    have hf := (allN_iff _ _).mp hfull j hj1
    simp only [beq_iff_eq] at hf
    rw [popRowS_eq, hSdef] at hf
    exact full_row_dead tab hT hW A hΩ S last (wit.getD j 0) l hS511 hbits_le hB hf hrow (hSabove l hl)
  · -- a conflict of a prefix label
    have hq511 := h511 i hi
    have hql : pre.getD i 0 ≤ last := hbits_le _ ((hbit _).mpr ⟨i, hi, rfl⟩)
    rw [slot_bit Narr _ l hq511 (by omega)] at h2
    exact hconf _ l hq511 hl511 (hSabove l hl) (by omega) h2 (hpreHas _ ((hbit _).mpr ⟨i, hi, rfl⟩))

end NNP
