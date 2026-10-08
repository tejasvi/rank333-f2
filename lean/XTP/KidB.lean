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
public import XTP.NodeB
public import XTP.KStep
public import XTP.Kid
/-! # XTP.KidB: a child's setup against `KD.kidX` (`fuX`, `crX`, `allLt`, the initial matrix and candidates) -/
@[expose] public section
namespace XTP
open XT MisF

set_option exponentiation.threshold 1024

/-! ## Window constants -/

theorem DIAGn_bit (n v w : ℕ) (hn : n ≤ 511) (hw : w < 512) :
    (KD.DIAGn n).testBit (512 * v + w) = decide (v < n ∧ v = w) := by
  by_cases hv : v < n
  · rw [K2.testBit_DIAG 512 n (KD.DIAGn n) (by omega) (KD.DIAGn_eq n hn) v w hv hw]; simp [hv]
  · have hlt : KD.DIAGn n < 2 ^ (512 * n) := by
      rw [KD.DIAGn_eq n hn]; exact pk_lt _ _ _ (fun k hk => Nat.pow_lt_pow_right (by norm_num) (by omega))
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by nlinarith)))]
    simp [hv]

theorem outern_bit (n m : ℕ) (hn : n ≤ 511) (hm : m < 2 ^ n) (v w : ℕ) (hw : w < 512) :
    (K2.outer m (KD.REPmn n) (KD.REPn n)).testBit (512 * v + w) = (decide (v < n) && m.testBit v && m.testBit w) := by
  by_cases hv : v < n
  · rw [K2.testBit_outer 512 n m (KD.REPmn n) (KD.REPn n) (by omega) hm (KD.REPmn_eq n hn) (KD.REPn_eq n hn) v w hv hw]
    simp [hv]
  · have heq := K2.outer_eq 512 n m (KD.REPmn n) (KD.REPn n) (by omega) hm (KD.REPmn_eq n hn) (KD.REPn_eq n hn)
    have hlt : K2.outer m (KD.REPmn n) (KD.REPn n) < 2 ^ (512 * n) := by
      rw [heq]; exact pk_lt _ _ _ (fun k _ => by
        split
        · exact lt_of_lt_of_le hm (Nat.pow_le_pow_right (by norm_num) (by omega))
        · exact Nat.two_pow_pos _)
    rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by nlinarith)))]
    simp [hv]

theorem anodeX_lt (N : Array UInt64) (dict : Array UInt64) (nrows : List ℕ) (hnr : ∀ p ∈ nrows, (NN.rowV dict p) < 2 ^ 511) :
    KD.anodeX (NN.natL N 0 4096) (NN.rowV dict) nrows < 2 ^ (512 * 512) := by
  unfold KD.anodeX
  apply Nat.lt_pow_two_of_testBit
  intro k hk
  rw [clrD_bit, Bool.and_eq_false_iff]
  left
  cases h : (K2.addCl (NN.natL N 0 4096) KD.REPmF KD.REPF (R3RT.mapL (NN.rowV dict) nrows)).testBit k with
  | false => rfl
  | true =>
    exfalso
    rcases (addCl_bit _ _ _ k _).mp h with h | ⟨m, hm, h⟩
    · have := NNP.natL_lt N 4096 0
      rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le this (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
      cases h
    · obtain ⟨p, hp, rfl⟩ := KD.mem_mapL hm
      have heq := K2.outer_eq 512 511 _ KD.REPmF KD.REPF (by norm_num) (hnr p hp) KD.REPmF_eq KD.REPF_eq
      have hlt : K2.outer (NN.rowV dict p) KD.REPmF KD.REPF < 2 ^ (512 * 511) := by
        rw [heq]; exact pk_lt _ _ _ (fun k _ => by
          split
          · exact lt_trans (hnr p hp) (Nat.pow_lt_pow_right (by norm_num) (by norm_num))
          · exact Nat.two_pow_pos _)
      rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le hlt (Nat.pow_le_pow_right (by norm_num) (by omega)))] at h
      cases h

/-! ## The child -/

theorem lor_shr_bit (a b s k : ℕ) :
    (Nat.lor (Nat.shiftRight a s) (Nat.shiftRight b s)).testBit k = (a.testBit (s + k) || b.testBit (s + k)) := by
  show ((a >>> s) ||| (b >>> s)).testBit k = _
  rw [Nat.testBit_or, Nat.testBit_shiftRight, Nat.testBit_shiftRight]

theorem row_eq_rowOf (nc : NodeC) (p : ℕ) : nc.row p = rowOf nc.dictW p := rfl

theorem andn_view (x y : W8) : (x.andn y).view = K2.andn x.view y.view := W8.view_andn x y

theorem shiftL_mem_iff (o : ℕ) (rows : List ℕ) (m' : ℕ) : m' ∈ K2.shiftL o rows ↔ ∃ m ∈ rows, m' = m >>> o := by
  constructor
  · exact K2.mem_shiftL o rows m'
  · rintro ⟨m, hm, rfl⟩
    induction rows with
    | nil => cases hm
    | cons a rows ih =>
      change m >>> o ∈ (Nat.shiftRight a o :: K2.shiftL o rows)
      rcases List.mem_cons.mp hm with rfl | hm
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem _ (ih hm)

theorem mapL_mem_iff (mk : ℕ → ℕ) (ps : List ℕ) (m : ℕ) : m ∈ R3RT.mapL mk ps ↔ ∃ p ∈ ps, m = mk p := by
  constructor
  · exact KD.mem_mapL
  · rintro ⟨p, hp, rfl⟩
    induction ps with
    | nil => cases hp
    | cons q ps ih =>
      change mk p ∈ (mk q :: R3RT.mapL mk ps)
      rcases List.mem_cons.mp hp with rfl | hp
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem _ (ih hp)

/-! ## kill2's lean child check (`K2.childL4X`, X-steps on the complement): the converse of `K2.childL4X_imp` -/

/-- every in-branch's window index is inside the window (`K2.brk3L` requires it) -/
def vsLt (n : ℕ) : K2.XT3 → Prop
  | .leaf _ _ => True
  | .node _ v _ l r => v < n ∧ vsLt n l ∧ vsLt n r
  | .cut => True

/-- the tree check implies the tree check on the complement when every pick is inside the window -/
theorem checkXT3_imp_L (REP GRD LOWS MODM ALL S TOP n o T : ℕ) (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n)
    (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n) (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n)
    (hM : MODM = 2 ^ (S - 1) - 1) (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n) :
    ∀ (t : K2.XT3) (NA A c P : ℕ), vsLt n t → c < 2 ^ n → NA &&& ALL = ALL ^^^ (A &&& ALL) →
      K2.checkXT3 REP GRD LOWS MODM S o T t A c P = true → K2.checkXT3L REP GRD LOWS MODM S TOP o T t NA c P = true := by
  intro t
  induction t with
  | leaf sts fin =>
    intro NA A c P _ hc hNA h
    change K2.fewerB (Nat.land (K2.runSo A REP GRD LOWS MODM S o sts c) (fin.1 >>> o)) fin.2 = true at h
    change K2.fewerB (Nat.land (K2.runSoL NA REP GRD LOWS MODM o sts c) (fin.1 >>> o)) fin.2 = true
    rwa [K2.runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc]
  | node sts v B l r ihl ihr =>
    intro NA A c P hv hc hNA h
    obtain ⟨hvn, hvl, hvr⟩ := hv
    have hre := K2.runSoL_eq A NA REP GRD LOWS MODM ALL S n o hS hREP hGRD hL hM hALL hNA sts c hc
    have hc' : K2.runSo A REP GRD LOWS MODM S o sts c < 2 ^ n := K2.runSo_lt A REP GRD LOWS MODM S o n sts c hc
    change K2.brk3 _ _ A _ v S (K2.runSo A REP GRD LOWS MODM S o sts c) P = true at h
    change K2.brk3L _ _ NA _ v S TOP (K2.runSoL NA REP GRD LOWS MODM o sts c) P = true
    rw [hre]
    unfold K2.brk3 at h; unfold K2.brk3L
    rw [Bool.and_eq_true] at h
    rw [Bool.and_eq_true, Bool.and_eq_true]
    refine ⟨?_, ?_, ?_⟩
    · rw [Nat.blt_eq, hTOP]; show (1 : ℕ) <<< v < 2 ^ n
      rw [Nat.one_shiftLeft]; exact Nat.pow_lt_pow_right (by norm_num) hvn
    · rw [K2.land_rowA_compl A NA ALL S n v _ hS hvn hc' hALL hNA]
      exact ihl _ _ _ _ hvl (K2.andn_lt _ hc') (K2.compl_inbranch A NA ALL _ hNA) h.1
    · exact ihr _ _ _ _ hvr (K2.andn_lt _ hc') hNA h.2
  | cut => intro _ _ _ _ _ _ _ h; exact h

/-- **`K2.childL4` gives `K2.childL4X`** when every pick is inside the window -/
theorem childL4X_of (REPm REP GRD LOWS MODM DIAG ALL S TOP n o T Anode C2u Fu : ℕ) (crows : List ℕ) (t : K2.XT3)
    (hS : n + 2 ≤ S) (hREP : REP = pk S (fun _ => 1) n) (hGRD : GRD = pk S (fun _ => 2 ^ (S - 1)) n)
    (hL : LOWS = pk S (fun _ => 2 ^ (S - 1) - 1) n) (hM : MODM = 2 ^ (S - 1) - 1)
    (hALL : ALL = pk S (fun _ => 2 ^ n - 1) n) (hTOP : TOP = 2 ^ n) (hvs : vsLt n t)
    (h : K2.childL4 REPm REP GRD LOWS MODM DIAG S TOP o T Anode C2u Fu crows t = true) :
    K2.childL4X REPm REP GRD LOWS MODM DIAG ALL S TOP o T Anode C2u Fu crows t = true := by
  change (K2.allLt (Nat.shiftLeft TOP o) crows && K2.checkXT3 REP GRD LOWS MODM S o T t _ _ 0) = true at h
  change (K2.allLt (Nat.shiftLeft TOP o) crows && K2.checkXT3L REP GRD LOWS MODM S TOP o T t _ _ 0) = true
  rw [Bool.and_eq_true] at h ⊢
  refine ⟨h.1, checkXT3_imp_L REP GRD LOWS MODM ALL S TOP n o T hS hREP hGRD hL hM hALL hTOP t _ _ _ _ hvs ?_ ?_ h.2⟩
  · apply lt_of_le_of_lt Nat.and_le_right
    rw [hTOP]; exact Nat.sub_lt (Nat.two_pow_pos n) (by norm_num)
  · rw [K2.lor_shiftRight]; exact K2.compl_diag ALL _ DIAG

/-- an accepted native tree has every pick inside the window -/
theorem treeN_vs (nc : NodeC) (kc : KidC) (HP : ℕ) (aggs : List KD.Agg) :
    ∀ (t : XTN) (rows : Array W8) (path picks : List ℕ) (c : W8),
      treeN nc kc t rows path picks c = true → vsLt (510 - kc.u) (KD.toXT3c HP aggs (XCV t)) := by
  intro t
  induction t with
  | cut => intro _ _ _ _ _; trivial
  | leaf sts fj fd => intro _ _ _ _ _; trivial
  | node sts v k l r ihl ihr =>
    intro rows path picks c h
    unfold treeN at h
    split at h
    · cases h
    · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
      obtain ⟨⟨⟨⟨_, _⟩, hpw⟩, hl⟩, hr⟩ := h
      exact ⟨by omega, ihl _ _ _ _ hl, ihr _ _ _ _ hr⟩

/-- **a child**: an accepted native child is accepted by `KD.kidX` -/
theorem kidX_of (c2t : Array (Array UInt64)) (dict D N : Array UInt64) (last b1 m e1 du : ℕ) (x : XRec)
    (nc : NodeC) (hdictW : nc.dictW = dictWOf dict) (hD : nc.D = W8.ofLimbs D 0)
    (hAn : nc.An = anOf N last (x.nrows.map (rowOf (dictWOf dict)))) (hc2W : nc.c2W = prepC2 c2t) (hlast : nc.last = last)
    (hb1 : nc.b1 = b1) (hm : nc.m = m) (he1 : nc.e1 = e1)
    (hnr : ∀ p ∈ x.nrows.toList, (NN.rowV dict p).testBit 511 = false)
    (rel : NRel nc (HPV x) (DEFPV x) (JV x) (aggsV c2t (NN.rowV dict) x) (21 - du))
    (k : XKid) (rows : Array W8) (hsz : rows.size = 512) (kc : KidC) (rows1 : Array W8)
    (hset : kidSetup nc k rows = some (kc, rows1)) (htree : treeN nc kc k.t rows1 [] [] k.Fu = true) :
    KD.kidX (NN.natL D 0 8) last b1 m e1 (KD.anodeX (NN.natL N 0 4096) (NN.rowV dict) x.nrows.toList) (HPV x) (DEFPV x)
      (JV x) (Nat.sub 21 du) (NN.rowV dict) (aggsV c2t (NN.rowV dict) x) (kidV c2t k) = true := by
  obtain ⟨hlu, hu, hFu, hcr, hkc, hrows1⟩ := kidSetup_spec nc k rows kc rows1 hset
  rw [hlast] at hlu
  set u := k.u with hudef
  set Anode := KD.anodeX (NN.natL N 0 4096) (NN.rowV dict) x.nrows.toList with hAnode
  -- the node matrix rows
  have hAnb : ∀ l j, last < l → l < 512 → j < 512 → (nc.An[l]!).view.testBit j = Anode.testBit (512 * l + j) := by
    intro l j h1 h2 h3; rw [hAn]; exact an_bit N last dict x.nrows hnr l j h1 h2 h3
  have hrow : ∀ p, (nc.row p).view = NN.rowV dict p := by
    intro p; rw [row_eq_rowOf, hdictW, rowOf_view]
  -- the free set lies in the window
  have hFv : k.Fu.view = K2.andn (K2.andn (2 ^ 511 - 2 ^ (u + 1)) (NN.natL D 0 8)) (nc.An[u]!).view := by
    rw [hFu, andn_view, andn_view, windowTab_view u hu, hD, W8.view_ofLimbs]
  have hFwin : ∀ l, k.Fu.view.testBit l = true → u < l ∧ l < 511 := by
    intro l hl
    rw [hFv, K2.testBit_andn, K2.testBit_andn, L5.testBit_pow_sub_pow 511 (u + 1) l (by omega)] at hl
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hl
    omega
  -- the node-matrix row of u
  have hAu : (nc.An[u]!).view = K2.rowA 512 Anode u := by
    rw [K2.rowA_eq]
    apply Nat.eq_of_testBit_eq; intro t
    by_cases ht : t < 512
    · rw [hAnb u t hlu (by omega) ht, testBit_dig 512 Anode u t ht]
    · rw [Nat.testBit_lt_two_pow (lt_of_lt_of_le (W8.view_lt _) (Nat.pow_le_pow_right (by norm_num) (by omega))),
        Nat.testBit_lt_two_pow (lt_of_lt_of_le (dig_lt 512 Anode u) (Nat.pow_le_pow_right (by norm_num) (by omega)))]
  -- the child rows
  have hcrm : ∀ mm ∈ R3RT.mapL (NN.rowV dict) k.cr.toList, mm < 2 ^ 511 := by
    intro mm hmm
    obtain ⟨p, hp, rfl⟩ := (mapL_mem_iff _ _ _).mp hmm
    have := (hcr p hp).1
    rw [W8.testBit_eq, hrow] at this
    exact lt_511_of _ (rowV_lt dict p) this
  -- the initial rows are the source rows
  have hkc2 : ∀ l, kc.c2[l]! = c2row nc.c2W u l := by intro l; rw [hkc]; rfl
  have hrowsC : ∀ mm, mm ∈ kc.rowsC.toList ↔ ∃ p ∈ k.cr.toList, mm = nc.row p := by
    intro mm; rw [hkc]
    simp only [Array.toList_map, List.mem_map]
    constructor
    · rintro ⟨p, hp, rfl⟩; exact ⟨p, hp, rfl⟩
    · rintro ⟨p, hp, rfl⟩; exact ⟨p, hp, rfl⟩
  have hsz0 : (setBaseWs nc kc k.Fu 0 rows).size = 512 := by rw [setBaseWs_size nc kc k.Fu _ 0 rows rfl, hsz]
  have hrows0 : ∀ l, k.Fu.view.testBit l = true → (rows1[l]!).view = (srcRow nc kc [] l).view := by
    intro l hl
    have hlw := hFwin l hl
    have hb := setBaseWs_get nc kc k.Fu _ 0 rows l rfl
    rw [if_pos ⟨Nat.zero_le _, hl, by omega⟩] at hb
    rw [hrows1]
    apply Nat.eq_of_testBit_eq; intro j
    rw [scatRows_bit _ _ _ l j (by rw [hsz0]; omega) (by rw [hb]; unfold baseV; rw [W8.testBit_clrBit]; simp), hb]
    unfold srcRow srcBase
    simp only [List.foldl_nil, show ¬ l ≥ 512 by omega, if_false, show l ≠ 511 by omega]
    unfold baseV
    rw [W8.testBit_clrBit, W8.testBit_clrBit]
    apply Bool.eq_iff_iff.mpr
    simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq, hl, true_and]
    rw [orHoldingW_bit]
    constructor
    · rintro ⟨h | h, h2⟩
      · exact ⟨Or.inl h.1, h2⟩
      · exact ⟨Or.inr h, h2⟩
    · rintro ⟨h | h, h2⟩
      · exact ⟨Or.inl ⟨h, h2⟩, h2⟩
      · exact ⟨Or.inr h, h2⟩
  -- the kernel's initial matrix stands for the source rows
  set n := 510 - u with hn
  set o := u + 1 with ho
  have hA0 : KRel nc kc [] o n (K2.clrD (K2.addCl (Nat.lor (Nat.shiftRight Anode (Nat.add (Nat.mul 512 o) o))
      (Nat.shiftRight (c2tV c2t u) (Nat.add (Nat.mul 512 o) o))) (KD.REPmn n) (KD.REPn n)
      (K2.shiftL o (R3RT.mapL (NN.rowV dict) k.cr.toList))) (KD.DIAGn n)) := by
    intro v w hw
    rw [testBit_dig 512 _ v w (by omega), clrD_bit, DIAGn_bit n v w (by omega) (by omega)]
    have hout : ∀ mm ∈ K2.shiftL o (R3RT.mapL (NN.rowV dict) k.cr.toList),
        (K2.outer mm (KD.REPmn n) (KD.REPn n)).testBit (512 * v + w) = true ↔
          (v < n ∧ mm.testBit v = true ∧ mm.testBit w = true) := by
      intro mm hmm
      obtain ⟨m0, hm0, rfl⟩ := (shiftL_mem_iff _ _ _).mp hmm
      have hlt : m0 >>> o < 2 ^ n := by
        have := hcrm _ hm0
        rw [Nat.shiftRight_eq_div_pow]
        apply Nat.div_lt_of_lt_mul
        calc m0 < 2 ^ 511 := this
          _ = 2 ^ o * 2 ^ n := by rw [← pow_add]; congr 1; omega
      rw [outern_bit n _ (by omega) hlt v w (by omega), Bool.and_eq_true, Bool.and_eq_true, decide_eq_true_eq]
      exact ⟨fun ⟨⟨h1, h2⟩, h3⟩ => ⟨h1, h2, h3⟩, fun ⟨h1, h2, h3⟩ => ⟨⟨h1, h2⟩, h3⟩⟩
    have hAlt := anodeX_lt N dict x.nrows.toList (fun p hp => lt_511_of _ (rowV_lt dict p) (hnr p hp))
    apply Bool.eq_iff_iff.mpr
    rw [Bool.and_eq_true, addCl_bit, lor_shr_bit, Bool.not_eq_true', decide_eq_false_iff_not,
      show Nat.add (Nat.mul 512 o) o + (512 * v + w) = 512 * (o + v) + (o + w) by simp only [Nat.add_eq, Nat.mul_eq]; ring,
      Bool.or_eq_true]
    unfold srcRow srcBase
    simp only [List.foldl_nil]
    by_cases hv1 : o + v ≥ 512
    · rw [if_pos hv1, W8.view_zero, Nat.zero_testBit]
      have hbig : 512 * 512 ≤ 512 * (o + v) + (o + w) := le_trans (Nat.mul_le_mul_left 512 hv1) (Nat.le_add_right _ _)
      have h1 : Anode.testBit (512 * (o + v) + (o + w)) = false :=
        Nat.testBit_lt_two_pow (lt_of_lt_of_le hAlt (Nat.pow_le_pow_right (by norm_num) hbig))
      have h2 : (c2tV c2t u).testBit (512 * (o + v) + (o + w)) = false :=
        Nat.testBit_lt_two_pow (lt_of_lt_of_le (c2tV_lt c2t u) (Nat.pow_le_pow_right (by norm_num) hbig))
      rw [h1, h2]
      constructor
      · rintro ⟨h | ⟨mm, hmm, hb⟩, _⟩
        · simp at h
        · have := ((hout mm hmm).mp hb).1; omega
      · intro h; cases h
    · rw [if_neg hv1]
      have hl5 : o + v < 512 := by omega
      have hAv := hAnb (o + v) (o + w) (by omega) hl5 (by omega)
      have hCv := c2row_view c2t u (o + v) (o + w) hl5 (by omega)
      rw [← hc2W] at hCv
      by_cases hv2 : o + v = 511
      · rw [if_pos hv2, W8.testBit_or, hkc2, Bool.or_eq_true, hAv, hCv]
        have hvn : ¬ v < n := by omega
        constructor
        · rintro ⟨h | ⟨mm, hmm, hb⟩, _⟩
          · exact h
          · exact absurd ((hout mm hmm).mp hb).1 hvn
        · intro h; exact ⟨Or.inl h, fun h' => hvn h'.1⟩
      · rw [if_neg hv2, W8.testBit_clrBit, Bool.and_eq_true, orHoldingW_bit, W8.testBit_or, hkc2, Bool.or_eq_true,
          hAv, hCv, decide_eq_true_eq]
        have hvn : v < n := by omega
        constructor
        · rintro ⟨h | ⟨mm, hmm, hb⟩, h4⟩
          · exact ⟨Or.inl h, fun h' => h4 ⟨hvn, by omega⟩⟩
          · obtain ⟨_, hb1, hb2⟩ := (hout mm hmm).mp hb
            obtain ⟨m0, hm0, rfl⟩ := (shiftL_mem_iff _ _ _).mp hmm
            obtain ⟨p, hp, rfl⟩ := (mapL_mem_iff _ _ _).mp hm0
            rw [Nat.testBit_shiftRight] at hb1 hb2
            refine ⟨Or.inr ⟨nc.row p, (hrowsC _).mpr ⟨p, hp, rfl⟩, by rw [hrow]; exact hb1, by rw [hrow]; exact hb2⟩,
              fun h' => h4 ⟨hvn, by omega⟩⟩
        · rintro ⟨h | ⟨mm, hmm, hb1, hb2⟩, h4⟩
          · exact ⟨Or.inl h, fun h' => h4 (by omega)⟩
          · obtain ⟨p, hp, rfl⟩ := (hrowsC mm).mp hmm
            rw [hrow] at hb1 hb2
            refine ⟨Or.inr ⟨NN.rowV dict p >>> o, (shiftL_mem_iff _ _ _).mpr ⟨_, (mapL_mem_iff _ _ _).mpr ⟨p, hp, rfl⟩, rfl⟩,
              (hout _ ((shiftL_mem_iff _ _ _).mpr ⟨_, (mapL_mem_iff _ _ _).mpr ⟨p, hp, rfl⟩, rfl⟩)).mpr
                ⟨hvn, by rw [Nat.testBit_shiftRight]; exact hb1, by rw [Nat.testBit_shiftRight]; exact hb2⟩⟩,
              fun h' => h4 (by omega)⟩
  -- the kernel's initial candidates
  have hc0 : CandRel o k.Fu (Nat.land (Nat.shiftRight k.Fu.view o) (Nat.sub (Nat.shiftLeft 1 (Nat.sub 510 u)) 1)) := by
    refine ⟨?_, fun l hl => ⟨by have := hFwin l hl; omega, (hFwin l hl).2⟩⟩
    apply Nat.eq_of_testBit_eq; intro t
    change ((k.Fu.view >>> o) &&& ((1 <<< (510 - u)) - 1)).testBit t = _
    rw [Nat.testBit_and, Nat.one_shiftLeft, Nat.testBit_two_pow_sub_one, Nat.testBit_shiftRight]
    by_cases ht : t < 510 - u
    · simp [ht]
    · have : k.Fu.view.testBit (o + t) = false := by
        cases h' : k.Fu.view.testBit (o + t)
        · rfl
        · have := hFwin _ h'; omega
      simp [this]
  -- the tree
  obtain ⟨hchk, hxc⟩ := treeN_sim rel kc u hu (by rw [hkc]) k.t rows1 [] [] k.Fu _ _ htree
    (by rw [hrows1, scatRows_size, hsz0]) hc0 hrows0 hA0
  -- kidX
  unfold KD.kidX
  simp only [kidV, consts, Bool.and_eq_true, Nat.blt_eq]
  refine ⟨⟨⟨⟨⟨hlu, hu⟩, ?_⟩, ?_⟩, hxc⟩, ?_⟩
  · -- fuX
    unfold KD.fuX
    rw [Nat.beq_eq, hFv, hAu]
    have hw : Nat.sub (Nat.shiftLeft 1 511) (Nat.shiftLeft 1 (Nat.add u 1)) = 2 ^ 511 - 2 ^ (u + 1) := by
      show (1 <<< 511) - (1 <<< (u + 1)) = _
      rw [Nat.one_shiftLeft, Nat.one_shiftLeft]
    rw [hw]
  · -- crX
    unfold KD.crX
    apply listRec_and_of
    intro p hp
    obtain ⟨h1, h2⟩ := hcr p hp
    rw [Bool.or_eq_true]
    rcases h2 with h2 | h2
    · left; rw [← r1pos_eq, ← hb1, ← hm, ← he1]; exact h2
    · right
      rw [Nat.beq_eq, KD.bitAt_eq, ← hrow, ← W8.testBit_eq, h2]; rfl
  · -- childL4X, from childL4
    have hn : 510 - u ≤ 511 := by omega
    have hvs := treeN_vs nc kc (HPV x) (aggsV c2t (NN.rowV dict) x) k.t rows1 [] [] k.Fu htree
    have hku : kc.u = u := by rw [hkc]
    rw [hku] at hvs
    apply childL4X_of _ _ _ _ _ _ _ _ _ (510 - u) _ _ _ _ _ _ _ (by omega) (KD.REPn_eq _ hn) (KD.GRDn_eq _ hn)
      (KD.LOWSn_eq _ hn) rfl ?_ ?_ hvs
    · unfold K2.childL4
      rw [Bool.and_eq_true]
      refine ⟨?_, hchk⟩
      unfold K2.allLt
      apply listRec_and_of (fun mm => Nat.blt mm (Nat.shiftLeft (Nat.shiftLeft 1 (Nat.sub 510 u)) (Nat.succ u)))
      intro mm hmm
      rw [Nat.blt_eq]
      change mm < (1 <<< (510 - u)) <<< (u + 1)
      rw [Nat.one_shiftLeft, Nat.shiftLeft_eq, ← pow_add, show 510 - u + (u + 1) = 511 by omega]
      exact hcrm mm hmm
    · -- ALL = REP (2^n - 1)
      show KD.REPn (510 - u) * ((1 <<< (510 - u)) - 1) = pk 512 (fun _ => 2 ^ (510 - u) - 1) (510 - u)
      rw [KD.REPn_eq _ hn, Nat.one_shiftLeft, mul_comm, ← MisF.pk_mul]
      simp
    · show Nat.shiftLeft 1 (Nat.sub 510 u) = 2 ^ (510 - u)
      show 1 <<< (510 - u) = _; rw [Nat.one_shiftLeft]

end XTP
