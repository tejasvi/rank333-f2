module
public import R22Port.U_6d73af0793e7
public import Mathlib
public import KD.XComp
public import NNP.Core
public import XTP.W8
public import XTP.Loops
public import XTP.Views
public import XTP.Node
/-! # XTP.Agg: the aggregates `B_x`: `K2.bxOK`'s formula slot by slot is `XT.brow`

* bits of the layout constants (`REPF`, `DIAGF`) and of `outer`, `addCl`, `addClV`, `clrV`, `clrD`;
* `bxF_bit`: bit `512 i + j` of the formula;
* `brow_view`: the native row of the aggregate is that slot (`c2W = prepC2 c2t`);
* `aggsX_of`: `XT.aggsOK` (layouts 0 and 2) gives `KD.aggsX`. -/
@[expose] public section
namespace XTP
open XT MisF

set_option exponentiation.threshold 1024

/-! ## Layout constants -/

theorem REPF_lt : KD.REPF < 2 ^ (512 * 511) := by
  rw [KD.REPF_eq]; exact pk_lt _ _ _ (fun _ _ => by norm_num)

theorem DIAGF_bit (i j : ℕ) (hj : j < 512) : KD.DIAGF.testBit (512 * i + j) = decide (i < 511 ∧ i = j) := by
  by_cases hi : i < 511
  · rw [K2.testBit_DIAG 512 511 KD.DIAGF (by norm_num) KD.DIAGF_eq i j hi hj]; simp [hi]
  · have hlt : KD.DIAGF < 2 ^ (512 * 511) := by
      rw [KD.DIAGF_eq]; exact pk_lt _ _ _ (fun k hk => Nat.pow_lt_pow_right (by norm_num) (by omega))
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hi]

theorem outer_bit (m : ℕ) (hm : m < 2 ^ 511) (i j : ℕ) (hj : j < 512) :
    (K2.outer m KD.REPmF KD.REPF).testBit (512 * i + j) = (decide (i < 511) && m.testBit i && m.testBit j) := by
  by_cases hi : i < 511
  · rw [K2.testBit_outer 512 511 m KD.REPmF KD.REPF (by norm_num) hm KD.REPmF_eq KD.REPF_eq i j hi hj]; simp [hi]
  · have heq := K2.outer_eq 512 511 m KD.REPmF KD.REPF (by norm_num) hm KD.REPmF_eq KD.REPF_eq
    have hlt : K2.outer m KD.REPmF KD.REPF < 2 ^ (512 * 511) := by
      rw [heq]; exact pk_lt _ _ _ (fun k _ => by
        split
        · exact lt_trans hm (Nat.pow_lt_pow_right (by norm_num) (by norm_num))
        · exact Nat.two_pow_pos _)
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))]
    simp [hi]

theorem addCl_bit (A REPm REP : ℕ) (k : ℕ) : ∀ (rows : List ℕ),
    ((K2.addCl A REPm REP rows).testBit k = true ↔ (A.testBit k = true ∨ ∃ m ∈ rows, (K2.outer m REPm REP).testBit k = true)) := by
  intro rows
  induction rows with
  | nil => simp [K2.addCl]
  | cons m rows ih =>
    show (Nat.lor (K2.addCl A REPm REP rows) (K2.outer m REPm REP)).testBit k = true ↔ _
    rw [K2.testBit_lor, Bool.or_eq_true, ih]
    constructor
    · rintro ((h | ⟨m', hm', h⟩) | h)
      · exact Or.inl h
      · exact Or.inr ⟨m', List.mem_cons_of_mem _ hm', h⟩
      · exact Or.inr ⟨m, List.mem_cons_self .., h⟩
    · rintro (h | ⟨m', hm', h⟩)
      · exact Or.inl (Or.inl h)
      · rcases List.mem_cons.mp hm' with rfl | hm'
        · exact Or.inr h
        · exact Or.inl (Or.inr ⟨m', hm', h⟩)

theorem addClV_bit (A REPm REP v : ℕ) (k : ℕ) : ∀ (rows : List ℕ),
    ((K2.addClV A REPm REP v rows).testBit k = true ↔
      (A.testBit k = true ∨ ∃ m ∈ rows, (K2.outer (K2.andn m (Nat.shiftLeft 1 v)) REPm REP).testBit k = true)) := by
  intro rows
  induction rows with
  | nil => simp [K2.addClV]
  | cons m rows ih =>
    show (Nat.lor (K2.addClV A REPm REP v rows) (K2.outer (K2.andn m (Nat.shiftLeft 1 v)) REPm REP)).testBit k = true ↔ _
    rw [K2.testBit_lor, Bool.or_eq_true, ih]
    constructor
    · rintro ((h | ⟨m', hm', h⟩) | h)
      · exact Or.inl h
      · exact Or.inr ⟨m', List.mem_cons_of_mem _ hm', h⟩
      · exact Or.inr ⟨m, List.mem_cons_self .., h⟩
    · rintro (h | ⟨m', hm', h⟩)
      · exact Or.inl (Or.inl h)
      · rcases List.mem_cons.mp hm' with rfl | hm'
        · exact Or.inr h
        · exact Or.inl (Or.inr ⟨m', hm', h⟩)

theorem clrD_bit (A DIAG k : ℕ) : (K2.clrD A DIAG).testBit k = (A.testBit k && !DIAG.testBit k) := by
  unfold K2.clrD; rw [K2.testBit_andn]

/-- the mask `clrV` removes: column `x` of the 511 slots and slot `x` -/
theorem clrVmask_bit (x i j : ℕ) (hx : x < 512) (hj : j < 512) :
    (Nat.lor (Nat.shiftLeft KD.REPF x) (Nat.shiftLeft (Nat.sub (Nat.shiftLeft 1 512) 1) (Nat.mul 512 x))).testBit (512 * i + j) =
      (decide (j = x ∧ i < 511) || decide (i = x)) := by
  rw [K2.testBit_lor]
  congr 1
  · change (KD.REPF <<< x).testBit (512 * i + j) = _
    rw [Nat.testBit_shiftLeft]
    by_cases hjx : j = x
    · subst hjx
      simp only [show 512 * i + j ≥ j by omega, decide_true, Bool.true_and, Nat.add_sub_cancel]
      by_cases hi : i < 511
      · rw [K2.testBit_REP 512 511 KD.REPF (by norm_num) KD.REPF_eq i hi]; simp [hi]
      · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le REPF_lt (Nat.pow_le_pow_right (by norm_num) (by omega)))]; simp [hi]
    · simp only [hjx, false_and, decide_false]
      by_cases hge : 512 * i + j ≥ x
      · simp only [hge, decide_true, Bool.true_and]
        -- 512 i + j - x is not a multiple of 512 below 512 * 511
        have hd : (KD.REPF).testBit (512 * i + j - x) = false := by
          rw [KD.REPF_eq]
          have hlt := pk_lt 512 (fun _ => 1) 511 (fun _ _ => by norm_num)
          by_cases hq : (512 * i + j - x) / 512 < 511
          · have h := testBit_dig 512 (pk 512 (fun _ => 1) 511) ((512 * i + j - x) / 512) ((512 * i + j - x) % 512)
              (Nat.mod_lt _ (by norm_num))
            rw [Nat.div_add_mod] at h
            rw [← h, dig_pk _ _ _ (fun _ _ => by norm_num) _ hq]
            have hr : (512 * i + j - x) % 512 ≠ 0 := by omega
            rw [show (1 : ℕ) = 2 ^ 0 from rfl, Nat.testBit_two_pow]; simp [Ne.symm hr]
          · exact Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))
        rw [hd]
      · simp [hge]
  · change ((((1 : ℕ) <<< 512) - 1) <<< (512 * x)).testBit (512 * i + j) = _
    rw [Nat.testBit_shiftLeft, Nat.one_shiftLeft, Nat.testBit_two_pow_sub_one]
    by_cases hix : i = x
    · subst hix; simp [hj]
    · by_cases hlt : i < x
      · simp only [show ¬ (512 * i + j ≥ 512 * x) by omega, decide_false, Bool.false_and, hix]
      · simp only [show 512 * i + j ≥ 512 * x by omega, decide_true, Bool.true_and, hix, decide_false]
        exact decide_eq_false (by omega)

theorem andn_shl_bit (m x t : ℕ) : (K2.andn m (Nat.shiftLeft 1 x)).testBit t = (m.testBit t && decide (t ≠ x)) := by
  rw [K2.testBit_andn, K2.testBit_one_shiftLeft]; cases m.testBit t <;> simp

theorem andn_shl_lt (m x : ℕ) (hm : m < 2 ^ 511) : K2.andn m (Nat.shiftLeft 1 x) < 2 ^ 511 := K2.andn_lt _ hm

/-- **bit `512 i + j` of `K2.bxOK`'s formula** -/
theorem bxF_bit (x C2x : ℕ) (rows : List ℕ) (hx : x < 511) (hrows : ∀ m ∈ rows, m < 2 ^ 511) (i j : ℕ) (hj : j < 512) :
    (bxF x C2x rows).testBit (512 * i + j) = true ↔
      ((i < 511 ∧ ∃ m ∈ rows, m.testBit i = true ∧ i ≠ x ∧ m.testBit j = true ∧ j ≠ x) ∨
        (C2x.testBit (512 * i + j) = true ∧ ¬ (j = x ∧ i < 511) ∧ i ≠ x)) ∧ ¬ (i < 511 ∧ i = j) := by
  unfold bxF
  rw [clrD_bit, DIAGF_bit i j hj, Bool.and_eq_true, K2.testBit_lor, Bool.or_eq_true, addClV_bit]
  unfold K2.clrV
  rw [K2.testBit_andn, clrVmask_bit x i j (by omega) hj]
  simp only [Nat.zero_testBit, Bool.false_eq_true, false_or, Bool.and_eq_true, Bool.not_eq_true', Bool.or_eq_false_iff,
    decide_eq_false_iff_not, decide_eq_true_eq]
  apply and_congr _ Iff.rfl
  apply or_congr _ Iff.rfl
  constructor
  · rintro ⟨m, hm, hb⟩
    rw [outer_bit _ (andn_shl_lt m x (hrows m hm)) i j hj] at hb
    simp only [Bool.and_eq_true, decide_eq_true_eq, andn_shl_bit] at hb
    obtain ⟨⟨hi, h1, h2⟩, h3, h4⟩ := hb
    exact ⟨hi, m, hm, h1, h2, h3, h4⟩
  · rintro ⟨hi, m, hm, h1, h2, h3, h4⟩
    refine ⟨m, hm, ?_⟩
    rw [outer_bit _ (andn_shl_lt m x (hrows m hm)) i j hj, andn_shl_bit, andn_shl_bit]
    simp [hi, h1, h2, h3, h4]

/-- the formula vanishes for a label at or above 511 with no rows and no table -/
theorem bxF_high (x : ℕ) (hx : 511 ≤ x) : bxF x 0 [] = 0 := by
  unfold bxF K2.clrV K2.clrD K2.andn K2.addClV
  simp

theorem bxF_lt (x C2x : ℕ) (rows : List ℕ) (hC : C2x < 2 ^ (512 * 512)) (hrows : ∀ m ∈ rows, m < 2 ^ 511) :
    bxF x C2x rows < 2 ^ (512 * 512) := by
  unfold bxF
  apply lt_of_le_of_lt (Nat.le_of_testBit (fun k hk => ?_)) (show 2 ^ (512 * 512) - 1 < 2 ^ (512 * 512) by omega)
  rw [Nat.testBit_two_pow_sub_one]
  by_contra hc
  simp only [decide_eq_true_eq, not_lt] at hc
  rw [clrD_bit, Bool.and_eq_true, K2.testBit_lor, Bool.or_eq_true, addClV_bit] at hk
  rcases hk.1 with ((h | ⟨m, hm, h⟩) | h)
  · simp at h
  · have heq := K2.outer_eq 512 511 _ KD.REPmF KD.REPF (by norm_num) (andn_shl_lt m x (hrows m hm)) KD.REPmF_eq KD.REPF_eq
    have hlt : K2.outer (K2.andn m (Nat.shiftLeft 1 x)) KD.REPmF KD.REPF < 2 ^ (512 * 511) := by
      rw [heq]; exact pk_lt _ _ _ (fun k _ => by
        split
        · exact lt_trans (andn_shl_lt m x (hrows m hm)) (Nat.pow_lt_pow_right (by norm_num) (by norm_num))
        · exact Nat.two_pow_pos _)
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
    simp at h
  · unfold K2.clrV at h
    rw [K2.testBit_andn, Bool.and_eq_true] at h
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hC (Nat.pow_le_pow_right (by norm_num) hc))] at h
    simp at h

/-! ## The native rows of an aggregate -/

theorem size_prepC2 (c2t : Array (Array UInt64)) : (prepC2 c2t).size = c2t.size := by simp [prepC2]

theorem c2row_view (c2t : Array (Array UInt64)) (x l j : ℕ) (hl : l < 512) (hj : j < 512) :
    (c2row (prepC2 c2t) x l).view.testBit j = (c2tV c2t x).testBit (512 * l + j) := by
  unfold c2row c2tV
  by_cases hx : x < c2t.size
  · have h1 : (prepC2 c2t)[x]! = (Array.range 512).map fun l => W8.ofLimbs c2t[x]! (8 * l) := by
      rw [getElem!_pos (prepC2 c2t) x (by rw [size_prepC2]; exact hx)]
      simp [prepC2, getElem!_pos c2t x hx]
    have h2 : ((Array.range 512).map fun l => W8.ofLimbs c2t[x]! (8 * l))[l]! = W8.ofLimbs c2t[x]! (8 * l) := by
      rw [getElem!_pos _ l (by simp; exact hl)]; simp
    rw [h1, h2, W8.view_ofLimbs, NNP.natL_testBit, NNP.natL_testBit]
    simp only [show j < 64 * 8 by omega, show 512 * l + j < 64 * 4096 by omega, decide_true, Bool.true_and]
    rw [show 0 + (512 * l + j) / 64 = 8 * l + j / 64 by omega, show (512 * l + j) % 64 = j % 64 by omega]
  · have h1 : (prepC2 c2t)[x]! = #[] := by
      rw [Array.getElem!_eq_getD, Array.getD, dif_neg (by rw [size_prepC2]; exact hx)]; rfl
    have h2 : c2t[x]! = #[] := by
      rw [Array.getElem!_eq_getD, Array.getD, dif_neg hx]; rfl
    rw [h1, h2]
    have h3 : (#[] : Array W8)[l]! = W8.zero := rfl
    rw [h3, W8.view_zero]
    have h4 : ∀ off n, NN.natL (#[] : Array UInt64) off n = 0 := by
      intro off n; induction n generalizing off with
      | zero => rfl
      | succ n ih => rw [NNP.natL_succ, ih]; rfl
    rw [h4]; simp

theorem c2tV_lt (c2t : Array (Array UInt64)) (x : ℕ) : c2tV c2t x < 2 ^ (512 * 512) := by
  unfold c2tV; have := NNP.natL_lt c2t[x]! 4096 0; simpa using this

theorem c2tV_high (c2t : Array (Array UInt64)) (x : ℕ) (hs : c2t.size ≤ 511) (hx : 511 ≤ x) : c2tV c2t x = 0 := by
  unfold c2tV
  have h2 : c2t[x]! = #[] := by rw [Array.getElem!_eq_getD, Array.getD, dif_neg (by omega)]; rfl
  rw [h2]
  have h4 : ∀ off n, NN.natL (#[] : Array UInt64) off n = 0 := by
    intro off n; induction n generalizing off with
    | zero => rfl
    | succ n ih => rw [NNP.natL_succ, ih]; rfl
  exact h4 0 4096

/-- the native rows of an aggregate whose rows lie below `2^511` and hold its label -/
theorem brow_bit (c2t : Array (Array UInt64)) (hs : c2t.size ≤ 511) (dict : Array UInt64) (a : XAgg)
    (hrows : ∀ p ∈ a.ps.toList, NN.rowV dict p < 2 ^ 511 ∧ (NN.rowV dict p).testBit a.x = true)
    (l j : ℕ) (hl : l < 512) (hj : j < 512) :
    (brow (prepC2 c2t) (aggCOf (dictWOf dict) a) l).view.testBit j =
      (bxF a.x (c2tV c2t a.x) (R3RT.mapL (NN.rowV dict) a.ps.toList)).testBit (512 * l + j) := by
  have hmap : ∀ m, m ∈ R3RT.mapL (NN.rowV dict) a.ps.toList ↔ ∃ p ∈ a.ps.toList, m = NN.rowV dict p := by
    intro m
    constructor
    · intro hm; exact KD.mem_mapL hm
    · rintro ⟨p, hp, rfl⟩
      generalize a.ps.toList = L at hp
      induction L with
      | nil => cases hp
      | cons q L ih =>
        rcases List.mem_cons.mp hp with rfl | hp
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem _ (ih hp)
  have hlt : ∀ m ∈ R3RT.mapL (NN.rowV dict) a.ps.toList, m < 2 ^ 511 := by
    intro m hm; obtain ⟨p, hp, rfl⟩ := (hmap m).mp hm; exact (hrows p hp).1
  by_cases hx : a.x < 511
  · unfold brow
    simp only [aggCOf]
    rw [if_neg (by omega), if_neg (by omega)]
    apply Bool.eq_iff_iff.mpr
    rw [bxF_bit a.x _ _ hx hlt l j hj]
    by_cases h511 : l = 511
    · subst h511
      rw [if_pos rfl, c2row_view c2t a.x 511 j (by norm_num) hj]
      simp; omega
    · rw [if_neg h511]
      by_cases hlx : l = a.x
      · subst hlx
        rw [if_pos rfl, W8.view_zero]
        simp
      · rw [if_neg hlx, W8.testBit_clrBit, Bool.and_eq_true, orHoldingW_bit, W8.testBit_clrBit,
          c2row_view c2t a.x l j hl hj]
        have hl511 : l < 511 := by omega
        constructor
        · rintro ⟨h1 | ⟨m', hm', h2, h3⟩, h4⟩
          · simp only [Bool.and_eq_true, decide_eq_true_eq] at h1 h4
            exact ⟨Or.inr ⟨h1.1, fun h => h1.2 h.1, hlx⟩, fun h => h4 (h.2.symm)⟩
          · simp only [decide_eq_true_eq] at h4
            obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hm'
            have hi' : i < a.ps.size := by simpa using hi
            simp only [Array.getElem_toList, Array.getElem_map] at h2 h3
            rw [W8.testBit_clrBit, rowOf_view, Bool.and_eq_true] at h2 h3
            simp only [decide_eq_true_eq] at h2 h3
            refine ⟨Or.inl ⟨hl511, NN.rowV dict (a.ps[i]'hi'), (hmap _).mpr ⟨a.ps[i]'hi', ?_, rfl⟩, h2.1, h2.2, h3.1, h3.2⟩,
              fun h => h4 h.2.symm⟩
            exact Array.getElem_mem_toList _
        · rintro ⟨h1 | h1, h4⟩
          · obtain ⟨_, m, hm, h2, h3, h5, h6⟩ := h1
            obtain ⟨p, hp, rfl⟩ := (hmap m).mp hm
            refine ⟨Or.inr ⟨(rowOf (dictWOf dict) p).clrBit a.x, ?_, ?_, ?_⟩, ?_⟩
            · obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hp
              rw [List.mem_iff_getElem]
              exact ⟨i, by simpa using hi, by simp⟩
            · rw [W8.testBit_clrBit, rowOf_view]; simp [h2, h3]
            · rw [W8.testBit_clrBit, rowOf_view]; simp [h5, h6]
            · simp only [decide_eq_true_eq]; exact fun h => h4 ⟨hl511, h.symm⟩
          · refine ⟨Or.inl ?_, ?_⟩
            · simp only [Bool.and_eq_true, decide_eq_true_eq]; exact ⟨h1.1, fun h => h1.2.1 ⟨h, hl511⟩⟩
            · simp only [decide_eq_true_eq]; exact fun h => h4 ⟨hl511, h.symm⟩
  · -- a label at or above 511: no rows (each would hold the label below 2^511), B = 0
    have hps : a.ps.toList = [] := by
      cases hL : a.ps.toList with
      | nil => rfl
      | cons p L =>
        exfalso
        have := hrows p (by rw [hL]; exact List.mem_cons_self ..)
        rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le this.1 (Nat.pow_le_pow_right (by norm_num) (by omega)))] at this
        simp at this
    unfold brow
    simp only [aggCOf]
    rw [if_pos (by omega), W8.view_zero, hps, c2tV_high c2t a.x hs (by omega)]
    show Nat.testBit 0 j = (bxF a.x 0 []).testBit (512 * l + j)
    rw [bxF_high a.x (by omega)]; simp

theorem lt_511_of (m : ℕ) (hm : m < 2 ^ 512) (h : m.testBit 511 = false) : m < 2 ^ 511 := by
  apply Nat.lt_pow_two_of_testBit
  intro i hi
  rcases Nat.eq_or_lt_of_le hi with rfl | hi
  · exact h
  · exact Nat.testBit_lt_two_pow (lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) hi))

theorem rowV_lt (dict : Array UInt64) (p : ℕ) : NN.rowV dict p < 2 ^ 512 := by
  rw [← rowOf_view]; exact W8.view_lt _

theorem rowsOK_of (TOP v : ℕ) : ∀ (rows : List ℕ), (∀ m ∈ rows, m < TOP ∧ m.testBit v = true) → K2.rowsOK TOP v rows = true := by
  intro rows h
  induction rows with
  | nil => rfl
  | cons m rows ih =>
    show (Nat.blt m TOP && Nat.beq (Nat.land (Nat.shiftRight m v) 1) 1 && K2.rowsOK TOP v rows) = true
    have hm := h m (List.mem_cons_self ..)
    have h1 : Nat.land (Nat.shiftRight m v) 1 = 1 := by
      change (m >>> v) &&& 1 = 1
      rw [Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow]
      have := hm.2; rw [Nat.testBit_eq_decide_div_mod_eq] at this; simpa using this
    simp only [Bool.and_eq_true, Nat.blt_eq, h1, Nat.beq_refl, and_true]
    exact ⟨hm.1, ih (fun q hq => h q (List.mem_cons_of_mem _ hq))⟩

theorem listRec_and_of {α : Type} (f : α → Bool) : ∀ (L : List α), (∀ a ∈ L, f a = true) →
    List.rec (motive := fun _ => Bool) true (fun a _ ih => f a && ih) L = true := by
  intro L h
  induction L with
  | nil => rfl
  | cons a L ih =>
    show (f a && List.rec (motive := fun _ => Bool) true (fun a _ ih => f a && ih) L) = true
    rw [Bool.and_eq_true]; exact ⟨h a (List.mem_cons_self ..), ih (fun b hb => h b (List.mem_cons_of_mem _ hb))⟩

/-- **the aggregates**: `XT.aggsOK` gives `KD.aggsX` (layouts 0 and 2) -/
theorem aggsX_of (c2t : Array (Array UInt64)) (hs : c2t.size ≤ 511) (dict : Array UInt64) (x : XRec) (hlay : x.lay ≠ 1)
    (h : aggsOK x (prepC2 c2t) (dictWOf dict) = true) :
    KD.aggsX (NN.rowV dict) (aggsV c2t (NN.rowV dict) x) = true := by
  unfold aggsOK at h
  rw [List.all_eq_true] at h
  unfold KD.aggsX aggsV
  apply listRec_and_of
  intro ag hag
  rw [List.mem_map] at hag
  obtain ⟨a, ha, rfl⟩ := hag
  obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem ha
  have hi' : i < x.aggs.size := by simpa using hi
  have hc := h i (by simpa using hi')
  rw [Bool.and_eq_true, Array.all_eq_true] at hc
  obtain ⟨hps, hB⟩ := hc
  simp only [Array.getElem_toList]
  rw [show x.aggs[i]! = x.aggs[i] from getElem!_pos x.aggs i hi'] at hps hB
  set a := x.aggs[i] with hadef
  -- the rows: below 2^511, through x
  have hrows : ∀ p ∈ a.ps.toList, NN.rowV dict p < 2 ^ 511 ∧ (NN.rowV dict p).testBit a.x = true := by
    intro p hp
    obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hp
    have := hps k (by simpa using hk)
    simp only [Bool.and_eq_true, Bool.not_eq_true'] at this
    rw [W8.testBit_eq, W8.testBit_eq, rowOf_view] at this
    simp only [Array.getElem_toList]
    exact ⟨lt_511_of _ (rowV_lt dict _) this.1, this.2⟩
  have hrowsm : ∀ m ∈ R3RT.mapL (NN.rowV dict) a.ps.toList, m < 2 ^ 511 ∧ m.testBit a.x = true := by
    intro m hm; obtain ⟨p, hp, rfl⟩ := KD.mem_mapL hm; exact hrows p hp
  unfold K2.bxOK
  rw [Bool.and_eq_true]
  refine ⟨rowsOK_of _ _ _ hrowsm, ?_⟩
  rw [Nat.beq_eq]
  show bxF a.x (c2tV c2t a.x) (R3RT.mapL (NN.rowV dict) a.ps.toList) = aggBV c2t (NN.rowV dict) x.lay a
  unfold aggBV
  split
  · -- layout 0: the literal equals the formula slot by slot
    rename_i h0
    unfold aggBOK at hB
    rw [if_pos h0, List.all_eq_true] at hB
    apply Nat.eq_of_testBit_eq; intro k
    by_cases hk : k < 512 * 512
    · rw [show k = 512 * (k / 512) + k % 512 by omega, testBit_slotsV a.B 512 _ _ (by omega),
        ← brow_bit c2t hs dict a hrows (k / 512) (k % 512) (by omega) (by omega)]
      have := hB (k / 512) (by simp; omega)
      rw [W8.beq_eq_true this]; simp; omega
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (bxF_lt _ _ _ (c2tV_lt c2t a.x) (fun m hm => (hrowsm m hm).1))
          (Nat.pow_le_pow_right (by norm_num) (by omega))),
        Nat.testBit_lt_two_pow (lt_of_lt_of_le (slotsV_lt a.B 512) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
  · rfl

/-- the facts `XT.aggsOK` gives for aggregate `i`: rows below `2^511` through `x`, and `B` = the `bxOK` formula -/
theorem agg_facts (c2t : Array (Array UInt64)) (hs : c2t.size ≤ 511) (dict : Array UInt64) (x : XRec) (hlay : x.lay ≠ 1)
    (h : aggsOK x (prepC2 c2t) (dictWOf dict) = true) (i : ℕ) (hi : i < x.aggs.size) :
    (∀ p ∈ x.aggs[i].ps.toList, NN.rowV dict p < 2 ^ 511 ∧ (NN.rowV dict p).testBit x.aggs[i].x = true) ∧
      aggBV c2t (NN.rowV dict) x.lay x.aggs[i] =
        bxF x.aggs[i].x (c2tV c2t x.aggs[i].x) (R3RT.mapL (NN.rowV dict) x.aggs[i].ps.toList) := by
  unfold aggsOK at h
  rw [List.all_eq_true] at h
  have hc := h i (by simpa using hi)
  rw [Bool.and_eq_true, Array.all_eq_true] at hc
  obtain ⟨hps, hB⟩ := hc
  rw [show x.aggs[i]! = x.aggs[i] from getElem!_pos x.aggs i hi] at hps hB
  set a := x.aggs[i] with hadef
  have hrows : ∀ p ∈ a.ps.toList, NN.rowV dict p < 2 ^ 511 ∧ (NN.rowV dict p).testBit a.x = true := by
    intro p hp
    obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hp
    have := hps k (by simpa using hk)
    simp only [Bool.and_eq_true, Bool.not_eq_true'] at this
    rw [W8.testBit_eq, W8.testBit_eq, rowOf_view] at this
    simp only [Array.getElem_toList]
    exact ⟨lt_511_of _ (rowV_lt dict _) this.1, this.2⟩
  have hrowsm : ∀ m ∈ R3RT.mapL (NN.rowV dict) a.ps.toList, m < 2 ^ 511 ∧ m.testBit a.x = true := by
    intro m hm; obtain ⟨p, hp, rfl⟩ := KD.mem_mapL hm; exact hrows p hp
  refine ⟨hrows, ?_⟩
  unfold aggBV
  split
  · rename_i h0
    unfold aggBOK at hB
    rw [if_pos h0, List.all_eq_true] at hB
    symm
    apply Nat.eq_of_testBit_eq; intro k
    by_cases hk : k < 512 * 512
    · rw [show k = 512 * (k / 512) + k % 512 by omega, testBit_slotsV a.B 512 _ _ (by omega),
        ← brow_bit c2t hs dict a hrows (k / 512) (k % 512) (by omega) (by omega)]
      have := hB (k / 512) (by simp; omega)
      rw [W8.beq_eq_true this]; simp; omega
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (bxF_lt _ _ _ (c2tV_lt c2t a.x) (fun m hm => (hrowsm m hm).1))
          (Nat.pow_le_pow_right (by norm_num) (by omega))),
        Nat.testBit_lt_two_pow (lt_of_lt_of_le (slotsV_lt a.B 512) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
  · rfl

end XTP
