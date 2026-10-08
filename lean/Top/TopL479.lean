module
public import R22Port.U_d41d8cd98f00
public import Top.Top
public import Top.Root321
public import LG.Top
public import LG.IPL479
public import Br.Final
/-! # Top-level skeleton for the route we run: L479 in case (II), `--rord 321` for cases (I) and (I13)

**`Top.rank_ge_23_L479`** proves `Top.RankGe23` from the remaining computational facts, each the conclusion one producer
(agent + checker) delivers (`top/GAPS.md`, section "L479 route"):

| hypothesis | statement | producer |
|---|---|---|
| `hPoint` | `HC.ClassLB 492 21` (the point lemma) | hcls: E1P on the point IP, `HC.classLB_of_e1` |
| `hCap` | `∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2` (110 raised classes) | leaf2 (dims 4-5), hcls + fleet (lines, planes, dim 3) |
| `g175` … `oc2` | the nine `G` interface props (Gram-state checkers) | create-subtasks-to: `G/Main.lean` |
| `hIPL` | `L479.IPL C Em LB LBR UB Ntab nrows i2 sl tab GE` (l479cw IP facts) | hcls: `E1G.OK_l479cw` (decide) |
| `hEnum` | `L479.EnumOK C sl UB` (the l479cw enumeration) | hcls: E1G chains of l479cw |
| `hExt` | `L479.ExtOK C` (SAT/ABORT leaves: `NoDecomp` or `NoLift3`) | leaf2 (BC7 SAT variant) + hcls (rank-1 test, generator) |
| `hsegII` | `ClassFactsC (CaseK 14 22) HC.cLBII → KD.TypeFacts → ∀ k, SegOKO LO123 (CaseK 14 22) (segII k)` | kinds (`KD.batchX` at Ω = case II) + R3 (streams, `--pctop` segments) |
| `hglueII`, `hrootII` | `GlueOK segII`; `(1, 0)` is the root of a segment with `lo = 0` | R3 / queue (manifest) |
| `hsegI`, `hsegI13` | `Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 0 12 / 13 13) (seg k)` | kinds (checkers over the order) + R3 (runs under `--rord 321`) |
| `hglueI`, `hrootI`, `hglueI13`, `hrootI13` | `GlueOK`; labels 0, 168, 462 are roots of segments with `lo = 0` | R3 / queue (manifest) |

Proved here (standard axioms):
* `tree_soundO`: the tree closure of `KD.tree_sound` over any label order `O` and case predicate `C` (spec rev 6a), and
  `treeOKO_123` (`TreeOKO LO123 (CaseK 14 22) ↔ KD.TreeOK`);
* segments (`Seg`: root, `lo`, OPEN / dead nodes, external children, queue ranges) and the manifest glue `GlueOK`:
  `segs_cover`, `segs_root_empty` (the root of every segment with `lo = 0` is empty);
* `has_cardO`: a `Dec22` has 22 labels in every order;
* `canon123`, `canon321`: canonical representatives for both keys;
* `caseII_of_segs` (with `Top.root_caseII`), `caseK321_of_segs` (with `Top321.root_321`);
* the composition: `ClassFacts` from `hCap`, `TypeFacts` from `G.Br.typeFacts`, `HC.L479II` from `L479.l479II_of`
  (with `L479.h495` from RR), the case-(II) class facts from `HC.classFactsII_of`, and the reduction
  `Top.rank_ge_23_of_cases`. -/
@[expose] public section
set_option exponentiation.threshold 50000
set_option linter.unusedVariables false

noncomputable section
namespace Top
open RootSound R3RT R3RT.SpecO Finset Classical

/-! ## Labels of a decomposition in any label order -/

section order
variable (O : LabelOrder)

/-- every nonzero code is the code of a label -/
theorem vec_surj (v : ℕ) (h0 : 0 < v) (h : v < 512) : ∃ l, l < 511 ∧ O.vec l = v := by
  classical
  let I := (range 511).image O.vec
  have hsub : I ⊆ (range 512).filter (fun x => x ≠ 0) := by
    intro x hx
    obtain ⟨l, hl, rfl⟩ := mem_image.mp hx
    rw [mem_range] at hl
    simp only [mem_filter, mem_range]
    exact ⟨O.vec_lt l hl, O.vec_ne l hl⟩
  have hcardI : I.card = 511 := by
    rw [card_image_of_injOn]
    · simp
    · intro x hx y hy hxy
      exact O.vec_inj x y (by simpa using hx) (by simpa using hy) hxy
  have hcardF : ((range 512).filter (fun x => x ≠ 0)).card = 511 := by
    rw [Finset.filter_ne', Finset.card_erase_of_mem (by simp)]; simp
  have heq : I = (range 512).filter (fun x => x ≠ 0) := eq_of_subset_of_card_le hsub (by rw [hcardI, hcardF])
  have hv : v ∈ (range 512).filter (fun x => x ≠ 0) := by simp [h, Nat.pos_iff_ne_zero.mp h0]
  rw [← heq] at hv
  obtain ⟨l, hl, hlv⟩ := mem_image.mp hv
  exact ⟨l, mem_range.mp hl, hlv⟩

/-- **a `Dec22` has 22 labels** (in every label order) -/
theorem has_cardO (A : Spec.Dec22) : ((range 511).filter (fun l => Has O A l)).card = 22 := by
  classical
  have hex : ∀ s : Fin 22, ∃ l, l < 511 ∧ O.vec l = A.av s :=
    fun s => vec_surj O (A.av s) (Nat.pos_of_ne_zero (A.ne s)) (A.lt s)
  rw [show (22 : ℕ) = (univ : Finset (Fin 22)).card by simp]
  symm
  apply Finset.card_bij (fun s _ => Nat.find (hex s))
  · intro s _
    have hs := Nat.find_spec (hex s)
    simp only [mem_filter, mem_range]
    exact ⟨hs.1, hs.1, s, hs.2.symm⟩
  · intro s _ t _ hst
    have hs := Nat.find_spec (hex s)
    have ht := Nat.find_spec (hex t)
    apply A.inj
    rw [← hs.2, ← ht.2]
    exact congrArg O.vec hst
  · intro l hl
    simp only [mem_filter, mem_range] at hl
    obtain ⟨hl5, _, s, hs⟩ := hl
    refine ⟨s, mem_univ _, ?_⟩
    have hsp := Nat.find_spec (hex s)
    exact O.vec_inj _ _ hsp.1 hl5 (hsp.2.trans hs)

theorem below_splitO {A : Spec.Dec22} {S last : ℕ} (hS : S >>> last = 1) (h : Below O A S last) :
    ((range 511).filter (fun l => Has O A l)).card =
      ((range 511).filter (fun l => S.testBit l = true)).card +
      ((range 511).filter (fun l => last < l ∧ Has O A l)).card := by
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [KD.shr_one_bit hS l (by omega)]; simp; omega
  rw [← Finset.card_union_of_disjoint]
  · apply congrArg Finset.card; ext l
    simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_union]
    constructor
    · rintro ⟨hl, hA⟩
      by_cases hle : l ≤ last
      · exact Or.inl ⟨hl, (h l hl hle).1 hA⟩
      · exact Or.inr ⟨hl, by omega, hA⟩
    · rintro (⟨hl, h1⟩ | ⟨hl, _, hA⟩)
      · have hle : l ≤ last := by
          by_contra hc; push Not at hc; rw [hS0 l hc] at h1; exact absurd h1 (by decide)
        exact ⟨hl, (h l hl hle).2 h1⟩
      · exact ⟨hl, hA⟩
  · rw [Finset.disjoint_filter]; rintro l _ h1 ⟨h2, _⟩; rw [hS0 l h2] at h1; exact absurd h1 (by decide)

/-- the next label of a decomposition below a node with at most 21 prefix labels -/
theorem next_labelO {A : Spec.Dec22} {S last : ℕ} (hS : S >>> last = 1) (hA : Below O A S last)
    (hcard : ((range 511).filter (fun l => S.testBit l = true)).card ≤ 21) :
    ∃ u, Continues O A S last u := by
  have hab := below_splitO O hS hA
  rw [has_cardO O A] at hab
  have hne : ((range 511).filter (fun l => last < l ∧ Has O A l)).Nonempty := by
    rw [← Finset.card_pos]; omega
  obtain ⟨u, humem, humin⟩ : ∃ u ∈ (range 511).filter (fun l => last < l ∧ Has O A l),
      ∀ l ∈ (range 511).filter (fun l => last < l ∧ Has O A l), u ≤ l :=
    ⟨_, Finset.min'_mem _ hne, fun l hl => Finset.min'_le _ l hl⟩
  simp only [Finset.mem_filter, Finset.mem_range] at humem
  obtain ⟨hu5, hlu, hAu⟩ := humem
  have hmin : ∀ l, last < l → l < u → ¬ Has O A l := by
    intro l hl hlu' hAl
    have : u ≤ l := humin l (by simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨by omega, hl, hAl⟩)
    omega
  have hS0 : ∀ l, last < l → S.testBit l = false := by
    intro l hl; rw [KD.shr_one_bit hS l (by omega)]; simp; omega
  refine ⟨u, hlu, hu5, fun l hl hle => ?_⟩
  rw [KD.testBit_or_two_pow]
  by_cases hll : l ≤ last
  · rw [hA l hl hll]; have : l ≠ u := by omega
    simp [this]
  · push Not at hll
    rcases Nat.lt_or_ge l u with h1 | h1
    · rw [hS0 l hll]; have : l ≠ u := by omega
      simp only [this, decide_false, Bool.or_false, Bool.false_eq_true, iff_false]
      exact hmin l hll h1
    · have e : l = u := by omega
      rw [e]; simp [hAu]

end order

/-! ## The tree closure over an order and a case -/

section tree
variable (O : LabelOrder) (C : Spec.Dec22 → Prop)

/-- node emptiness for canonical decompositions of the case `C` -/
def EmptyO (S last : ℕ) : Prop := ∀ A : Spec.Dec22, Canon O A → C A → ¬ Below O A S last

/-- **a certified tree** (`KD.TreeOK` over the order `O` and the case `C`): dead nodes are empty; every OPEN node has its top
bit at `last`, at most 21 prefix labels, and each child above `last` is dead (`ChildDead O C`) or a node of the tree -/
def TreeOKO (opens dead : Set (ℕ × ℕ)) : Prop :=
  (∀ n ∈ dead, EmptyO O C n.1 n.2) ∧
  (∀ n ∈ opens, n.1 >>> n.2 = 1 ∧ ((range 511).filter (fun l => n.1.testBit l = true)).card ≤ 21 ∧
    ∀ u, n.2 < u → u < 511 → ChildDead O C n.1 n.2 u ∨ (n.1 ||| 2 ^ u, u) ∈ opens ∨ (n.1 ||| 2 ^ u, u) ∈ dead)

theorem tree_soundO {opens dead : Set (ℕ × ℕ)} (hT : TreeOKO O C opens dead) : ∀ n ∈ opens, EmptyO O C n.1 n.2 := by
  obtain ⟨hdead, hopen⟩ := hT
  suffices ∀ m, ∀ n ∈ opens, 511 - n.2 = m → EmptyO O C n.1 n.2 by
    intro n hn; exact this _ n hn rfl
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro n hn hm A hcan hC hA
    obtain ⟨hS, hcard, hkids⟩ := hopen n hn
    obtain ⟨u, hu⟩ := next_labelO O hS hA hcard
    obtain ⟨hlu, hu5, hbel⟩ := hu
    rcases hkids u hlu hu5 with hdk | hon | hdn
    · exact hdk A hcan hC ⟨hlu, hu5, hbel⟩
    · exact ih (511 - u) (by omega) _ hon rfl A hcan hC hbel
    · exact hdead _ hdn A hcan hC hbel

/-- **a case is empty** if its canonical decompositions lie below the tree's roots (every first label is a node or empty) -/
theorem case_empty_of_tree {opens dead : Set (ℕ × ℕ)} (hT : TreeOKO O C opens dead)
    (hroot : ∀ l, l < 511 → EmptyO O C (2 ^ l) l ∨ (2 ^ l, l) ∈ opens ∨ (2 ^ l, l) ∈ dead) :
    ∀ A : Spec.Dec22, Canon O A → C A → False := by
  intro A hcan hC
  have hne : ((range 511).filter (fun l => Has O A l)).Nonempty := by
    rw [← Finset.card_pos, has_cardO O A]; omega
  obtain ⟨l0, hmem, hmin0⟩ : ∃ l0 ∈ (range 511).filter (fun l => Has O A l),
      ∀ l ∈ (range 511).filter (fun l => Has O A l), l0 ≤ l :=
    ⟨_, Finset.min'_mem _ hne, fun l hl => Finset.min'_le _ l hl⟩
  simp only [Finset.mem_filter, Finset.mem_range] at hmem
  obtain ⟨hl5, hAl⟩ := hmem
  have hbel : Below O A (2 ^ l0) l0 := by
    intro l hl hle
    rw [Nat.testBit_two_pow]
    rcases Nat.lt_or_ge l l0 with h1 | h1
    · have hn : ¬ Has O A l := by
        intro hA'
        have := hmin0 l (by simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨hl, hA'⟩)
        omega
      simp only [hn, false_iff]; simp; omega
    · have e : l = l0 := by omega
      subst e; simp [hAl]
  rcases hroot l0 hl5 with h | h | h
  · exact h A hcan hC hbel
  · exact tree_soundO O C hT _ h A hcan hC hbel
  · exact hT.1 _ h A hcan hC hbel

/-! ### Segments and the manifest glue

The certified streams are segments (job streams, pieces, queue ranges, `--pctop` top segments), each with its own theorem.
* A segment's OPEN nodes may have **external children** (`ext`: DON / JOB references), each the root of another segment with
  `lo = 0`.
* A **range** (`rng`, kind 3 RNG): `(n, l) ∈ rng` hands node `n`'s children `≥ l` to a range segment whose root is `n` itself
  and whose `lo` is `l`. A range segment accounts only for its root's children `≥ lo`.
* The manifest glue `GlueOK` says every external child and every range is realized by a segment. Then the root of every
  segment with `lo = 0` is empty (`segs_root_empty`). -/

/-- a segment: its root, its lower bound `lo` on the root's children (`0` except for a range segment), OPEN nodes, dead
nodes, external children and ranges -/
structure Seg where
  root : ℕ × ℕ
  lo : ℕ
  opens : Set (ℕ × ℕ)
  dead : Set (ℕ × ℕ)
  ext : Set (ℕ × ℕ)
  rng : Set ((ℕ × ℕ) × ℕ)

/-- the lower bound on node `n`'s children in segment `g` -/
def Seg.lb (g : Seg) (n : ℕ × ℕ) : ℕ := if n = g.root then g.lo else 0

/-- **a certified segment** -/
def SegOKO (g : Seg) : Prop :=
  (g.root ∈ g.opens ∨ g.root ∈ g.dead) ∧
  (0 < g.lo → ∀ n ∈ g.opens, ∀ u, n.2 < u → (n.1 ||| 2 ^ u, u) ≠ g.root) ∧
  (∀ p ∈ g.rng, g.lb p.1 < p.2) ∧
  (∀ n ∈ g.dead, EmptyO O C n.1 n.2) ∧
  (∀ n ∈ g.opens, n.1 >>> n.2 = 1 ∧ ((range 511).filter (fun l => n.1.testBit l = true)).card ≤ 21 ∧
    ∀ u, n.2 < u → u < 511 →
      (n = g.root ∧ u < g.lo) ∨ (∃ l, (n, l) ∈ g.rng ∧ l ≤ u) ∨ ChildDead O C n.1 n.2 u ∨
      (n.1 ||| 2 ^ u, u) ∈ g.opens ∨ (n.1 ||| 2 ^ u, u) ∈ g.dead ∨ (n.1 ||| 2 ^ u, u) ∈ g.ext)

/-- **the manifest glue**: every external child is the root of a segment with `lo = 0`, every range is a segment -/
def GlueOK {ι : Type} (segs : ι → Seg) : Prop :=
  (∀ k, ∀ e ∈ (segs k).ext, ∃ k', (segs k').root = e ∧ (segs k').lo = 0) ∧
  (∀ k, ∀ p ∈ (segs k).rng, ∃ k', (segs k').root = p.1 ∧ (segs k').lo = p.2)

theorem cont_belowO {A : Spec.Dec22} {S last u : ℕ} (hS : S >>> last = 1) (h : Continues O A S last u) :
    Below O A S last := by
  obtain ⟨hlu, hu, hb⟩ := h
  intro l hl hle
  rw [hb l hl (by omega), KD.testBit_or_two_pow]
  have : l ≠ u := by omega
  simp [this]

theorem seg_measure_child (a b c d : ℕ) (h1 : a < b) (h2 : b < 511) (hc : c ≤ 511) :
    (511 - b) * 1024 + c < (511 - a) * 1024 + d := by
  have : 511 - b + 1 ≤ 511 - a := by omega
  nlinarith

/-- every OPEN node of a certified, glued segment family covers the continuations its segment accounts for -/
theorem segs_cover {ι : Type} (segs : ι → Seg) (hseg : ∀ k, SegOKO O C (segs k)) (hglue : GlueOK segs) :
    ∀ k, ∀ n ∈ (segs k).opens, ∀ A : Spec.Dec22, Canon O A → C A → ∀ u, Continues O A n.1 n.2 u →
      ¬ (n = (segs k).root ∧ u < (segs k).lo) → False := by
  suffices key : ∀ m, ∀ k, ∀ n ∈ (segs k).opens, (511 - n.2) * 1024 + (511 - (segs k).lb n) = m →
      ∀ A : Spec.Dec22, Canon O A → C A → ∀ u, Continues O A n.1 n.2 u →
      ¬ (n = (segs k).root ∧ u < (segs k).lo) → False from
    fun k n hn A hcan hC u hu hnot => key _ k n hn rfl A hcan hC u hu hnot
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
  intro k n hn hm A hcan hC u hu hnot
  obtain ⟨-, hrc, hrng, hdead, hopen⟩ := hseg k
  obtain ⟨hS, -, hkids⟩ := hopen n hn
  obtain ⟨hlu, hu5, hbel⟩ := hu
  -- going down to the child `(n.1 ||| 2^u, u)` as an OPEN node of a segment `k'` (not a range root there)
  have step : ∀ k', ∀ c ∈ (segs k').opens, c = (n.1 ||| 2 ^ u, u) →
      ¬ (c = (segs k').root ∧ 0 < (segs k').lo) → False := by
    intro k' c hc hce hnr
    obtain ⟨hSc, hcardc, -⟩ := (hseg k').2.2.2.2 c hc
    have hbc : Below O A c.1 c.2 := by rw [hce]; exact hbel
    obtain ⟨u', hu'⟩ := next_labelO O hSc hbc hcardc
    refine ih _ ?_ k' c hc rfl A hcan hC u' hu' ?_
    · rw [← hm, hce]; exact seg_measure_child n.2 u _ _ hlu hu5 (Nat.sub_le _ _)
    · rintro ⟨h1, h2⟩; exact hnr ⟨h1, by omega⟩
  rcases hkids u hlu hu5 with h | ⟨l, hl, hlu'⟩ | h | h | h | h
  · exact hnot h
  · -- a range: the range segment's root is `n`, with `lo = l ≤ u`
    obtain ⟨k', hk'r, hk'l⟩ := hglue.2 k _ hl
    have hlt : (segs k).lb n < l := hrng _ hl
    obtain ⟨hroot', -, -, hdead', -⟩ := hseg k'
    rcases hroot' with hro | hrd
    · rw [hk'r] at hro
      have hlb' : (segs k').lb n = l := by unfold Seg.lb; rw [if_pos hk'r.symm, hk'l]
      refine ih _ ?_ k' n hro rfl A hcan hC u ⟨hlu, hu5, hbel⟩ ?_
      · rw [← hm, hlb']; omega
      · rintro ⟨-, h2⟩; rw [hk'l] at h2; omega
    · rw [hk'r] at hrd
      exact hdead' n hrd A hcan hC (cont_belowO O hS ⟨hlu, hu5, hbel⟩)
  · exact h A hcan hC ⟨hlu, hu5, hbel⟩
  · -- a child node of the same segment (never the root of a range segment)
    exact step k _ h rfl (fun ⟨h1, h2⟩ => hrc h2 n hn u hlu h1)
  · exact hdead _ h A hcan hC hbel
  · -- an external child: the root of a segment with `lo = 0`
    obtain ⟨k', hk'r, hk'l⟩ := hglue.1 k _ h
    obtain ⟨hroot', -, -, hdead', -⟩ := hseg k'
    rcases hroot' with hro | hrd
    · rw [hk'r] at hro
      exact step k' _ hro rfl (fun ⟨_, h2⟩ => by rw [hk'l] at h2; omega)
    · rw [hk'r] at hrd
      exact hdead' _ hrd A hcan hC hbel

/-- **the root of every segment with `lo = 0` is empty** -/
theorem segs_root_empty {ι : Type} (segs : ι → Seg) (hseg : ∀ k, SegOKO O C (segs k)) (hglue : GlueOK segs) :
    ∀ k, (segs k).lo = 0 → EmptyO O C (segs k).root.1 (segs k).root.2 := by
  intro k hk0 A hcan hC hbel
  rcases (hseg k).1 with hro | hrd
  · obtain ⟨hS, hcard, -⟩ := (hseg k).2.2.2.2 _ hro
    obtain ⟨u, hu⟩ := next_labelO O hS hbel hcard
    exact segs_cover O C segs hseg hglue k _ hro A hcan hC u hu (fun ⟨_, h2⟩ => by rw [hk0] at h2; omega)
  · exact (hseg k).2.2.2.1 _ hrd A hcan hC hbel

/-- **a case is empty** if all its first-level nodes `(2^l, l)` are empty for its canonical decompositions -/
theorem case_empty_of_roots (hroots : ∀ l, l < 511 → EmptyO O C (2 ^ l) l) :
    ∀ A : Spec.Dec22, Canon O A → C A → False := by
  intro A hcan hC
  have hne : ((range 511).filter (fun l => Has O A l)).Nonempty := by
    rw [← Finset.card_pos, has_cardO O A]; omega
  obtain ⟨l0, hmem, hmin0⟩ : ∃ l0 ∈ (range 511).filter (fun l => Has O A l),
      ∀ l ∈ (range 511).filter (fun l => Has O A l), l0 ≤ l :=
    ⟨_, Finset.min'_mem _ hne, fun l hl => Finset.min'_le _ l hl⟩
  simp only [Finset.mem_filter, Finset.mem_range] at hmem
  obtain ⟨hl5, hAl⟩ := hmem
  have hbel : Below O A (2 ^ l0) l0 := by
    intro l hl hle
    rw [Nat.testBit_two_pow]
    rcases Nat.lt_or_ge l l0 with h1 | h1
    · have hn : ¬ Has O A l := by
        intro hA'
        have := hmin0 l (by simp only [Finset.mem_filter, Finset.mem_range]; exact ⟨hl, hA'⟩)
        omega
      simp only [hn, false_iff]; simp; omega
    · have e : l = l0 := by omega
      subst e; simp [hAl]
  exact hroots l0 hl5 A hcan hC hbel

end tree

/-- at prof7's `--rord 123` order and case (II), `TreeOKO` is `KD.TreeOK` (so the case-(II) tree may be stated either way) -/
theorem treeOKO_123 (opens dead : Set (ℕ × ℕ)) : TreeOKO LO123 (CaseK 14 22) opens dead ↔ KD.TreeOK opens dead := by
  unfold TreeOKO KD.TreeOK EmptyO KD.Empty2
  simp only [canon_123, caseK_II, below_123, childDead_123]

/-! ## Canonical representatives for the `--rord 321` key -/

theorem labN321_zero : Top321.labN321 0 = 0 := by decide +kernel

theorem labN321_inj {x y : ℕ} (hx : x < 512) (hy : y < 512) (h : Top321.labN321 x = Top321.labN321 y) : x = y := by
  rcases Nat.eq_zero_or_pos x with rfl | hx0
  · rcases Nat.eq_zero_or_pos y with rfl | hy0
    · rfl
    · have := (Top321.inv_spec y hy0 hy).2.1; rw [← h, labN321_zero] at this; omega
  · rcases Nat.eq_zero_or_pos y with rfl | hy0
    · have := (Top321.inv_spec x hx0 hx).2.1; rw [h, labN321_zero] at this; omega
    · rw [← (Top321.inv_spec x hx0 hx).1, ← (Top321.inv_spec y hy0 hy).1, h]

theorem labK321_inj : Function.Injective Top321.labK321 := by
  intro x y h
  unfold Top321.labK321 at h
  have hx := C3.fld9_lt Top321.LABT321 (x % 512)
  have hy := C3.fld9_lt Top321.LABT321 (y % 512)
  have hq : x / 512 = y / 512 := by
    unfold Top321.labN321 at h; omega
  have hr : Top321.labN321 (x % 512) = Top321.labN321 (y % 512) := by
    unfold Top321.labN321 at h ⊢; omega
  have := labN321_inj (Nat.mod_lt _ (by norm_num)) (Nat.mod_lt _ (by norm_num)) hr
  rw [← Nat.div_add_mod x 512, ← Nat.div_add_mod y 512, hq, this]

theorem rkOf_actN {t : Bool} {P Q : ℕ} (hP : C3.isGL P = true) (hQ : C3.isGL Q = true) (v : ℕ) (hv : v < 512) :
    rkOf (C3.actN t P Q v) = rkOf v := by
  rw [KD.rkOf_rank _ (C3.actN_lt _ _ _ _), KD.rkOf_rank _ hv]
  obtain ⟨hP1, -⟩ := C3.gl_inv hP
  obtain ⟨-, hQ2⟩ := C3.gl_inv hQ
  rw [C3.toM3_actN, Matrix.rank_mul_eq_left_of_isUnit_det _ _ (Matrix.isUnit_det_of_left_inverse hQ2),
    Matrix.rank_mul_eq_right_of_isUnit_det _ _ (Matrix.isUnit_det_of_right_inverse hP1)]
  cases t
  · rfl
  · exact Matrix.rank_transpose _

/-- **every `Dec22` has a canonical image for the 321 key with the same rank type** -/
theorem canon321 (A : Spec.Dec22) :
    ∃ A' : Spec.Dec22, Canon Top321.O A' ∧ ∀ r, Spec.nType A' r = Spec.nType A r := by
  obtain ⟨g, ⟨t, P, Q, hP, hQ, rfl⟩, hcan⟩ := C3.exists_canon Top321.labK321 labK321_inj C3.Gset {x | x < 512}
    C3.Gset_finite C3.Gset_nonempty C3.Gset_comp (Finset.univ.image A.av)
    (by intro x hx; obtain ⟨s, -, rfl⟩ := Finset.mem_image.mp hx; exact A.lt s)
  obtain ⟨b', c', hd'⟩ := C3.isDecomp_actN A.dec hP hQ
  refine ⟨{ av := fun s => C3.actN t P Q (A.av s), b := b', c := c'
            lt := fun s => C3.actN_lt t P Q (A.av s)
            ne := fun s h0 => A.ne s (C3.actN_inj hP hQ (A.lt s) (by norm_num) (by rw [h0, C3.actN_zero]))
            inj := fun s s' h => A.inj (C3.actN_inj hP hQ (A.lt s) (A.lt s') h)
            dec := hd' }, ?_, ?_⟩
  · show C3.Canon Top321.labK321 C3.Gset (Finset.univ.image (fun s => C3.actN t P Q (A.av s)))
    rw [Finset.image_image] at hcan
    exact hcan
  · intro r
    unfold Spec.nType
    simp only [rkOf_actN hP hQ _ (A.lt _)]

/-! ## Canonical representatives for the 123 key, and the cases from their segments -/

/-- **every `Dec22` has a canonical image for prof7's `--rord 123` key with the same rank type** -/
theorem canon123 (A : Spec.Dec22) :
    ∃ A' : Spec.Dec22, Canon LO123 A' ∧ ∀ r, Spec.nType A' r = Spec.nType A r := by
  obtain ⟨t, P, Q, hP, hQ, ⟨b', c', hd'⟩, hcan⟩ := C3.exists_canon_decomp A.av A.lt A.b A.c A.dec
  refine ⟨{ av := fun s => C3.actN t P Q (A.av s), b := b', c := c'
            lt := fun s => C3.actN_lt t P Q (A.av s)
            ne := fun s h0 => A.ne s (C3.actN_inj hP hQ (A.lt s) (by norm_num) (by rw [h0, C3.actN_zero]))
            inj := fun s s' h => A.inj (C3.actN_inj hP hQ (A.lt s) (A.lt s') h)
            dec := hd' }, hcan, ?_⟩
  intro r
  unfold Spec.nType
  simp only [rkOf_actN hP hQ _ (A.lt _)]

/-- **case (II) from its certified, glued segments**: the node `(1, 0)` is the root of a segment with `lo = 0`; the other
first labels are empty by `Top.root_caseII` -/
theorem caseII_of_segs {ι : Type} (segs : ι → Seg) (hseg : ∀ k, SegOKO LO123 (CaseK 14 22) (segs k))
    (hglue : GlueOK segs) (hroot : ∃ k, (segs k).root = (1, 0) ∧ (segs k).lo = 0) : CaseIIEmpty := by
  intro A _ hII
  obtain ⟨A', hcan, hn⟩ := canon123 A
  have hC' : CaseK 14 22 A' := by
    refine ⟨?_, nType_le A' 1⟩
    rw [hn 1]; exact hII
  refine case_empty_of_roots LO123 (CaseK 14 22) (fun l hl => ?_) A' hcan hC'
  rcases Nat.eq_zero_or_pos l with rfl | hpos
  · obtain ⟨k, hkr, hk0⟩ := hroot
    have := segs_root_empty LO123 (CaseK 14 22) segs hseg hglue k hk0
    rw [hkr] at this
    simpa using this
  · intro B hB hBC hBb
    exact root_caseII l hpos hl B ((canon_123 B).mp hB) ((caseK_II B).mp hBC) ((below_123 B _ _).mp hBb)

/-- **a case of the `--rord 321` run from its certified, glued segments**: the job roots (labels 0, 168, 462) are roots of
segments with `lo = 0`; the other first labels are empty by `Top321.root_321` -/
theorem caseK321_of_segs (lo hi : ℕ) {ι : Type} (segs : ι → Seg) (hseg : ∀ k, SegOKO Top321.O (CaseK lo hi) (segs k))
    (hglue : GlueOK segs) (hroot : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segs k).root = (2 ^ l, l) ∧ (segs k).lo = 0) :
    ∀ A : Spec.Dec22, CaseK lo hi A → False := by
  intro A hC
  obtain ⟨A', hcan, hn⟩ := canon321 A
  have hC' : CaseK lo hi A' := by unfold CaseK at hC ⊢; rw [hn 1]; exact hC
  refine case_empty_of_roots Top321.O (CaseK lo hi) (fun l hl => ?_) A' hcan hC'
  have hjob : l ∈ ([0, 168, 462] : List ℕ) → EmptyO Top321.O (CaseK lo hi) (2 ^ l) l := by
    intro hm
    obtain ⟨k, hkr, hk0⟩ := hroot l hm
    have := segs_root_empty Top321.O (CaseK lo hi) segs hseg hglue k hk0
    rw [hkr] at this
    exact this
  by_cases h0 : l = 0
  · subst h0; exact hjob (by simp)
  · by_cases h1 : l = 168
    · subst h1; exact hjob (by simp)
    · by_cases h2 : l = 462
      · subst h2; exact hjob (by simp)
      · intro B hB _; exact Top321.root_321 l hl h0 h1 h2 B hB

/-! ## The theorem -/

/-- **`R_F2(<3,3,3>) ≥ 23` on the L479 route**, from the remaining computational facts.
* The l479cw IP constants (`C Em LB LBR UB Ntab nrows i2 sl tab GE`) are those of hcls's `E1G.IP_l479cw` /
  `E1G.OK_l479cw_Base`.
* `segII`, `segI`, `segI13` are the certificate run's segments (job streams, pieces, queue ranges, `--pctop` top segments);
  `GlueOK` and the roots are the manifest's facts. -/
theorem rank_ge_23_L479
    -- hcls: the point lemma (E1P)
    (hPoint : HC.ClassLB 492 21)
    -- leaf2 (dims 4-5) and hcls + fleet (lines, planes, dim 3): the 110 raised classes
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    -- create-subtasks-to: the Gram-state checkers (`G/Main.lean`)
    (g175 : G.NoFam_17_5_0) (g1903 : G.NoFam_19_0_3) (g1822 : G.NoFam_18_2_2) (g1741 : G.NoFam_17_4_1)
    (g1732 : G.NoFam_17_3_2) (g1813 : G.NoFam_18_1_3)
    (oc0 : G.OrbitComplete2) (oc1 : G.OrbitComplete3 1) (oc2 : G.OrbitComplete3 2)
    -- hcls: the l479cw coset IP (facts by decide; chains); leaf2 + hcls: its SAT/ABORT leaves
    (C : E1G.Ctx) (Em LB LBR UB Ntab nrows i2 : ℕ) (sl tab : ℕ → ℕ) (GE : ℕ → Bool × ℕ × ℕ)
    (hIPL : L479.IPL C Em LB LBR UB Ntab nrows i2 sl tab GE)
    (hEnum : L479.EnumOK C sl UB)
    (hExt : L479.ExtOK C)
    -- kinds + R3: case (II) under the L479 table, every segment checked at Ω = case (II)
    (ιII : Type) (segII : ιII → Seg)
    (hsegII : ClassFactsC (CaseK 14 22) HC.cLBII → KD.TypeFacts → ∀ k, SegOKO LO123 (CaseK 14 22) (segII k))
    -- R3 / queue: the case-(II) manifest
    (hglueII : GlueOK segII) (hrootII : ∃ k, (segII k).root = (1, 0) ∧ (segII k).lo = 0)
    -- kinds + R3: cases (I) and (I13) under `--rord 321`; R3 / queue: their manifests
    (ιI : Type) (segI : ιI → Seg) (hsegI : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 0 12) (segI k))
    (hglueI : GlueOK segI)
    (hrootI : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI k).root = (2 ^ l, l) ∧ (segI k).lo = 0)
    (ιI13 : Type) (segI13 : ιI13 → Seg) (hsegI13 : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 13 13) (segI13 k))
    (hglueI13 : GlueOK segI13)
    (hrootI13 : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI13 k).root = (2 ^ l, l) ∧ (segI13 k).lo = 0) :
    RankGe23 := by
  have hcf : Spec.ClassFacts := classFacts_of hCap
  have hty : KD.TypeFacts := G.Br.typeFacts g175 g1903 g1822 g1741 g1732 g1813 oc0 oc1 oc2
  have hL : HC.L479II := L479.l479II_of C Em LB LBR UB Ntab nrows i2 sl tab GE hIPL hEnum hExt hcf L479.h495
  have hcfII : ClassFactsC (CaseK 14 22) HC.cLBII := HC.classFactsII_of hL hcf
  have hI : CaseIEmpty := fun A _ hA =>
    caseK321_of_segs 0 12 segI (hsegI hcf) hglueI hrootI A ⟨Nat.zero_le _, hA⟩
  have hI13 : CaseI13Empty := fun A _ hA =>
    caseK321_of_segs 13 13 segI13 (hsegI13 hcf) hglueI13 hrootI13 A ⟨le_of_eq hA.symm, le_of_eq hA⟩
  exact rank_ge_23_of_cases HC.rr_all hPoint hI hI13 (caseII_of_segs segII (hsegII hcfII hty) hglueII hrootII)

/-- **the plan of record: `rank_ge_23_L479` at hcls's l479cw IP** (`E1G.OK_l479cw`, `E1G.IP_l479cw`). `hIPL` is discharged by
`L479.ipl_cw ext` (hcls's IP facts, all by `decide`); the context is `E1G.OK_l479cw.Cx ext`, parametrized by the external-leaf
list `ext`, which is final only when the enumeration is. -/
theorem rank_ge_23_L479cw
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (g175 : G.NoFam_17_5_0) (g1903 : G.NoFam_19_0_3) (g1822 : G.NoFam_18_2_2) (g1741 : G.NoFam_17_4_1)
    (g1732 : G.NoFam_17_3_2) (g1813 : G.NoFam_18_1_3)
    (oc0 : G.OrbitComplete2) (oc1 : G.OrbitComplete3 1) (oc2 : G.OrbitComplete3 2)
    -- hcls: the l479cw enumeration (E1G chains); leaf2 + hcls: its external (SAT / over-budget) leaves
    (ext : List ℕ)
    (hEnum : L479.EnumOK (E1G.OK_l479cw.Cx ext) E1G.OK_l479cw.sl E1G.IP_l479cw.UB)
    (hExt : L479.ExtOK (E1G.OK_l479cw.Cx ext))
    (ιII : Type) (segII : ιII → Seg)
    (hsegII : ClassFactsC (CaseK 14 22) HC.cLBII → KD.TypeFacts → ∀ k, SegOKO LO123 (CaseK 14 22) (segII k))
    (hglueII : GlueOK segII) (hrootII : ∃ k, (segII k).root = (1, 0) ∧ (segII k).lo = 0)
    (ιI : Type) (segI : ιI → Seg) (hsegI : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 0 12) (segI k))
    (hglueI : GlueOK segI)
    (hrootI : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI k).root = (2 ^ l, l) ∧ (segI k).lo = 0)
    (ιI13 : Type) (segI13 : ιI13 → Seg) (hsegI13 : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 13 13) (segI13 k))
    (hglueI13 : GlueOK segI13)
    (hrootI13 : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI13 k).root = (2 ^ l, l) ∧ (segI13 k).lo = 0) :
    RankGe23 :=
  rank_ge_23_L479 hPoint hCap g175 g1903 g1822 g1741 g1732 g1813 oc0 oc1 oc2 (E1G.OK_l479cw.Cx ext)
    E1G.IP_l479cw.Em E1G.IP_l479cw.LB E1G.IP_l479cw.LBR E1G.IP_l479cw.UB E1G.OK_l479cw.Ntab E1G.OK_l479cw.nrows
    E1G.OK_l479cw.i2 E1G.OK_l479cw.sl E1G.OK_l479cw.tab E1G.IP_l479cw.ge (L479.ipl_cw ext) hEnum hExt
    ιII segII hsegII hglueII hrootII ιI segI hsegI hglueI hrootI ιI13 segI13 hsegI13 hglueI13 hrootI13

/-- **the same without L479** (case (II) on table C3eD, rows valid for every decomposition): no l479cw hypotheses -/
theorem rank_ge_23_C3eD
    (hPoint : HC.ClassLB 492 21)
    (hCap : ∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2)
    (g175 : G.NoFam_17_5_0) (g1903 : G.NoFam_19_0_3) (g1822 : G.NoFam_18_2_2) (g1741 : G.NoFam_17_4_1)
    (g1732 : G.NoFam_17_3_2) (g1813 : G.NoFam_18_1_3)
    (oc0 : G.OrbitComplete2) (oc1 : G.OrbitComplete3 1) (oc2 : G.OrbitComplete3 2)
    (ιII : Type) (segII : ιII → Seg)
    (hsegII : Spec.ClassFacts → KD.TypeFacts → ∀ k, SegOKO LO123 (CaseK 14 22) (segII k))
    (hglueII : GlueOK segII) (hrootII : ∃ k, (segII k).root = (1, 0) ∧ (segII k).lo = 0)
    (ιI : Type) (segI : ιI → Seg) (hsegI : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 0 12) (segI k))
    (hglueI : GlueOK segI)
    (hrootI : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI k).root = (2 ^ l, l) ∧ (segI k).lo = 0)
    (ιI13 : Type) (segI13 : ιI13 → Seg) (hsegI13 : Spec.ClassFacts → ∀ k, SegOKO Top321.O (CaseK 13 13) (segI13 k))
    (hglueI13 : GlueOK segI13)
    (hrootI13 : ∀ l ∈ ([0, 168, 462] : List ℕ), ∃ k, (segI13 k).root = (2 ^ l, l) ∧ (segI13 k).lo = 0) :
    RankGe23 := by
  have hcf : Spec.ClassFacts := classFacts_of hCap
  have hty : KD.TypeFacts := G.Br.typeFacts g175 g1903 g1822 g1741 g1732 g1813 oc0 oc1 oc2
  have hI : CaseIEmpty := fun A _ hA =>
    caseK321_of_segs 0 12 segI (hsegI hcf) hglueI hrootI A ⟨Nat.zero_le _, hA⟩
  have hI13 : CaseI13Empty := fun A _ hA =>
    caseK321_of_segs 13 13 segI13 (hsegI13 hcf) hglueI13 hrootI13 A ⟨le_of_eq hA.symm, le_of_eq hA⟩
  exact rank_ge_23_of_cases HC.rr_all hPoint hI hI13 (caseII_of_segs segII (hsegII hcf hty) hglueII hrootII)

end Top
end

#print axioms Top.tree_soundO
#print axioms Top.treeOKO_123
#print axioms Top.segs_cover
#print axioms Top.segs_root_empty
#print axioms Top.canon123
#print axioms Top.canon321
#print axioms Top.caseII_of_segs
#print axioms Top.caseK321_of_segs
#print axioms Top.rank_ge_23_L479
#print axioms Top.rank_ge_23_L479cw
#print axioms Top.rank_ge_23_C3eD
