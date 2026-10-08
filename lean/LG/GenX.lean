module
public import R22Port.U_d41d8cd98f00
public import LG.CapT
public import KD.Types
/-! # The context cap with per-rank bounds and extra rank rows (generalization of `LG/Gen.lean`, math2's request 2026-10-07)

**Universe of a slice** (`OmX Em R L U`): as `OmG`, with `L r ≤ n_r ≤ U r` for the ranks `r = 1, 2, 3` (`n_r` = the number of
rank-`r` first factors) in place of `lo ≤ n_1`.  A slice of the main search is a range `a ≤ n_1 ≤ b` together with the bounds
`TypeFacts` implies there (`boundsOK`, `bounds_of`).

**Extra rows** (`RowX`, any slot at or above `Ntab`): a slot `v` with mask `M` and cap `scap v` is valid when, for a rank `r`,
* (LB) `R + q_r(E) + Σ_{l ∈ M} r_r(l) ≤ scap v + L r`, where `q_r(E) = rkCnt Em r 0` is the number of rank-`r` points of `E`
  and `r_r(l) = rkCnt Em r (vt l)` the number of rank-`r` elements of coset `l` (`slot_lbX`): the rank-`r` first factors,
  at least `L r`, are at most `q_r(E)` inside `E` (distinct points of `E`), at most `r_r(l)` in coset `l` (distinct), and
  otherwise outside `M`; the case row of `Gen` is `r = 1` with `M` the rank-1-free cosets;
* (UB) `U r + Σ_{l ∈ M} nr_r(l) ≤ scap v`, where `nr_r(l) = nrkCnt Em r (vt l)` counts the elements of coset `l` whose rank
  is not `r` (`slot_ubX`): the outside first factors in `M` are rank `r` (at most `U r`) or not (at most `nr_r(l)` per coset).

`capX_of`: `CapX Em R L U` (every `Dec22` with the slice's rank counts has at least `R + 1` first factors outside `E`) from the
IP facts `IPX`, the enumeration `EnumOK`, the external leaves (`LeafNoExt C Em (L 1) pl`, e.g. `leafNoExt_of_noLiftK`),
`hclsN`, `E`'s base bound and RR's bound for `{0}`.  `classFactsX_of`: the class facts of `CaseK lo hi` with `E`'s class raised
to `R + 1`, from `TypeFacts` and one `CapX` per slice covering `[lo, hi]`. -/
@[expose] public section
set_option maxRecDepth 20000
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace L479
open Finset RootSound Matrix E1GS

/-! ## Rank counts of cosets -/

/-- the number of `e ∈ E` with `rank (a ⊕ e) = r` (`a = 0`: the rank-`r` points of `E`; `a = vt l`: of coset `l`) -/
def rkCnt (Em r a : ℕ) : ℕ := ((range 512).filter (fun e => Em.testBit e = true ∧ BC6s.rk3 (a ^^^ e) = r)).card

/-- the number of `e ∈ E` with `rank (a ⊕ e) ≠ r` -/
def nrkCnt (Em r a : ℕ) : ℕ := ((range 512).filter (fun e => Em.testBit e = true ∧ BC6s.rk3 (a ^^^ e) ≠ r)).card

/-- the sum of a per-label count over the labels of a mask -/
def mskSum (N M : ℕ) (f : ℕ → ℕ) : ℕ := ∑ l ∈ range N, (if M.testBit l = true then f l else 0)

theorem xor_cancel (a b : ℕ) : b ^^^ (a ^^^ b) = a := by
  rw [Nat.xor_comm a b, ← Nat.xor_assoc, Nat.xor_self, Nat.zero_xor]

/-- distinct first factors in coset `l` with a property of their rank are at most the coset's elements with it -/
theorem coset_card_le {n : ℕ} (Em VT l : ℕ) (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av)
    (p : ℕ → Prop) [DecidablePred p] :
    (univ.filter (fun s => Em.testBit (av s ^^^ vt VT l) = true ∧ p (BC6s.rk3 (av s)))).card ≤
      ((range 512).filter (fun e => Em.testBit e = true ∧ p (BC6s.rk3 (vt VT l ^^^ e)))).card := by
  have hi : Function.Injective (fun s => av s ^^^ vt VT l) := by
    intro s s' h
    apply hinj
    have := congrArg (fun x => x ^^^ vt VT l) h
    simpa [Nat.xor_assoc, Nat.xor_self] using this
  rw [← Finset.card_image_of_injective _ hi]
  apply Finset.card_le_card
  intro e he
  simp only [mem_image, mem_filter, mem_univ, true_and] at he
  obtain ⟨s, ⟨h1, h2⟩, rfl⟩ := he
  simp only [mem_filter, mem_range]
  refine ⟨RootSound.TransBits.xor_lt _ _ (hav s) (vt_lt VT l), h1, ?_⟩
  rw [xor_cancel]; exact h2

/-- the outside first factors in `M` with a rank property, by labels (union bound) -/
theorem mask_card_le {n : ℕ} (Em VT N M : ℕ) (av : Fin n → ℕ) (p : Fin n → Prop) [DecidablePred p] :
    (univ.filter (fun s => Em.testBit (av s) = false ∧ (∃ l < N, M.testBit l = true ∧ Em.testBit (av s ^^^ vt VT l) = true)
      ∧ p s)).card ≤
      ∑ l ∈ range N, (if M.testBit l = true then
        (univ.filter (fun s => Em.testBit (av s ^^^ vt VT l) = true ∧ p s)).card else 0) := by
  classical
  have hsub : univ.filter (fun s => Em.testBit (av s) = false ∧ (∃ l < N, M.testBit l = true ∧
      Em.testBit (av s ^^^ vt VT l) = true) ∧ p s) ⊆
      ((range N).filter (fun l => M.testBit l = true)).biUnion
        (fun l => univ.filter (fun s => Em.testBit (av s ^^^ vt VT l) = true ∧ p s)) := by
    intro s hs
    simp only [mem_filter, mem_univ, true_and] at hs
    obtain ⟨_, ⟨l, hl, hM, hE⟩, hp⟩ := hs
    simp only [mem_biUnion, mem_filter, mem_range, mem_univ, true_and]
    exact ⟨l, ⟨hl, hM⟩, hE, hp⟩
  refine le_trans (card_le_card hsub) (le_trans card_biUnion_le ?_)
  rw [Finset.sum_filter]

/-- the inside first factors of rank `r` are at most `E`'s rank-`r` points -/
theorem inside_rank_le {n : ℕ} (Em r : ℕ) (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av) :
    (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = r)).card ≤ rkCnt Em r 0 := by
  have hrk : ∀ s, BC6s.rk3 (av s) = (toM3 (av s)).rank := fun s => S6.rk3_rank (av s) (hav s)
  unfold rkCnt
  rw [← Finset.card_image_of_injective _ hinj]
  apply Finset.card_le_card
  intro a ha
  simp only [mem_image, mem_filter, mem_univ, true_and] at ha
  obtain ⟨s, ⟨h1, h2⟩, rfl⟩ := ha
  simp only [mem_filter, mem_range, Nat.zero_xor]
  exact ⟨hav s, h1, by rw [hrk]; exact h2⟩

/-! ## The extra rows -/

/-- **LB row of rank `r`**: with at least `L` distinct rank-`r` first factors among `n` (exactly `R` outside `E`), the
outside first factors in the mask's cosets are at most `R + q_r(E) + Σ_M r_r(l) - L` -/
theorem slot_lbX {n : ℕ} (VT N Em R r L : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N)
    (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av)
    (hR : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card = R)
    (hL : L ≤ (univ.filter (fun s => (toM3 (av s)).rank = r)).card)
    (v : ℕ) (hcap : R + rkCnt Em r 0 + mskSum N (smask v) (fun l => rkCnt Em r (vt VT l)) ≤ scap v + L)
    (hrev : ∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) (hlt : v < 2 ^ 264) :
    SlotV (xOf av Em VT N) v := by
  classical
  refine ⟨?_, hrev, hlt⟩
  rw [msum_xOf av Em VT N (smask v) hN hC hav]
  have hrk : ∀ s, BC6s.rk3 (av s) = (toM3 (av s)).rank := fun s => S6.rk3_rank (av s) (hav s)
  set M := smask v
  -- n_r = inside_r + outside-not-in-M_r + outside-in-M_r
  let Out := univ.filter (fun s : Fin n => Em.testBit (av s) = false)
  let InM : Fin n → Prop := fun s => ∃ l < N, M.testBit l = true ∧ Em.testBit (av s ^^^ vt VT l) = true
  have h1 : (univ.filter (fun s => (toM3 (av s)).rank = r)).card ≤
      (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = r)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ ¬ InM s)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank = r)).card := by
    have hsub : univ.filter (fun s => (toM3 (av s)).rank = r) ⊆
        (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = r)) ∪
        (univ.filter (fun s => Em.testBit (av s) = false ∧ ¬ InM s)) ∪
        (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank = r)) := by
      intro s hs
      simp only [mem_filter, mem_univ, true_and, mem_union] at hs ⊢
      cases e : Em.testBit (av s)
      · by_cases hm : InM s
        · exact Or.inr ⟨rfl, hm, hs⟩
        · exact Or.inl (Or.inr ⟨rfl, hm⟩)
      · exact Or.inl (Or.inl ⟨rfl, hs⟩)
    exact le_trans (card_le_card hsub) (le_trans (card_union_le _ _) (by
      have := card_union_le (univ.filter (fun s => Em.testBit (av s) = true ∧ (toM3 (av s)).rank = r))
        (univ.filter (fun s => Em.testBit (av s) = false ∧ ¬ InM s)); omega))
  have h2 := inside_rank_le Em r av hav hinj
  -- outside, in `M`, rank `r`: at most `Σ_M r_r(l)`
  have h3 : (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank = r)).card ≤
      mskSum N M (fun l => rkCnt Em r (vt VT l)) := by
    refine le_trans (mask_card_le Em VT N M av (fun s => (toM3 (av s)).rank = r)) ?_
    unfold mskSum
    apply Finset.sum_le_sum; intro l _
    split
    · have := coset_card_le Em VT l av hav hinj (fun k => k = r)
      unfold rkCnt
      refine le_trans (le_of_eq ?_) this
      congr 1; ext s; simp only [mem_filter, mem_univ, true_and, hrk]
    · exact le_rfl
  -- outside = (outside, not in M) + (outside, in M)
  have h4 : (univ.filter (fun s : Fin n => Em.testBit (av s) = false)).card =
      (univ.filter (fun s => Em.testBit (av s) = false ∧ ¬ InM s)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s)).card := by
    rw [← card_union_of_disjoint]
    · congr 1; ext s; simp only [mem_filter, mem_univ, true_and, mem_union]; tauto
    · rw [disjoint_filter]; intro s _ h1 h2; exact h1.2 h2.2
  have h5 : (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s)).card =
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, M.testBit l = true ∧
        Em.testBit (av s ^^^ vt VT l) = true)).card := rfl
  omega

/-- **UB row of rank `r`**: with at most `U` rank-`r` first factors, the outside first factors in the mask's cosets are at
most `U + Σ_M nr_r(l)` -/
theorem slot_ubX {n : ℕ} (VT N Em r U : ℕ) (hN : N ≤ 127) (hC : Cosets Em VT N)
    (av : Fin n → ℕ) (hav : ∀ s, av s < 512) (hinj : Function.Injective av)
    (hU : (univ.filter (fun s => (toM3 (av s)).rank = r)).card ≤ U)
    (v : ℕ) (hcap : U + mskSum N (smask v) (fun l => nrkCnt Em r (vt VT l)) ≤ scap v)
    (hrev : ∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) (hlt : v < 2 ^ 264) :
    SlotV (xOf av Em VT N) v := by
  classical
  refine ⟨?_, hrev, hlt⟩
  rw [msum_xOf av Em VT N (smask v) hN hC hav]
  have hrk : ∀ s, BC6s.rk3 (av s) = (toM3 (av s)).rank := fun s => S6.rk3_rank (av s) (hav s)
  set M := smask v
  let InM : Fin n → Prop := fun s => ∃ l < N, M.testBit l = true ∧ Em.testBit (av s ^^^ vt VT l) = true
  have h1 : (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s)).card ≤
      (univ.filter (fun s => (toM3 (av s)).rank = r)).card +
      (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank ≠ r)).card := by
    have hsub : univ.filter (fun s => Em.testBit (av s) = false ∧ InM s) ⊆
        (univ.filter (fun s => (toM3 (av s)).rank = r)) ∪
        (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank ≠ r)) := by
      intro s hs
      simp only [mem_filter, mem_univ, true_and, mem_union] at hs ⊢
      by_cases hr : (toM3 (av s)).rank = r
      · exact Or.inl hr
      · exact Or.inr ⟨hs.1, hs.2, hr⟩
    exact le_trans (card_le_card hsub) (card_union_le _ _)
  have h3 : (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s ∧ (toM3 (av s)).rank ≠ r)).card ≤
      mskSum N M (fun l => nrkCnt Em r (vt VT l)) := by
    refine le_trans (mask_card_le Em VT N M av (fun s => (toM3 (av s)).rank ≠ r)) ?_
    unfold mskSum
    apply Finset.sum_le_sum; intro l _
    split
    · have := coset_card_le Em VT l av hav hinj (fun k => k ≠ r)
      unfold nrkCnt
      refine le_trans (le_of_eq ?_) this
      congr 1; ext s; simp only [mem_filter, mem_univ, true_and, hrk]
    · exact le_rfl
  have h5 : (univ.filter (fun s => Em.testBit (av s) = false ∧ InM s)).card =
      (univ.filter (fun s : Fin n => Em.testBit (av s) = false ∧ ∃ l < N, M.testBit l = true ∧
        Em.testBit (av s ^^^ vt VT l) = true)).card := rfl
  omega

/-! ## The decompositions of a slice -/

/-- rank counts within the bounds `L r ≤ n_r ≤ U r` for `r = 1, 2, 3` -/
def RkB (L U : ℕ → ℕ) (av : Fin 22 → ℕ) : Prop :=
  ∀ r, 1 ≤ r → r ≤ 3 → L r ≤ (univ.filter (fun s => (toM3 (av s)).rank = r)).card ∧
    (univ.filter (fun s => (toM3 (av s)).rank = r)).card ≤ U r

/-- 22 distinct nonzero first factors, nonzero second and third factors, rank counts in the slice's bounds, exactly `R`
first factors outside `E` -/
def OmX (Em R : ℕ) (L U : ℕ → ℕ) (av : Fin 22 → ℕ) (b c : Fin 22 → M3) : Prop :=
  (∀ s, av s < 512) ∧ (∀ s, av s ≠ 0) ∧ Function.Injective av ∧ IsDecomp (fun s => toM3 (av s)) b c ∧
  (∀ s, b s ≠ 0 ∧ c s ≠ 0) ∧ RkB L U av ∧ (univ.filter (fun s : Fin 22 => Em.testBit (av s) = false)).card = R

theorem omG_of_omX {Em R : ℕ} {L U : ℕ → ℕ} {av : Fin 22 → ℕ} {b c : Fin 22 → M3} (h : OmX Em R L U av b c) :
    OmG Em R (L 1) av b c := by
  obtain ⟨hav, hnz, hinj, hd, hbc, hrk, hR⟩ := h
  exact ⟨hav, hnz, hinj, hd, hbc, (hrk 1 le_rfl (by norm_num)).1, hR⟩

/-- `OmX` is closed under the stabilizer of `E` -/
theorem omX_act {Em R VT N gp : ℕ} {L U : ℕ → ℕ} {t : Bool} {P Q : ℕ} (hg : GElt Em VT N gp t P Q) {av : Fin 22 → ℕ}
    {b c : Fin 22 → M3} (h : OmX Em R L U av b c) : ∃ b' c', OmX Em R L U (fun s => C3.actN t P Q (av s)) b' c' := by
  obtain ⟨hav, hnz, hinj, hd, hbc, hrk, hR⟩ := h
  obtain ⟨b', c', hd', hbc'⟩ := isDecomp_actN_nz hd hbc (t := t) hg.glP hg.glQ
  refine ⟨b', c', fun s => C3.actN_lt _ _ _ _, ?_, ?_, hd', hbc', ?_, ?_⟩
  · intro s h0
    rw [← RT.actN_zero t P Q] at h0
    exact hnz s (C3.actN_inj hg.glP hg.glQ (hav s) (by norm_num) h0)
  · intro s s' h'
    exact hinj (C3.actN_inj hg.glP hg.glQ (hav s) (hav s') h')
  · intro r h1 h3; simp only [rank_actN hg.glP hg.glQ]; exact hrk r h1 h3
  · rw [← hR]; apply congrArg Finset.card; apply Finset.filter_congr; intro s _; rw [hg.fixE _ (hav s)]

/-! ## The IP facts -/

/-- an extra slot: zero, or a well-formed slot satisfying an LB or a UB row of some rank `r ∈ {1, 2, 3}` -/
def RowX (N Em R : ℕ) (L U : ℕ → ℕ) (VT v : ℕ) : Prop :=
  v = 0 ∨ ((∀ j < 127, (smr v).testBit j = (smask v).testBit (126 - j)) ∧ v < 2 ^ 264 ∧ ∃ r, 1 ≤ r ∧ r ≤ 3 ∧
    (R + rkCnt Em r 0 + mskSum N (smask v) (fun l => rkCnt Em r (vt VT l)) ≤ scap v + L r ∨
     U r + mskSum N (smask v) (fun l => nrkCnt Em r (vt VT l)) ≤ scap v))

/-- the facts of a coset IP of `E` for a slice `(L, U)` (outside count `C.R`, the IP's class table `CL`), checked by `decide`;
the slots at or above `Ntab` are extra rows or zero -/
structure IPX (C : E1G.Ctx) (CL Em : ℕ) (L U : ℕ → ℕ) (LB LBR UB Ntab nrows : ℕ) (sl tab : ℕ → ℕ)
    (GE : ℕ → Bool × ℕ × ℕ) : Prop where
  N_le : C.N ≤ 127
  R_le : C.R ≤ 22
  R_pos : 1 ≤ C.R
  DOM_lt : C.DOM < 2 ^ 512
  cosets : Cosets Em C.VT C.N
  domperp : DomPerp C.DOM Em
  planes : Planes LB C.VT C.N
  planesR : PlanesR LB LBR
  sl_spec : ∀ i < Ntab, sl i = E1G.slot LB LBR (tab i) ∧ E1G.dualIn C.DOM (tab i) = true ∧
    RT.entryOK C.R CL (tab i) = true
  cls_lt : ∀ i < Ntab, RT.eCls (tab i) < 496
  Ntab_le : Ntab ≤ 2 ^ 15
  xrows : ∀ i, Ntab ≤ i → i < 2 ^ 15 → RowX C.N Em C.R L U C.VT (sl i)
  capslot : ∀ l < C.N, nrows + l < Ntab ∧ (∀ j < C.N, (smask (sl (nrows + l))).testBit j = decide (j = l)) ∧
    scap (sl (nrows + l)) = E1G.fld UB l
  grp : ∀ g < 2048, GElt Em C.VT C.N (C.GP g) (GE g).1 (GE g).2.1 (GE g).2.2

/-- every slot holds for every decomposition of the slice -/
def SlotsX (C : E1G.Ctx) (Em : ℕ) (L U : ℕ → ℕ) (sl : ℕ → ℕ) : Prop :=
  ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmX Em C.R L U av b c → ∀ i < 2 ^ 15, SlotV (xOf av Em C.VT C.N) (sl i)

theorem IPX.slots {C : E1G.Ctx} {CL Em : ℕ} {L U : ℕ → ℕ} {LB LBR UB Ntab nrows : ℕ} {sl tab : ℕ → ℕ}
    {GE : ℕ → Bool × ℕ × ℕ} (h : IPX C CL Em L U LB LBR UB Ntab nrows sl tab GE)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM CL c) (RT.cLB CL c)) : SlotsX C Em L U sl := by
  intro av b c hom i hi
  obtain ⟨hav, hnz, hinj, hd, hbc, hrk, hR⟩ := hom
  by_cases hiN : i < Ntab
  · obtain ⟨e1, e2, e3⟩ := h.sl_spec i hiN
    rw [e1]
    have hF := entry_soundNR C.R CL (tab i) (hclsN _ (h.cls_lt i hiN)) e3
    exact slot_valid_cnt LB LBR C.VT C.N Em C.DOM C.R h.N_le h.planes h.planesR h.cosets h.domperp (tab i) e2 av hav
      hR (hF av b c hav hnz hinj hd)
  · rcases h.xrows i (by omega) hi with h0 | ⟨hrev, hlt, r, hr1, hr3, hlb | hub⟩
    · rw [h0]; exact slotV_zero _
    · exact slot_lbX C.VT C.N Em C.R r (L r) h.N_le h.cosets av hav hinj hR (hrk r hr1 hr3).1 (sl i) hlb hrev hlt
    · exact slot_ubX C.VT C.N Em r (U r) h.N_le h.cosets av hav hinj (hrk r hr1 hr3).2 (sl i) hub hrev hlt

/-! ## The induction (as `coreG`) -/

theorem coreX (C : E1G.Ctx) (CL Em : ℕ) (L U : ℕ → ℕ) (LB LBR UB Ntab nrows : ℕ) (sl tab : ℕ → ℕ)
    (GE : ℕ → Bool × ℕ × ℕ) (h : IPX C CL Em L U LB LBR UB Ntab nrows sl tab GE) (hsl : SlotsX C Em L U sl)
    (henum : EnumOK C sl UB) (hext : ∀ pl ∈ C.EXT, LeafNoExt C Em (L 1) pl) :
    ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmX Em C.R L U av b c → False := by
  have hN := h.N_le
  have hRle := h.R_le
  suffices key : ∀ m, ∀ (av : Fin 22 → ℕ) (b c : Fin 22 → M3), OmX Em C.R L U av b c →
      2 ^ 16256 - VR (xOf av Em C.VT C.N) = m → False from
    fun av b c hom => key _ av b c hom rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro av b c hom hm
  have hslot := hsl av b c hom
  have hom0 := hom
  obtain ⟨hav, hnz, hinj, hd, hbc, hrk, hR⟩ := hom
  set x := xOf av Em C.VT C.N with hxdef
  have hsum : ∑ l ∈ range 127, x l = C.R := by rw [hxdef, sum_xOf av Em C.VT C.N hN h.cosets hav, hR]
  have hxle : ∀ l < 127, x l ≤ C.R := by
    intro l hl
    rw [← hsum]; exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_range.mpr hl)
  have hxb : ∀ l < 127, x l < 2 ^ 128 := fun l hl => lt_of_le_of_lt (hxle l hl) (by omega)
  by_cases hcan : ∀ g < 2048, ¬ (VR x < VR (push (C.GP g) x))
  · have hxub : ∀ l < 127, x l ≤ E1G.fld UB l := by
      intro l hl
      by_cases hlN : l < C.N
      · obtain ⟨h1, h2, h3⟩ := h.capslot l hlN
        have := (hslot (nrows + l) (by have := h.Ntab_le; omega)).1
        rw [h3, msum_cap x _ l C.N hN hlN (fun j hj => xOf_ge _ _ _ _ _ hj) h2] at this
        exact this
      · rw [hxdef, xOf_ge _ _ _ _ _ (by omega)]; exact Nat.zero_le _
    have hglob : Glob C x := {
      N_le := hN
      R_le := by omega
      xN := fun l hl => xOf_ge _ _ _ _ _ hl
      xR := hsum
      leaf := fun pl cert hx hleaf => by
        unfold E1G.leafOK at hleaf
        cases hc : Nat.beq cert 0
        · rw [hc] at hleaf
          exact leaf_bridge C.VT C.N Em C.DOM C.R hN (by omega) h.cosets h.domperp h.DOM_lt av b c hav hd hbc
            hR pl cert hx hleaf
        · rw [hc] at hleaf
          exact hext pl (extMem_spec pl C.EXT hleaf) av b c (omG_of_omX hom0) hx
      canon := hcan
      gp := fun g hg l hl => ((h.grp g hg).lab l hl).1 }
    have hx0 : ∃ l < 127, 0 < x l := by
      by_contra hc
      push Not at hc
      have : ∑ l ∈ range 127, x l = 0 := Finset.sum_eq_zero (fun l hl => by
        have := hc l (Finset.mem_range.mp hl); omega)
      have := h.R_pos; omega
    exact henum x hglob hslot hxub hx0
  · push Not at hcan
    obtain ⟨g, hg16, hlt⟩ := hcan
    have hG := h.grp g hg16
    obtain ⟨b', c', hom'⟩ := omX_act hG hom0
    have hx' : VR (xOf (fun s => C3.actN (GE g).1 (GE g).2.1 (GE g).2.2 (av s)) Em C.VT C.N) = VR (push (C.GP g) x) :=
      VR_congr _ _ (fun l hl => xOf_act hN h.cosets hG av hav l hl)
    have hbound : VR (push (C.GP g) x) < 2 ^ 16256 := by
      apply VR_lt; intro l hl
      have : push (C.GP g) x l ≤ ∑ j ∈ range 127, x j := by
        unfold push; apply Finset.sum_le_sum; intro j _; split
        · exact le_rfl
        · exact Nat.zero_le _
      omega
    have hVx : VR x < 2 ^ 16256 := VR_lt x hxb
    exact ih (2 ^ 16256 - VR (push (C.GP g) x)) (by omega) _ b' c' hom' (by rw [hx'])

/-! ## The theorem -/

/-- **the context cap of `E` in a slice**: every decomposition with the slice's rank counts has at least `R + 1` first factors
outside `E` -/
def CapX (Em R : ℕ) (L U : ℕ → ℕ) : Prop :=
  ∀ A : R3RT.Spec.Dec22, (∀ r, 1 ≤ r → r ≤ 3 → L r ≤ KD.nType A r ∧ KD.nType A r ≤ U r) →
    R + 1 ≤ (univ.filter (fun s => Em.testBit (A.av s) = false)).card

/-- **The context cap of a slice from the enumeration and the leaf refutations** -/
theorem capX_of (C : E1G.Ctx) (CL Em : ℕ) (L U : ℕ → ℕ) (LB LBR UB Ntab nrows : ℕ) (sl tab : ℕ → ℕ)
    (GE : ℕ → Bool × ℕ × ℕ) (h : IPX C CL Em L U LB LBR UB Ntab nrows sl tab GE) (henum : EnumOK C sl UB)
    (hext : ∀ pl ∈ C.EXT, LeafNoExt C Em (L 1) pl)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM CL c) (RT.cLB CL c))
    (hbase : RT.FactN 22 Em C.R) (h495 : RT.Fact (RT.kM RT.K3eD_Cls.CL 495) 22) : CapX Em C.R L U := by
  intro A hrk
  by_contra hlt
  push Not at hlt
  have hR := hbase A.av A.b A.c A.lt A.ne A.inj A.dec
  apply coreX C CL Em L U LB LBR UB Ntab nrows sl tab GE h (h.slots hclsN) henum hext A.av A.b A.c
  exact ⟨A.lt, A.ne, A.inj, A.dec, dec_nz h495 A, fun r h1 h3 => hrk r h1 h3, by omega⟩

/-- `CapX` along a symmetry mapping `E'` into `E` (as `capG_transport`) -/
theorem capX_transport {Em Em' R : ℕ} {L U : ℕ → ℕ} {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true)
    (hmap : HC.mapsTo t P Q Em Em' = true) (h : CapX Em R L U) : CapX Em' R L U := by
  intro A hA
  have h1 := h (Dec22.act A t P Q hP hQ) (by intro r h1 h3; rw [nType_act]; exact hA r h1 h3)
  refine le_trans h1 (Finset.card_le_card ?_)
  intro s hs
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  cases e : Em'.testBit (A.av s)
  · rfl
  · have h2 := HC.mapsTo_spec hmap _ (A.lt s) e
    have h3 : Em.testBit (C3.actN t P Q (A.av s)) = false := hs
    rw [h2] at h3; exact absurd h3 (by decide)

/-! ## Slices of the main search from the type facts -/

/-- the slice `a ≤ n_1 ≤ b` with bounds `(L, U)`: every type `(n1, n2, n3)` (sum 22) in the slice that passes `typeOK` has
its rank counts within the bounds -/
def boundsOK (a b : ℕ) (L U : ℕ → ℕ) : Bool :=
  (List.range 23).all fun n1 => (List.range 23).all fun n2 =>
    !(Nat.ble a n1 && Nat.ble n1 b && Nat.ble (n1 + n2) 22 && KD.typeOK n1 n2 (22 - n1 - n2)) ||
      (Nat.ble (L 1) n1 && Nat.ble n1 (U 1) && Nat.ble (L 2) n2 && Nat.ble n2 (U 2) &&
        Nat.ble (L 3) (22 - n1 - n2) && Nat.ble (22 - n1 - n2) (U 3))

theorem bounds_of {a b : ℕ} {L U : ℕ → ℕ} (hT : KD.TypeFacts) (h : boundsOK a b L U = true) (A : R3RT.Spec.Dec22)
    (ha : a ≤ KD.nType A 1) (hb : KD.nType A 1 ≤ b) :
    ∀ r, 1 ≤ r → r ≤ 3 → L r ≤ KD.nType A r ∧ KD.nType A r ≤ U r := by
  have hs := KD.type_sum A
  have hty := hT A
  unfold boundsOK at h
  rw [List.all_eq_true] at h
  have h1 := h (KD.nType A 1) (List.mem_range.mpr (by omega))
  rw [List.all_eq_true] at h1
  have h2 := h1 (KD.nType A 2) (List.mem_range.mpr (by omega))
  have e3 : 22 - KD.nType A 1 - KD.nType A 2 = KD.nType A 3 := by omega
  rw [e3, hty] at h2
  have hpre : (Nat.ble a (KD.nType A 1) && Nat.ble (KD.nType A 1) b && Nat.ble (KD.nType A 1 + KD.nType A 2) 22 &&
      true) = true := by
    simp only [Bool.and_true, Bool.and_eq_true, Nat.ble_eq]; omega
  rw [hpre] at h2
  simp only [Bool.not_true, Bool.false_or, Bool.and_eq_true, Nat.ble_eq] at h2
  obtain ⟨⟨⟨⟨⟨l1, u1⟩, l2⟩, u2⟩, l3⟩, u3⟩ := h2
  intro r hr1 hr3
  interval_cases r
  · exact ⟨l1, u1⟩
  · exact ⟨l2, u2⟩
  · exact ⟨l3, u3⟩

/-- **the class facts of `CaseK lo hi`** with `E = K_cE`'s class raised to `R + 1`, from the type facts and, for every `n1`
in `[lo, hi]`, a slice containing it whose context cap holds -/
theorem classFactsX_of (cE R lo hi : ℕ) (hT : KD.TypeFacts)
    (hcov : ∀ n1, lo ≤ n1 → n1 ≤ hi → ∃ a b : ℕ, ∃ L U : ℕ → ℕ, a ≤ n1 ∧ n1 ≤ b ∧ boundsOK a b L U = true ∧
      CapX (RT.kM RT.K3eD_Cls.CL cE) R L U)
    (hclsN : ∀ c, c < 496 → RT.FactN 22 (RT.kM RT.K3eD_Cls.CL c) (RT.cLB RT.K3eD_Cls.CL c)) :
    R3RT.SpecO.ClassFactsC (R3RT.SpecO.CaseK lo hi) (cLBG cE R) := by
  intro A hΩ c hc
  unfold cLBG
  split_ifs with hcE
  · subst hcE
    have hlo : lo ≤ KD.nType A 1 := by rw [← KD.nType_eq]; exact hΩ.1
    have hhi : KD.nType A 1 ≤ hi := by rw [← KD.nType_eq]; exact hΩ.2
    obtain ⟨a, b, L, U, ha, hb, hok, hcap⟩ := hcov _ hlo hhi
    exact hcap A (bounds_of hT hok A ha hb)
  · exact hclsN c hc A.av A.b A.c A.lt A.ne A.inj A.dec

end L479

#print axioms L479.capX_of
#print axioms L479.capX_transport
#print axioms L479.classFactsX_of
