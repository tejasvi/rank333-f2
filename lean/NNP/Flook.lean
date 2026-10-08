module
public import R22Port.U_427bc8db676f
public import NNP.Dead
public import NNP.Cut
public import NNP.Node0
public import NN.Flook
public import KD.Flook
public import RootSound.Leaf
/-! # NNP.Flook: soundness of the native look-ahead cut (node cut 3, leaf code 4)

* `rc_*`: the copied root checker `NN.RC` is RootSound's `RootCheck` (tables by `rfl`, recursive functions by induction);
* `fbN_sound`: an accepted bound of one functional `X` at a valid frame bounds the final hits of `X` of every decomposition of `Ω`
  below the node by `3 rk X + c` (`KD321.fbO_sound`'s argument with native counts);
* **`flookChk_sound`**: an accepted look-ahead record at a valid frame refutes every decomposition of `Ω` below the node
  (`KD.core_sound_le'`, RootSound's root certificate with slack bounds). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO Finset Classical BC4 BC5 RootSound
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-! ## The copied root checker -/

theorem rc_PAR : NN.RC.PAR = RootCheck.PAR := rfl
theorem rc_RKT : NN.RC.RKT = RootCheck.RKT := rfl
theorem rc_QXT : NN.RC.QXT = RootCheck.QXT := rfl
theorem rc_PXT : NN.RC.PXT = RootCheck.PXT := rfl
theorem rc_FZT : NN.RC.FZT = RootCheck.FZT := rfl
theorem rc_SPREAD : NN.RC.SPREAD = RootCheck.SPREAD := rfl

theorem rc_bit (n i : ℕ) : NN.RC.bit n i = RootCheck.bit n i := rfl
theorem rc_hitsOne (X a : ℕ) : NN.RC.hitsOne X a = RootCheck.hitsOne X a := by
  unfold NN.RC.hitsOne RootCheck.hitsOne; rw [rc_bit, rc_PAR]
theorem rc_rk (X : ℕ) : NN.RC.rk X = RootCheck.rk X := by unfold NN.RC.rk RootCheck.rk; rw [rc_RKT]
theorem rc_qx (X : ℕ) : NN.RC.qx X = RootCheck.qx X := by unfold NN.RC.qx RootCheck.qx; rw [rc_QXT]
theorem rc_px (X : ℕ) : NN.RC.px X = RootCheck.px X := by unfold NN.RC.px RootCheck.px; rw [rc_PXT]
theorem rc_fz (X : ℕ) : NN.RC.fz X = RootCheck.fz X := by unfold NN.RC.fz RootCheck.fz; rw [rc_FZT]
theorem rc_outer (P Q : ℕ) : NN.RC.outer P Q = RootCheck.outer P Q := by
  unfold NN.RC.outer RootCheck.outer; rw [rc_SPREAD]

theorem rc_q0 : ∀ L : List ℕ, NN.RC.q0 L = RootCheck.q0 L
  | [] => rfl
  | X :: Xs => by simp only [NN.RC.q0, RootCheck.q0, rc_q0 Xs, rc_rk, rc_qx]
theorem rc_p0 : ∀ L : List ℕ, NN.RC.p0 L = RootCheck.p0 L
  | [] => rfl
  | X :: Xs => by simp only [NN.RC.p0, RootCheck.p0, rc_p0 Xs, rc_rk, rc_px]
theorem rc_zsum : ∀ (L : List ℕ) (S : ℕ), NN.RC.zsum L S = RootCheck.zsum L S
  | [], _ => rfl
  | X :: Xs, S => by simp only [NN.RC.zsum, RootCheck.zsum, rc_zsum Xs, rc_bit, rc_fz]
theorem rc_oddSel : ∀ (L : List ℕ) (S : ℕ), NN.RC.oddSel L S = RootCheck.oddSel L S
  | [], _ => rfl
  | X :: Xs, S => by simp only [NN.RC.oddSel, RootCheck.oddSel, rc_oddSel Xs, rc_bit]
theorem rc_getD : ∀ (L : List ℕ) (n : ℕ), NN.RC.getD L n = RootCheck.getD L n
  | [], _ => rfl
  | x :: _, 0 => rfl
  | _ :: xs, n + 1 => by simp only [NN.RC.getD, RootCheck.getD, rc_getD xs n]

theorem rc_walk (nT : ℕ) (TL SL : List ℕ) : ∀ (fuel h Q P i : ℕ),
    NN.RC.walk nT TL SL fuel h Q P i = RootCheck.walk nT TL SL fuel h Q P i
  | 0, _, _, _, _ => rfl
  | fuel + 1, h, Q, P, i => by
    simp only [NN.RC.walk, RootCheck.walk, rc_bit, rc_getD, rc_qx, rc_px, rc_oddSel, rc_zsum, rc_outer,
      rc_walk nT TL SL fuel]

/-! ## Native counts -/

theorem natF_and_bit (f : ℕ → UInt64) (n l : ℕ) :
    (natF f n).testBit l = (decide (l < 64 * n) && (f (l / 64)).toNat.testBit (l % 64)) := natF_testBit f n l

theorem natL_bit512 (a : Array UInt64) (l : ℕ) (hl : l < 512) :
    (natL a 0 8).testBit l = (a.getD (l / 64) 0).toNat.testBit (l % 64) := by
  rw [natL_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, getElem!_eq_getD', Nat.zero_add]

theorem pop2_card (a b : Array UInt64) :
    pop2 a b = ((range 512).filter (fun l => (natL a 0 8).testBit l = true ∧ (natL b 0 8).testBit l = true)).card := by
  unfold pop2
  rw [sumN_eq, sum_pop_eq, L5.pcnt_eq_card]
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range]
  constructor
  · rintro ⟨hl, h⟩
    rw [natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and] at h
    simp only [Bool.and_eq_true] at h
    exact ⟨by omega, by rw [natL_bit512 _ _ (by omega)]; exact h.1, by rw [natL_bit512 _ _ (by omega)]; exact h.2⟩
  · rintro ⟨hl, h1, h2⟩
    refine ⟨hl, ?_⟩
    rw [natL_bit512 _ _ hl] at h1 h2
    rw [natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and, h1, h2]; rfl

theorem pop3_card (a b c : Array UInt64) :
    pop3 a b c = ((range 512).filter (fun l => (natL a 0 8).testBit l = true ∧ (natL b 0 8).testBit l = true ∧
      (natL c 0 8).testBit l = true)).card := by
  unfold pop3
  rw [sumN_eq, sum_pop_eq, L5.pcnt_eq_card]
  apply congrArg Finset.card; ext l
  simp only [mem_filter, mem_range]
  constructor
  · rintro ⟨hl, h⟩
    rw [natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and, tb_and] at h
    simp only [Bool.and_eq_true] at h
    exact ⟨by omega, by rw [natL_bit512 _ _ (by omega)]; exact h.1.1, by rw [natL_bit512 _ _ (by omega)]; exact h.1.2,
      by rw [natL_bit512 _ _ (by omega)]; exact h.2⟩
  · rintro ⟨hl, h1, h2, h3⟩
    refine ⟨hl, ?_⟩
    rw [natL_bit512 _ _ hl] at h1 h2 h3
    rw [natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and, tb_and, tb_and, h1, h2, h3]; rfl

theorem availAbove_bit (D : Array UInt64) (last l : ℕ) (hl5 : l < 511) (hll : last < l)
    (hD : (natL D 0 8).testBit l = false) : (natL (availAbove D last) 0 8).testBit l = true := by
  unfold availAbove
  rw [natL_range_map, natF_testBit, decide_eq_true (show l < 64 * 8 by omega), Bool.true_and]
  unfold availW
  have hj : l % 64 < 64 := Nat.mod_lt _ (by norm_num)
  have hk : l / 64 < 8 := by omega
  rw [tb_and, tb_and, tb_not, aboveW_bit _ _ _ hj hk, aboveW_bit _ _ _ hj hk, show 64 * (l / 64) + l % 64 = l by omega,
    decide_eq_true hj, ← natL_bit512 _ _ (by omega), hD]
  simp only [Bool.not_false, Bool.true_and, Bool.and_eq_true, decide_eq_true_eq]
  omega

/-- the hits of a decomposition's labels on `X` -/
theorem hitSet_card (A : R3RT.Spec.Dec22) (X : ℕ) (hX : X < 512) :
    (hitSet (fun s => toM3 (A.av s)) (toM3 X)).card =
      ((range 511).filter (fun l => Has O A l ∧ par (O.vec l &&& X) = true)).card := by
  unfold hitSet
  rw [NNP.KC.card_termsO O A (fun v => pair (toM3 X) (toM3 v) = 1)]
  apply KD.card_filter_congr; intro l hl; rw [mem_range] at hl
  rw [pair_eq_one_iff X _ hX (O.vec_lt l hl), KD.par_eq_hitsOne]

/-! ## One functional's bound -/

theorem fbN_sound (ks : KStatics) (hK : KStatOK O ks) {S D' : Array UInt64} {N d last X c Y : ℕ} {U : ByteArray}
    (hF : FrameOK O Ω (natL S 0 8) (natL D' 0 8) N (natU U) d) (hU : ∀ j, j < 512 → (U.get! j).toNat < 128)
    (hS : natL S 0 8 >>> last = 1) (hd : d ≤ 22) (hX : X < 512)
    (h : fbN ks U d (availAbove D' last) X c Y = true) (A : R3RT.Spec.Dec22) (hΩ : Ω A)
    (hA : Below O A (natL S 0 8) last) :
    ((range 511).filter (fun l => Has O A l ∧ par (O.vec l &&& X) = true)).card ≤ 3 * rkOf X + c := by
  have hcard := hF.2.2.1
  have hlastOf := KD.shr_one_lastOf hS
  have hB' : Below O A (natL S 0 8) (R3RT.Spec.lastOf (natL S 0 8)) := by rw [hlastOf]; exact hA
  have hinF : ∀ l, last < l → l < 511 → Has O A l → (natL (availAbove D' last) 0 8).testBit l = true :=
    fun l hll hl5 hAl => availAbove_bit D' last l hl5 hll (frame_notD' hF hS hΩ hB' l hll hl5 hAl)
  have hsp := NNP.KC.below_splitO hS hA (fun l => par (O.vec l &&& X) = true)
  have hT1 : ((range 511).filter (fun l => last < l ∧ Has O A l ∧ par (O.vec l &&& X) = true)).card ≤ 22 - d := by
    rw [← NNP.KC.below_above_cardO hS hA d hcard]
    apply card_le_card; intro l; simp only [mem_filter]; rintro ⟨h1, h2, h3, _⟩; exact ⟨h1, h2, h3⟩
  have hhX := frame_hits hF (by omega) hU X hX
  unfold hits at hhX
  have hnp : ∀ Z l, Z < 512 → l < 511 → (natL (ks.np.getD Z #[]) 0 8).testBit l = par (O.vec l &&& Z) := by
    intro Z l hZ hl
    rw [hK.np Z hZ, npOf_bit, decide_eq_true hl, Bool.true_and, hK.vec l hl, parN_eq _ (lt_of_le_of_lt Nat.and_le_right hZ)]
  unfold fbN at h
  simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨h0, h⟩ := h
  rw [hK.rk X hX, hhX] at h0 h
  rw [hsp]
  rcases h with (h1 | h1) | ⟨⟨⟨⟨hY0, hY⟩, hdY⟩, hge⟩, h1⟩
  · omega
  · have hsub : ((range 511).filter (fun l => last < l ∧ Has O A l ∧ par (O.vec l &&& X) = true)).card ≤
        pop2 (availAbove D' last) (ks.np.getD X #[]) := by
      rw [pop2_card]; apply card_le_card; intro l hl
      simp only [mem_filter, mem_range] at hl ⊢
      obtain ⟨hl5, hll, hAl, hp⟩ := hl
      exact ⟨by omega, hinF l hll hl5 hAl, by rw [hnp X l hX hl5]; exact hp⟩
    omega
  · have hhY := frame_hits hF (by omega) hU Y hY
    unfold hits at hhY
    rw [hK.rk Y hY, hhY] at hdY hge h1
    have hdefY := NNP.KC.deficit_labO O A Y hY0 hY
    have hspY := NNP.KC.below_splitO hS hA (fun l => par (O.vec l &&& Y) = true)
    rw [hspY] at hdefY
    have hY2 : ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& Y) = true))).card =
        ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& Y) = true ∧ par (O.vec l &&& X) = true))).card +
        ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& Y) = true ∧ ¬ par (O.vec l &&& X) = true))).card := by
      rw [← card_union_of_disjoint]
      · apply congrArg Finset.card; ext l; simp only [mem_filter, mem_union, mem_range]
        constructor
        · rintro ⟨hl, h1, h2, h3⟩
          by_cases hx : par (O.vec l &&& X) = true
          · exact Or.inl ⟨hl, h1, h2, h3, hx⟩
          · exact Or.inr ⟨hl, h1, h2, h3, hx⟩
        · rintro (⟨hl, h1, h2, h3, _⟩ | ⟨hl, h1, h2, h3, _⟩) <;> exact ⟨hl, h1, h2, h3⟩
      · rw [disjoint_filter]; rintro l _ ⟨_, _, _, hx⟩ ⟨_, _, _, hx'⟩; exact hx' hx
    have hXY : ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& Y) = true ∧ par (O.vec l &&& X) = true))).card ≤
        pop3 (availAbove D' last) (ks.np.getD X #[]) (ks.np.getD Y #[]) := by
      rw [pop3_card]; apply card_le_card; intro l hl
      simp only [mem_filter, mem_range] at hl ⊢
      obtain ⟨hl5, hll, hAl, hpY, hpX⟩ := hl
      exact ⟨by omega, hinF l hll hl5 hAl, by rw [hnp X l hX hl5]; exact hpX, by rw [hnp Y l hY hl5]; exact hpY⟩
    have hdisj : ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& X) = true))).card +
        ((range 511).filter (fun l => last < l ∧ Has O A l ∧ (par (O.vec l &&& Y) = true ∧ ¬ par (O.vec l &&& X) = true))).card ≤ 22 - d := by
      rw [← NNP.KC.below_above_cardO hS hA d hcard]
      rw [← card_union_of_disjoint]
      · apply card_le_card; intro l hl
        simp only [mem_union, mem_filter, mem_range] at hl ⊢
        rcases hl with ⟨hl, h1, h2, _⟩ | ⟨hl, h1, h2, _⟩
        · exact ⟨hl, h1, h2⟩
        · exact ⟨hl, h1, h2⟩
      · rw [disjoint_filter]; rintro l _ ⟨_, _, hx⟩ ⟨_, _, _, hx'⟩; exact hx' hx
    have hSY : ((range 511).filter (fun l => (natL S 0 8).testBit l = true ∧ par (O.vec l &&& Y) = true)).card =
        hits O (natL S 0 8) Y := rfl
    omega

/-! ## The look-ahead record -/

theorem fbAllN_mem (ks : KStatics) (U : ByteArray) (d : ℕ) (F : Array UInt64) (a c : ℕ) : ∀ (Xs Ys : List ℕ),
    fbAllN ks U d F a c Xs Ys = true → ∀ X ∈ Xs, ∃ Y, 0 < X ∧ X < 512 ∧ NN.RC.hitsOne X a = true ∧ fbN ks U d F X c Y = true
  | [], [], _, X, hX => absurd hX List.not_mem_nil
  | [], _ :: _, h, _, _ => by simp [fbAllN] at h
  | _ :: _, [], h, _, _ => by simp [fbAllN] at h
  | X' :: Xs, Y' :: Ys, h, X, hX => by
    simp only [fbAllN, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩ := h
    rcases List.mem_cons.mp hX with rfl | hm
    · exact ⟨Y', h0, h1, h2, h3⟩
    · exact fbAllN_mem ks U d F a c Xs Ys h4 X hm

/-- **the look-ahead cut**: an accepted record at a valid frame refutes every decomposition of `Ω` below the node -/
theorem flookChk_sound (ks : KStatics) (hK : KStatOK O ks) {S D' : Array UInt64} {N d last : ℕ} {U : ByteArray}
    (hF : FrameOK O Ω (natL S 0 8) (natL D' 0 8) N (natU U) d) (hU : ∀ j, j < 512 → (U.get! j).toNat < 128)
    (hS : natL S 0 8 >>> last = 1) (r : FlookRec) (h : flookChk ks S D' U d last r = true)
    (hbc : ∀ A : R3RT.Spec.Dec22, Ω A → ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) :
    ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Below O A (natL S 0 8) last := by
  intro A hΩ hA
  unfold flookChk at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨hlt5, hbit⟩, hle⟩, hd⟩, hTL⟩, hSL⟩, hw⟩ := h
  rw [bit8_eq _ _ (by omega)] at hbit
  obtain ⟨_, s, has⟩ := (hA r.lt hlt5 hle).2 hbit
  have hvt : ks.vec.getD r.lt 0 = O.vec r.lt := hK.vec r.lt hlt5
  have hpair : ∀ X, X < 512 → NN.RC.hitsOne X (ks.vec.getD r.lt 0) = true →
      pair (toM3 X) ((fun s => toM3 (A.av s)) s) = 1 := by
    intro X hX hh; simp only
    rw [has, pair_eq_one_iff X _ hX (O.vec_lt r.lt hlt5), ← hvt, ← rc_hitsOne]; exact hh
  cases hTLc : r.TL with
  | nil =>
    -- no tight functional: the walk splits on slack functionals only; `b`, `c` of the term are nonzero by `hbc`
    rw [hTLc] at hTL hw
    rw [rc_walk, rc_q0, rc_p0] at hw
    refine KD.core_sound_le A.dec s (hbc A hΩ s).1 (hbc A hΩ s).2 ([] : List ℕ).length [] r.SL r.h2 ?_ ?_ ?_ ?_ hw
    · intro X hX; simp at hX
    · intro X hX; obtain ⟨_, h0, h1, _, _⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hSL X hX; exact ⟨h1, by omega⟩
    · intro X hX; simp at hX
    · intro X hX
      obtain ⟨Y, h0, h1, h2', h3⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hSL X hX
      refine ⟨hpair X h1 h2', ?_⟩
      rw [hitSet_card (O := O) A X h1]; exact fbN_sound ks hK hF hU hS hd h1 h3 A hΩ hA
  | cons X0 TL' =>
    rw [hTLc] at hTL hw
    rw [rc_walk, rc_q0, rc_p0] at hw
    refine KD.core_sound_le' A.dec s (X0 :: TL').length X0 TL' r.SL r.h2 ?_ ?_ ?_ ?_ hw
    · intro X hX; obtain ⟨_, h0, h1, _, _⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hTL X hX; exact ⟨h1, by omega⟩
    · intro X hX; obtain ⟨_, h0, h1, _, _⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hSL X hX; exact ⟨h1, by omega⟩
    · intro X hX
      obtain ⟨Y, h0, h1, h2', h3⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hTL X hX
      have hge : 3 * rkOf X ≤ (hitSet (fun s => toM3 (A.av s)) (toM3 X)).card := by
        rw [hitSet_card (O := O) A X h1]; exact NNP.KC.deficit_labO O A X h0 h1
      refine ⟨hpair X h1 h2', le_antisymm ?_ hge⟩
      rw [hitSet_card (O := O) A X h1]; simpa using fbN_sound ks hK hF hU hS hd h1 h3 A hΩ hA
    · intro X hX
      obtain ⟨Y, h0, h1, h2', h3⟩ := fbAllN_mem _ _ _ _ _ _ _ _ hSL X hX
      refine ⟨hpair X h1 h2', ?_⟩
      rw [hitSet_card (O := O) A X h1]; exact fbN_sound ks hK hF hU hS hd h1 h3 A hΩ hA

end NNP

namespace NNP
open NN R3RT.SpecO Classical
variable {O : R3RT.SpecO.LabelOrder} {Ω : R3RT.Spec.Dec22 → Prop}

/-- **the dead children of the r3 path are empty** (node cut 3, leaf code 4; every other kind is rejected by `deadR3`) -/
theorem deadR3_sound {C : R3RT.Spec.Dec22 → Prop} (S : IStat) (c : Cfg) (ids lm : Array ℕ) (tab : Tab)
    (hT : TabOK O Ω (tabV tab)) (hW : TabWF tab)
    (hC2 : ∀ l, l < 511 → C2OK O Ω l (c2tV S.st l)) (hH : ∀ l, l < 511 → HOK O l (hV S.st l)) (hK : KStatOK O S.ks)
    (hR1 : ∀ l, l < 511 → (O.rk l = 1 ↔ c.r1lo ≤ l ∧ l < c.r1hi)) (hr1hi : c.r1hi ≤ 511)
    (hleaf0 : ∀ fr lab blob, FInvO O Ω fr → leaf0OK S.ks fr.S fr.d lab blob = true →
      EmptyO O C (natL fr.S 0 8 ||| 2 ^ lab) lab)
    (hCut : ∀ (fr : Frame) (u last b1 m : ℕ) (ids' : Array ℕ) (nd ce : ByteArray) (pos expos : Array ℕ),
      FInvO O Ω fr →
      XT.checkCut fr.S fr.D fr.N fr.U fr.d last b1 m m (mkDict tab ids') S.c2W S.npW u nd ce pos expos = true →
      natL fr.S 0 8 >>> last = 1 →
      DictSemXO O Ω (natL fr.S 0 8) last (dictRowV tab ids') (KD.rposB b1 m m) →
      (∀ p, dictRowV tab ids' p < 2 ^ 511) →
      ∀ A : R3RT.Spec.Dec22, Ω A → ¬ Continues O A (natL fr.S 0 8) last u)
    (hCΩ : ∀ A, C A → Ω A) (hCK : ∀ A, C A → CaseK c.lo c.hi A)
    (hbc : ∀ A : R3RT.Spec.Dec22, Ω A → ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) :
    DeadSound O C (FInv0 O Ω S.st) (deadR3 S c ids lm tab) := by
  intro fr lab r hI0 h
  unfold deadR3 at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hd0, h⟩ := h
  have hI : FInvO O Ω fr := by
    rcases hI0 with hF | ⟨_, _, _, _, hdz⟩
    · exact hF
    · omega
  -- the dead node's frame refutes every decomposition of `Ω` below it
  have key : ∀ (vs : Array ℕ) (f : Frame), frameStep S.st tab fr lab vs = some f →
      (∃ rr, flookChk S.ks f.S f.D f.U f.d lab rr = true) → EmptyO O C (natL fr.S 0 8 ||| 2 ^ lab) lab := by
    intro vs f hf ⟨rr, hrr⟩ A _ hC hB
    obtain ⟨hS', _, _, hshr, hF', hU'⟩ := frameStep_sound S.st tab hT hW hC2 hH fr lab vs f hI hf
    rw [← hS'] at hB
    exact flookChk_sound S.ks hK hF' hU' hshr rr hrr hbc A (hCΩ A hC) hB
  cases r with
  | cut k args nd ce vrows =>
    simp only [] at h
    split at h
    · rcases hf : frameStep S.st tab fr lab (vrows.map _) with _ | f
      · rw [hf] at h; exact absurd h (by simp)
      · rw [hf] at h
        exact key _ f hf (flookAt_spec _ _ _ _ _ _ _ h)
    · split at h
      · -- node cut 7: the window at the cut node's own frame
        rcases hf : frameStep S.st tab fr lab (vrows.map _) with _ | f
        · rw [hf] at h; exact absurd h (by simp)
        · rw [hf] at h
          intro A _ hC hB
          obtain ⟨hS', _, _, hshr, hF', _⟩ := frameStep_sound S.st tab hT hW hC2 hH fr lab _ f hI hf
          rw [← hS'] at hB
          exact winN_sound c hR1 hr1hi hF' hshr h A (hCΩ A hC) (hCK A hC) hB
      · split at h
        · -- node cuts 5 / 6
          intro A _ hC hB
          exact cutXOK_sound S tab hT hW _ fr lab _ nd ce hI
            (fun last b1 m ids' pos expos hc hs hd hm => hCut fr lab last b1 m ids' nd ce pos expos hI hc hs hd hm) h A
            (hCΩ A hC) hB
        · split at h
          · -- node cut 2: the cut node's prefix holds more labels of a kept row than its capacity
            rcases hf : frameStep S.st tab fr lab #[] with _ | f
            · rw [hf] at h; exact absurd h (by simp)
            · rw [hf] at h
              simp only [decide_eq_true_eq] at h
              intro A _ hC hB
              obtain ⟨hS', _, _, hshr, hF', _⟩ := frameStep_sound S.st tab hT hW hC2 hH fr lab _ f hI hf
              rw [← hS'] at hB
              have hb : ∀ l, (natL f.S 0 8).testBit l = true → l ≤ lab := by
                intro l hl; by_contra hc
                rw [KD.shr_one_bit hshr l (by omega)] at hl; simp at hl; omega
              set w := (let k := lm.getD (args.getD 0 0) 0; if k == 0 then ids.size else k - 1)
              have hR : RowOK O Ω (rowT tab w % 2 ^ 511) (capOf tab w) := by
                rw [Nat.mod_eq_of_lt (rowT_lt tab hW w)]; exact rowOK_tab tab hT hW w
              have hc := L5O.row_count A (hCΩ A hC) (natL f.S 0 8) lab (rowT tab w) (capOf tab w) hF'.2.1 hb hB hR ∅
                (by intro l hl; simp at hl)
              rw [popRowS_eq] at h
              simp at hc
              omega
          · exact absurd h (by simp)
  | leaf code args blob =>
    simp only [] at h
    split at h
    · exact hleaf0 fr lab blob hI h
    · split at h
      · rcases hf : frameStep S.st tab fr lab #[] with _ | f
        · rw [hf] at h; exact absurd h (by simp)
        · rw [hf] at h
          exact key _ f hf (flookAny_spec _ _ _ _ _ _ h)
      · exact absurd h (by simp)

end NNP
