module
public import R22Port.U_d41d8cd98f00
public import KD.Kinds
/-! # KD.Cuts: node-level cuts 1 (hyperplane), 2 / 10 (overfull kept row), 4 / 9 (count, childless), 7 (rank-1 window),
8 (type), with soundness

A cut node has the frame `(S, D, N, U, d)` that `node5` would give it (`FrameOK`; `S` with top bit `last`; for kinds 4 / 7 / 9
its `D` must hold the node's own full rows, REQUESTS.md 5).  An accepted cut record proves that no decomposition lies below the
node (`¬ Below A S last`), i.e. the parent's child `last` is dead.
* 1 `X`: `hits S X + min(need, labels above last hitting X) < 3 rk X` (`deficit_fact`).
* 4, 9: at most `need - 1` labels outside `D ∪ W` above `last`.
* 7: the rank-1 labels of `S` and at most `need` available rank-1 labels above `last` are fewer than 14 (case II).
* 8: every type reachable with `need` more labels of rank at least that of `last` fails `typeOK` (`TypeFacts`).
* 2, 10: a valid row `(m, cap)` (`RowOK`) holds more than `cap` labels of `S`. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

/-! ## Counting below a node -/

theorem below_le {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below A S last) (l : ℕ) (hl : l < 511) (hll : l ≤ last) :
    A.Has l ↔ S.testBit l = true := h l hl hll

theorem below_split {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below A S last) (q : ℕ → Prop) [DecidablePred q] :
    ((Finset.range 511).filter (fun l => A.Has l ∧ q l)).card =
      ((Finset.range 511).filter (fun l => S.testBit l = true ∧ q l)).card +
      ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ q l)).card := by
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

theorem below_above_card {A : Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below A S last) (d : ℕ)
    (hd : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) :
    ((Finset.range 511).filter (fun l => last < l ∧ A.Has l)).card = 22 - d := by
  have h1 := below_split hS h (fun _ => True)
  simp only [and_true] at h1
  rw [has_card A, hd] at h1
  omega

theorem remB_ne_card {x k : ℕ} (hx : x < 2 ^ 511) (h : K2.remB x k ≠ 0) : k + 1 ≤ (K2.bitsB 511 x).card := by
  have h1 := K2.card_bits_remB 511 x k hx
  have h2 := K2.card_bits_pos 511 _ h (K2.remB_lt 511 x k hx)
  omega

/-! ## The checks -/

/-- cut 1 with hyperplane `X` -/
def ffOK (U d last X : ℕ) : Bool :=
  Nat.blt 0 X && Nat.blt X 512 && Nat.blt (fld7 U X) (Nat.mul 3 (rkOf X)) &&
  (Nat.blt (Nat.add (fld7 U X) (Nat.sub 22 d)) (Nat.mul 3 (rkOf X)) ||
    Nat.beq (K2.remB (Nat.shiftRight (nperpL X) (Nat.succ last)) (Nat.sub (Nat.sub (Nat.mul 3 (rkOf X)) (fld7 U X)) 1)) 0)

/-- cuts 4 and 9 -/
def cntOK (D W d last : ℕ) : Bool := Nat.beq (K2.remB (Nat.land (avM D W) (abv last)) (Nat.sub 21 d)) 0

/-- cut 7 (case II) -/
def winOK (S D W d last : ℕ) : Bool :=
  Nat.beq (K2.remB (Nat.lor (Nat.land S R1M) (Nat.land (Nat.land R1M (abv last)) (avM D W))) 13) 0 ||
    (Nat.ble (Nat.sub 22 d) 13 && Nat.beq (K2.remB (Nat.land S R1M) (Nat.sub 13 (Nat.sub 22 d))) 0)

/-- cut 8 -/
def tyNodeOK (S d last : ℕ) : Bool :=
  tyAll (popcF 22 (Nat.land S R1M)) (popcF 22 (Nat.land S R2M)) (popcF 22 (Nat.land S R3M)) (Nat.sub 22 d) last

/-- cuts 2 and 10: the row `(m, cap)` holds more than `cap` labels of `S` -/
def overOK (S m cap : ℕ) : Bool := !(Nat.beq (K2.remB (Nat.land S m) cap) 0)

/-- a node cut: `kind`, argument `arg` (cut 1: `X`), row `(m, cap)` for cuts 2 / 10 -/
def cutOK (S D U W d last kind arg m cap : ℕ) : Bool :=
  Nat.beq (Nat.shiftRight S last) 1 && Nat.ble d 22 &&
  cond (Nat.beq kind 1) (ffOK U d last arg)
  (cond (Nat.beq kind 4 || Nat.beq kind 9) (Nat.ble d 21 && cntOK D W d last)
  (cond (Nat.beq kind 7) (Nat.ble d 21 && winOK S D W d last)
  (cond (Nat.beq kind 8) (tyNodeOK S d last)
  (cond (Nat.beq kind 2 || Nat.beq kind 10) (overOK S m cap) false))))

/-! ## Soundness -/

theorem ff_soundU {Ω : Dec22 → Prop} {S D N U d last X : ℕ} (hF : FrameOKU Ω S D N U d) (hS : S >>> last = 1) (hd : d ≤ 22)
    (h : ffOK U d last X = true) : ∀ A : Dec22, Ω A → ¬ Below A S last := by
  intro A _ hA
  obtain ⟨_, _, hcard, hU⟩ := frameOKU_basic hF
  unfold ffOK at h
  simp only [Bool.and_eq_true, Nat.blt_eq, Bool.or_eq_true] at h
  obtain ⟨⟨⟨hX0, hX⟩, hlt⟩, halt⟩ := h
  simp only [Nat.add_eq, Nat.sub_eq, Nat.mul_eq] at hlt halt
  have hdef := deficit_lab A X hX0 hX
  have hsp := below_split hS hA (fun l => par (vecL l &&& X) = true)
  have hfl : fld7 U X = hits S X := by rw [hU]; exact fld7_packU S X d hX hcard (by omega)
  have ht1 : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ par (vecL l &&& X) = true)).card ≤ 22 - d := by
    rw [← below_above_card hS hA d hcard]
    exact Finset.card_le_card (fun l => by simp only [Finset.mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩)
  unfold hits at hfl
  rw [hfl] at hlt halt
  rcases halt with h1 | h1
  · rw [hsp] at hdef; omega
  · replace h1 := beq_true h1
    have ht2 := le_trans (above_le_mask (A := A) (u := last) (fun l => par (vecL l &&& X) = true))
      (card_above_le_shift (nperpL X) last (fun l => par (vecL l &&& X) = true)
        (fun l hl hp => by rw [nperpL_bit X l hX hl]; exact hp))
    have hlt2 : Nat.shiftRight (nperpL X) (Nat.succ last) < 2 ^ 511 :=
      lt_of_le_of_lt (Nat.shiftRight_le (nperpL X) (Nat.succ last)) (nperpL_lt X)
    have ht3 := remB_card_le hlt2 h1
    rw [hsp] at hdef
    omega

theorem cnt_soundU {Ω : Dec22 → Prop} {S D N U W d last : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : cntOK D W d last = true) : ∀ A : Dec22, Ω A → ¬ Below A S last := by
  intro A hΩ hA
  obtain ⟨_, _, hcard, _⟩ := frameOKU_basic hF
  have hlast := shr_one_lastOf hS
  have hbel : Below A S (lastOf S) := by rw [hlast]; exact hA
  unfold cntOK at h
  replace h := beq_true h
  have hc := remB_card_le (land_M511_lt _ _ (abv_lt last)) h
  have hac := below_above_card hS hA d hcard
  have hsub : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l)).card ≤ (K2.bitsB 511 (avM D W &&& abv last)).card := by
    apply card_le_bits; intro l hl
    simp only [Finset.mem_filter, Finset.mem_range] at hl
    obtain ⟨hl5, hll, hAl⟩ := hl
    have hD : D.testBit l = false := by
      cases hDl : D.testBit l
      · rfl
      · exact absurd hAl ((frameOKU_apply hF A hΩ hbel).1 l (by rw [hlast]; exact hll) hl5 hDl)
    have hWl : W.testBit l = false := by
      cases hWl : W.testBit l
      · rfl
      · exact absurd hAl (hW A hΩ hbel l (by rw [hlast]; exact hll) hl5 hWl)
    refine ⟨hl5, ?_⟩
    rw [Nat.testBit_and, testBit_avM, testBit_abv, hD, hWl]; simp [hl5, hll]
  simp only [Nat.sub_eq] at hc; omega

theorem win_soundU {Ω : Dec22 → Prop} {S D N U W d last : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : winOK S D W d last = true) : ∀ A : Dec22, Ω A → CaseII A → ¬ Below A S last := by
  intro A hΩ hII hA
  obtain ⟨_, _, hcard, _⟩ := frameOKU_basic hF
  have hlast := shr_one_lastOf hS
  have hbel : Below A S (lastOf S) := by rw [hlast]; exact hA
  have h14 := caseII_lab A hII
  have hsp := below_split hS hA (fun l => l < 49)
  have hs1 : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ l < 49)).card = (K2.bitsB 511 (S &&& R1M)).card := by
    unfold K2.bitsB; apply card_filter_congr; intro l _
    rw [Nat.testBit_and, testBit_R1M]; simp
  have hS1lt : S &&& R1M < 2 ^ 511 := land_M511_lt _ _ r1m_lt
  have hav : ∀ l, last < l → l < 511 → A.Has l → l < 49 → (R1M &&& abv last &&& avM D W).testBit l = true := by
    intro l hul hl hAl hl49
    have hD : D.testBit l = false := by
      cases hDl : D.testBit l
      · rfl
      · exact absurd hAl ((frameOKU_apply hF A hΩ hbel).1 l (by rw [hlast]; omega) hl hDl)
    have hWl : W.testBit l = false := by
      cases hWl : W.testBit l
      · rfl
      · exact absurd hAl (hW A hΩ hbel l (by rw [hlast]; omega) hl hWl)
    rw [Nat.testBit_and, Nat.testBit_and, testBit_R1M, testBit_abv, testBit_avM, hD, hWl]; simp [hl49, hul, hl]
  unfold winOK at h
  simp only [Bool.or_eq_true, Bool.and_eq_true, Nat.ble_eq] at h
  rcases h with h1 | ⟨hnn, h1⟩ <;> replace h1 := beq_true h1
  · have hlt : (S &&& R1M) ||| (R1M &&& abv last &&& avM D W) < 2 ^ 511 :=
      lt511_of_bits (fun i hi => by
        rw [Nat.testBit_or, Nat.testBit_and, Nat.testBit_and, Nat.testBit_and, testBit_R1M]; simp; omega)
    have hc := remB_card_le hlt h1
    have hU : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ l < 49)).card +
        ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ l < 49)).card ≤
        (K2.bitsB 511 ((S &&& R1M) ||| (R1M &&& abv last &&& avM D W))).card := by
      rw [← Finset.card_union_of_disjoint]
      · apply card_le_bits; intro l hl
        simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_range] at hl
        rcases hl with ⟨hl, h1, h2⟩ | ⟨hl, h1, h2, h3⟩
        · exact ⟨hl, by rw [Nat.testBit_or, Nat.testBit_and, h1, testBit_R1M]; simp [h2]⟩
        · exact ⟨hl, by rw [Nat.testBit_or, hav l h1 hl h2 h3]; simp⟩
      · rw [Finset.disjoint_filter]; rintro l _ ⟨h1, _⟩ ⟨h2, _, _⟩
        rw [shr_one_bit hS l (by omega)] at h1; simp at h1; omega
    rw [hsp] at h14; omega
  · have hc := remB_card_le hS1lt h1
    have ht : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ l < 49)).card ≤ 22 - d := by
      rw [← below_above_card hS hA d hcard]
      exact Finset.card_le_card (fun l => by simp only [Finset.mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩)
    rw [hs1] at hsp; rw [hsp] at h14; simp only [Nat.sub_eq] at hc hnn; omega

theorem tyNode_soundU {Ω : Dec22 → Prop} {S D N U d last : ℕ} (hF : FrameOKU Ω S D N U d) (hT : TypeFacts)
    (hS : S >>> last = 1) (hd : d ≤ 22) (h : tyNodeOK S d last = true) : ∀ A : Dec22, Ω A → ¬ Below A S last := by
  intro A _ hA
  obtain ⟨_, hS511, hcard, _⟩ := frameOKU_basic hF
  have hTA := hT A
  rw [nType_lab, nType_lab, nType_lab] at hTA
  rw [below_split hS hA (fun l => rkL l = 1), below_split hS hA (fun l => rkL l = 2),
    below_split hS hA (fun l => rkL l = 3)] at hTA
  rw [prefix_rank_card hS511 hcard hd R1M 1 (fun l _ => by rw [testBit_R1M, (rkL_cases l).1]; simp),
    prefix_rank_card hS511 hcard hd R2M 2 (fun l _ => by rw [testBit_R2M, (rkL_cases l).2.1]; simp),
    prefix_rank_card hS511 hcard hd R3M 3 (fun l hl => by rw [testBit_R3M, (rkL_cases l).2.2]; simp; omega)] at hTA
  set t1 := ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ rkL l = 1)).card with ht1
  set t2 := ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ rkL l = 2)).card with ht2
  set t3 := ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ rkL l = 3)).card with ht3
  have hsum : t1 + t2 + t3 = 22 - d := by
    have hac := below_above_card hS hA d hcard
    rw [← hac, ht1, ht2, ht3, ← Finset.card_union_of_disjoint, ← Finset.card_union_of_disjoint]
    · apply congrArg Finset.card; ext l
      simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_range]
      have h3 : rkL l = 1 ∨ rkL l = 2 ∨ rkL l = 3 := by unfold rkL; split_ifs <;> simp
      constructor
      · rintro ((⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩) | ⟨hl, h1, h2, _⟩) <;> exact ⟨hl, h1, h2⟩
      · rintro ⟨hl, h1, h2⟩
        rcases h3 with h3 | h3 | h3
        · exact Or.inl (Or.inl ⟨hl, h1, h2, h3⟩)
        · exact Or.inl (Or.inr ⟨hl, h1, h2, h3⟩)
        · exact Or.inr ⟨hl, h1, h2, h3⟩
    · rw [Finset.disjoint_union_left, Finset.disjoint_filter, Finset.disjoint_filter]
      exact ⟨fun l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩ => by omega, fun l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩ => by omega⟩
    · rw [Finset.disjoint_filter]; rintro l _ ⟨_, _, h1⟩ ⟨_, _, h2⟩; omega
  have hy : t1 < Nat.succ (cond (Nat.blt last 49) (22 - d) 0) := by
    by_cases hu49 : last < 49
    · rw [blt_true hu49, cond_true]; omega
    · rw [blt_false hu49, cond_false]
      have : t1 = 0 := by
        rw [ht1, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨h1, _, h3⟩
        rw [(rkL_cases l).1] at h3; omega
      omega
  have hx : t2 < Nat.succ (cond (Nat.blt last 343) (22 - d - t1) 0) := by
    by_cases hu3 : last < 343
    · rw [blt_true hu3, cond_true]; omega
    · rw [blt_false hu3, cond_false]
      have : t2 = 0 := by
        rw [ht2, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨h1, _, h3⟩
        rw [(rkL_cases l).2.1] at h3; omega
      omega
  unfold tyNodeOK tyAll at h
  have h2 := S5.allLT_spec (S5.allLT_spec h t1 hy) t2 hx
  rw [Bool.not_eq_true'] at h2
  have e3 : 22 - d - t1 - t2 = t3 := by omega
  simp only [Nat.sub_eq] at h2
  rw [e3, hTA] at h2
  exact absurd h2 (by decide)

theorem over_soundU {Ω : Dec22 → Prop} {S m cap last : ℕ} (hS511 : S < 2 ^ 511) (hS : S >>> last = 1) (hrow : RowOKU Ω m cap)
    (h : overOK S m cap = true) : ∀ A : Dec22, Ω A → ¬ Below A S last := by
  intro A hΩ hA
  unfold overOK at h
  rw [Bool.not_eq_true'] at h
  have hne : K2.remB (Nat.land S m) cap ≠ 0 := by
    intro h0; rw [h0] at h; exact absurd h (by decide)
  have hlt : Nat.land S m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left hS511
  have hc := remB_ne_card hlt hne
  have hsub : (K2.bitsB 511 (Nat.land S m)).card ≤ (inMask A m).card := by
    apply Finset.card_le_card; intro l hl
    rw [K2.mem_bitsB] at hl
    obtain ⟨hl5, hb⟩ := hl
    rw [show Nat.land S m = S &&& m from rfl, Nat.testBit_and, Bool.and_eq_true] at hb
    have hll : l ≤ last := by
      by_contra hc'; push Not at hc'
      rw [shr_one_bit hS l (by omega)] at hb; simp at hb; omega
    unfold inMask; simp only [Finset.mem_filter, Finset.mem_range]
    exact ⟨hl5, hb.2, (hA l hl5 hll).2 hb.1⟩
  have := rowOKU_apply hrow A hΩ
  omega

/-! ## The node theorem for cuts -/

/-- **Node cuts.**  An accepted cut record proves the node empty for case (II). -/
theorem cut_soundU {Ω : Dec22 → Prop} {S D N U W d last kind arg m cap : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hT : TypeFacts) (hrow : RowOKU Ω m cap) (h : cutOK S D U W d last kind arg m cap = true) :
    ∀ A : Dec22, Ω A → CaseII A → ¬ Below A S last := by
  intro A hΩ hII
  have hS511 : S < 2 ^ 511 := hF.2.1
  unfold cutOK at h
  rw [Bool.and_eq_true, Bool.and_eq_true] at h
  obtain ⟨⟨hS, hd⟩, h⟩ := h
  replace hS := beq_true hS
  rw [Nat.ble_eq] at hd
  cases h1 : Nat.beq kind 1
  · rw [h1, cond_false] at h
    cases h4 : (Nat.beq kind 4 || Nat.beq kind 9)
    · rw [h4, cond_false] at h
      cases h7 : Nat.beq kind 7
      · rw [h7, cond_false] at h
        cases h8 : Nat.beq kind 8
        · rw [h8, cond_false] at h
          cases h2 : (Nat.beq kind 2 || Nat.beq kind 10)
          · rw [h2, cond_false] at h; exact absurd h (by decide)
          · rw [h2, cond_true] at h; exact over_soundU hS511 hS hrow h A hΩ
        · rw [h8, cond_true] at h; exact tyNode_soundU hF hT hS hd h A hΩ
      · rw [h7, cond_true, Bool.and_eq_true, Nat.ble_eq] at h; exact win_soundU hF hW hS h.1 h.2 A hΩ hII
    · rw [h4, cond_true, Bool.and_eq_true, Nat.ble_eq] at h; exact cnt_soundU hF hW hS h.1 h.2 A hΩ
  · rw [h1, cond_true] at h; exact ff_soundU hF hS hd h A hΩ

/-! ### Revision 5's statements (the trivial universe) -/

theorem ff_sound {S D N U d last X : ℕ} (hF : FrameOK S D N U d) (hS : S >>> last = 1) (hd : d ≤ 22)
    (h : ffOK U d last X = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => ff_soundU (frameOKU_of5 hF) hS hd h A trivial

theorem cnt_sound {S D N U W d last : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : cntOK D W d last = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => cnt_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hS hd h A trivial

theorem win_sound {S D N U W d last : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : winOK S D W d last = true) : ∀ A : Dec22, CaseII A → ¬ Below A S last :=
  fun A => win_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hS hd h A trivial

theorem tyNode_sound {S D N U d last : ℕ} (hF : FrameOK S D N U d) (hT : TypeFacts) (hS : S >>> last = 1)
    (hd : d ≤ 22) (h : tyNodeOK S d last = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => tyNode_soundU (frameOKU_of5 hF) hT hS hd h A trivial

theorem over_sound {S m cap last : ℕ} (hS511 : S < 2 ^ 511) (hS : S >>> last = 1) (hrow : RowOK m cap)
    (h : overOK S m cap = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => over_soundU hS511 hS (rowOKU_of5 hrow) h A trivial

/-- **Node cuts.**  An accepted cut record proves the node empty for case (II). -/
theorem cut_sound {S D N U W d last kind arg m cap : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hT : TypeFacts)
    (hrow : RowOK m cap) (h : cutOK S D U W d last kind arg m cap = true) : ∀ A : Dec22, CaseII A → ¬ Below A S last :=
  fun A => cut_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hT (rowOKU_of5 hrow) h A trivial

end KD

namespace KD
/-- a batch of node-cut records `(S, D, U, W, d, last, kind, arg, m, cap)` (timing) -/
def cutBatch (rs : List (ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ acc => cutOK x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2.1 x.2.2.2.2.2.1 x.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.1
      x.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2 && acc) rs
end KD
