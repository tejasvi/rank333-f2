module
public import R22Port.U_d41d8cd98f00
public import KD321.Base
public import KD.Kinds
/-! # KD321.Kinds: PREFF, DOOM (rank-1 window), suffix break and node cut 7 over a label order, with soundness

The checkers of `KD.Kinds` / `KD.Cuts` with the order as data: the code table `vf` and the odd-pairing masks `npf X` (labels `l`
with `par (vec l &&& X) = 1`) enter as functions (`VecOK`), the rank-1 labels as a mask `r1m` and its complement `nr1m`
(`R1OK`).  The case is the rank-1 window `CaseK lo hi` (`lo ≤ #rank-1 first factors ≤ hi`), as prof7's `--minr1 lo --maxr1 hi`:
* PREFF (record 0x24, functional `X`): as `KD.preffOK` (`preffO_sound`, every decomposition).
* DOOM (record 0x26), the child's own window test of prof7R3 (`--minr1` / `--maxr1`): with `r12` = rank-1 labels of
  `S ∪ {u}`, `nn = 21 - d` labels after `u`, `ra` / `rb` = available (outside `D`) rank-1 / other labels above `u`, the child is
  dead if `r12 + min(ra, nn) < lo`, or `hi < r12`, or `rb + min(ra, hi - r12) < nn` (`doomO_sound`, case `CaseK lo hi`).
* Suffix break at `b` (`KD.sufOK`, order-free; `sufO_sound`).
* Node cut 7 (the node's window test): the same with the node's own labels, `need = 22 - d` (`winO_sound`).
Counts are `popcF` with fuel 22 / 23: a count that exceeds the fuel only makes a test fail (`popcF_min`). -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD321
open RootSound R3RT R3RT.SpecO BC4 BC5 Finset Classical

/-! ## Bit counts -/

theorem popcF_min (f : ℕ) : ∀ x, x < 2 ^ 511 → KD.popcF f x = min f (K2.bitsB 511 x).card := by
  induction f with
  | zero => intro x _; simp [KD.popcF]
  | succ f ih =>
    intro x hx
    by_cases h0 : x = 0
    · subst h0; simp [KD.popcF, K2.bitsB_zero]
    · have hbeq : Nat.beq x 0 = false := by
        cases h : Nat.beq x 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true h) h0
      simp only [KD.popcF, hbeq, cond_false]
      have hc := K2.card_bits_land_pred 511 x h0 hx
      have hpos := K2.card_bits_pos 511 x h0 hx
      rw [show Nat.land x (Nat.sub x 1) = x &&& (x - 1) from rfl, ih _ (lt_of_le_of_lt Nat.and_le_left hx), hc]
      omega

/-- `min` in kernel form -/
def minN (a b : ℕ) : ℕ := cond (Nat.ble a b) a b

theorem minN_eq (a b : ℕ) : minN a b = min a b := by
  unfold minN
  cases h : Nat.ble a b
  · rw [cond_false]
    have : ¬ a ≤ b := fun hle => by rw [Nat.ble_eq.mpr hle] at h; exact absurd h (by decide)
    omega
  · rw [cond_true]; have := Nat.ble_eq.mp h; omega

theorem land_shr_one (m u : ℕ) : Nat.land (Nat.shiftRight m u) 1 = if m.testBit u = true then 1 else 0 := by
  rw [show Nat.land (Nat.shiftRight m u) 1 = (m >>> u) &&& 1 from rfl, Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow,
    Nat.testBit_eq_decide_div_mod_eq]
  rcases Nat.mod_two_eq_zero_or_one (m / 2 ^ u) with h | h <;> simp [h]

/-- the labels of `S` with a bit of `m`, counted by `popcF` -/
theorem popcF_prefix {S d : ℕ} (hS511 : S < 2 ^ 511)
    (hcard : ((range 511).filter (fun l => S.testBit l = true)).card = d) (f : ℕ) (hd : d ≤ f) (m : ℕ) (q : ℕ → Prop)
    [DecidablePred q] (hm : ∀ l, l < 511 → (m.testBit l = true ↔ q l)) :
    ((range 511).filter (fun l => S.testBit l = true ∧ q l)).card = KD.popcF f (Nat.land S m) := by
  have hlt : S &&& m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left hS511
  have hb : ((range 511).filter (fun l => S.testBit l = true ∧ q l)).card = (K2.bitsB 511 (S &&& m)).card := by
    unfold K2.bitsB; apply KD.card_filter_congr; intro l hl; rw [mem_range] at hl
    rw [Nat.testBit_and, Bool.and_eq_true, hm l hl]
  have hle : ((range 511).filter (fun l => S.testBit l = true ∧ q l)).card ≤ d := by
    rw [← hcard]
    exact card_le_card (fun l => by simp only [mem_filter]; rintro ⟨h1, h2, _⟩; exact ⟨h1, h2⟩)
  rw [show Nat.land S m = S &&& m from rfl, popcF_min f _ hlt, ← hb]
  omega

/-! ## Order data -/

/-- the order's code table `vf` and odd-pairing masks `npf X` as functions -/
structure VecOK (O : LabelOrder) (vf npf : ℕ → ℕ) : Prop where
  vf_eq : ∀ l, l < 511 → vf l = O.vec l
  np_bit : ∀ X, X < 512 → ∀ l, l < 511 → (npf X).testBit l = par (O.vec l &&& X)
  np_lt : ∀ X, X < 512 → npf X < 2 ^ 511

/-- the rank-1 labels `r1m` and the others `nr1m` -/
structure R1OK (O : LabelOrder) (r1m nr1m : ℕ) : Prop where
  r1_bit : ∀ l, l < 511 → (r1m.testBit l = true ↔ O.rk l = 1)
  nr1_bit : ∀ l, l < 511 → (nr1m.testBit l = true ↔ ¬ O.rk l = 1)
  r1_lt : r1m < 2 ^ 511
  nr1_lt : nr1m < 2 ^ 511

/-! ## The checkers (kernel form) -/

@[inline] def pbitO (vf : ℕ → ℕ) (u X : ℕ) : ℕ := cond (par (Nat.land (vf u) X)) 1 0

/-- PREFF record `(u, X)` at the node with counters `U` and `d` prefix labels -/
def preffOKO (vf npf : ℕ → ℕ) (U d u X : ℕ) : Bool :=
  Nat.blt 0 X && Nat.blt X 512 && Nat.blt (Nat.add (KD.fld7 U X) (pbitO vf u X)) (Nat.mul 3 (rkOf X)) &&
  (Nat.blt (Nat.add (Nat.add (KD.fld7 U X) (pbitO vf u X)) (Nat.sub 21 d)) (Nat.mul 3 (rkOf X)) ||
    Nat.beq (K2.remB (Nat.shiftRight (npf X) (Nat.succ u))
      (Nat.sub (Nat.sub (Nat.mul 3 (rkOf X)) (Nat.add (KD.fld7 U X) (pbitO vf u X))) 1)) 0)

/-- the window test from counts: `r` rank-1 labels so far, `ra` / `rb` available rank-1 / other labels, `n` labels to come -/
def winTest (r ra rb n lo hi : ℕ) : Bool :=
  Nat.blt (Nat.add r (minN ra n)) lo || Nat.blt hi r || Nat.blt (Nat.add rb (minN ra (Nat.sub hi r))) n

/-- DOOM record `u` (the child's own window test) -/
def doomOKO (r1m nr1m S D d u lo hi : ℕ) : Bool :=
  winTest (Nat.add (KD.popcF 22 (Nat.land S r1m)) (Nat.land (Nat.shiftRight r1m u) 1))
    (KD.popcF 22 (Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) r1m))
    (KD.popcF 22 (Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) nr1m)) (Nat.sub 21 d) lo hi

/-- node cut 7 (the node's own window test) -/
def winOKO (r1m nr1m S D d last lo hi : ℕ) : Bool :=
  winTest (KD.popcF 22 (Nat.land S r1m))
    (KD.popcF 23 (Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) r1m))
    (KD.popcF 23 (Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) nr1m)) (Nat.sub 22 d) lo hi

/-! ## Soundness -/

section sound
variable {O : LabelOrder}

theorem preffO_sound {vf npf : ℕ → ℕ} (hV : VecOK O vf npf) {Ω : Spec.Dec22 → Prop} {S D N U d last u X : ℕ}
    (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1) (hd : d ≤ 21) (h : preffOKO vf npf U d u X = true) :
    ∀ A : Spec.Dec22, ¬ Continues O A S last u := by
  intro A hA
  obtain ⟨_, _, hcard, hU, _⟩ := hF
  unfold preffOKO at h
  simp only [Bool.and_eq_true, Nat.blt_eq, Bool.or_eq_true] at h
  obtain ⟨⟨⟨hX0, hX⟩, hlt⟩, halt⟩ := h
  simp only [Nat.add_eq, Nat.sub_eq, Nat.mul_eq] at hlt halt
  have hu5 : u < 511 := hA.2.1
  have hdef := deficit_labO O A X hX0 hX
  have hsp := cont_splitO O hS hA (fun l => par (O.vec l &&& X) = true)
  have hfl : KD.fld7 U X = hits O S X := by rw [hU]; exact fld7_packUO O S X d hX hcard (by omega)
  have hpb : pbitO vf u X = if par (O.vec u &&& X) = true then 1 else 0 := by
    unfold pbitO
    rw [show Nat.land (vf u) X = vf u &&& X from rfl, hV.vf_eq u hu5]
    cases par (O.vec u &&& X) <;> rfl
  have ht1 := above_le_tailO O hS hA d hcard (fun l => par (O.vec l &&& X) = true)
  unfold hits at hfl
  rw [hfl, hpb] at hlt halt
  rcases halt with h1 | h1
  · rw [hsp] at hdef; omega
  · replace h1 := KD.beq_true h1
    have hmask : ((range 511).filter (fun l => u < l ∧ Has O A l ∧ par (O.vec l &&& X) = true)).card ≤
        ((range 511).filter (fun l => u < l ∧ par (O.vec l &&& X) = true)).card :=
      card_le_card (fun l => by simp only [mem_filter]; rintro ⟨h1, h2, _, h4⟩; exact ⟨h1, h2, h4⟩)
    have ht2 := le_trans hmask (KD.card_above_le_shift (npf X) u (fun l => par (O.vec l &&& X) = true)
        (fun l hl hp => by rw [hV.np_bit X hX l hl]; exact hp))
    have hlt2 : Nat.shiftRight (npf X) (Nat.succ u) < 2 ^ 511 :=
      lt_of_le_of_lt (Nat.shiftRight_le (npf X) (Nat.succ u)) (hV.np_lt X hX)
    have ht3 := KD.remB_card_le hlt2 h1
    rw [hsp] at hdef
    omega

theorem sufO_sound {Ω : Spec.Dec22 → Prop} {S D N U d last b : ℕ} (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1)
    (hd : d ≤ 21) (h : KD.sufOK D 0 d b = true) : ∀ u, b ≤ u → ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S last u := by
  intro u hbu A hΩ hA
  have hF' := hF
  obtain ⟨_, _, hcard, _, _⟩ := hF'
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  have hbel := cont_belowO O hS hA
  unfold KD.sufOK at h
  replace h := KD.beq_true h
  have hc := KD.remB_card_le (KD.land_M511_lt _ _ (KD.geM_lt b)) h
  have hfree : ∀ l, last < l → l < 511 → Has O A l → (KD.avM D 0 &&& KD.geM b).testBit l = true ∨ l < b := by
    intro l hl hl5 hAl
    have hD := frame_notD O hF hS hΩ hbel l hl hl5 hAl
    by_cases hbl : b ≤ l
    · left; rw [Nat.testBit_and, KD.testBit_avM, KD.testBit_geM, hD]; simp [hl5, hbl]
    · right; omega
  have ht := above_cardO O hS hA d hcard
  have hsub : ((range 511).filter (fun l => u < l ∧ Has O A l)).card + 1 ≤ (K2.bitsB 511 (KD.avM D 0 &&& KD.geM b)).card := by
    have : insert u ((range 511).filter (fun l => u < l ∧ Has O A l)) ⊆ K2.bitsB 511 (KD.avM D 0 &&& KD.geM b) := by
      intro l hl
      rw [mem_insert] at hl
      rw [K2.mem_bitsB]
      rcases hl with rfl | hl
      · refine ⟨hu, ?_⟩
        rcases hfree l hlu hu (cont_hasO O hA) with h1 | h1
        · exact h1
        · omega
      · simp only [mem_filter, mem_range] at hl
        refine ⟨hl.1, ?_⟩
        rcases hfree l (by omega) hl.1 hl.2.2 with h1 | h1
        · exact h1
        · omega
    have h2 := card_le_card this
    rw [card_insert_of_notMem (by simp)] at h2; exact h2
  simp only [Nat.sub_eq] at hc; omega

/-- the window arithmetic: counts `r` (so far), `t1` / `t2` (rank-1 / other labels to come, `t1 + t2 = n`), bounded by the
available counts `RA` / `RB`, and `lo ≤ r + t1 ≤ hi`, contradict an accepted `winTest` with `popcF`-truncated counts -/
theorem winTest_false {r t1 t2 n RA RB lo hi f : ℕ} (hn : t1 + t2 = n) (hnf : n < f) (h1 : t1 ≤ RA) (h2 : t2 ≤ RB)
    (hlo : lo ≤ r + t1) (hhi : r + t1 ≤ hi) (h : winTest r (min f RA) (min f RB) n lo hi = true) : False := by
  unfold winTest at h
  simp only [Bool.or_eq_true, Nat.blt_eq, minN_eq, Nat.add_eq, Nat.sub_eq] at h
  rcases h with (h | h) | h <;> omega

theorem doomO_sound {r1m nr1m : ℕ} (hR : R1OK O r1m nr1m) {Ω : Spec.Dec22 → Prop} {S D N U d last u lo hi : ℕ}
    (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1) (hd : d ≤ 21) (h : doomOKO r1m nr1m S D d u lo hi = true) :
    ∀ A : Spec.Dec22, Ω A → CaseK lo hi A → ¬ Continues O A S last u := by
  intro A hΩ hC hA
  have hF' := hF
  obtain ⟨_, hS511, hcard, _, _⟩ := hF'
  have hlu : last < u := hA.1
  have hu : u < 511 := hA.2.1
  have hbel := cont_belowO O hS hA
  obtain ⟨hlo, hhi⟩ := hC
  rw [nType_O O A 1] at hlo hhi
  have hsp := cont_splitO O hS hA (fun l => O.rk l = 1)
  have hpre := popcF_prefix hS511 hcard 22 (by omega) r1m (fun l => O.rk l = 1) hR.r1_bit
  have hu1 : Nat.land (Nat.shiftRight r1m u) 1 = if O.rk u = 1 then 1 else 0 := by
    rw [land_shr_one]
    by_cases h1 : O.rk u = 1
    · rw [if_pos ((hR.r1_bit u hu).2 h1), if_pos h1]
    · rw [if_neg (fun e => h1 ((hR.r1_bit u hu).1 e)), if_neg h1]
  -- the labels to come
  set t1 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ O.rk l = 1)).card with ht1
  set t2 := ((range 511).filter (fun l => u < l ∧ Has O A l ∧ ¬ O.rk l = 1)).card with ht2
  have hsum : t1 + t2 = 21 - d := by
    have hac := above_cardO O hS hA d hcard
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
  -- available labels above `u`
  have hav : ∀ l, u < l → l < 511 → Has O A l → (Nat.land (KD.abv u) (KD.avM D 0)).testBit l = true := by
    intro l hul hl hAl
    have hD := frame_notD O hF hS hΩ hbel l (by omega) hl hAl
    rw [show Nat.land (KD.abv u) (KD.avM D 0) = KD.abv u &&& KD.avM D 0 from rfl, Nat.testBit_and, KD.testBit_abv,
      KD.testBit_avM, hD]
    simp [hul, hl]
  have hlt1 : Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) r1m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_right hR.r1_lt
  have hlt2 : Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) nr1m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_right hR.nr1_lt
  have hRA : t1 ≤ (K2.bitsB 511 (Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) r1m)).card := by
    apply KD.card_le_bits; intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨hl5, hul, hAl, hr⟩ := hl
    refine ⟨hl5, ?_⟩
    rw [show Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) r1m = Nat.land (KD.abv u) (KD.avM D 0) &&& r1m from rfl,
      Nat.testBit_and, hav l hul hl5 hAl, (hR.r1_bit l hl5).2 hr]; rfl
  have hRB : t2 ≤ (K2.bitsB 511 (Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) nr1m)).card := by
    apply KD.card_le_bits; intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨hl5, hul, hAl, hr⟩ := hl
    refine ⟨hl5, ?_⟩
    rw [show Nat.land (Nat.land (KD.abv u) (KD.avM D 0)) nr1m = Nat.land (KD.abv u) (KD.avM D 0) &&& nr1m from rfl,
      Nat.testBit_and, hav l hul hl5 hAl, (hR.nr1_bit l hl5).2 hr]; rfl
  unfold doomOKO at h
  rw [popcF_min 22 _ hlt1, popcF_min 22 _ hlt2, ← hpre, hu1] at h
  rw [hsp] at hlo hhi
  exact winTest_false hsum (by omega) hRA hRB (by omega) (by omega) h

theorem winO_sound {r1m nr1m : ℕ} (hR : R1OK O r1m nr1m) {Ω : Spec.Dec22 → Prop} {S D N U d last lo hi : ℕ}
    (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1) (hd : d ≤ 22) (h : winOKO r1m nr1m S D d last lo hi = true) :
    ∀ A : Spec.Dec22, Ω A → CaseK lo hi A → ¬ Below O A S last := by
  intro A hΩ hC hA
  have hF' := hF
  obtain ⟨_, hS511, hcard, _, _⟩ := hF'
  obtain ⟨hlo, hhi⟩ := hC
  rw [nType_O O A 1] at hlo hhi
  have hsp := below_splitO O hS hA (fun l => O.rk l = 1)
  have hpre := popcF_prefix hS511 hcard 22 hd r1m (fun l => O.rk l = 1) hR.r1_bit
  set t1 := ((range 511).filter (fun l => last < l ∧ Has O A l ∧ O.rk l = 1)).card with ht1
  set t2 := ((range 511).filter (fun l => last < l ∧ Has O A l ∧ ¬ O.rk l = 1)).card with ht2
  have hsum : t1 + t2 = 22 - d := by
    have hac := below_above_cardO O hS hA d hcard
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
  have hav : ∀ l, last < l → l < 511 → Has O A l → (Nat.land (KD.abv last) (KD.avM D 0)).testBit l = true := by
    intro l hll hl hAl
    have hD := frame_notD O hF hS hΩ hA l hll hl hAl
    rw [show Nat.land (KD.abv last) (KD.avM D 0) = KD.abv last &&& KD.avM D 0 from rfl, Nat.testBit_and, KD.testBit_abv,
      KD.testBit_avM, hD]
    simp [hll, hl]
  have hlt1 : Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) r1m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_right hR.r1_lt
  have hlt2 : Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) nr1m < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_right hR.nr1_lt
  have hRA : t1 ≤ (K2.bitsB 511 (Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) r1m)).card := by
    apply KD.card_le_bits; intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨hl5, hll, hAl, hr⟩ := hl
    refine ⟨hl5, ?_⟩
    rw [show Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) r1m = Nat.land (KD.abv last) (KD.avM D 0) &&& r1m from rfl,
      Nat.testBit_and, hav l hll hl5 hAl, (hR.r1_bit l hl5).2 hr]; rfl
  have hRB : t2 ≤ (K2.bitsB 511 (Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) nr1m)).card := by
    apply KD.card_le_bits; intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨hl5, hll, hAl, hr⟩ := hl
    refine ⟨hl5, ?_⟩
    rw [show Nat.land (Nat.land (KD.abv last) (KD.avM D 0)) nr1m = Nat.land (KD.abv last) (KD.avM D 0) &&& nr1m from rfl,
      Nat.testBit_and, hav l hll hl5 hAl, (hR.nr1_bit l hl5).2 hr]; rfl
  unfold winOKO at h
  rw [popcF_min 23 _ hlt1, popcF_min 23 _ hlt2, ← hpre] at h
  rw [hsp] at hlo hhi
  exact winTest_false hsum (by omega) hRA hRB hlo hhi h

end sound

/-! ## One OPEN node: suffix break and the PREFF / DOOM child records -/

/-- one child record: `tag | u << 2 | X << 11` (tag 0 PREFF, 1 DOOM) -/
def itemOKO (vf npf : ℕ → ℕ) (r1m nr1m lo hi S D U d last it : ℕ) : Bool :=
  Nat.blt last (Nat.land (Nat.shiftRight it 2) 511) && Nat.blt (Nat.land (Nat.shiftRight it 2) 511) 511 &&
  cond (Nat.beq (Nat.land it 3) 0) (preffOKO vf npf U d (Nat.land (Nat.shiftRight it 2) 511) (Nat.shiftRight it 11))
    (cond (Nat.beq (Nat.land it 3) 1) (doomOKO r1m nr1m S D d (Nat.land (Nat.shiftRight it 2) 511) lo hi) false)

def itemsOKO (vf npf : ℕ → ℕ) (r1m nr1m lo hi S D U d last : ℕ) (its : List ℕ) : Bool :=
  List.rec (motive := fun _ => Bool) true (fun it _ acc => itemOKO vf npf r1m nr1m lo hi S D U d last it && acc) its

/-- one OPEN node: frame shape, break label `b`, child records -/
def kindsNodeO (vf npf : ℕ → ℕ) (r1m nr1m lo hi S D U d last b : ℕ) (its : List ℕ) : Bool :=
  Nat.beq (Nat.shiftRight S last) 1 && Nat.ble d 21 && KD.sufOK D 0 d b && itemsOKO vf npf r1m nr1m lo hi S D U d last its

theorem itemsOKO_mem {vf npf : ℕ → ℕ} {r1m nr1m lo hi S D U d last : ℕ} : ∀ (its : List ℕ),
    itemsOKO vf npf r1m nr1m lo hi S D U d last its = true → ∀ it ∈ its, itemOKO vf npf r1m nr1m lo hi S D U d last it = true
  | [], _, it, hit => absurd hit List.not_mem_nil
  | x :: xs, h, it, hit => by
    have h' : (itemOKO vf npf r1m nr1m lo hi S D U d last x && itemsOKO vf npf r1m nr1m lo hi S D U d last xs) = true := h
    rw [Bool.and_eq_true] at h'
    rcases List.mem_cons.mp hit with rfl | hm
    · exact h'.1
    · exact itemsOKO_mem xs h'.2 it hm

section sound2
variable {O : LabelOrder}

theorem itemO_sound {vf npf : ℕ → ℕ} {r1m nr1m : ℕ} (hV : VecOK O vf npf) (hR : R1OK O r1m nr1m) {Ω : Spec.Dec22 → Prop}
    {lo hi S D N U d last it : ℕ} (hF : FrameOK O Ω S D N U d) (hS : S >>> last = 1) (hd : d ≤ 21)
    (h : itemOKO vf npf r1m nr1m lo hi S D U d last it = true) :
    ∀ A : Spec.Dec22, Ω A → CaseK lo hi A → ¬ Continues O A S last (Nat.land (Nat.shiftRight it 2) 511) := by
  intro A hΩ hC
  unfold itemOKO at h
  rw [Bool.and_eq_true, Bool.and_eq_true] at h
  obtain ⟨⟨_, _⟩, h⟩ := h
  generalize Nat.land (Nat.shiftRight it 2) 511 = u at h ⊢
  generalize Nat.shiftRight it 11 = X at h
  generalize Nat.land it 3 = tg at h
  cases h0 : Nat.beq tg 0
  · rw [h0, cond_false] at h
    cases h1 : Nat.beq tg 1
    · rw [h1, cond_false] at h; exact absurd h (by decide)
    · rw [h1, cond_true] at h; exact doomO_sound hR hF hS hd h A hΩ hC
  · rw [h0, cond_true] at h; exact preffO_sound hV hF hS hd h A

/-- **The node theorem.**  An accepted node: no decomposition of `Ω` continues it with a child at or after the break label; none
of `Ω ∩ CaseK lo hi` continues it with the child of a PREFF / DOOM record. -/
theorem kindsNodeO_sound {vf npf : ℕ → ℕ} {r1m nr1m : ℕ} (hV : VecOK O vf npf) (hR : R1OK O r1m nr1m)
    {Ω : Spec.Dec22 → Prop} {lo hi S D N U d last b : ℕ} {its : List ℕ} (hF : FrameOK O Ω S D N U d)
    (h : kindsNodeO vf npf r1m nr1m lo hi S D U d last b its = true) :
    (∀ u, b ≤ u → ∀ A : Spec.Dec22, Ω A → ¬ Continues O A S last u) ∧
    (∀ it ∈ its, ∀ A : Spec.Dec22, Ω A → CaseK lo hi A → ¬ Continues O A S last (Nat.land (Nat.shiftRight it 2) 511)) := by
  unfold kindsNodeO at h
  simp only [Bool.and_eq_true, Nat.ble_eq] at h
  obtain ⟨⟨⟨hS, hd⟩, hsuf⟩, hits⟩ := h
  replace hS := KD.beq_true hS
  exact ⟨sufO_sound hF hS hd hsuf, fun it hit => itemO_sound hV hR hF hS hd (itemsOKO_mem its hits it hit)⟩

end sound2

/-! ## The `--rord 321` data -/

theorem vecOK321 : VecOK Top321.O RT.O321.vecL RT.O321.lpar511 where
  vf_eq := fun _ _ => rfl
  np_bit := fun X hX l hl => by
    rw [RT.O321.lpar511_testBit X l hl, ← S5.par_eq _ (lt_of_le_of_lt Nat.and_le_left (RT.O321.vecL_lt l))]; rfl
  np_lt := fun X _ => by
    apply KD.lt511_of_bits; intro i hi
    unfold RT.O321.lpar511
    have key : ∀ k, (Nat.rec (motive := fun _ => ℕ) 0
        (fun j acc => cond (X.testBit j) (acc ^^^ ((RT.O321.LBM >>> (512 * j)) &&& RT.O321.M511)) acc) k).testBit i = false := by
      intro k
      induction k with
      | zero => simp
      | succ k ih =>
        show (cond (X.testBit k) (Nat.rec (motive := fun _ => ℕ) 0
          (fun j acc => cond (X.testBit j) (acc ^^^ ((RT.O321.LBM >>> (512 * j)) &&& RT.O321.M511)) acc) k ^^^
            ((RT.O321.LBM >>> (512 * k)) &&& RT.O321.M511)) (Nat.rec (motive := fun _ => ℕ) 0
          (fun j acc => cond (X.testBit j) (acc ^^^ ((RT.O321.LBM >>> (512 * j)) &&& RT.O321.M511)) acc) k)).testBit i = false
        cases X.testBit k
        · exact ih
        · rw [cond_true, Nat.testBit_xor, ih, Nat.testBit_and, RT.O321.m511_bit]; simp; omega
    exact key 9

theorem r1OK321 : R1OK Top321.O R1M321 NR1M321 where
  r1_bit := fun l hl => by rw [testBit_R1M321, rk1_321]; simp [hl]
  nr1_bit := fun l hl => by rw [testBit_NR1M321, rk1_321]; simp
  r1_lt := R1M321_lt
  nr1_lt := NR1M321_lt

end KD321
