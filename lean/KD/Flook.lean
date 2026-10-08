module
public import R22Port.U_d41d8cd98f00
public import KD.Cuts
public import RootSound.Core
/-! # KD.Flook: the Lemma-R look-ahead cut (prof7 `--flook`, node cut 3) and its soundness

r22/mid/FLOOK.md.  At a node with prefix `S` (`d` labels, `need = 22 - d`) and candidate set `F = labels above last outside
D ∪ W`, every completion takes its `need` labels from `F`, so for a functional `X` the final hits `u(X)` are at most
`hits(S,X) + min(need, |F ∩ H_X|)`, and, for a deficit hyperplane `Y` (`d_Y = 3 rk Y - hits(S,Y) > 0`), at most
`hits(S,X) + need - (d_Y - |F ∩ H_Y ∩ H_X|)`.  With the deficit fact `u(X) ≥ 3 rk X` a bound `≤ 3 rk X` makes `X` tight and a bound
`≤ 3 rk X + 1` makes it tight or slack-1.  A prefix term whose root conditions (RootSound's matrix-form walk) are infeasible
is dead in every leaf below: the node is cut.

* `core_sound_le`: RootSound's `core_sound` with the slack-1 counts relaxed to `≤ 3 rk X + 1` (a tight functional's conditions
  contain the slack-1 ones), and `core_sound_le'` (a tight functional in the list makes `b_t, c_t` nonzero).
* `fbOK`: the bound of one functional (kernel form, `remB` counts); `flookOK`: one cut record; `flook_sound`. -/
@[expose] public section
set_option exponentiation.threshold 1024
noncomputable section
namespace KD
open R3RT R3RT.Spec RootSound BC4 BC5 Classical

section core
variable {n : ℕ} {a b c : Fin n → M3}

theorem slack_or_tight (hd : IsDecomp a b c) (X : Nat) (hX : X < 512) (h0 : X ≠ 0)
    (hle : (hitSet a (toM3 X)).card ≤ 3 * rkOf X + 1) (t : Fin n) (ht : pair (toM3 X) (a t) = 1) :
    (∀ k, memM (qxOf X) (colB (b t) k)) ∨ (∀ k, memM (pxOf X) (rowC (c t) k)) := by
  have hge : 3 * rkOf X ≤ (hitSet a (toM3 X)).card := by
    have h1 := resid_rank_le hd (toM3 X) ∅
    simp only [Finset.inter_empty, Finset.sum_empty, add_zero, Finset.sdiff_empty] at h1
    rw [rank_TX X hX h0] at h1; exact h1
  rcases Nat.eq_or_lt_of_le hge with he | hlt
  · exact Or.inl (tight_mask hd X hX h0 he.symm t ht).1
  · exact slack_mask hd X hX h0 (by omega) t ht

/-- **Root certificate soundness with slack bounds.** -/
theorem core_sound_le (hd : IsDecomp a b c) (t : Fin n) (hb : b t ≠ 0) (hc : c t ≠ 0)
    (nT : Nat) (TL SL : List Nat) (h2 : Nat)
    (hTv : ∀ X ∈ TL, X < 512 ∧ X ≠ 0) (hSv : ∀ X ∈ SL, X < 512 ∧ X ≠ 0)
    (hT : ∀ X ∈ TL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X)
    (hS : ∀ X ∈ SL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card ≤ 3 * rkOf X + 1)
    (hw : RootCheck.walk nT TL SL 64 h2 (RootCheck.q0 TL) (RootCheck.p0 TL) 0 = true) : False := by
  obtain ⟨hQ, hP, hQ8, hP8⟩ := q0_mem hd t TL hTv hT
  have htr : ∀ X ∈ TL, trZ (toM3 (zxOf X)) (b t) (c t) = 1 := fun X hX =>
    (tight_mask hd X (hTv X hX).1 (hTv X hX).2 (hT X hX).2 t (hT X hX).1).2.2
  refine walk_sound nT TL SL hTv hSv (b t) (c t) hb hc htr 64 h2 _ _ 0 hQ8 hP8 hw hQ hP ?_
  intro j _ hj
  have hm := getD_mem SL j hj
  exact slack_or_tight hd _ (hSv _ hm).1 (hSv _ hm).2 (hS _ hm).2 t (hS _ hm).1

theorem core_sound_le' (hd : IsDecomp a b c) (t : Fin n)
    (nT : Nat) (X0 : Nat) (TL SL : List Nat) (h2 : Nat)
    (hTv : ∀ X ∈ X0 :: TL, X < 512 ∧ X ≠ 0) (hSv : ∀ X ∈ SL, X < 512 ∧ X ≠ 0)
    (hT : ∀ X ∈ X0 :: TL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card = 3 * rkOf X)
    (hS : ∀ X ∈ SL, pair (toM3 X) (a t) = 1 ∧ (hitSet a (toM3 X)).card ≤ 3 * rkOf X + 1)
    (hw : RootCheck.walk nT (X0 :: TL) SL 64 h2 (RootCheck.q0 (X0 :: TL)) (RootCheck.p0 (X0 :: TL)) 0 = true) :
    False := by
  obtain ⟨hX5, hX0⟩ := hTv X0 (List.mem_cons_self ..)
  obtain ⟨hpX, hcX⟩ := hT X0 (List.mem_cons_self ..)
  have hr : (TX (toM3 X0)).rank = (hitSet a (toM3 X0)).card := by rw [rank_TX X0 hX5 hX0, hcX]
  obtain ⟨h1, _, h3⟩ := term_tight hd (toM3 X0) hr t hpX
  have hb : b t ≠ 0 := by
    intro hb0
    have := h3 0 (by rw [hb0]; funext y; simp [vecB, Matrix.mulVec, dotProduct])
    simp at this
  have hc : c t ≠ 0 := by
    intro hc0
    obtain ⟨x0, hx0⟩ := h1
    have := h3 x0 hx0
    rw [hc0] at this
    simp [vecC, dotProduct] at this
  exact core_sound_le hd t hb hc nT (X0 :: TL) SL h2 hTv hSv hT hS hw

end core

/-! ## The bound of one functional -/

/-- final hits of `X` at most `3 rk X + c`, from the node's counters `U`, depth `d`, candidate set `F` and an optional deficit
hyperplane `Y` (0: none) -/
def fbOK (U d F X c Y : ℕ) : Bool :=
  Nat.ble (fld7 U X) (Nat.add (Nat.mul 3 (rkOf X)) c) &&
  (Nat.ble (Nat.add (fld7 U X) (Nat.sub 22 d)) (Nat.add (Nat.mul 3 (rkOf X)) c) ||
   Nat.beq (K2.remB (Nat.land F (nperpL X)) (Nat.sub (Nat.add (Nat.mul 3 (rkOf X)) c) (fld7 U X))) 0 ||
   (Nat.blt 0 Y && Nat.blt Y 512 && Nat.blt (fld7 U Y) (Nat.mul 3 (rkOf Y)) &&
    Nat.ble (Nat.sub 22 d) (Nat.add (Nat.sub (Nat.add (Nat.mul 3 (rkOf X)) c) (fld7 U X)) (Nat.sub (Nat.mul 3 (rkOf Y)) (fld7 U Y))) &&
    Nat.beq (K2.remB (Nat.land (Nat.land F (nperpL X)) (nperpL Y))
      (Nat.sub (Nat.add (Nat.sub (Nat.add (Nat.mul 3 (rkOf X)) c) (fld7 U X)) (Nat.sub (Nat.mul 3 (rkOf Y)) (fld7 U Y))) (Nat.sub 22 d))) 0))

theorem fb_soundU {Ω : Dec22 → Prop} {S D N U W d last X c Y : ℕ} (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (hS : S >>> last = 1) (hd : d ≤ 22) (hX0 : 0 < X) (hX : X < 512)
    (h : fbOK U d (Nat.land (avM D W) (abv last)) X c Y = true) (A : Dec22) (hΩ : Ω A) (hA : Below A S last) :
    ((Finset.range 511).filter (fun l => A.Has l ∧ par (vecL l &&& X) = true)).card ≤ 3 * rkOf X + c := by
  obtain ⟨_, _, hcard, hU⟩ := frameOKU_basic hF
  have hlast := shr_one_lastOf hS
  have hbel : Below A S (lastOf S) := by rw [hlast]; exact hA
  have hfl : ∀ Z, Z < 512 → fld7 U Z = hits S Z := fun Z hZ => by rw [hU]; exact fld7_packU S Z d hZ hcard (by omega)
  -- every label of A above last lies in F
  have hinF : ∀ l, last < l → l < 511 → A.Has l → (Nat.land (avM D W) (abv last)).testBit l = true := by
    intro l hll hl5 hAl
    have hD : D.testBit l = false := by
      cases hDl : D.testBit l
      · rfl
      · exact absurd hAl ((frameOKU_apply hF A hΩ hbel).1 l (by rw [hlast]; exact hll) hl5 hDl)
    have hWl : W.testBit l = false := by
      cases hWl : W.testBit l
      · rfl
      · exact absurd hAl (hW A hΩ hbel l (by rw [hlast]; exact hll) hl5 hWl)
    rw [show Nat.land (avM D W) (abv last) = avM D W &&& abv last from rfl, Nat.testBit_and, testBit_avM, testBit_abv, hD, hWl]
    simp [hl5, hll]
  have hsp := below_split hS hA (fun l => par (vecL l &&& X) = true)
  have hT1 : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& X) = true))).card ≤ 22 - d := by
    rw [← below_above_card hS hA d hcard]
    exact Finset.card_le_card (fun l => by simp only [Finset.mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩)
  have hFlt : Nat.land (avM D W) (abv last) < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left (avM_lt D W)
  have hhX := hfl X hX
  unfold hits at hhX
  unfold fbOK at h
  simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.ble_eq, Nat.blt_eq] at h
  obtain ⟨h0, h⟩ := h
  simp only [Nat.add_eq, Nat.sub_eq, Nat.mul_eq] at h0 h
  rw [hhX] at h0 h
  rw [hsp]
  rcases h with (h1 | h1) | ⟨⟨⟨⟨hY0, hY⟩, hdY⟩, hge⟩, h1⟩
  · omega
  · replace h1 := beq_true h1
    have hx : Nat.land (Nat.land (avM D W) (abv last)) (nperpL X) < 2 ^ 511 := lt_of_le_of_lt Nat.and_le_left hFlt
    have hc := remB_card_le hx h1
    have hsub : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& X) = true))).card ≤ (K2.bitsB 511 (Nat.land (Nat.land (avM D W) (abv last)) (nperpL X))).card := by
      apply card_le_bits; intro l hl
      simp only [Finset.mem_filter, Finset.mem_range] at hl
      obtain ⟨hl5, hll, hAl, hp⟩ := hl
      refine ⟨hl5, ?_⟩
      rw [show Nat.land (Nat.land (avM D W) (abv last)) (nperpL X) = Nat.land (avM D W) (abv last) &&& nperpL X from rfl,
        Nat.testBit_and, hinF l hll hl5 hAl, nperpL_bit X l hX hl5, hp]; rfl
    omega
  · replace h1 := beq_true h1
    have hhY := hfl Y hY
    unfold hits at hhY
    rw [hhY] at hdY hge h1
    have hFXY : Nat.land (Nat.land (Nat.land (avM D W) (abv last)) (nperpL X)) (nperpL Y) < 2 ^ 511 :=
      lt_of_le_of_lt Nat.and_le_left (lt_of_le_of_lt Nat.and_le_left hFlt)
    have hc := remB_card_le hFXY h1
    -- the deficit fact for Y
    have hdefY := deficit_lab A Y hY0 hY
    have hspY := below_split hS hA (fun l => par (vecL l &&& Y) = true)
    rw [hspY] at hdefY
    -- tail of Y splits by X
    have hY2 : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& Y) = true))).card =
        ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& Y) = true ∧ par (vecL l &&& X) = true))).card +
        ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& Y) = true ∧ ¬ par (vecL l &&& X) = true))).card := by
      rw [← Finset.card_union_of_disjoint]
      · apply congrArg Finset.card; ext l; simp only [Finset.mem_filter, Finset.mem_union, Finset.mem_range]
        constructor
        · rintro ⟨hl, h1, h2, h3⟩
          by_cases hx : par (vecL l &&& X) = true
          · exact Or.inl ⟨hl, h1, h2, h3, hx⟩
          · exact Or.inr ⟨hl, h1, h2, h3, hx⟩
        · rintro (⟨hl, h1, h2, h3, _⟩ | ⟨hl, h1, h2, h3, _⟩) <;> exact ⟨hl, h1, h2, h3⟩
      · rw [Finset.disjoint_filter]; rintro l _ ⟨_, _, _, hx⟩ ⟨_, _, _, hx'⟩; exact hx' hx
    have hXY : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& Y) = true ∧ par (vecL l &&& X) = true))).card ≤
        (K2.bitsB 511 (Nat.land (Nat.land (Nat.land (avM D W) (abv last)) (nperpL X)) (nperpL Y))).card := by
      apply card_le_bits; intro l hl
      simp only [Finset.mem_filter, Finset.mem_range] at hl
      obtain ⟨hl5, hll, hAl, hpY, hpX⟩ := hl
      refine ⟨hl5, ?_⟩
      rw [show Nat.land (Nat.land (Nat.land (avM D W) (abv last)) (nperpL X)) (nperpL Y) =
          Nat.land (avM D W) (abv last) &&& nperpL X &&& nperpL Y from rfl,
        Nat.testBit_and, Nat.testBit_and, hinF l hll hl5 hAl, nperpL_bit X l hX hl5, nperpL_bit Y l hY hl5, hpX, hpY]; rfl
    -- X-tail and the (Y, not X)-tail are disjoint parts of A's labels above last
    have hdisj : ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& X) = true))).card +
        ((Finset.range 511).filter (fun l => last < l ∧ A.Has l ∧ (par (vecL l &&& Y) = true ∧ ¬ par (vecL l &&& X) = true))).card ≤ 22 - d := by
      rw [← below_above_card hS hA d hcard]
      rw [← Finset.card_union_of_disjoint]
      · apply Finset.card_le_card; intro l hl
        simp only [Finset.mem_union, Finset.mem_filter, Finset.mem_range] at hl ⊢
        rcases hl with ⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩
        · exact ⟨hl, h1, h2⟩
        · exact ⟨hl, h1, h2⟩
      · rw [Finset.disjoint_filter]; rintro l _ ⟨_, _, hx⟩ ⟨_, _, _, hx'⟩; exact hx' hx
    omega

/-! ## The cut record -/

/-- every functional `X` of the list (with its deficit hyperplane `Y` from the parallel list) passes through the term `a` and
has final hits at most `3 rk X + c` -/
def fbAll (U d F a c : ℕ) : List ℕ → List ℕ → Bool
  | [], [] => true
  | X :: Xs, Y :: Ys => Nat.blt 0 X && Nat.blt X 512 && RootCheck.hitsOne X a && fbOK U d F X c Y && fbAll U d F a c Xs Ys
  | _, _ => false

/-- node cut 3: dead prefix term `t` (a label of `S`), tight list `TL` (deficits `TY`), slack list `SL` (`SY`), walk hint `h2` -/
def flookOK (S D U W d last t nT h2 : ℕ) (TL TY SL SY : List ℕ) : Bool :=
  Nat.beq (Nat.shiftRight S last) 1 && Nat.ble d 22 && S.testBit t && Nat.blt t 511 &&
  fbAll U d (Nat.land (avM D W) (abv last)) (vecL t) 0 TL TY &&
  fbAll U d (Nat.land (avM D W) (abv last)) (vecL t) 1 SL SY &&
  RootCheck.walk nT TL SL 64 h2 (RootCheck.q0 TL) (RootCheck.p0 TL) 0

theorem fbAll_mem {U d F a c : ℕ} : ∀ (Xs Ys : List ℕ), fbAll U d F a c Xs Ys = true →
    ∀ X ∈ Xs, ∃ Y, 0 < X ∧ X < 512 ∧ RootCheck.hitsOne X a = true ∧ fbOK U d F X c Y = true
  | [], [], _, X, hX => absurd hX List.not_mem_nil
  | [], _ :: _, h, _, _ => by simp [fbAll] at h
  | _ :: _, [], h, _, _ => by simp [fbAll] at h
  | X' :: Xs, Y' :: Ys, h, X, hX => by
    simp only [fbAll, Bool.and_eq_true, Nat.blt_eq] at h
    obtain ⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩ := h
    rcases List.mem_cons.mp hX with rfl | hm
    · exact ⟨Y', h0, h1, h2, h3⟩
    · exact fbAll_mem Xs Ys h4 X hm

/-- the hit set of a decomposition's terms is the count over its labels -/
theorem hitSet_card (A : Dec22) (X : ℕ) (hX : X < 512) :
    (hitSet (fun s => toM3 (A.av s)) (toM3 X)).card =
      ((Finset.range 511).filter (fun l => A.Has l ∧ par (vecL l &&& X) = true)).card := by
  unfold hitSet
  rw [card_terms A (fun v => pair (toM3 X) (toM3 v) = 1)]
  apply card_filter_congr; intro l hl; rw [Finset.mem_range] at hl
  rw [pair_eq_one_iff X _ hX (vecL_lt l), par_eq_hitsOne]

theorem hitSet_ge (A : Dec22) (X : ℕ) (hX0 : 0 < X) (hX : X < 512) :
    3 * rkOf X ≤ (hitSet (fun s => toM3 (A.av s)) (toM3 X)).card := by
  rw [hitSet_card A X hX]; exact deficit_lab A X hX0 hX

/-- **The look-ahead cut.**  An accepted record with a nonempty tight list proves the node empty. -/
theorem flook_soundU {Ω : Dec22 → Prop} {S D N U W d last t nT h2 : ℕ} {X0 : ℕ} {TL TY SL SY : List ℕ}
    (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W) (h : flookOK S D U W d last t nT h2 (X0 :: TL) TY SL SY = true) :
    ∀ A : Dec22, Ω A → ¬ Below A S last := by
  intro A hΩ hA
  unfold flookOK at h
  simp only [Bool.and_eq_true, Nat.ble_eq, Nat.blt_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨hS, hd⟩, ht⟩, ht5⟩, hTL⟩, hSL⟩, hw⟩ := h
  replace hS := beq_true hS
  have htl : t ≤ last := by
    by_contra hc; push Not at hc; rw [shr_one_bit hS t (by omega)] at ht; simp at ht; omega
  obtain ⟨s, hs⟩ := (has_iff A t).1 ((hA t ht5 htl).2 ht)
  have has : A.av s = vecL t := by rw [← (labT_spec A s).2, hs]
  have hpair : ∀ X, X < 512 → RootCheck.hitsOne X (vecL t) = true → pair (toM3 X) ((fun s => toM3 (A.av s)) s) = 1 := by
    intro X hX hh; simp only; rw [has, pair_eq_one_iff X _ hX (vecL_lt t)]; exact hh
  refine core_sound_le' A.dec s nT X0 TL SL h2 ?_ ?_ ?_ ?_ hw
  · intro X hX; obtain ⟨_, h0, h1, _, _⟩ := fbAll_mem _ _ hTL X hX; exact ⟨h1, by omega⟩
  · intro X hX; obtain ⟨_, h0, h1, _, _⟩ := fbAll_mem _ _ hSL X hX; exact ⟨h1, by omega⟩
  · intro X hX
    obtain ⟨Y, h0, h1, h2', h3⟩ := fbAll_mem _ _ hTL X hX
    refine ⟨hpair X h1 h2', le_antisymm ?_ (hitSet_ge A X h0 h1)⟩
    rw [hitSet_card A X h1]; simpa using fb_soundU hF hW hS hd h0 h1 h3 A hΩ hA
  · intro X hX
    obtain ⟨Y, h0, h1, h2', h3⟩ := fbAll_mem _ _ hSL X hX
    refine ⟨hpair X h1 h2', ?_⟩
    rw [hitSet_card A X h1]; exact fb_soundU hF hW hS hd h0 h1 h3 A hΩ hA

end KD

namespace KD
open R3RT R3RT.Spec

/-- a cut-3 record with a nonempty tight list -/
def flookRec (S D U W d last t nT h2 : ℕ) (TL TY SL SY : List ℕ) : Bool :=
  match TL with
  | [] => false
  | X0 :: TL' => flookOK S D U W d last t nT h2 (X0 :: TL') TY SL SY

theorem flookRec_soundU {Ω : Dec22 → Prop} {S D N U W d last t nT h2 : ℕ} {TL TY SL SY : List ℕ}
    (hF : FrameOKU Ω S D N U d) (hW : BlockOKU Ω S W)
    (h : flookRec S D U W d last t nT h2 TL TY SL SY = true) : ∀ A : Dec22, Ω A → ¬ Below A S last := by
  cases TL with
  | nil => simp [flookRec] at h
  | cons X0 TL' => exact flook_soundU hF hW h

open R3RT R3RT.Spec RootSound BC4 BC5 Classical
theorem fb_sound {S D N U W d last X c Y : ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W) (hS : S >>> last = 1)
    (hd : d ≤ 22) (hX0 : 0 < X) (hX : X < 512) (h : fbOK U d (Nat.land (avM D W) (abv last)) X c Y = true) (A : Dec22)
    (hA : Below A S last) :
    ((Finset.range 511).filter (fun l => A.Has l ∧ par (vecL l &&& X) = true)).card ≤ 3 * rkOf X + c :=
  fb_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) hS hd hX0 hX h A trivial hA

theorem flook_sound {S D N U W d last t nT h2 : ℕ} {X0 : ℕ} {TL TY SL SY : List ℕ} (hF : FrameOK S D N U d)
    (hW : BlockOK S W) (h : flookOK S D U W d last t nT h2 (X0 :: TL) TY SL SY = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => flook_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) h A trivial

theorem flookRec_sound {S D N U W d last t nT h2 : ℕ} {TL TY SL SY : List ℕ} (hF : FrameOK S D N U d) (hW : BlockOK S W)
    (h : flookRec S D U W d last t nT h2 TL TY SL SY = true) : ∀ A : Dec22, ¬ Below A S last :=
  fun A => flookRec_soundU (frameOKU_of5 hF) (blockOKU_of5 hW) h A trivial

/-- a batch of cut-3 records `(S, D, U, W, d, last, t, nT, h2, TL, TY, SL, SY)` (timing) -/
def flookBatch (rs : List (ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × ℕ × List ℕ × List ℕ × List ℕ × List ℕ)) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun x _ acc => flookRec x.1 x.2.1 x.2.2.1 x.2.2.2.1 x.2.2.2.2.1 x.2.2.2.2.2.1 x.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.1
      x.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2.2.2.1 x.2.2.2.2.2.2.2.2.2.2.2.2 && acc) rs

end KD
