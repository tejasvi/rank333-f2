module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import MisF.Packed
public import K2.XStep
public import K2.XNode
public import K2.XDict
/-! # Per-label clique aggregates: one matrix per label and node, for the child matrix and every in-branch

For a node and a label `x`, `B_x` = the cliques `U ∖ {x}` of the dictionary rows through `x` with residual 2 at the node,
together with the static slice `c2t[x]` without row and column `x`, diagonal cleared (`bxOK`, label layout, 511 slots).
* As a child `u`'s matrix: rows through `u` with residual 2 at the node have residual 1 at the child, so `B_u` holds only
  conflicts of the child's completion.
* As the in-branch matrix of a pick `p`: with `p` in the completion, a row through `p` of residual ≤ 2 holds at most one more
  point, so `B_p` holds no pair of the completion at all (row, column and diagonal of `p` are clear).
So each in-branch costs one shift and one OR (`XT2`, `checkXT2`), and the cliques are built once per node and label.
**`bx_sound`**, **`checkXT2_sound`**, **`childL2_sound_label`**. -/
@[expose] public section
namespace K2
open MisF Finset

/-! ## The aggregate of a label -/

/-- `Bx` is the aggregate of `x`: rows (all below `2^511`, all through `x`) and the static slice `C2x` -/
def bxOK (REPm REP DIAG x C2x Bx : ℕ) (rows : List ℕ) : Bool :=
  rowsOK (2 ^ 511) x rows && Nat.beq (clrD (Nat.lor (addClV 0 REPm REP x rows) (clrV C2x REP 512 x)) DIAG) Bx

/-- **The aggregate holds no pair of `L` at all** when every row meets `L ∖ {x}` at most once and the slice holds only
conflicts of `L` away from `x`. -/
theorem bx_sound (REPm REP DIAG x C2x Bx : ℕ) (rows : List ℕ) (h : bxOK REPm REP DIAG x C2x Bx rows = true)
    (hREP : REP = pk 512 (fun _ => 1) 511) (hREPm : REPm = pk 511 (fun _ => 1) 511) (hDIAG : DIAG = pk 512 (fun i => 2 ^ i) 511)
    (L : Finset ℕ) (hL : ∀ a ∈ L, a < 511)
    (hrows : ∀ m ∈ rows, ((L.erase x).filter (fun a => m.testBit a = true)).card ≤ 1)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ x → b ≠ x → a ≠ b → (dig 512 C2x a).testBit b = false) :
    ∀ a ∈ L, ∀ b ∈ L, (dig 512 Bx a).testBit b = false := by
  unfold bxOK at h
  rw [Bool.and_eq_true] at h
  obtain ⟨hok, heq⟩ := h
  have hokm := rowsOK_mem (2 ^ 511) x rows hok
  have hB : clrD (Nat.lor (addClV 0 REPm REP x rows) (clrV C2x REP 512 x)) DIAG = Bx := Nat.eq_of_beq_eq_true heq
  have hREPm' : REPm = pk (512 - 1) (fun _ => 1) 511 := hREPm
  intro a ha b hb
  have han := hL a ha
  have hbn := hL b hb
  rw [← hB, testBit_clrD 512 511 _ DIAG (by norm_num) hDIAG a b han (by omega)]
  by_cases he : a = b
  · simp [he]
  · simp only [he, decide_false, Bool.not_false, Bool.and_true]
    cases hX : (dig 512 (Nat.lor (addClV 0 REPm REP x rows) (clrV C2x REP 512 x)) a).testBit b with
    | false => rfl
    | true =>
      exfalso
      rw [testBit_dig 512 _ a b (by omega), testBit_lor, Bool.or_eq_true] at hX
      rcases hX with hX | hX
      · rcases testBit_addClV_imp 0 REPm REP x _ rows hX with h0 | ⟨m, hm, hO⟩
        · simp at h0
        · obtain ⟨hmlt, _⟩ := hokm m hm
          have hmlt' : andn m (Nat.shiftLeft 1 x) < 2 ^ 511 := andn_lt _ hmlt
          rw [testBit_outer 512 511 _ REPm REP (by norm_num) hmlt' hREPm' hREP a b han (by omega)] at hO
          rw [testBit_andn, testBit_andn, testBit_one_shiftLeft, testBit_one_shiftLeft] at hO
          simp only [Bool.and_eq_true, Bool.not_eq_true', decide_eq_false_iff_not] at hO
          obtain ⟨⟨hma, hax⟩, hmb, hbx⟩ := hO
          have hsub : ({a, b} : Finset ℕ) ⊆ (L.erase x).filter (fun c => m.testBit c = true) := by
            intro c hc
            simp only [Finset.mem_insert, Finset.mem_singleton] at hc
            rw [Finset.mem_filter, Finset.mem_erase]
            rcases hc with rfl | rfl
            · exact ⟨⟨hax, ha⟩, hma⟩
            · exact ⟨⟨hbx, hb⟩, hmb⟩
          have := Finset.card_le_card hsub
          rw [Finset.card_pair he] at this
          have := hrows m hm
          omega
      · rw [← testBit_dig 512 _ a b (by omega)] at hX
        obtain ⟨hc2, hax, hbx⟩ := testBit_clrV 512 511 C2x REP x (by norm_num) hREP a b han hbn hX
        rw [hC2 a ha b hb hax hbx he] at hc2; exact absurd hc2 (by decide)

/-! ## Trees whose in-branches add a whole aggregate -/

inductive XT2 where
  | leaf : List (ℕ × ℕ) → ℕ × ℕ → XT2
  /-- X-steps, then a branch on window index `v`; the in-branch adds the matrix `B` (label layout) -/
  | node : List (ℕ × ℕ) → ℕ → ℕ → XT2 → XT2 → XT2

noncomputable def checkXT2 (REP GRD LOWS MODM S o : ℕ) (t : XT2) : ℕ → ℕ → Bool :=
  XT2.rec (motive := fun _ => ℕ → ℕ → Bool)
    (fun sts fin A c => fewerB (Nat.land (runSo A REP GRD LOWS MODM S o sts c) (Nat.shiftRight fin.1 o)) fin.2)
    (fun sts v B _ _ ihl ihr A c =>
      brk ihl ihr A (Nat.lor A (Nat.shiftRight B (Nat.add (Nat.mul S o) o))) v S (runSo A REP GRD LOWS MODM S o sts c))
    t

def XTValid2 (S o : ℕ) (C : Finset ℕ) : XT2 → Prop
  | .leaf sts fin => (∀ st ∈ sts, demOK C o st) ∧ demOK C o fin
  | .node sts v B l r => (∀ st ∈ sts, demOK C o st) ∧
      (v ∈ C → ∀ w1 ∈ C, ∀ w2 ∈ C, (dig S (B >>> (S * o + o)) w1).testBit w2 = false) ∧
      XTValid2 S o C l ∧ XTValid2 S o C r

theorem checkXT2_sound (REP GRD LOWS MODM S n o : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) :
    ∀ (t : XT2) (A c : ℕ), c < 2 ^ n → checkXT2 REP GRD LOWS MODM S o t A c = true →
    ∀ C : Finset ℕ, (∀ v ∈ C, v < n ∧ c.testBit v = true) → (∀ v ∈ C, ∀ w ∈ C, (dig S A v).testBit w = false) →
    XTValid2 S o C t → False := by
  intro t
  induction t with
  | leaf sts fin =>
    intro A c hc h C hC hind hval
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
    intro A c hc h C hC hind hval
    obtain ⟨hsts, hB, hvl, hvr⟩ := hval
    obtain ⟨hc', hC'⟩ := runSo_keep REP GRD LOWS MODM S n o hS hREP hGRD hL hM A C hind sts c hc hC hsts
    set c' := runSo A REP GRD LOWS MODM S o sts c with hc'def
    change brk _ _ A _ v S c' = true at h
    unfold brk at h
    rw [Bool.and_eq_true] at h
    obtain ⟨hl, hr⟩ := h
    by_cases hvC : v ∈ C
    · refine ihl _ _ (andn_lt _ hc') hl C ?_ ?_ hvl
      · intro w hw
        refine ⟨(hC w hw).1, ?_⟩
        rw [testBit_andn, hC' w hw, rowA_eq, hind v hvC w hw]; rfl
      · intro w1 hw1 w2 hw2
        change (dig S (A ||| (B >>> (S * o + o))) w1).testBit w2 = false
        rw [dig_lor, Nat.testBit_or, hind w1 hw1 w2 hw2, hB hvC w1 hw1 w2 hw2]; rfl
    · refine ihr _ _ (andn_lt _ hc') hr C ?_ hind hvr
      intro w hw
      refine ⟨(hC w hw).1, ?_⟩
      rw [testBit_andn, hC' w hw, testBit_one_shiftLeft]
      have : w ≠ v := fun e => hvC (e ▸ hw)
      simp [this]

/-! ## The child check with aggregates -/

/-- child matrix = node matrix and the child's aggregate, shifted into the window, diagonal cleared; then the tree -/
noncomputable def childL2 (REP GRD LOWS MODM DIAG S TOP o Anode Bu Fu : ℕ) (t : XT2) : Bool :=
  checkXT2 REP GRD LOWS MODM S o t
    (clrD (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o)) (Nat.shiftRight Bu (Nat.add (Nat.mul S o) o))) DIAG)
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1))

def XTValidL2 (S o : ℕ) (L : Finset ℕ) : XT2 → Prop
  | .leaf sts fin => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (1 ≤ fin.2 ∧ fin.2 ≤ (L.filter (fun a => fin.1.testBit a = true)).card)
  | .node sts v B l r => (∀ st ∈ sts, 1 ≤ st.2 ∧ st.2 ≤ (L.filter (fun a => st.1.testBit a = true)).card) ∧
      (o + v ∈ L → ∀ a ∈ L, ∀ b ∈ L, (dig S B a).testBit b = false) ∧
      XTValidL2 S o L l ∧ XTValidL2 S o L r

theorem xtvalid2_of_label (S o n : ℕ) (L : Finset ℕ) (hL : ∀ a ∈ L, o ≤ a ∧ a < o + n) (hon : o + n ≤ S) :
    ∀ t : XT2, XTValidL2 S o L t → XTValid2 S o (L.image (fun a => a - o)) t := by
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

/-- **Soundness of the child check with aggregates**, label coordinates. -/
theorem childL2_sound_label (REP GRD LOWS MODM DIAG S TOP n o Anode Bu Fu : ℕ) (t : XT2)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hon : o + n ≤ S)
    (h : childL2 REP GRD LOWS MODM DIAG S TOP o Anode Bu Fu t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hB : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Bu a).testBit b = false)
    (hval : XTValidL2 S o L t) : False := by
  set C := L.image (fun a => a - o) with hCdef
  have hmemC : ∀ w, w ∈ C ↔ o + w ∈ L := by
    intro w; rw [hCdef, Finset.mem_image]
    constructor
    · rintro ⟨a, ha, rfl⟩; rw [Nat.add_sub_cancel' (hLo a ha).1]; exact ha
    · intro hw; exact ⟨o + w, hw, by omega⟩
  have hCn : ∀ w ∈ C, w < n := by
    intro w hw; have := (hLo _ ((hmemC w).mp hw)).2.1; omega
  refine checkXT2_sound REP GRD LOWS MODM S n o hS hREP hGRD hL hM t _ _ ?_ h C ?_ ?_
    (xtvalid2_of_label S o n L (fun a ha => ⟨(hLo a ha).1, (hLo a ha).2.1⟩) hon t hval)
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
      have ha := (hmemC w1).mp hw1
      have hb := (hmemC w2).mp hw2
      have hne : o + w1 ≠ o + w2 := by omega
      change (dig S ((Anode >>> (S * o + o)) ||| (Bu >>> (S * o + o))) w1).testBit w2 = false
      rw [dig_lor, Nat.testBit_or, dig_shift_testBit S _ o w1 w2 (by omega), dig_shift_testBit S _ o w1 w2 (by omega),
        hA _ ha _ hb hne, hB _ ha _ hb hne]; rfl


/-! ## Hybrid child check: child rows in the window (as `childL`), aggregates only for in-branches -/

noncomputable def childL3 (REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT2) : Bool :=
  allLt (Nat.shiftLeft TOP o) crows &&
  checkXT2 REP GRD LOWS MODM S o t
    (clrD (addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul S o) o)) (Nat.shiftRight C2u (Nat.add (Nat.mul S o) o)))
      REPm REP (shiftL o crows)) DIAG)
    (Nat.land (Nat.shiftRight Fu o) (Nat.sub TOP 1))

/-- **Soundness of the hybrid child check**, label coordinates. -/
theorem childL3_sound_label (REPm REP GRD LOWS MODM DIAG S TOP n o Anode C2u Fu : ℕ) (crows : List ℕ) (t : XT2)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hREPm : REPm = pk (S - 1) (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hDIAG : DIAG = pk S (fun i => 2 ^ i) n) (hTOP : TOP = 2 ^ n)
    (hon : o + n ≤ S)
    (h : childL3 REPm REP GRD LOWS MODM DIAG S TOP o Anode C2u Fu crows t = true)
    (L : Finset ℕ) (hLo : ∀ a ∈ L, o ≤ a ∧ a < o + n ∧ Fu.testBit a = true)
    (hA : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S Anode a).testBit b = false)
    (hC2 : ∀ a ∈ L, ∀ b ∈ L, a ≠ b → (dig S C2u a).testBit b = false)
    (hrows : ∀ m ∈ crows, (L.filter (fun a => m.testBit a = true)).card ≤ 1)
    (hval : XTValidL2 S o L t) : False := by
  change (allLt (Nat.shiftLeft TOP o) crows && checkXT2 REP GRD LOWS MODM S o t _ _) = true at h
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
  refine checkXT2_sound REP GRD LOWS MODM S n o hS hREP hGRD hL hM t _ _ ?_ hchk C ?_ ?_
    (xtvalid2_of_label S o n L (fun a ha => ⟨(hLo a ha).1, (hLo a ha).2.1⟩) hon t hval)
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

end K2
