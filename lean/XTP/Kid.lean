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
/-! # XTP.Kid: a child of the native X tier against `KD.kidX`

The native child (`XT.kidSetup`, `XT.treeN`) keeps the rows of its candidates equal to the **source rows** `srcRow`: the window
matrix's slots in label layout, with the aggregates of the path's in-branches ORed in.  The kernel's matrix `A` of
`K2.checkXT3` has exactly these slots on the window bits (`KInv`).  So every X-step, in-branch, leaf and cut decides the same. -/
@[expose] public section
namespace XTP
open XT MisF

set_option exponentiation.threshold 1024

/-! ## Source rows -/

/-- the OR of the views of `g k` for `k ∈ path` -/
def orV (g : ℕ → W8) : List ℕ → ℕ
  | [] => 0
  | k :: path => (g k).view ||| orV g path

theorem foldl_or_view (g : ℕ → W8) : ∀ (path : List ℕ) (base : W8),
    (path.foldl (fun acc k => acc.or (g k)) base).view = base.view ||| orV g path := by
  intro path
  induction path with
  | nil => intro base; simp [orV]
  | cons k path ih =>
    intro base
    simp only [List.foldl_cons]
    rw [ih, W8.view_or, orV, Nat.or_assoc]

theorem srcRow_cons (nc : NodeC) (kc : KidC) (k : ℕ) (path : List ℕ) (l : ℕ) :
    (srcRow nc kc (k :: path) l).view = (srcRow nc kc path l).view ||| (brow nc.c2W nc.aggs[k]! l).view := by
  unfold srcRow
  rw [foldl_or_view (fun k => brow nc.c2W nc.aggs[k]! l) (k :: path),
    foldl_or_view (fun k => brow nc.c2W nc.aggs[k]! l) path, orV, Nat.or_assoc,
    Nat.or_comm (brow nc.c2W nc.aggs[k]! l).view (orV (fun k => brow nc.c2W nc.aggs[k]! l) path)]

theorem brow_diag (c2W : Array (Array W8)) (ag : AggC) (l : ℕ) (hl : l < 511) : (brow c2W ag l).view.testBit l = false := by
  unfold brow
  split
  · rw [W8.view_zero]; simp
  · split
    · omega
    · split
      · omega
      · split
        · rw [W8.view_zero]; simp
        · rw [W8.testBit_clrBit]; simp

theorem srcRow_diag (nc : NodeC) (kc : KidC) (path : List ℕ) (l : ℕ) (hl : l < 511) :
    (srcRow nc kc path l).view.testBit l = false := by
  induction path with
  | nil =>
    unfold srcRow srcBase
    simp only [List.foldl_nil, show ¬ l ≥ 512 by omega, if_false, show l ≠ 511 by omega]
    rw [W8.testBit_clrBit]; simp
  | cons k path ih => rw [srcRow_cons, Nat.testBit_or, ih, brow_diag _ _ _ hl]; rfl

theorem srcRow_high (nc : NodeC) (kc : KidC) (path : List ℕ) (l : ℕ) (hl : 512 ≤ l) : (srcRow nc kc path l).view = 0 := by
  induction path with
  | nil => unfold srcRow srcBase; simp [show l ≥ 512 from hl, W8.view_zero]
  | cons k path ih =>
    rw [srcRow_cons, ih]
    have : (brow nc.c2W nc.aggs[k]! l).view = 0 := by
      unfold brow
      by_cases hx : nc.aggs[k]!.x ≥ 511
      · rw [if_pos hx]; exact W8.view_zero
      · rw [if_neg hx, if_pos (by omega)]; exact W8.view_zero
    rw [this]; rfl

/-! ## The child setup -/

theorem kidSetup_spec (nc : NodeC) (k : XKid) (rows : Array W8) (kc : KidC) (rows1 : Array W8)
    (h : kidSetup nc k rows = some (kc, rows1)) :
    nc.last < k.u ∧ k.u < 511 ∧ k.Fu = ((windowTab[k.u]!).andn nc.D).andn (nc.An[k.u]!) ∧
      (∀ p ∈ k.cr.toList, (nc.row p).testBit 511 = false ∧ (XT.r1pos nc.b1 nc.m nc.e1 p = true ∨ (nc.row p).testBit k.u = true)) ∧
      kc = { u := k.u, rowsC := k.cr.map nc.row, c2 := nc.c2W[k.u]! } ∧
      rows1 = scatRows kc.rowsC k.Fu (setBaseWs nc kc k.Fu 0 rows) := by
  simp only [kidSetup] at h
  split at h
  · rename_i hc
    simp only [Option.some.injEq, Prod.mk.injEq] at h
    obtain ⟨rfl, rfl⟩ := h
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
    obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hc
    refine ⟨h1, h2, W8.beq_eq_true h3, ?_, rfl, rfl⟩
    intro p hp
    rw [Array.all_eq_true] at h4
    obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hp
    have := h4 i (by simpa using hi)
    simp only [Bool.and_eq_true, Bool.not_eq_true', Bool.or_eq_true, Array.getElem_toList] at this ⊢
    exact this
  · cases h

/-! ## Candidate sets in the window -/

/-- the native candidates `cN` stand for the kernel's `c` on the window `[o, 511)` -/
structure CandRel (o : ℕ) (cN : W8) (c : ℕ) : Prop where
  shift : c = cN.view >>> o
  win : ∀ l, cN.view.testBit l = true → o ≤ l ∧ l < 511

theorem CandRel.lt {o : ℕ} {cN : W8} {c : ℕ} (h : CandRel o cN c) (ho : o ≤ 511) : c < 2 ^ (511 - o) := by
  rw [h.shift]
  apply Nat.lt_pow_two_of_testBit
  intro t ht
  rw [Nat.testBit_shiftRight]
  cases hb : cN.view.testBit (o + t) with
  | false => rfl
  | true => have := h.win _ hb; omega

theorem CandRel.bit {o : ℕ} {cN : W8} {c : ℕ} (h : CandRel o cN c) (w : ℕ) : c.testBit w = cN.view.testBit (o + w) := by
  rw [h.shift, Nat.testBit_shiftRight]

/-- a subset of the candidates keeps the relation -/
theorem CandRel.sub {o : ℕ} {cN : W8} {c : ℕ} (h : CandRel o cN c) (cN' : W8)
    (hs : ∀ l, cN'.view.testBit l = true → cN.view.testBit l = true) : CandRel o cN' (cN'.view >>> o) :=
  ⟨rfl, fun l hl => h.win l (hs l hl)⟩

theorem pcnt_low_zero (X o : ℕ) (hlow : ∀ t < o, X.testBit t = false) : L5.pcnt o X = 0 := by
  rw [L5.pcnt_eq_card, Finset.card_eq_zero, Finset.filter_eq_empty_iff]
  intro t ht; rw [hlow t (Finset.mem_range.mp ht)]; simp

theorem pcnt_high (X a : ℕ) (b : ℕ) (hX : X < 2 ^ a) : L5.pcnt (a + b) X = L5.pcnt a X := by
  rw [L5.pcnt_add]
  have : X >>> a = 0 := by rw [Nat.shiftRight_eq_div_pow]; exact Nat.div_eq_of_lt hX
  rw [this, L5.pcnt_zero_x, Nat.add_zero]

/-- a mask without bits below `o` and above 511 has the popcount of its shift -/
theorem pcnt_shift (X o : ℕ) (ho : o ≤ 511) (hX : X < 2 ^ 511) (hlow : ∀ t < o, X.testBit t = false) :
    L5.pcnt 512 X = L5.pcnt 512 (X >>> o) := by
  have h1 : L5.pcnt 512 X = L5.pcnt o X + L5.pcnt (512 - o) (X >>> o) := by
    rw [← L5.pcnt_add]; congr 1; omega
  rw [h1, pcnt_low_zero X o hlow, Nat.zero_add]
  have hs : X >>> o < 2 ^ (512 - o) := by
    rw [Nat.shiftRight_eq_div_pow]
    apply Nat.div_lt_of_lt_mul
    calc X < 2 ^ 511 := hX
      _ ≤ 2 ^ o * 2 ^ (512 - o) := by rw [← pow_add]; exact Nat.pow_le_pow_right (by norm_num) (by omega)
  have := pcnt_high (X >>> o) (512 - o) o hs
  rw [show 512 - o + o = 512 by omega] at this
  exact this.symm

/-- the kernel matrix stands for the source rows on the window: slot `v`, bit `w` (`w < n`) -/
def KRel (nc : NodeC) (kc : KidC) (path : List ℕ) (o n A : ℕ) : Prop :=
  ∀ v w, w < n → (dig 512 A v).testBit w = (srcRow nc kc path (o + v)).view.testBit (o + w)

theorem consts_cp (n : ℕ) (hn : n ≤ 511) :
    KD.REPn n = pk 512 (fun _ => 1) n ∧ KD.GRDn n = pk 512 (fun _ => 2 ^ (512 - 1)) n ∧
      KD.LOWSn n = pk 512 (fun _ => 2 ^ (512 - 1) - 1) n :=
  ⟨KD.REPn_eq n hn, KD.GRDn_eq n hn, KD.LOWSn_eq n hn⟩

/-- **the X-step**: the kernel's step on the window is the native step, shifted -/
theorem xstep_sim (nc : NodeC) (kc : KidC) (path : List ℕ) (u : ℕ) (hu : u < 511) (rows : Array W8) (cN : W8)
    (c A Hk : ℕ) (H : W8) (d : ℕ) (hd : 1 ≤ d) (hc : CandRel (u + 1) cN c)
    (hrows : ∀ l, cN.view.testBit l = true → (rows[l]!).view = (srcRow nc kc path l).view)
    (hA : KRel nc kc path (u + 1) (510 - u) A)
    (hH : ∀ t, t < 511 → Hk.testBit t = H.view.testBit t) :
    K2.xstep A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 c (Hk >>> (u + 1)) d =
      (xstepN rows cN H d).view >>> (u + 1) := by
  obtain ⟨hR, hG, hL⟩ := consts_cp (510 - u) (by omega)
  have hclt : c < 2 ^ (510 - u) := by have := hc.lt (by omega); rwa [show 511 - (u + 1) = 510 - u by omega] at this
  apply Nat.eq_of_testBit_eq; intro w
  rw [Nat.testBit_shiftRight]
  by_cases hw : w < 510 - u
  · rw [xstep_bit A _ _ _ _ 512 (510 - u) c _ d w (by omega) hclt hR hG hL (by rw [R3RT.m511_eq]) hw, xstepN_bit,
      hc.bit w]
    cases hb : cN.view.testBit (u + 1 + w)
    · rfl
    · simp only [Bool.true_and]
      apply decide_eq_decide.mpr
      set Y := cN.and H with hYdef
      -- the kernel's demand set is the native one, shifted
      have hYwin : ∀ l, Y.view.testBit l = true → u + 1 ≤ l ∧ l < 511 := by
        intro l hl; rw [W8.testBit_and, Bool.and_eq_true] at hl; exact hc.win l hl.1
      have hYk : c &&& (Hk >>> (u + 1)) = Y.view >>> (u + 1) := by
        apply Nat.eq_of_testBit_eq; intro t
        rw [Nat.testBit_and, Nat.testBit_shiftRight, Nat.testBit_shiftRight, hc.bit t, W8.testBit_and]
        cases hct : cN.view.testBit (u + 1 + t)
        · rfl
        · have := hc.win _ hct
          rw [hH _ (by omega)]
      have hYlt : Y.view < 2 ^ 511 := by
        apply Nat.lt_pow_two_of_testBit; intro t ht
        cases h' : Y.view.testBit t
        · rfl
        · have := hYwin t h'; omega
      have hlow : ∀ t < u + 1, Y.view.testBit t = false := by
        intro t ht; cases h' : Y.view.testBit t
        · rfl
        · have := hYwin t h'; omega
      have hpop : Y.pop = L5.pcnt 512 (c &&& (Hk >>> (u + 1))) := by
        rw [W8.pop_eq, hYk]; exact pcnt_shift _ _ (by omega) hYlt hlow
      have hr := hrows (u + 1 + w) hb
      have hand : Y.andPop rows[u + 1 + w]! = L5.pcnt 512 ((c &&& (Hk >>> (u + 1))) &&& dig 512 A w) := by
        rw [W8.andPop_eq, pcnt_shift _ (u + 1) (by omega) (lt_of_le_of_lt Nat.and_le_left hYlt)
          (fun t ht => by rw [Nat.testBit_and, hlow t ht]; rfl)]
        apply L5.pcnt_congr; intro t _
        rw [Nat.testBit_shiftRight, Nat.testBit_and, Nat.testBit_and, hYk, Nat.testBit_shiftRight, hr]
        cases hyt : Y.view.testBit (u + 1 + t)
        · rfl
        · have := hYwin _ hyt
          rw [hA w t (by omega)]
      have hdiff := pcnt_diff 512 (c &&& (Hk >>> (u + 1))) (dig 512 A w)
      rw [hpop, hand]
      omega
  · have h1 : c.testBit w = false := Nat.testBit_lt_two_pow (lt_of_lt_of_le hclt (Nat.pow_le_pow_right (by norm_num) (by omega)))
    have h2 : (K2.xstep A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 c (Hk >>> (u + 1)) d).testBit w
        = false := by
      unfold K2.xstep
      change (c &&& _).testBit w = false
      rw [Nat.testBit_and, h1]; rfl
    rw [h2, xstepN_bit]
    have : cN.view.testBit (u + 1 + w) = false := by
      cases h' : cN.view.testBit (u + 1 + w)
      · rfl
      · have := hc.win _ h'; omega
    rw [this]; rfl

/-! ## The in-branch rows -/

theorem addAgg_view (c2W : Array (Array W8)) (ag : AggC) (hx : ag.x < 511) (hcl : ∀ m ∈ ag.cl.toList, m.view.testBit ag.x = false)
    (cin : W8) (rs : Array W8) (l : ℕ) (hl : cin.view.testBit l = true) (hls : l < rs.size) (hl511 : l < 511)
    (hdiag : (rs[l]!).view.testBit l = false) :
    (addAgg c2W ag cin rs)[l]!.view = (rs[l]!).view ||| (brow c2W ag l).view := by
  unfold addAgg
  have hR1 := addC2Ws_get c2W ag cin _ 0 rs l rfl
  have hR1s : l < (addC2Ws c2W ag cin 0 rs).size := by rw [addC2Ws_size c2W ag cin _ 0 rs rfl]; exact hls
  have hR1d : (addC2Ws c2W ag cin 0 rs)[l]!.view.testBit l = false := by
    rw [hR1]; split
    · simp [c2upd, W8.testBit_clrBit]
    · exact hdiag
  have hb1 : brow c2W ag l = if l = ag.x then W8.zero else (orHoldingW ag.cl l ((c2row c2W ag.x l).clrBit ag.x)).clrBit l := by
    unfold brow
    rw [if_neg (show ¬ ag.x ≥ 511 by omega), if_neg (show ¬ l ≥ 512 by omega), if_neg (show ¬ l = 511 by omega)]
  apply Nat.eq_of_testBit_eq; intro j
  rw [scatRows_bit _ _ _ l j hR1s hR1d, Nat.testBit_or, hb1]
  by_cases hlx : l = ag.x
  · -- the pick itself: its row is cleared in B and no aggregate row holds it
    have hnone : ¬ (cin.view.testBit l = true ∧ ∃ m ∈ ag.cl.toList, m.view.testBit l = true ∧ m.view.testBit j = true) := by
      rintro ⟨_, m, hm, h1, _⟩; rw [hlx, hcl m hm] at h1; cases h1
    have hv : (addC2Ws c2W ag cin 0 rs)[l]! = rs[l]! := by rw [hR1, if_neg (fun h => h.2.2.2 hlx)]
    rw [hv, if_pos hlx, W8.view_zero, Nat.zero_testBit, Bool.or_false, decide_eq_false hnone, Bool.or_false]
    by_cases hjl : j = l
    · subst hjl; rw [hdiag]; rfl
    · rw [decide_eq_true hjl, Bool.and_true]
  · have hv : (addC2Ws c2W ag cin 0 rs)[l]! = c2upd c2W ag l rs[l]! := by
      rw [hR1, if_pos ⟨Nat.zero_le _, hl, hls, hlx⟩]
    rw [hv, if_neg hlx]
    unfold c2upd
    rw [W8.testBit_clrBit, W8.testBit_or, W8.testBit_clrBit, W8.testBit_clrBit]
    have hor := orHoldingW_bit ag.cl l ((c2row c2W ag.x l).clrBit ag.x) j
    rw [W8.testBit_clrBit] at hor
    by_cases hjl : j = l
    · subst hjl; simp [hdiag]
    · simp only [hjl, ne_eq, not_false_eq_true, decide_true, Bool.and_true]
      apply Bool.eq_iff_iff.mpr
      simp only [Bool.or_eq_true, decide_eq_true_eq, hl, true_and]
      rw [hor]
      constructor
      · rintro ((h | h) | h)
        · exact Or.inl h
        · exact Or.inr (Or.inl h)
        · exact Or.inr (Or.inr h)
      · rintro (h | h | h)
        · exact Or.inl (Or.inl h)
        · exact Or.inl (Or.inr h)
        · exact Or.inr h

theorem brow_high (c2W : Array (Array W8)) (ag : AggC) (l : ℕ) (hl : 512 ≤ l) : (brow c2W ag l).view = 0 := by
  unfold brow
  by_cases hx : ag.x ≥ 511
  · rw [if_pos hx]; exact W8.view_zero
  · rw [if_neg hx, if_pos (by omega)]; exact W8.view_zero

theorem brow_xhigh (c2W : Array (Array W8)) (ag : AggC) (l : ℕ) (hx : 511 ≤ ag.x) : (brow c2W ag l).view = 0 := by
  unfold brow; rw [if_pos hx]; exact W8.view_zero

/-! ## Picks -/

/-- the kernel's pick mask of a path -/
def pmask : List ℕ → ℕ
  | [] => 0
  | v :: vs => Nat.lor (pmask vs) (Nat.shiftLeft 1 v)

theorem pmask_bit : ∀ (picks : List ℕ) (t : ℕ), (pmask picks).testBit t = decide (t ∈ picks)
  | [], t => by simp [pmask]
  | v :: vs, t => by
    show (Nat.lor (pmask vs) (Nat.shiftLeft 1 v)).testBit t = _
    rw [K2.testBit_lor, pmask_bit vs t, K2.testBit_one_shiftLeft]
    by_cases h : t = v
    · subst h; simp
    · simp [h]

theorem pmask_lt : ∀ (picks : List ℕ) (B : ℕ), (∀ v ∈ picks, v < B) → pmask picks < 2 ^ B
  | [], B, _ => by simp [pmask]
  | v :: vs, B, h => by
    show Nat.lor (pmask vs) (Nat.shiftLeft 1 v) < 2 ^ B
    apply Nat.or_lt_two_pow (pmask_lt vs B (fun w hw => h w (List.mem_cons_of_mem _ hw)))
    change 1 <<< v < 2 ^ B
    rw [Nat.one_shiftLeft]; exact Nat.pow_lt_pow_right (by norm_num) (h v (List.mem_cons_self ..))

theorem distinct_eq : ∀ (picks : List ℕ), distinct picks = picks.toFinset.card
  | [] => rfl
  | v :: vs => by
    rw [distinct, distinct_eq vs, List.toFinset_cons]
    by_cases h : v ∈ vs
    · rw [if_pos (List.elem_iff.mpr h), Finset.insert_eq_of_mem (List.mem_toFinset.mpr h)]; simp
    · rw [if_neg (by simpa using h), Finset.card_insert_of_notMem (by rw [List.mem_toFinset]; exact h)]; ring

/-- **the cut leaf**: more than `T` distinct picks -/
theorem overB_pmask (picks : List ℕ) (T : ℕ) (h : T < distinct picks) : K2.overB (pmask picks) T = true := by
  set B := picks.foldr max 0 + 1 with hB
  have hlt : ∀ v ∈ picks, v < B := by
    intro v hv
    have : v ≤ picks.foldr max 0 := by
      clear hB h
      induction picks with
      | nil => cases hv
      | cons w ws ih =>
        rcases List.mem_cons.mp hv with rfl | hv
        · simp
        · exact le_trans (ih hv) (by simp)
    omega
  have hP := pmask_lt picks B hlt
  unfold K2.overB
  rw [Nat.blt_eq]
  have hne := (remB_ne_zero_iff B (pmask picks) T hP).mpr (by
    rw [bitsB_card_eq_pcnt, L5.pcnt_eq_card]
    have : (Finset.range B).filter (fun t => (pmask picks).testBit t = true) = picks.toFinset := by
      ext t; simp only [Finset.mem_filter, Finset.mem_range, pmask_bit, decide_eq_true_eq, List.mem_toFinset]
      constructor
      · rintro ⟨_, h⟩; exact h
      · intro ht; exact ⟨hlt t ht, ht⟩
    rw [this, ← distinct_eq]; exact h)
  omega

/-! ## What the child needs of the node -/

structure NRel (nc : NodeC) (HP DEFP J : ℕ) (aggs : List KD.Agg) (T : ℕ) : Prop where
  hJ : nc.J = J
  hslot : ∀ j < J, KD.hslot HP j = (nc.Hm[j]!).view
  hbyte : ∀ j < J, KD.byteAt DEFP j = nc.DEF[j]!
  hx : ∀ k < nc.aggs.size, (KD.aggAt aggs k).1 = (nc.aggs[k]!).x
  hB : ∀ k < nc.aggs.size, ∀ l j, l < 512 → j < 512 →
    (KD.aggAt aggs k).2.2.1.testBit (512 * l + j) = (brow nc.c2W nc.aggs[k]! l).view.testBit j
  hBlt : ∀ k < nc.aggs.size, (KD.aggAt aggs k).2.2.1 < 2 ^ (512 * 512)
  hcl : ∀ k < nc.aggs.size, ∀ m ∈ (nc.aggs[k]!).cl.toList, m.view.testBit (nc.aggs[k]!).x = false
  hT : nc.T = T

theorem stepC_of {nc : NodeC} {HP DEFP J : ℕ} {aggs : List KD.Agg} {T : ℕ} (rel : NRel nc HP DEFP J aggs T) (u j d : ℕ)
    (h : stepOK nc u j d = true) : KD.stepC HP DEFP J u (j, d) = true ∧ 1 ≤ d ∧ j < J := by
  unfold stepOK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  rw [rel.hJ] at h2
  refine ⟨?_, h1, h2⟩
  unfold KD.stepC
  simp only [Bool.and_eq_true, Nat.blt_eq, Nat.ble_eq]
  refine ⟨⟨h1, h2⟩, ?_⟩
  rw [rel.hslot j h2, rel.hbyte j h2, KD.bitAt_eq, ← W8.testBit_eq]
  simpa [Nat.add_eq] using h3

/-! ## A run of X-steps -/

theorem stepsFrom_cons (a : Array ℕ) (i : ℕ) (h : i + 1 < a.size) :
    stepsFrom a i = (a[i]!, a[i + 1]!) :: stepsFrom a (i + 2) := by
  rw [stepsFrom, if_pos h]

theorem stepsFrom_nil (a : Array ℕ) (i : ℕ) (h : ¬ i + 1 < a.size) : stepsFrom a i = [] := by
  rw [stepsFrom, if_neg h]

theorem runSteps_sim {nc : NodeC} {HP DEFP J : ℕ} {aggs : List KD.Agg} {T : ℕ} (rel : NRel nc HP DEFP J aggs T)
    (kc : KidC) (u : ℕ) (hu : u < 511) (rows : Array W8) (path : List ℕ) (A : ℕ)
    (hA : KRel nc kc path (u + 1) (510 - u) A) (sts : Array ℕ) :
    ∀ (k i : ℕ) (cN : W8) (c : ℕ) (c' : W8), sts.size - i = k → CandRel (u + 1) cN c →
      (∀ l, cN.view.testBit l = true → (rows[l]!).view = (srcRow nc kc path l).view) →
      runSteps nc u rows sts i cN = some c' →
      KD.stepsCOK HP DEFP J u (stepsFrom sts i) = true ∧
      K2.runSo A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1)
        (KD.stepsC HP (stepsFrom sts i)) c = c'.view >>> (u + 1) ∧
      (∀ l, c'.view.testBit l = true → cN.view.testBit l = true) := by
  intro k
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    intro i cN c c' hk hc hrows hrun
    rw [runSteps] at hrun
    by_cases hi : i + 1 < sts.size
    · rw [dif_pos hi] at hrun
      split at hrun
      · rename_i hok
        obtain ⟨hstep, hd, hj⟩ := stepC_of rel u _ _ hok
        set cN1 := xstepN rows cN nc.Hm[sts[i]!]! sts[i + 1]! with hcN1
        have hsub : ∀ l, cN1.view.testBit l = true → cN.view.testBit l = true := by
          intro l hl; rw [hcN1, xstepN_bit, Bool.and_eq_true] at hl; exact hl.1
        have hstep_eq := xstep_sim nc kc path u hu rows cN c A (KD.hslot HP sts[i]!) nc.Hm[sts[i]!]! sts[i + 1]! hd hc hrows hA
          (fun t _ => by rw [rel.hslot _ hj])
        obtain ⟨h1, h2, h3⟩ := ih (sts.size - (i + 2)) (by omega) (i + 2) cN1 (cN1.view >>> (u + 1)) c' rfl
          (hc.sub cN1 hsub) (fun l hl => hrows l (hsub l hl)) hrun
        rw [stepsFrom_cons sts i hi]
        refine ⟨?_, ?_, fun l hl => hsub l (h3 l hl)⟩
        · show (KD.stepC HP DEFP J u (sts[i]!, sts[i + 1]!) && KD.stepsCOK HP DEFP J u (stepsFrom sts (i + 2))) = true
          rw [hstep, h1]; rfl
        · show K2.runSo A _ _ _ _ 512 (u + 1) (KD.stepsC HP (stepsFrom sts (i + 2)))
            (K2.xstep A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 c
              (Nat.shiftRight (KD.hslot HP sts[i]!) (u + 1)) sts[i + 1]!) = _
          change K2.runSo A _ _ _ _ 512 (u + 1) (KD.stepsC HP (stepsFrom sts (i + 2)))
            (K2.xstep A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 c
              (KD.hslot HP sts[i]! >>> (u + 1)) sts[i + 1]!) = _
          rw [hstep_eq, ← hcN1, h2]
      · cases hrun
    · rw [dif_neg hi] at hrun
      cases hrun
      rw [stepsFrom_nil sts i hi]
      exact ⟨rfl, by rw [hc.shift]; rfl, fun l hl => hl⟩

/-! ## The tree -/

theorem fewerB_iff (x d : ℕ) (hx : x < 2 ^ 512) (hd : 1 ≤ d) : K2.fewerB x d = true ↔ L5.pcnt 512 x < d := by
  unfold K2.fewerB
  rw [Nat.beq_eq]
  have := remB_ne_zero_iff 512 x (Nat.sub d 1) hx
  rw [bitsB_card_eq_pcnt] at this
  constructor
  · intro h; by_contra hc; exact (this.mpr (by simp only [Nat.sub_eq]; omega)) h
  · intro h; by_contra hc; have := this.mp hc; simp only [Nat.sub_eq] at this; omega

/-- **the tree**: an accepted native tree is accepted by kill2's `checkXT3`, and its steps and in-branches are valid (`KD.xcOK`) -/
theorem treeN_sim {nc : NodeC} {HP DEFP J : ℕ} {aggs : List KD.Agg} {T : ℕ} (rel : NRel nc HP DEFP J aggs T)
    (kc : KidC) (u : ℕ) (hu : u < 511) (hku : kc.u = u) :
    ∀ (t : XTN) (rows : Array W8) (path picks : List ℕ) (cN : W8) (A c : ℕ),
      treeN nc kc t rows path picks cN = true → rows.size = 512 → CandRel (u + 1) cN c →
      (∀ l, cN.view.testBit l = true → (rows[l]!).view = (srcRow nc kc path l).view) →
      KRel nc kc path (u + 1) (510 - u) A →
      K2.checkXT3 (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) T
          (KD.toXT3c HP aggs (XCV t)) A c (pmask picks) = true ∧
        KD.xcOK HP DEFP J u aggs (XCV t) = true := by
  intro t
  induction t with
  | cut =>
    intro rows path picks cN A c h _ _ _ _
    unfold treeN at h
    rw [rel.hT] at h
    simp only [decide_eq_true_eq] at h
    exact ⟨overB_pmask picks T h, rfl⟩
  | leaf sts fj fd =>
    intro rows path picks cN A c h hsz hc hrows hA
    unfold treeN at h
    rw [hku] at h
    split at h
    · cases h
    · rename_i c' hrun
      rw [Bool.and_eq_true, decide_eq_true_eq] at h
      obtain ⟨hok, hpop⟩ := h
      obtain ⟨hstep, hd, hj⟩ := stepC_of rel u fj fd hok
      obtain ⟨h1, h2, h3⟩ := runSteps_sim rel kc u hu rows path A hA sts _ 0 cN c c' rfl hc hrows hrun
      refine ⟨?_, ?_⟩
      · show K2.fewerB (Nat.land (K2.runSo A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) (KD.stepsC HP (stepsFrom sts 0)) c)
            (Nat.shiftRight (KD.hslot HP fj) (u + 1))) fd = true
        have hwin : ∀ l, (c'.and nc.Hm[fj]!).view.testBit l = true → u + 1 ≤ l ∧ l < 511 := by
          intro l hl; rw [W8.testBit_and, Bool.and_eq_true] at hl; exact hc.win l (h3 l hl.1)
        have hx : Nat.land (K2.runSo A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) (KD.stepsC HP (stepsFrom sts 0)) c)
            (Nat.shiftRight (KD.hslot HP fj) (u + 1)) = (c'.and nc.Hm[fj]!).view >>> (u + 1) := by
          rw [h2]
          apply Nat.eq_of_testBit_eq; intro t
          change ((c'.view >>> (u + 1)) &&& (KD.hslot HP fj >>> (u + 1))).testBit t = _
          rw [Nat.testBit_and, Nat.testBit_shiftRight, Nat.testBit_shiftRight, Nat.testBit_shiftRight, W8.testBit_and,
            rel.hslot fj hj]
        have hlt : (c'.and nc.Hm[fj]!).view < 2 ^ 511 := by
          apply Nat.lt_pow_two_of_testBit; intro t ht
          cases h' : (c'.and nc.Hm[fj]!).view.testBit t
          · rfl
          · have := hwin t h'; omega
        have hlow : ∀ t < u + 1, (c'.and nc.Hm[fj]!).view.testBit t = false := by
          intro t ht; cases h' : (c'.and nc.Hm[fj]!).view.testBit t
          · rfl
          · have := hwin t h'; omega
        rw [hx, fewerB_iff _ fd (lt_of_le_of_lt (Nat.shiftRight_le _ _) (lt_trans hlt (by norm_num))) hd,
          ← pcnt_shift _ _ (by omega) hlt hlow, ← W8.pop_eq]
        exact hpop
      · show (KD.stepsCOK HP DEFP J u (stepsFrom sts 0) && KD.stepC HP DEFP J u (fj, fd)) = true
        rw [h1, hstep]; rfl
  | node sts v k l r ihl ihr =>
    intro rows path picks cN A c h hsz hc hrows hA
    unfold treeN at h
    rw [hku] at h
    split at h
    · cases h
    · rename_i c' hrun
      simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
      obtain ⟨⟨⟨⟨hk, hkx⟩, hpw⟩, hl⟩, hr⟩ := h
      obtain ⟨h1, h2, h3⟩ := runSteps_sim rel kc u hu rows path A hA sts _ 0 cN c c' rfl hc hrows hrun
      have hc' : CandRel (u + 1) c' (c'.view >>> (u + 1)) := hc.sub c' h3
      have hrows' : ∀ l, c'.view.testBit l = true → (rows[l]!).view = (srcRow nc kc path l).view :=
        fun l hl => hrows l (h3 l hl)
      set p := u + 1 + v with hp
      set ag := nc.aggs[k]! with hag
      -- the pick's current row is its source row
      set rv := if c'.testBit p = true then rows[p]! else srcRow nc kc path p with hrv
      have hrvv : rv.view = (srcRow nc kc path p).view := by
        rw [hrv]; split
        · rename_i hb; rw [W8.testBit_eq] at hb; exact hrows' p hb
        · rfl
      set cin := c'.andn rv with hcin
      have hcinsub : ∀ l, cin.view.testBit l = true → c'.view.testBit l = true := by
        intro l hl; rw [hcin, W8.testBit_andn, Bool.and_eq_true] at hl; exact hl.1
      -- the aggregate's matrix
      set B := (KD.aggAt aggs k).2.2.1 with hB
      have hagx : ag.x = p := hkx
      -- the kernel's in-branch candidates
      have hcin_rel : K2.andn (c'.view >>> (u + 1)) (K2.rowA 512 A v) = cin.view >>> (u + 1) := by
        apply Nat.eq_of_testBit_eq; intro w
        rw [K2.testBit_andn, Nat.testBit_shiftRight, Nat.testBit_shiftRight, K2.rowA_eq, hcin, W8.testBit_andn, hrvv]
        by_cases hw : w < 510 - u
        · rw [testBit_dig 512 A v w (by omega), ← testBit_dig 512 A v w (by omega), hA v w hw]
        · have : c'.view.testBit (u + 1 + w) = false := by
            cases h' : c'.view.testBit (u + 1 + w)
            · rfl
            · have := hc'.win _ h'; omega
          rw [this]; rfl
      -- the in-branch rows
      have hrows_in : ∀ l, cin.view.testBit l = true →
          ((if p < 511 then addAgg nc.c2W ag cin rows else rows)[l]!).view = (srcRow nc kc (k :: path) l).view := by
        intro l hl
        have hlw := hc'.win l (hcinsub l hl)
        rw [srcRow_cons, ← hag, if_pos hpw]
        rw [addAgg_view nc.c2W ag (by omega) (rel.hcl k hk) cin rows l hl (by omega) hlw.2
          (by rw [hrows' l (hcinsub l hl)]; exact srcRow_diag nc kc path l hlw.2), hrows' l (hcinsub l hl)]
      have hsz_in : (if p < 511 then addAgg nc.c2W ag cin rows else rows).size = 512 := by
        rw [if_pos hpw]; unfold addAgg; rw [scatRows_size, addC2Ws_size _ _ _ _ 0 rows rfl, hsz]
      -- the in-branch matrix
      have hA_in : KRel nc kc (k :: path) (u + 1) (510 - u) (Nat.lor A (Nat.shiftRight B (Nat.add (Nat.mul 512 (u + 1)) (u + 1)))) := by
        intro v' w hw
        rw [testBit_dig 512 _ v' w (by omega), srcRow_cons, Nat.testBit_or, ← hag]
        change (A ||| (B >>> (512 * (u + 1) + (u + 1)))).testBit (512 * v' + w) = _
        have hBb : B.testBit (512 * (u + 1 + v') + (u + 1 + w)) = (brow nc.c2W ag (u + 1 + v')).view.testBit (u + 1 + w) := by
          by_cases hv' : u + 1 + v' < 512
          · rw [hB, rel.hB k hk _ _ hv' (by omega)]
          · rw [brow_high nc.c2W ag _ (by omega), Nat.zero_testBit]
            exact Nat.testBit_lt_two_pow (lt_of_lt_of_le (rel.hBlt k hk) (Nat.pow_le_pow_right (by norm_num) (by nlinarith)))
        rw [Nat.testBit_or, ← testBit_dig 512 A v' w (by omega), hA v' w hw, Nat.testBit_shiftRight,
          show 512 * (u + 1) + (u + 1) + (512 * v' + w) = 512 * (u + 1 + v') + (u + 1 + w) by ring, hBb]
      obtain ⟨hl1, hl2⟩ := ihl (if p < 511 then addAgg nc.c2W ag cin rows else rows) (k :: path) (v :: picks) cin
        (Nat.lor A (Nat.shiftRight B (Nat.add (Nat.mul 512 (u + 1)) (u + 1)))) (cin.view >>> (u + 1)) hl hsz_in
        (hc'.sub cin hcinsub) hrows_in hA_in
      -- the out-branch
      have hcout_rel : K2.andn (c'.view >>> (u + 1)) (Nat.shiftLeft 1 v) = (c'.clrBit p).view >>> (u + 1) := by
        apply Nat.eq_of_testBit_eq; intro w
        rw [K2.testBit_andn, Nat.testBit_shiftRight, Nat.testBit_shiftRight, K2.testBit_one_shiftLeft, W8.testBit_clrBit]
        by_cases hwv : w = v
        · subst hwv; simp [hp]
        · have : u + 1 + w ≠ p := by omega
          simp [hwv, this]
      have houtsub : ∀ l, (c'.clrBit p).view.testBit l = true → c'.view.testBit l = true := by
        intro l hl; rw [W8.testBit_clrBit, Bool.and_eq_true] at hl; exact hl.1
      obtain ⟨hr1, hr2⟩ := ihr rows path picks (c'.clrBit p) A ((c'.clrBit p).view >>> (u + 1)) hr hsz
        (hc'.sub _ houtsub) (fun l hl => hrows' l (houtsub l hl)) hA
      refine ⟨?_, ?_⟩
      · show K2.brk3 (K2.checkXT3 (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) T (KD.toXT3c HP aggs (XCV l)))
            (K2.checkXT3 (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) T (KD.toXT3c HP aggs (XCV r))) A
            (Nat.lor A (Nat.shiftRight B (Nat.add (Nat.mul 512 (u + 1)) (u + 1)))) v 512
            (K2.runSo A (KD.REPn (510 - u)) (KD.GRDn (510 - u)) (KD.LOWSn (510 - u)) R3RT.M511 512 (u + 1) (KD.stepsC HP (stepsFrom sts 0)) c) (pmask picks) = true
        unfold K2.brk3
        rw [h2, hcin_rel, hcout_rel, Bool.and_eq_true]
        exact ⟨hl1, hr1⟩
      · show (KD.stepsCOK HP DEFP J u (stepsFrom sts 0) && Nat.beq (KD.aggAt aggs k).1 (Nat.add (Nat.succ u) v) &&
          KD.xcOK HP DEFP J u aggs (XCV l) && KD.xcOK HP DEFP J u aggs (XCV r)) = true
        rw [h1, hl2, hr2, rel.hx k hk, ← hag, hagx]
        simp [hp, Nat.add_eq, Nat.succ_eq_add_one]

end XTP
