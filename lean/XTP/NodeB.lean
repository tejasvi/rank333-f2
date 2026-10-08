module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import KD.XComp
public import NNP.Core
public import XTP.W8
public import XTP.Loops
public import XTP.Views
public import XTP.Node
public import XTP.Agg
/-! # XTP.NodeB: the deficit table (`KD.dtOK`) and the node matrix (`KD.anodeX`) -/
@[expose] public section
namespace XTP
open XT MisF

set_option exponentiation.threshold 1024

/-! ## The deficit table -/

theorem hslot_HPV (x : XRec) (j : ℕ) (hj : j < x.XL.size) (h511 : x.HP[j]!.view < 2 ^ 511) :
    KD.hslot (HPV x) j = x.HP[j]!.view := by
  unfold KD.hslot HPV
  apply Nat.eq_of_testBit_eq; intro t
  change ((slotsV x.HP x.XL.size >>> (j <<< 9)) &&& R3RT.M511).testBit t = _
  rw [Nat.testBit_and, R3RT.m511_bit, Nat.testBit_shiftRight, Nat.shiftLeft_eq]
  by_cases ht : t < 511
  · rw [show j * 2 ^ 9 + t = 512 * j + t by ring, testBit_slotsV x.HP _ j t (by omega)]
    simp [hj, ht]
  · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le h511 (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [ht]

theorem byteAt_DEFPV (x : XRec) (hd : ∀ i : ℕ, x.DEF[i]! < 256) (j : ℕ) (hj : j < x.XL.size) :
    KD.byteAt (DEFPV x) j = x.DEF[j]! := by
  rw [KD.byteAt_eq]
  unfold DEFPV
  have hb : ∀ n, bytesV x.DEF n = pk 8 (fun i => x.DEF[i]!) n := by
    intro n; induction n with
    | zero => rfl
    | succ n ih => rw [bytesV, ih, pk_succ]
  rw [hb, E1S.dig, ← MisF.dig, dig_pk 8 _ _ (fun i _ => lt_of_lt_of_le (hd i) (by norm_num)) j hj]

theorem fld7_natU (U : ByteArray) (hU : countersOK U = true) (X : ℕ) (hX : X < 512) :
    KD.fld7 (NN.natU U) X = (U.get! X).toNat := by
  unfold countersOK at hU
  rw [List.all_eq_true] at hU
  have hU' : ∀ j, j < 512 → (U.get! j).toNat < 128 := by
    intro j hj; have := hU j (by simpa using hj); simpa using this
  unfold KD.fld7 NN.natU
  change (NN.natU7 U 512 >>> (7 * X)) &&& 127 = _
  rw [show (127 : ℕ) = 2 ^ 7 - 1 by norm_num, Nat.and_two_pow_sub_one_eq_mod]
  exact NNP.fld_natU7 U hU' 512 (le_refl _) X hX

theorem nperpL_lt (X : ℕ) : R3RT.nperpL X < 2 ^ 511 := by
  unfold R3RT.nperpL
  exact Nat.xor_lt_two_pow (KD.land_M511_lt _ _ KD.m511_lt) (KD.land_M511_lt _ _ KD.m511_lt)

theorem nperpTab_view (X : ℕ) (hX : X < 512) : nperpTab[X]!.view = R3RT.nperpL X := by
  have : nperpTab[X]! = W8.ofNat (XT.nperpL X) := by
    rw [getElem!_pos nperpTab X (by simp [nperpTab]; exact hX)]; simp [nperpTab]
  rw [this, W8.view_ofNat, nperpL_eq]
  apply Nat.mod_eq_of_lt
  exact lt_trans (nperpL_lt X) (by norm_num)

theorem rkTab_eq (X : ℕ) (hX : X < 512) : rkTab[X]! = RootSound.rkOf X := by
  rw [getElem!_pos rkTab X (by simp [rkTab]; exact hX)]; simp [rkTab, rkOf_eq]

theorem all511_view : W8.all511.view = R3RT.M511 := by rw [W8.view_all511, R3RT.m511_eq]

/-- the `--rord 123` table: `KD.NpOK LO123 (npV nperpTab)` -/
theorem npOK_nperpTab : KD.NpOK R3RT.SpecO.LO123 (npV nperpTab) := by
  intro X hX0 hX l hl
  rw [npV, nperpTab_view X hX]
  exact KD.npOK_123 X hX0 hX l hl

theorem dtOK_list (np : ℕ → ℕ) (U du HP DEFP J : ℕ) : ∀ (L : List ℕ) (j0 : ℕ), j0 + L.length = J →
    (∀ i < L.length, KD.dtEntry np U du L[i]! (KD.hslot HP (j0 + i)) (KD.byteAt DEFP (j0 + i)) = true) →
    KD.dtOK np U du HP DEFP J L j0 = true := by
  intro L
  induction L with
  | nil => intro j0 hj _; show Nat.beq j0 J = true; simp at hj; rw [Nat.beq_eq]; exact hj
  | cons X L ih =>
    intro j0 hj h
    show (KD.dtEntry np U du X (KD.hslot HP j0) (KD.byteAt DEFP j0) && KD.dtOK np U du HP DEFP J L (Nat.succ j0)) = true
    rw [Bool.and_eq_true]
    refine ⟨by have := h 0 (by simp); simpa using this, ih (j0 + 1) (by simp at hj; omega) (fun i hi => ?_)⟩
    have := h (i + 1) (by simp; omega)
    simpa [show j0 + (i + 1) = j0 + 1 + i by ring] using this

/-- the deficit-table masks have bit 511 clear (`dtN`'s check) -/
theorem hp511 (x : XRec) (hb : ∀ i (hi : i < x.HP.size), (x.HP[i].testBit 511) = false) (j : ℕ) :
    x.HP[j]!.view < 2 ^ 511 := by
  by_cases hj : j < x.HP.size
  · rw [getElem!_pos x.HP j hj]
    apply lt_511_of _ (W8.view_lt _)
    rw [← W8.testBit_eq]; exact hb j hj
  · rw [Array.getElem!_eq_getD, Array.getD, dif_neg hj]
    show (W8.zero).view < 2 ^ 511
    rw [W8.view_zero]; norm_num

/-- **the deficit table** (hyperplane masks `npV npW`) -/
theorem dtOK_of (npW : Array W8) (U : ByteArray) (du : ℕ) (x : XRec) (hU : countersOK U = true) (h : dtN npW U du x = true) :
    KD.dtOK (npV npW) (NN.natU U) du (HPV x) (DEFPV x) (JV x) (XLV x) 0 = true := by
  unfold dtN at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, Array.all_eq_true, List.all_eq_true, Bool.not_eq_true'] at h
  obtain ⟨⟨⟨⟨hHP, hDEF⟩, hd⟩, hb⟩, hent⟩ := h
  have hd' : ∀ i : ℕ, x.DEF[i]! < 256 := by
    intro i
    by_cases hi : i < x.DEF.size
    · have := hd i hi; rw [getElem!_pos x.DEF i hi]; simpa using this
    · rw [Array.getElem!_eq_getD, Array.getD, dif_neg hi]; simp
  apply dtOK_list _ _ _ _ _ _ (XLV x) 0 (by simp [XLV, JV])
  intro i hi
  simp only [XLV, Array.length_toList] at hi
  have he := hent i (by simpa using hi)
  simp only [Nat.zero_add]
  have hXL : (XLV x)[i]! = x.XL[i]! := by
    unfold XLV; rw [getElem!_pos x.XL.toList i (by simpa using hi), getElem!_pos x.XL i hi]; simp
  rw [hXL]
  set X := x.XL[i]! with hXdef
  obtain ⟨hX5, he⟩ := he
  unfold KD.dtEntry
  rw [Bool.and_eq_true, Nat.blt_eq]
  refine ⟨hX5, ?_⟩
  rw [byteAt_DEFPV x hd' i hi]
  by_cases hX0 : X = 0
  · rw [if_pos hX0, Bool.and_eq_true, decide_eq_true_eq] at he
    have hH := W8.beq_eq_true he.1
    have hv : x.HP[i]!.view = R3RT.M511 := by rw [hH, all511_view]
    rw [hslot_HPV x i hi (by rw [hv, R3RT.m511_eq]; omega), hv]
    simp [hX0, Nat.ble_eq, he.2]
  · rw [if_neg hX0, Bool.and_eq_true, decide_eq_true_eq] at he
    have hH := W8.beq_eq_true he.1
    have hv : x.HP[i]!.view = npV npW X := by rw [hH]; rfl
    rw [hslot_HPV x i hi (hp511 x hb i), hv, fld7_natU U hU X hX5, ← rkTab_eq X hX5]
    have hX0' : Nat.beq X 0 = false := by
      cases h : Nat.beq X 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) hX0
    simp [hX0', Nat.ble_eq, he.2]

/-! ## Windows and the node matrix -/

theorem windowTab_view (u : ℕ) (hu : u < 511) : (windowTab[u]!).view = 2 ^ 511 - 2 ^ (u + 1) := by
  have : windowTab[u]! = W8.ofNat (2 ^ 511 - 2 ^ (u + 1)) := by
    rw [getElem!_pos windowTab u (by simp [windowTab]; exact hu)]; simp [windowTab]
  rw [this, W8.view_ofNat]
  apply Nat.mod_eq_of_lt
  calc 2 ^ 511 - 2 ^ (u + 1) ≤ 2 ^ 511 := Nat.sub_le _ _
    _ < 2 ^ 512 := by norm_num

theorem windowTab_bit (u l : ℕ) (hu : u < 511) : (windowTab[u]!).view.testBit l = decide (u < l ∧ l < 511) := by
  rw [windowTab_view u hu, L5.testBit_pow_sub_pow 511 (u + 1) l (by omega)]
  apply decide_eq_decide.mpr; omega

theorem natL_slot (N : Array UInt64) (l j : ℕ) (hl : l < 512) (hj : j < 512) :
    (W8.ofLimbs N (8 * l)).view.testBit j = (NN.natL N 0 4096).testBit (512 * l + j) := by
  rw [W8.view_ofLimbs, NNP.natL_testBit, NNP.natL_testBit]
  simp only [show j < 64 * 8 by omega, show 512 * l + j < 64 * 4096 by omega, decide_true, Bool.true_and]
  rw [show 0 + (512 * l + j) / 64 = 8 * l + j / 64 by omega, show (512 * l + j) % 64 = j % 64 by omega]

theorem get!_range_map {α : Type} [Inhabited α] (n : ℕ) (f : ℕ → α) (i : ℕ) (hi : i < n) :
    ((Array.range n).map f)[i]! = f i := by
  rw [getElem!_pos _ i (by simp; exact hi)]; simp

/-- **the node matrix**: the native rows above `last` are the slots of `KD.anodeX` -/
theorem an_bit (N : Array UInt64) (last : ℕ) (dict : Array UInt64) (nrows : Array ℕ)
    (hnr : ∀ p ∈ nrows.toList, (NN.rowV dict p).testBit 511 = false)
    (l j : ℕ) (hl : last < l) (hl5 : l < 512) (hj : j < 512) :
    (anOf N last (nrows.map (rowOf (dictWOf dict))))[l]!.view.testBit j =
      (KD.anodeX (NN.natL N 0 4096) (NN.rowV dict) nrows.toList).testBit (512 * l + j) := by
  have hmap : ∀ m, m ∈ R3RT.mapL (NN.rowV dict) nrows.toList ↔ ∃ p ∈ nrows.toList, m = NN.rowV dict p := by
    intro m
    constructor
    · intro hm; exact KD.mem_mapL hm
    · rintro ⟨p, hp, rfl⟩
      generalize nrows.toList = L at hp
      induction L with
      | nil => cases hp
      | cons q L ih =>
        rcases List.mem_cons.mp hp with rfl | hp
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem _ (ih hp)
  have hlt : ∀ m ∈ R3RT.mapL (NN.rowV dict) nrows.toList, m < 2 ^ 511 := by
    intro m hm; obtain ⟨p, hp, rfl⟩ := (hmap m).mp hm; exact lt_511_of _ (rowV_lt dict p) (hnr p hp)
  unfold anOf
  simp only
  rw [get!_range_map 512 _ l hl5, if_neg (by omega)]
  unfold KD.anodeX
  apply Bool.eq_iff_iff.mpr
  rw [clrD_bit, DIAGF_bit l j hj, Bool.and_eq_true, addCl_bit]
  by_cases h511 : l = 511
  · subst h511
    rw [if_pos rfl, natL_slot N 511 j (by norm_num) hj]
    simp only [show ¬ ((511 : ℕ) < 511) by norm_num, false_and, decide_false, Bool.not_false, and_true]
    constructor
    · intro h; exact Or.inl h
    · rintro (h | ⟨m, hm, h⟩)
      · exact h
      · rw [outer_bit m (hlt m hm) 511 j hj] at h; simp at h
  · rw [if_neg h511, W8.testBit_clrBit, Bool.and_eq_true, W8.testBit_or, Bool.or_eq_true, natL_slot N l j hl5 hj]
    have hl511 : l < 511 := by omega
    have hlast : last < 511 := by omega
    have hacc := scatRows_bit (nrows.map (rowOf (dictWOf dict))) windowTab[last]! (Array.replicate 512 W8.zero) l j
      (by simp; exact hl5) (by rw [get!_replicate, if_pos hl5]; simp [W8.view_zero])
    rw [hacc, get!_replicate, if_pos hl5, windowTab_bit last l hlast]
    simp only [W8.view_zero, Nat.zero_testBit, Bool.false_or, Bool.and_eq_true, decide_eq_true_eq, ne_eq,
      Bool.not_eq_true', decide_eq_false_iff_not]
    constructor
    · rintro ⟨h | ⟨⟨_, m', hm', h1, h2⟩, _⟩, h4⟩
      · exact ⟨Or.inl h, fun h' => h4 h'.2.symm⟩
      · obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hm'
        have hi' : i < nrows.size := by simpa using hi
        simp only [Array.getElem_toList, Array.getElem_map] at h1 h2
        rw [rowOf_view] at h1 h2
        refine ⟨Or.inr ⟨NN.rowV dict nrows[i], (hmap _).mpr ⟨nrows[i], Array.getElem_mem_toList _, rfl⟩, ?_⟩,
          fun h' => h4 h'.2.symm⟩
        rw [outer_bit _ (hlt _ ((hmap _).mpr ⟨nrows[i], Array.getElem_mem_toList _, rfl⟩)) l j hj]
        simp [hl511, h1, h2]
    · rintro ⟨h | ⟨m, hm, h⟩, h4⟩
      · exact ⟨Or.inl h, fun h' => h4 ⟨hl511, h'.symm⟩⟩
      · rw [outer_bit m (hlt m hm) l j hj] at h
        simp only [Bool.and_eq_true, decide_eq_true_eq] at h
        obtain ⟨p, hp, rfl⟩ := (hmap m).mp hm
        refine ⟨Or.inr ⟨⟨by omega, (rowOf (dictWOf dict) p), ?_, ?_, ?_⟩, fun h' => h4 ⟨hl511, h'.symm⟩⟩,
          fun h' => h4 ⟨hl511, h'.symm⟩⟩
        · obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hp
          rw [List.mem_iff_getElem]
          exact ⟨i, by simpa using hi, by simp⟩
        · rw [rowOf_view]; exact h.1.2
        · rw [rowOf_view]; exact h.2

end XTP
