module
public import R22Port.U_d41d8cd98f00
public import KD.Masks
public import KD.SemU
/-! # KD.Kinds: checkers for PREFF, DOOM and TYPE child records and the suffix break, with soundness

Context: an OPEN node of the main search with L1 v5's child frame `(S, D, N, U, d)` (`R3RT.Spec.FrameOK`; `S` has its top bit
at `last`).  `W` is a mask of labels that no decomposition below the node takes (the W-blocked labels of Lemma W; `0` when the
certificate run is made without `--wblock`).
* PREFF (prof7 `--preff`, record 0x24 with a functional `X`): with `h` = hits of `S ∪ {u}` on `X`, `nn = 21 - d` points after
  `u` and `cnt` = the labels above `u` with odd pairing against `X`: `h + min(nn, cnt) < 3 rk X` contradicts `deficit_fact`.
* DOOM (`--minr1 14`, record 0x26): case (II) has at least 14 rank-1 first factors; the rank-1 labels of `S ∪ {u}` plus the
  available rank-1 labels above `u` (at most `nn` of them) are fewer.
* TYPE (`--typecut 31`, record 0x25): every first-factor type reachable from `S ∪ {u}` (labels are rank-ordered) is forbidden
  by `typeOK`; `TypeFacts` (the type lemmas; `KD.typeFacts_of` reduces it to four Gram-state facts) says every decomposition
  passes.
* Suffix break: the available labels from `b` on number at most `nn`, so no child `u ≥ b` has `nn` labels after it.
Counts use `K2.remB` (lowest-bit removals) and `popcF`; no popcount table. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

/-! ## Semantics -/

/-- number of first factors of rank `r` -/
def nType (A : Dec22) (r : ℕ) : ℕ := (Finset.univ.filter (fun s : Fin 22 => (toM3 (A.av s)).rank = r)).card

/-- case (II) of the main search: at least 14 rank-1 first factors (`--minr1 14`) -/
def CaseII (A : Dec22) : Prop := 14 ≤ nType A 1

/-- prof7's `typeOK` with `--typecut 31` (bits 1, 2, 4, 8, 16).  With `n1 + n2 + n3 = 22` and `Δ = n2 + 2 n3 - 5` it allows the
types with `Δ ≥ 2` and `(16,6,0)` (`Δ = 1`).  Equal to the C++ function on `[0,40)^3` (`KD.typeOK31_cpp`). -/
def typeOK31 (n1 n2 n3 : ℕ) : Bool :=
  !(Nat.beq (n1 + n2 + n3) 22) || (Nat.ble 7 (n2 + 2 * n3) || (Nat.beq n2 6 && Nat.beq n3 0))

/-- prof7's `typeOK` with `--typecut 95` = 31 + bit 64 (`(17,3,2)` and `(18,1,3)`, `Δ = 2`; `KD.typeOK95_cpp`) -/
def typeOK95 (n1 n2 n3 : ℕ) : Bool :=
  typeOK31 n1 n2 n3 && !(Nat.beq n2 3 && Nat.beq n3 2 && Nat.beq n1 17) && !(Nat.beq n2 1 && Nat.beq n3 3 && Nat.beq n1 18)

/-- **the certificate run's type set**: `--typecut 95` since 2026-10-06 (G3, REQUESTS.md 11a; the fleet's `--typecut` must equal
it).  Fallback to 31: `typeOK := typeOK31` and `KD.typeFacts31_of` (KD/Types.lean).  (The earlier 1535 set is `KD.typeOK1535`.) -/
def typeOK (n1 n2 n3 : ℕ) : Bool := typeOK95 n1 n2 n3

/-- prof7's `typeOK` with `--typecut 1535` (bits 1-256 and 1024), kept for reference -/
def typeOK1535 (n1 n2 n3 : ℕ) : Bool :=
  !(Nat.beq (n1 + n2 + n3) 22) ||
  (Nat.ble 7 (n2 + 2 * n3) && !(Nat.beq n2 3 && Nat.beq n3 2) && !(Nat.beq n2 1 && Nat.beq n3 3) &&
    !(Nat.beq n2 5 && Nat.beq n3 1) && !(Nat.beq n2 2 && Nat.beq n3 3) && !(Nat.beq n2 0 && Nat.beq n3 4))

/-- **the type lemmas** (to be proved by the type-lemma certificates): every decomposition's first-factor type passes `typeOK` -/
def TypeFacts : Prop := ∀ A : Dec22, typeOK (nType A 1) (nType A 2) (nType A 3) = true

/-- `W` holds no label above `last` of any decomposition below the node -/
def BlockOK (S W : ℕ) : Prop :=
  ∀ A : Dec22, Below A S (lastOf S) → ∀ l, lastOf S < l → l < 511 → W.testBit l = true → ¬ A.Has l

theorem blockOK_zero (S : ℕ) : BlockOK S 0 := by intro A _ l _ _ h; simp at h

/-- `BlockOK` over a universe `Ω` -/
def BlockOKU (Ω : Dec22 → Prop) (S W : ℕ) : Prop :=
  ∀ A : Dec22, Ω A → Below A S (lastOf S) → ∀ l, lastOf S < l → l < 511 → W.testBit l = true → ¬ A.Has l

theorem blockOKU_zero (Ω : Dec22 → Prop) (S : ℕ) : BlockOKU Ω S 0 := by intro A _ _ l _ _ h; simp at h

theorem blockOKU_of5 {S W : ℕ} (h : BlockOK S W) : BlockOKU R3RT.SpecO.ΩT S W := fun A _ hB => h A hB

theorem nType_lab (A : Dec22) (r : ℕ) : nType A r = ((Finset.range 511).filter (fun l => A.Has l ∧ rkL l = r)).card := by
  unfold nType
  rw [card_terms A (fun v => (toM3 v).rank = r)]
  apply card_filter_congr; intro l hl; rw [Finset.mem_range] at hl; rw [rkL_fact l hl]

/-! ## The checkers (kernel form) -/

@[inline] def pbit (u X : ℕ) : ℕ := cond (par (Nat.land (vecL u) X)) 1 0

/-- PREFF record `(u, X)` at the node with counters `U` and `d` prefix labels -/
def preffOK (U d u X : ℕ) : Bool :=
  Nat.blt 0 X && Nat.blt X 512 && Nat.blt (Nat.add (fld7 U X) (pbit u X)) (Nat.mul 3 (rkOf X)) &&
  (Nat.blt (Nat.add (Nat.add (fld7 U X) (pbit u X)) (Nat.sub 21 d)) (Nat.mul 3 (rkOf X)) ||
    Nat.beq (K2.remB (Nat.shiftRight (nperpL X) (Nat.succ u))
      (Nat.sub (Nat.sub (Nat.mul 3 (rkOf X)) (Nat.add (fld7 U X) (pbit u X))) 1)) 0)

/-- DOOM record `u` (case (II), at least 14 rank-1 labels) -/
def doomOK (S D W d u : ℕ) : Bool :=
  cond (Nat.blt u 49)
    (Nat.beq (K2.remB (Nat.lor (Nat.land S R1M) (Nat.land (Nat.land R1M (abv u)) (avM D W))) 12) 0 ||
      (Nat.ble (Nat.sub 21 d) 12 && Nat.beq (K2.remB (Nat.land S R1M) (Nat.sub 12 (Nat.sub 21 d))) 0))
    (Nat.beq (K2.remB (Nat.land S R1M) 13) 0)

/-- every type reachable from counts `(c1, c2, c3)` with `nd` more labels of rank at least that of `u` fails `typeOK` -/
def tyAll (c1 c2 c3 nd u : ℕ) : Bool :=
  S5.allLT (Nat.succ (cond (Nat.blt u 49) nd 0)) (fun y =>
    S5.allLT (Nat.succ (cond (Nat.blt u 343) (Nat.sub nd y) 0)) (fun x =>
      !typeOK (c1 + y) (c2 + x) (c3 + (nd - y - x))))

/-- TYPE record `u` -/
def tyOK (S d u : ℕ) : Bool :=
  tyAll (popcF 22 (Nat.land S R1M) + cond (Nat.blt u 49) 1 0)
    (popcF 22 (Nat.land S R2M) + cond (Nat.blt u 49) 0 (cond (Nat.blt u 343) 1 0))
    (popcF 22 (Nat.land S R3M) + cond (Nat.blt u 343) 0 1) (Nat.sub 21 d) u

/-- suffix break at label `b`: at most `nn = 21 - d` available labels from `b` on -/
def sufOK (D W d b : ℕ) : Bool := Nat.beq (K2.remB (Nat.land (avM D W) (geM b)) (Nat.sub 21 d)) 0

/-- one child record: `tag | u << 2 | X << 11` (tag 0 PREFF, 1 DOOM, 2 TYPE) -/
def itemOK (S D U W d last it : ℕ) : Bool :=
  Nat.blt last (Nat.land (Nat.shiftRight it 2) 511) && Nat.blt (Nat.land (Nat.shiftRight it 2) 511) 511 &&
  cond (Nat.beq (Nat.land it 3) 0) (preffOK U d (Nat.land (Nat.shiftRight it 2) 511) (Nat.shiftRight it 11))
    (cond (Nat.beq (Nat.land it 3) 1) (doomOK S D W d (Nat.land (Nat.shiftRight it 2) 511))
      (cond (Nat.beq (Nat.land it 3) 2) (tyOK S d (Nat.land (Nat.shiftRight it 2) 511)) false))

def itemsOK (S D U W d last : ℕ) (its : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun it _ acc => itemOK S D U W d last it && acc) its

/-- one OPEN node: frame data, blocked mask `W`, break label `b`, child records -/
def kindsNode (S D U W d last b : ℕ) (its : List ℕ) : Bool :=
  Nat.beq (Nat.shiftRight S last) 1 && Nat.ble d 21 && sufOK D W d b && itemsOK S D U W d last its

/-! ## Soundness -/

theorem preff_soundU {Ω : Dec22 → Prop} {S D N U d last u X : ℕ} (hF : FrameOKU Ω S D N U d) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : preffOK U d u X = true) : ∀ A : Dec22, Ω A → ¬ Continues A S last u := by
  intro A _ hA
  obtain ⟨_, _, hcard, hU⟩ := frameOKU_basic hF
  unfold preffOK at h
  simp only [Bool.and_eq_true, Nat.blt_eq, Bool.or_eq_true] at h
  obtain ⟨⟨⟨hX0, hX⟩, hlt⟩, halt⟩ := h
  simp only [Nat.add_eq, Nat.sub_eq, Nat.mul_eq] at hlt halt
  have hdef := deficit_lab A X hX0 hX
  have hsp := cont_split hS hA (fun l => par (vecL l &&& X) = true)
  have hfl : fld7 U X = hits S X := by rw [hU]; exact fld7_packU S X d hX hcard (by omega)
  have hpb : pbit u X = if par (vecL u &&& X) = true then 1 else 0 := by
    unfold pbit; show cond (par (vecL u &&& X)) 1 0 = _; cases par (vecL u &&& X) <;> rfl
  have ht1 := above_le_tail hS hA d hcard (fun l => par (vecL l &&& X) = true)
  unfold hits at hfl
  rw [hfl, hpb] at hlt halt
  rcases halt with h1 | h1
  · rw [hsp] at hdef; omega
  · replace h1 := beq_true h1
    have ht2 := le_trans (above_le_mask (A := A) (u := u) (fun l => par (vecL l &&& X) = true))
      (card_above_le_shift (nperpL X) u (fun l => par (vecL l &&& X) = true)
        (fun l hl hp => by rw [nperpL_bit X l hX hl]; exact hp))
    have hlt2 : Nat.shiftRight (nperpL X) (Nat.succ u) < 2 ^ 511 :=
      lt_of_le_of_lt (Nat.shiftRight_le (nperpL X) (Nat.succ u)) (nperpL_lt X)
    have ht3 := remB_card_le hlt2 h1
    rw [hsp] at hdef
    omega

theorem caseII_lab (A : Dec22) (h : CaseII A) : 14 ≤ ((Finset.range 511).filter (fun l => A.Has l ∧ l < 49)).card := by
  unfold CaseII at h; rw [nType_lab] at h
  refine le_trans h (le_of_eq ?_); apply card_filter_congr; intro l _; rw [rkL_lt]

theorem doom_soundU {Ω : Dec22 → Prop} {S D N U W d last u : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : doomOK S D W d u = true) : ∀ A : Dec22, Ω A → CaseII A → ¬ Continues A S last u := by
  intro A hΩ hII hA
  obtain ⟨_, hS511, hcard, _⟩ := frameOKU_basic hF
  have h14 := caseII_lab A hII
  have hsp := cont_split hS hA (fun l => l < 49)
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  have hbel := cont_below hS hA
  have hlast := shr_one_lastOf hS
  have hs1 : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ l < 49)).card = (K2.bitsB 511 (S &&& R1M)).card := by
    unfold K2.bitsB; apply card_filter_congr; intro l _
    rw [Nat.testBit_and, testBit_R1M]; simp
  have hS1lt : S &&& R1M < 2 ^ 511 := land_M511_lt _ _ r1m_lt
  unfold doomOK at h
  by_cases hu49 : u < 49
  · have hb : Nat.blt u 49 = true := blt_true hu49
    rw [hb, cond_true] at h
    simp only [Bool.or_eq_true, Bool.and_eq_true, Nat.ble_eq] at h
    rw [if_pos hu49] at hsp
    -- the rank-1 labels of A above u are available rank-1 labels above u
    have hav : ∀ l, u < l → l < 511 → A.Has l → l < 49 → (R1M &&& abv u &&& avM D W).testBit l = true := by
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
    rcases h with h1 | ⟨hnn, h1⟩ <;> replace h1 := beq_true h1
    · -- |S ∩ R1| + (rank-1 labels of A above u) ≤ bits of (S ∩ R1) ∪ (available rank-1 above u) ≤ 12
      have hlt : (S &&& R1M) ||| (R1M &&& abv u &&& avM D W) < 2 ^ 511 :=
        lt511_of_bits (fun i hi => by
          rw [Nat.testBit_or, Nat.testBit_and, Nat.testBit_and, Nat.testBit_and, testBit_R1M]; simp; omega)
      have hc := remB_card_le hlt h1
      have hU : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ l < 49)).card +
          ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ l < 49)).card ≤
          (K2.bitsB 511 ((S &&& R1M) ||| (R1M &&& abv u &&& avM D W))).card := by
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
      have ht := above_le_tail hS hA d hcard (fun l => l < 49)
      rw [hs1] at hsp; rw [hsp] at h14; simp only [Nat.sub_eq] at hc hnn; omega
  · have hb : Nat.blt u 49 = false := blt_false hu49
    rw [hb, cond_false] at h
    replace h := beq_true h
    have hc := remB_card_le hS1lt h
    rw [if_neg hu49] at hsp
    have h0 : ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ l < 49)).card = 0 := by
      rw [Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨h1, _, h3⟩; omega
    rw [hs1, h0] at hsp; rw [hsp] at h14; omega

theorem suf_soundU {Ω : Dec22 → Prop} {S D N U W d last b : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : sufOK D W d b = true) : ∀ u, b ≤ u → ∀ A : Dec22, Ω A → ¬ Continues A S last u := by
  intro u hbu A hΩ hA
  obtain ⟨_, _, hcard, _⟩ := frameOKU_basic hF
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  have hbel := cont_below hS hA
  have hlast := shr_one_lastOf hS
  unfold sufOK at h
  replace h := beq_true h
  have hc := remB_card_le (land_M511_lt _ _ (geM_lt b)) h
  have hfree : ∀ l, last < l → l < 511 → A.Has l → (avM D W &&& geM b).testBit l = true ∨ l < b := by
    intro l hl hl5 hAl
    have hD : D.testBit l = false := by
      cases hDl : D.testBit l
      · rfl
      · exact absurd hAl ((frameOKU_apply hF A hΩ hbel).1 l (by rw [hlast]; omega) hl5 hDl)
    have hWl : W.testBit l = false := by
      cases hWl : W.testBit l
      · rfl
      · exact absurd hAl (hW A hΩ hbel l (by rw [hlast]; omega) hl5 hWl)
    by_cases hbl : b ≤ l
    · left; rw [Nat.testBit_and, testBit_avM, testBit_geM, hD, hWl]; simp [hl5, hbl]
    · right; omega
  have ht := above_card hS hA d hcard
  -- u and the labels of A above u are available and ≥ b
  have hsub : ((Finset.range 511).filter (fun l => u < l ∧ A.Has l)).card + 1 ≤
      (K2.bitsB 511 (avM D W &&& geM b)).card := by
    have : insert u ((Finset.range 511).filter (fun l => u < l ∧ A.Has l)) ⊆ K2.bitsB 511 (avM D W &&& geM b) := by
      intro l hl
      rw [Finset.mem_insert] at hl
      rw [K2.mem_bitsB]
      rcases hl with rfl | hl
      · refine ⟨hu, ?_⟩
        rcases hfree l hlu hu (cont_has hA) with h1 | h1
        · exact h1
        · omega
      · simp only [Finset.mem_filter, Finset.mem_range] at hl
        refine ⟨hl.1, ?_⟩
        rcases hfree l (by omega) hl.1 hl.2.2 with h1 | h1
        · exact h1
        · omega
    have h2 := Finset.card_le_card this
    rw [Finset.card_insert_of_notMem (by simp)] at h2; exact h2
  simp only [Nat.sub_eq] at hc; omega

theorem rkL_cases (l : ℕ) : (rkL l = 1 ↔ l < 49) ∧ (rkL l = 2 ↔ 49 ≤ l ∧ l < 343) ∧ (rkL l = 3 ↔ 343 ≤ l) := by
  unfold rkL; split_ifs <;> omega

theorem prefix_rank_card {S d : ℕ} (hS511 : S < 2 ^ 511)
    (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = d) (hd : d ≤ 22) (M : ℕ) (r : ℕ)
    (hM : ∀ l, l < 511 → (M.testBit l = true ↔ rkL l = r)) :
    ((Finset.range 511).filter (fun l => S.testBit l = true ∧ rkL l = r)).card = popcF 22 (Nat.land S M) := by
  have hlt : S &&& M < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left hS511
  have hb : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ rkL l = r)).card = (K2.bitsB 511 (S &&& M)).card := by
    unfold K2.bitsB; apply card_filter_congr; intro l hl; rw [Finset.mem_range] at hl
    rw [Nat.testBit_and, Bool.and_eq_true, hM l hl]
  have hle : ((Finset.range 511).filter (fun l => S.testBit l = true ∧ rkL l = r)).card ≤ d := by
    rw [← hcard]
    exact Finset.card_le_card (fun l => by simp only [Finset.mem_filter]; rintro ⟨h1, h2, _⟩; exact ⟨h1, h2⟩)
  rw [show Nat.land S M = S &&& M from rfl, popcF_eq 22 _ hlt (by rw [← hb]; omega), hb]

theorem ty_soundU {Ω : Dec22 → Prop} {S D N U d last u : ℕ} (hF : FrameOKU Ω S D N U d) (hT : TypeFacts) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : tyOK S d u = true) : ∀ A : Dec22, Ω A → ¬ Continues A S last u := by
  intro A _ hA
  obtain ⟨_, hS511, hcard, _⟩ := frameOKU_basic hF
  have hu : u < 511 := hA.2.1
  have hTA := hT A
  rw [nType_lab, nType_lab, nType_lab] at hTA
  rw [cont_split hS hA (fun l => rkL l = 1), cont_split hS hA (fun l => rkL l = 2),
    cont_split hS hA (fun l => rkL l = 3)] at hTA
  have hd' : d ≤ 22 := by omega
  rw [prefix_rank_card hS511 hcard hd' R1M 1 (fun l _ => by rw [testBit_R1M, (rkL_cases l).1]; simp),
    prefix_rank_card hS511 hcard hd' R2M 2 (fun l _ => by rw [testBit_R2M, (rkL_cases l).2.1]; simp),
    prefix_rank_card hS511 hcard hd' R3M 3 (fun l hl => by rw [testBit_R3M, (rkL_cases l).2.2]; simp; omega)] at hTA
  -- the tail counts
  set t1 := ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ rkL l = 1)).card with ht1
  set t2 := ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ rkL l = 2)).card with ht2
  set t3 := ((Finset.range 511).filter (fun l => u < l ∧ A.Has l ∧ rkL l = 3)).card with ht3
  have hsum : t1 + t2 + t3 = 21 - d := by
    have hac := above_card hS hA d hcard
    rw [← show 22 - (d + 1) = 21 - d by omega, ← hac, ht1, ht2, ht3, ← Finset.card_union_of_disjoint,
      ← Finset.card_union_of_disjoint]
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
  have hy : t1 < Nat.succ (cond (Nat.blt u 49) (21 - d) 0) := by
    by_cases hu49 : u < 49
    · rw [blt_true hu49, cond_true]; omega
    · rw [blt_false hu49, cond_false]
      have : t1 = 0 := by
        rw [ht1, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨h1, _, h3⟩
        rw [(rkL_cases l).1] at h3; omega
      omega
  have hx : t2 < Nat.succ (cond (Nat.blt u 343) (21 - d - t1) 0) := by
    by_cases hu3 : u < 343
    · rw [blt_true hu3, cond_true]; omega
    · rw [blt_false hu3, cond_false]
      have : t2 = 0 := by
        rw [ht2, Finset.card_eq_zero, Finset.filter_eq_empty_iff]; rintro l _ ⟨h1, _, h3⟩
        rw [(rkL_cases l).2.1] at h3; omega
      omega
  unfold tyOK tyAll at h
  have h2 := S5.allLT_spec (S5.allLT_spec h t1 hy) t2 hx
  rw [Bool.not_eq_true'] at h2
  have e3 : 21 - d - t1 - t2 = t3 := by omega
  simp only [Nat.sub_eq] at h2
  rw [e3] at h2
  have e1 : (if rkL u = 1 then 1 else 0) = cond (Nat.blt u 49) 1 0 := by
    by_cases hu49 : u < 49
    · rw [blt_true hu49, cond_true, if_pos ((rkL_cases u).1.2 hu49)]
    · rw [blt_false hu49, cond_false, if_neg (fun e => hu49 ((rkL_cases u).1.1 e))]
  have e2 : (if rkL u = 2 then 1 else 0) = cond (Nat.blt u 49) 0 (cond (Nat.blt u 343) 1 0) := by
    by_cases hu49 : u < 49
    · rw [blt_true hu49, cond_true, if_neg (fun e => by have := (rkL_cases u).2.1.1 e; omega)]
    · rw [blt_false hu49, cond_false]
      by_cases hu3 : u < 343
      · rw [blt_true hu3, cond_true, if_pos ((rkL_cases u).2.1.2 ⟨by omega, hu3⟩)]
      · rw [blt_false hu3, cond_false, if_neg (fun e => by have := (rkL_cases u).2.1.1 e; omega)]
  have e3' : (if rkL u = 3 then 1 else 0) = cond (Nat.blt u 343) 0 1 := by
    by_cases hu3 : u < 343
    · rw [blt_true hu3, cond_true, if_neg (fun e => by have := (rkL_cases u).2.2.1 e; omega)]
    · rw [blt_false hu3, cond_false, if_pos ((rkL_cases u).2.2.2 (by omega))]
  rw [e1, e2, e3'] at hTA
  rw [hTA] at h2
  exact absurd h2 (by decide)

/-! ## The node theorem -/

theorem itemsOK_mem {S D U W d last : ℕ} : ∀ (its : List ℕ), itemsOK S D U W d last its = true →
    ∀ it ∈ its, itemOK S D U W d last it = true
  | [], _, it, hit => absurd hit (List.not_mem_nil)
  | x :: xs, h, it, hit => by
    have h' : (itemOK S D U W d last x && itemsOK S D U W d last xs) = true := h
    rw [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hit with rfl | hm
    · exact h'.1
    · exact itemsOK_mem xs h'.2 it hm

theorem item_soundU {Ω : Dec22 → Prop} {S D N U W d last it : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hT : TypeFacts) (hS : S >>> last = 1) (hd : d ≤ 21) (h : itemOK S D U W d last it = true) :
    ∀ A : Dec22, Ω A → CaseII A → ¬ Continues A S last (Nat.land (Nat.shiftRight it 2) 511) := by
  intro A hΩ hII
  unfold itemOK at h
  rw [Bool.and_eq_true, Bool.and_eq_true] at h
  obtain ⟨⟨_, _⟩, h⟩ := h
  generalize Nat.land (Nat.shiftRight it 2) 511 = u at h ⊢
  generalize Nat.shiftRight it 11 = X at h
  generalize Nat.land it 3 = tg at h
  cases h0 : Nat.beq tg 0
  · rw [h0, cond_false] at h
    cases h1 : Nat.beq tg 1
    · rw [h1, cond_false] at h
      cases h2 : Nat.beq tg 2
      · rw [h2, cond_false] at h; exact absurd h (by decide)
      · rw [h2, cond_true] at h; exact ty_soundU hF hT hS hd h A hΩ
    · rw [h1, cond_true] at h; exact doom_soundU hF hW hS hd h A hΩ hII
  · rw [h0, cond_true] at h; exact preff_soundU hF hS hd h A hΩ

/-- **The node theorem.**  An accepted node: no case-(II) decomposition continues it with a child at or after the break label,
or with the child of any PREFF / DOOM / TYPE record. -/
theorem kindsNode_soundU {Ω : Dec22 → Prop} {S D N U W d last b : ℕ} {its : List ℕ} (hF : FrameOKU Ω S D N U d)
    (hW : BlockOKU Ω S W) (hT : TypeFacts) (h : kindsNode S D U W d last b its = true) :
    (∀ u, b ≤ u → ∀ A : Dec22, Ω A → ¬ Continues A S last u) ∧
    (∀ it ∈ its, ∀ A : Dec22, Ω A → CaseII A → ¬ Continues A S last (Nat.land (Nat.shiftRight it 2) 511)) := by
  unfold kindsNode at h
  simp only [Bool.and_eq_true, Nat.ble_eq] at h
  obtain ⟨⟨⟨hS, hd⟩, hsuf⟩, hits⟩ := h
  replace hS := beq_true hS
  exact ⟨suf_soundU hF hW hS hd hsuf, fun it hit => item_soundU hF hW hT hS hd (itemsOK_mem its hits it hit)⟩

/-! ### Revision 5's statements (the trivial universe) -/

theorem preff_sound {S D N U d last u X : ℕ} (hF : FrameOK S D N U d) (hS : S >>> last = 1) (hd : d ≤ 21)
    (h : preffOK U d u X = true) : ∀ A : Dec22, ¬ Continues A S last u :=
  fun A => preff_soundU (frameOKU_of5 hF) hS hd h A trivial

theorem doom_sound {S D N U W d last u : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : doomOK S D W d u = true) : ∀ A : Dec22, CaseII A → ¬ Continues A S last u :=
  fun A => doom_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hS hd h A trivial

theorem suf_sound {S D N U W d last b : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : sufOK D W d b = true) : ∀ u, b ≤ u → ∀ A : Dec22, ¬ Continues A S last u :=
  fun u hu A => suf_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hS hd h u hu A trivial

theorem ty_sound {S D N U d last u : ℕ} (hF : FrameOK S D N U d) (hT : TypeFacts) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : tyOK S d u = true) : ∀ A : Dec22, ¬ Continues A S last u :=
  fun A => ty_soundU (frameOKU_of5 hF) hT hS hd h A trivial

theorem item_sound {S D N U W d last it : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hT : TypeFacts)
    (hS : S >>> last = 1) (hd : d ≤ 21) (h : itemOK S D U W d last it = true) :
    ∀ A : Dec22, CaseII A → ¬ Continues A S last (Nat.land (Nat.shiftRight it 2) 511) :=
  fun A => item_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hT hS hd h A trivial

theorem kindsNode_sound {S D N U W d last b : ℕ} {its : List ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W)
    (hT : TypeFacts) (h : kindsNode S D U W d last b its = true) :
    (∀ u, b ≤ u → ∀ A : Dec22, ¬ Continues A S last u) ∧
    (∀ it ∈ its, ∀ A : Dec22, CaseII A → ¬ Continues A S last (Nat.land (Nat.shiftRight it 2) 511)) := by
  obtain ⟨h1, h2⟩ := kindsNode_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hT h
  exact ⟨fun u hu A => h1 u hu A trivial, fun it hit A => h2 it hit A trivial⟩

end KD

namespace KD
open R3RT R3RT.Spec

/-- a batch of nodes `(S, D, U, W, d, last, b, items)` (timing and stream-level checks) -/
def kindsBatch (ns : List (ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ acc => kindsNode x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2.1 x.2.2.2.2.2.1 x.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2 && acc) ns

theorem kindsBatch_mem : ∀ (ns : List (ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ)), kindsBatch ns = true → ∀ x ∈ ns,
    kindsNode x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2.1 x.2.2.2.2.2.1 x.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2 = true
  | [], _, x, hx => absurd hx List.not_mem_nil
  | y :: ys, h, x, hx => by
    have h' : (kindsNode y.1 y.2.1 y.2.2.1 y.2.2.2.1 y.2.2.2.2.1 y.2.2.2.2.2.1 y.2.2.2.2.2.2.1 y.2.2.2.2.2.2.2 &&
      kindsBatch ys) = true := h
    rw [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hx with rfl | hm
    · exact h'.1
    · exact kindsBatch_mem ys h'.2 x hm

end KD
