module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import K2.XAgg
public import K2.XStepL
/-! # Budget cuts: a tree path with more than `T` in-branch picks is a leaf (kill2, DESIGN 27.14)

A completion of a child has at most `T` labels in the window (`T = 22 - (d + 1)`, `d` = labels of the node's prefix;
`KD.above_le_tail`).  Every in-branch pick of a path lies in the completion, so a path with more than `T` distinct picks is
infeasible: the peel's demands are lower bounds only and never see this (R3.md 5.14: all 105 peel failures of job 15089 end with
`T + 1` picks that meet every demand).

`XT3` is `XT2` with the leaf `cut`.  The checks thread the mask `P` of the path's picks (window indices, `P ||| 1 <<< v` in an
in-branch) and accept `cut` iff `|P| > T` (`overB P T`: `remB P T ≠ 0`, at most `T` steps on a number below `2 ^ n`).
* `checkXT3` / **`checkXT3_sound`**: as `checkXT2` / `checkXT2_sound`, plus the hypotheses `P ⊆ C` and `|C| ≤ T`.
* `childL4` / **`childL4_sound_label`**: as `childL3` / `childL3_sound_label`, with the budget `T` and `hT : L.card ≤ T`.
* `checkXT3L`, `childL4L` (lean X-steps on the complement, as `checkXT2L`, `childL3L`): **`checkXT3L_imp`**, **`childL4L_imp`**,
  **`childL4L_sound_label`**. -/
@[expose] public section
namespace K2
open MisF Finset

inductive XT3 where
  /-- X-steps, then the final count `|cand ∩ H| < d` -/
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XT3
  /-- X-steps, then a branch on window index `v`; the in-branch adds the matrix `B` (label layout) and picks `v` -/
  | node : List (ℕ × ℕ) → ℕ → ℕ → XT3 → XT3 → XT3
  /-- the path has more than `T` picks -/
  | cut : XT3

/-- more than `T` bits: `remB P T ≠ 0` -/
def overB (P T : ℕ) : Bool := Nat.blt 0 (remB P T)

theorem card_pos_of_ne_zero (n x : ℕ) (hx : x < 2 ^ n) (h0 : x ≠ 0) : 0 < (bitsB n x).card := by
  obtain ⟨i, hi⟩ := Nat.exists_testBit_of_ne_zero h0
  have hin : i < n := by
    by_contra hc; push Not at hc
    have h2 := Nat.ge_two_pow_of_testBit hi
    have : 2 ^ n ≤ 2 ^ i := Nat.pow_le_pow_right (by norm_num) hc
    omega
  exact Finset.card_pos.mpr ⟨i, mem_bitsB.mpr ⟨hin, hi⟩⟩

theorem lt_card_of_overB (n P T : ℕ) (hP : P < 2 ^ n) (h : overB P T = true) : T < (bitsB n P).card := by
  unfold overB at h
  have h0 : remB P T ≠ 0 := by
    intro h0; rw [h0] at h; exact absurd h (by decide)
  have hc := card_bits_remB n P T hP
  have hpos := card_pos_of_ne_zero n _ (remB_lt n P T hP) h0
  omega

/-- one branch with the picks: the in-branch adds `v` to `P` -/
def brk3 (kl kr : ℕ → ℕ → ℕ → Bool) (A A1 v S c P : ℕ) : Bool :=
  kl A1 (andn c (rowA S A v)) (Nat.lor P (Nat.shiftLeft 1 v)) && kr A (andn c (Nat.shiftLeft 1 v)) P

/-- the hybrid tree check with budget cuts: matrix, candidates, picks -/
noncomputable def checkXT3 (REP GRD LOWS MODM S o T : ℕ) (t : XT3) : ℕ → ℕ → ℕ → Bool :=
  XT3.rec (motive := fun _ => ℕ → ℕ → ℕ → Bool)
    (fun sts fin A c _ => fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (Nat.shiftRight fin.1 o)) fin.2)
    (fun sts v B _ _ ihl ihr A c P =>
      brk3 ihl ihr A (Nat.lor A (Nat.shiftRight B (Nat.add (Nat.mul S o) o))) v S (runSo A REP GRD LOWS MODM S o sts c) P)
    (fun _ _ P => overB P T)
    t

def XTValid3 (S o : ℕ) (C : Finset ℕ) : XT3 → Prop
  | .leaf sts fin => (∀ st ∈ sts, demOK C o st) ∧ demOK C o fin
  | .node sts v B l r => (∀ st ∈ sts, demOK C o st) ∧
      (v ∈ C → ∀ w1 ∈ C, ∀ w2 ∈ C, (dig S (B >>> (S * o + o)) w1).testBit w2 = false) ∧
      XTValid3 S o C l ∧ XTValid3 S o C r
  | .cut => True

theorem checkXT3_sound (REP GRD LOWS MODM S n o T : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) :
    ∀ (t : XT3) (A c P : ℕ), c < 2 ^ n → P < 2 ^ n → checkXT3 REP GRD LOWS MODM S o T t A c P = true →
    ∀ C : Finset ℕ, (∀ v ∈ C, v < n ∧ c.testBit v = true) → (∀ v ∈ C, ∀ w ∈ C, (dig S A v).testBit w = false) →
    (∀ v, P.testBit v = true → v ∈ C) → C.card ≤ T →
    XTValid3 S o C t → False := by
  intro t
  induction t with
  | leaf sts fin =>
    intro A c P hc _ h C hC hind _ _ hval
    obtain ⟨hsts, hfin⟩ := hval
    obtain ⟨hc', hC'⟩ := runSo_keep REP GRD LOWS MODM S n o hS hREP hGRD hL hM A C hind sts c hc hC hsts
    change Nat.beq (remB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o)) (Nat.sub fin.2 1)) 0 = true at h
    have h0 := Nat.eq_of_beq_eq_true h
    have hlt : (bitsB n (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o))).card < fin.2 :=
      card_lt_of_remB n _ fin.2 (lt_of_le_of_lt Nat.and_le_left hc') hfin.1 h0
    have hsub : (C.filter (fun v => (fin.1 >>> o).testBit v = true)).card ≤
        (bitsB n (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o))).card := by
      apply Finset.card_le_card; intro w hw
      rw [Finset.mem_filter] at hw
      rw [mem_bitsB]
      refine ⟨(hC w hw.1).1, ?_⟩
      rw [testBit_land, hC' w hw.1, hw.2]; rfl
    have := hfin.2; omega
  | node sts v B l r ihl ihr =>
    intro A c P hc hP h C hC hind hPC hT hval
    obtain ⟨hsts, hB, hvl, hvr⟩ := hval
    obtain ⟨hc', hC'⟩ := runSo_keep REP GRD LOWS MODM S n o hS hREP hGRD hL hM A C hind sts c hc hC hsts
    set c' := runSo A REP GRD LOWS MODM S o sts c with hc'def
    change brk3 _ _ A _ v S c' P = true at h
    unfold brk3 at h
    rw [Bool.and_eq_true] at h
    obtain ⟨hl, hr⟩ := h
    by_cases hvC : v ∈ C
    · have hvn : v < n := (hC v hvC).1
      have hP' : Nat.lor P (Nat.shiftLeft 1 v) < 2 ^ n := by
        change P ||| (1 <<< v) < 2 ^ n
        apply Nat.or_lt_two_pow hP
        rw [Nat.one_shiftLeft]; exact Nat.pow_lt_pow_right (by norm_num) hvn
      refine ihl _ _ _ (andn_lt _ hc') hP' hl C ?_ ?_ ?_ hT hvl
      · intro w hw
        refine ⟨(hC w hw).1, ?_⟩
        rw [testBit_andn, hC' w hw, rowA_eq, hind v hvC w hw]; rfl
      · intro w1 hw1 w2 hw2
        change (dig S (A ||| (B >>> (S * o + o))) w1).testBit w2 = false
        rw [dig_lor, Nat.testBit_or, hind w1 hw1 w2 hw2, hB hvC w1 hw1 w2 hw2]; rfl
      · intro w hw
        rw [testBit_lor, testBit_one_shiftLeft, Bool.or_eq_true] at hw
        rcases hw with hw | hw
        · exact hPC w hw
        · rw [decide_eq_true_eq] at hw; rw [hw]; exact hvC
    · refine ihr _ _ _ (andn_lt _ hc') hP hr C ?_ hind hPC hT hvr
      intro w hw
      refine ⟨(hC w hw).1, ?_⟩
      rw [testBit_andn, hC' w hw, testBit_one_shiftLeft]
      have : w ≠ v := fun e => hvC (e ▸ hw)
      simp [this]
  | cut =>
    intro A c P _ hP h C _ _ hPC hT _
    change overB P T = true at h
    have hlt := lt_card_of_overB n P T hP h
    have hsub : bitsB n P ⊆ C := by
      intro w hw; rw [mem_bitsB] at hw; exact hPC w hw.2
    have := Finset.card_le_card hsub
    omega

/-! ## Label coordinates and the child check -/

def XTValidL3 (S o : ℕ) (L : Finset ℕ) : XT3 → Prop
  | .leaf sts fin => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (1 ≤ fin.2 ∧ fin.2 ≤ (L.filter (fun a => fin.1.testBit a = true)).card)
  | .node sts v B l r => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (o + v ∈ L → ∀ a ∈ L, ∀ b ∈ L, (dig S B a).testBit b = false) ∧
      XTValidL3 S o L l ∧ XTValidL3 S o L r
  | .cut => True

theorem xtvalid3_of_label (S o n : ℕ) (L : Finset ℕ) (hL : ∀ a ∈ L, o ≤ a ∧ a < o + n) (hon : o + n ≤ S) :
    ∀ t : XT3, XTValidL3 S o L t → XTValid3 S o (L.image (fun a => a - o)) t := by
  have hLo : ∀ a ∈ L, o ≤ a := fun a ha => (hL a ha).1
  have hmem : ∀ w, w ∈ L.image (fun a => a - o) ↔ o + w ∈ L := by
    intro w; rw [Finset.mem_image]
    constructor
    · rintro ⟨a, ha, rfl⟩; rw [Nat.add_sub_cancel' (hLo a ha)]; exact ha
    · intro hw; exact ⟨o + w, hw, by omega⟩
  have hdem : ∀ st : ℕ × ℕ, (1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) →
      demOK (L.image (fun a => a - o)) o st := by
    intro st h
    refine ⟨h.1, ?_⟩
    have := card_image_sub L o hLo (fun a => st.1.testBit a = true)
    simp only at this
    have e : ((L.image (fun a => a - o)).filter (fun v => (st.1 >>> o).testBit v = true)) =
        ((L.image (fun a => a - o)).filter (fun w => st.1.testBit (o + w) = true)) := by
      congr 1; ext w; rw [Nat.testBit_shiftRight]
    rw [e, this]; exact h.2
  intro t
  induction t with
  | leaf sts fin =>
    rintro ⟨hs, hf⟩
    exact ⟨fun st hst => hdem st (hs st hst), hdem fin hf⟩
  | node sts v B l r ihl ihr =>
    rintro ⟨hs, hb, hl, hrr⟩
    refine ⟨fun st hst => hdem st (hs st hst), ?_, ihl hl, ihr hrr⟩
    intro hv w1 hw1 w2 hw2
    have hw2n : o + w2 < S := by have := (hL _ ((hmem w2).mp hw2)).2; omega
    rw [dig_shift_testBit S B o w1 w2 hw2n]
    exact hb ((hmem v).mp hv) _ ((hmem w1).mp hw1) _ ((hmem w2).mp hw2)
  | cut => intro _; trivial

/-- the hybrid child check with budget `T`: as `childL3`, the tree is an `XT3`, the picks start empty -/
noncomputable def childL4 (REPm REP GRD LOWS MODM DIAG S TOP o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT3 REP GRD LOWS MODM S o T t
    (clrD (addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o)) (Nat.shiftRight C2u (Nat.add (Nat.mul S o) o)))
      REPm REP (shiftL o crows)) DIAG)
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1)) 0

/-- **Soundness of the hybrid child check with budget cuts**, label coordinates.  The completion `L` has at most `T` labels. -/
theorem childL4_sound_label (REPm REP GRD LOWS MODM DIAG S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hon : o + n ≤ S)
    (h : childL4 REPm REP GRD LOWS MODM DIAG S TOP o T Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hT : L.card ≤ T)
    (hval : XTValidL3 S o L t) : False := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT3 REP GRD LOWS MODM S o T t _ _ 0) = true at h
  rw [Bool.and_eq_true] at h
  obtain ⟨hlt, hchk⟩ := h
  have hltm := allLt_mem _ crows hlt
  set C := L.image (fun a => a - o) with hCdef
  have hmemC : ∀ w, w ∈ C ↔ o + w ∈ L := by
    intro w; rw [hCdef, Finset.mem_image]
    constructor
    · rintro ⟨a, ha, rfl⟩; rw [Nat.add_sub_cancel' (hLo a ha).1]; exact ha
    · intro hw; exact ⟨o + w, hw, by omega⟩
  have hCn : ∀ w ∈ C, w < n := by
    intro w hw; have := (hLo _ ((hmemC w).mp hw)).2.1; omega
  set crows' := shiftL o crows with hcr
  have hmap : ∀ m' ∈ crows', ∃ m ∈ crows, m' = m >>> o := fun m' hm' => mem_shiftL o crows m' hm'
  refine checkXT3_sound REP GRD LOWS MODM S n o T hS hREP hGRD hL hM t _ _ 0 ?_ (Nat.two_pow_pos n) hchk C ?_ ?_ ?_
    (le_trans Finset.card_image_le hT)
    (xtvalid3_of_label S o n L (fun a ha => ⟨(hLo a ha).1, (hLo a ha).2.1⟩) hon t hval)
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · intro w hw
    refine ⟨hCn w hw, ?_⟩
    change (Nat.land (Fu >>> o) (TOP - 1)).testBit w = true
    rw [testBit_land, Nat.testBit_shiftRight, (hLo _ ((hmemC w).mp hw)).2.2, hTOP, Nat.testBit_two_pow_sub_one]
    simp [hCn w hw]
  · intro w1 hw1 w2 hw2
    have h1n := hCn w1 hw1
    have h2n := hCn w2 hw2
    rw [testBit_clrD S n _ DIAG (by omega) hDIAG w1 w2 h1n (by omega)]
    by_cases he : w1 = w2
    · simp [he]
    · simp only [he, decide_false, Bool.not_false, Bool.and_true]
      cases hX : (dig S (addCl (Nat.lor (Anode >>> (S * o + o)) (C2u >>> (S * o + o))) REPm REP crows') w1).testBit w2 with
      | false => rfl
      | true =>
        exfalso
        rw [testBit_dig S _ w1 w2 (by omega)] at hX
        rcases testBit_addCl_imp _ REPm REP _ crows' hX with hA0 | ⟨m', hm', hO⟩
        · rw [testBit_lor, Bool.or_eq_true] at hA0
          have ha := (hmemC w1).mp hw1
          have hb := (hmemC w2).mp hw2
          have hne : o + w1 ≠ o + w2 := by omega
          rcases hA0 with hA0 | hA0
          · rw [← testBit_dig S _ w1 w2 (by omega), dig_shift_testBit S _ o w1 w2 (by omega), hA _ ha _ hb hne] at hA0
            exact absurd hA0 (by decide)
          · rw [← testBit_dig S _ w1 w2 (by omega), dig_shift_testBit S _ o w1 w2 (by omega), hC2 _ ha _ hb hne] at hA0
            exact absurd hA0 (by decide)
        · obtain ⟨m, hm, rfl⟩ := hmap m' hm'
          have hmlt : m >>> o < 2 ^ n := by
            apply Nat.lt_pow_two_of_testBit
            intro j hj
            rw [Nat.testBit_shiftRight]
            apply testBit_false_of_lt
            have := hltm m hm
            change m < TOP <<< o at this
            rw [hTOP, Nat.shiftLeft_eq, ← pow_add] at this
            exact lt_of_lt_of_le this (Nat.pow_le_pow_right (by norm_num) (by omega))
          rw [testBit_outer S n _ REPm REP (by omega) hmlt hREPm hREP w1 w2 h1n (by omega),
            Nat.testBit_shiftRight, Nat.testBit_shiftRight] at hO
          rw [Bool.and_eq_true] at hO
          have hsub : ({o + w1, o + w2} : Finset ℕ) ⊆ L.filter (fun a => m.testBit a = true) := by
            intro x hx
            simp only [Finset.mem_insert, Finset.mem_singleton] at hx
            rw [Finset.mem_filter]
            rcases hx with rfl | rfl
            · exact ⟨(hmemC w1).mp hw1, hO.1⟩
            · exact ⟨(hmemC w2).mp hw2, hO.2⟩
          have h2 : ({o + w1, o + w2} : Finset ℕ).card = 2 := Finset.card_pair (by omega)
          have := Finset.card_le_card hsub
          have := hrows m hm
          omega
  · intro w hw; rw [Nat.zero_testBit] at hw; exact absurd hw (by decide)

/-! ## Lean X-steps on the complement -/

/-- the branch on the complement with the picks -/
def brk3L (kl kr : ℕ → ℕ → ℕ → Bool) (NA NA1 v S TOP c P : ℕ) : Bool :=
  Nat.blt (Nat.shiftLeft 1 v) TOP &&
    (kl NA1 (Nat.land c (rowA S NA v)) (Nat.lor P (Nat.shiftLeft 1 v)) && kr NA (andn c (Nat.shiftLeft 1 v)) P)

noncomputable def checkXT3L (REP GRD LOWS MODM S TOP o T : ℕ) (t : XT3) : ℕ → ℕ → ℕ → Bool :=
  XT3.rec (motive := fun _ => ℕ → ℕ → ℕ → Bool)
    (fun sts fin NA c _ => fewerB (Nat.land (runSoL NA REP GRD LOWS MODM o sts c) (Nat.shiftRight fin.1 o)) fin.2)
    (fun sts v B _ _ ihl ihr NA c P =>
      brk3L ihl ihr NA (andn NA (Nat.shiftRight B (Nat.add (Nat.mul S o) o))) v S TOP
        (runSoL NA REP GRD LOWS MODM o sts c) P)
    (fun _ _ P => overB P T)
    t

/-- **The tree check on the complement implies the tree check** (budget cuts). -/
theorem checkXT3L_imp (REP GRD LOWS MODM ALL S TOP n o T : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n) :
    ∀ (t : XT3) (NA A c P : ℕ), c < 2 ^ n → NA &&& ALL = ALL ^^^ (A &&& ALL) →
      checkXT3L REP GRD LOWS MODM S TOP o T t NA c P = true → checkXT3 REP GRD LOWS MODM S o T t A c P = true := by
  intro t
  induction t with
  | leaf sts fin =>
    intro NA A c P hc hNA h
    change fewerB (Nat.land (runSoL NA REP GRD LOWS MODM o sts c) (fin.1 >>> o)) fin.2 = true at h
    change fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o)) fin.2 = true
    rwa [← runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc]
  | node sts v B l r ihl ihr =>
    intro NA A c P hc hNA h
    have hre := runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc
    set c' := runSo A REP GRD LOWS MODM S o sts c with hc'def
    have hc' : c' < 2 ^ n := runSo_lt A REP GRD LOWS MODM S o n sts c hc
    change brk3L _ _ NA _ v S TOP (runSoL NA REP GRD LOWS MODM o sts c) P = true at h
    rw [hre] at h
    change brk3 _ _ A _ v S c' P = true
    unfold brk3L at h; unfold brk3
    rw [Bool.and_eq_true, Bool.and_eq_true] at h
    obtain ⟨hv, hl, hr⟩ := h
    have hvn : v < n := by
      have h2 : (1 <<< v) < 2 ^ n := by
        have := hv; rw [Nat.blt_eq] at this; rw [← hTOP]; exact this
      rw [Nat.one_shiftLeft] at h2
      by_contra hcon; push Not at hcon
      have := Nat.pow_le_pow_right (show 2 > 0 by norm_num) hcon
      omega
    rw [Bool.and_eq_true]
    refine ⟨?_, ?_⟩
    · rw [← land_rowA_compl A NA ALL S n v c' hS hvn hc' hALL hNA]
      exact ihl _ _ _ _ (lt_of_le_of_lt Nat.and_le_left hc') (compl_inbranch A NA ALL _ hNA) hl
    · exact ihr _ _ _ _ (andn_lt _ hc') hNA hr
  | cut => intro _ _ _ _ _ _ h; exact h

/-- the hybrid child check with budget cuts on the complement: `NA = ALL ⊕ A` once per child -/
noncomputable def childL4L (REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT3L REP GRD LOWS MODM S TOP o T t
    (Nat.xor ALL (clrD (addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o))
      (Nat.shiftRight C2u (Nat.add (Nat.mul S o) o))) REPm REP (shiftL o crows)) DIAG))
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1)) 0

theorem childL4L_imp (REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n)
    (h : childL4L REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu crows t = true) :
    childL4 REPm REP GRD LOWS MODM DIAG S TOP o T Anode C2u Fu crows t = true := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT3L REP GRD LOWS MODM S TOP o T t _ _ 0) = true at h
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT3 REP GRD LOWS MODM S o T t _ _ 0) = true
  rw [Bool.and_eq_true] at h ⊢
  refine ⟨h.1, checkXT3L_imp REP GRD LOWS MODM ALL S TOP n o T hS hREP hGRD hL hM hALL hTOP t _ _ _ _ ?_ ?_ h.2⟩
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · exact xor_compl ALL _

/-- **Soundness of the lean hybrid child check with budget cuts**, label coordinates. -/
theorem childL4L_sound_label (REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hon : o + n ≤ S)
    (h : childL4L REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hT : L.card ≤ T)
    (hval : XTValidL3 S o L t) : False :=
  childL4_sound_label REPm REP GRD LOWS MODM DIAG S TOP n o T Anode C2u Fu crows t hS hREP hREPm hGRD hL hM hDIAG hTOP hon
    (childL4L_imp REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu crows t hS hREP hGRD hL hM hALL hTOP h)
    L hLo hA hC2 hrows hT hval

/-! ## A cheaper child setup (same check): one shift of `Anode ||| C2u`; the complement as `(ALL ^^^ M) ||| DIAG` -/

noncomputable def childL4X (REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT3L REP GRD LOWS MODM S TOP o T t
    (Nat.lor (Nat.xor ALL (addCl (Nat.shiftRight (Nat.lor Anode C2u) (Nat.add (Nat.mul S o) o)) REPm REP (shiftL o crows))) DIAG)
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1)) 0

theorem compl_diag (ALL M DIAG : ℕ) : (Nat.lor (Nat.xor ALL M) DIAG) &&& ALL = ALL ^^^ (clrD M DIAG &&& ALL) := by
  apply Nat.eq_of_testBit_eq; intro j
  unfold clrD
  change (((ALL ^^^ M) ||| DIAG) &&& ALL).testBit j = (ALL ^^^ (andn M DIAG &&& ALL)).testBit j
  rw [Nat.testBit_and, Nat.testBit_or, Nat.testBit_xor, Nat.testBit_xor, Nat.testBit_and, testBit_andn]
  cases ALL.testBit j <;> cases M.testBit j <;> cases DIAG.testBit j <;> rfl

theorem lor_shiftRight (a b k : ℕ) : Nat.shiftRight (Nat.lor a b) k = Nat.lor (Nat.shiftRight a k) (Nat.shiftRight b k) := by
  apply Nat.eq_of_testBit_eq; intro j
  change ((a ||| b) >>> k).testBit j = ((a >>> k) ||| (b >>> k)).testBit j
  rw [Nat.testBit_shiftRight, Nat.testBit_or, Nat.testBit_or, Nat.testBit_shiftRight, Nat.testBit_shiftRight]

theorem childL4X_imp (REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n)
    (h : childL4X REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu crows t = true) :
    childL4 REPm REP GRD LOWS MODM DIAG S TOP o T Anode C2u Fu crows t = true := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT3L REP GRD LOWS MODM S TOP o T t _ _ 0) = true at h
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT3 REP GRD LOWS MODM S o T t _ _ 0) = true
  rw [Bool.and_eq_true] at h ⊢
  refine ⟨h.1, checkXT3L_imp REP GRD LOWS MODM ALL S TOP n o T hS hREP hGRD hL hM hALL hTOP t _ _ _ _ ?_ ?_ h.2⟩
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · rw [lor_shiftRight]; exact compl_diag ALL _ DIAG

/-- **Soundness of the cheaper-setup child check**, label coordinates (as `childL4L_sound_label`). -/
theorem childL4X_sound_label (REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hon : o + n ≤ S)
    (h : childL4X REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hT : L.card ≤ T)
    (hval : XTValidL3 S o L t) : False :=
  childL4_sound_label REPm REP GRD LOWS MODM DIAG S TOP n o T Anode C2u Fu crows t hS hREP hREPm hGRD hL hM hDIAG hTOP hon
    (childL4X_imp REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu crows t hS hREP hGRD hL hM hALL hTOP h)
    L hLo hA hC2 hrows hT hval

end K2
