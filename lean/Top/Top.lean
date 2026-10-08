module
public import R22Port.U_d41d8cd98f00
public import Top.Base
public import Top.Root
public import HC.Tables
public import KD.Tree
public import KD.Leaf
/-! # Top-level skeleton: `R_F2(<3,3,3>) ≥ 23` from the conclusions of every computational tier

**`Top.rank_ge_23_skeleton`** proves `RankGe23` from six hypotheses. Each one is the conclusion of a tier's own soundness
theorem (or the proposition a tier must deliver), named after the artifact that discharges it (`top/GAPS.md` lists who
owns each):

| hypothesis | statement | artifact |
|---|---|---|
| `hPoint` | `HC.ClassLB 492 21` (the point lemma: `rank(T mod e00) ≥ 21`) | E1P on the point IP of 492, then `HC.classLB_of_e1` |
| `hCap` | `∀ p ∈ HC.T_K3eD_Cls.RL, p.1 ≠ 492 → HC.ClassLB p.1 p.2` (110 class certificates) | E1 runs (`classLB_of_e1`), census (`classLB_of_ladder`), RR-form proofs (`classLB_of_table`) |
| `hTypes` | `KD.TypeFacts` (no 22-term decomposition has a forbidden rank type) | the type-lemma certificates (r22/thm4) |
| `hII` | `ClassFacts → TypeFacts → CaseIITree` | the case (II) tree: phase-0 collections and every job's stream, as one `KD.TreeOK` with the node `(1, 0)` |
| `hI` | `ClassFacts → TypeFacts → CaseIEmpty` | case (I) (`--rord 321 --maxr1 12`) |
| `hI13` | `ClassFacts → TypeFacts → CaseI13Empty` | case (I13) (`--rord 321`, `k = 13`) |

Proved here or in `Top.Base`, `HC.*`, `KD.*`:
- RR's claims (`HC.rr_all`).
- `n ≥ 22` (`rank_ge_22`).
- The step from 22 terms to `Dec22` with nonzero `b`, `c` (`dec22_of`), using RR for ranks 2-3 and `hPoint` for rank 1.
- The case split.
- The capacity table `ClassFacts` from `hCap` (`HC.hclsN_K3eD_Cls_final`).
- The canonical reduction and tree closure of case (II) (`KD.caseII_empty`); its root is the single node `(1, 0)` (`root_caseII`).
- Leaf nodes as dead nodes (`leaf_empty2`: `KD.leaf_node_dead` plus `dec22_bc`). -/
@[expose] public section
set_option exponentiation.threshold 50000
namespace Top
open RootSound RT HC R3RT.Spec

/-- **the case (II) certificate**: the main search's case-(II) nodes (phase-0 collections down to the job roots, then every job's
stream) form one `KD.TreeOK` tree containing the first-level node `(1, 0)` (label 0; the other first labels are empty for
canonical case-(II) decompositions, `root_caseII`) -/
def CaseIITree : Prop :=
  ∃ opens dead : Set (ℕ × ℕ), KD.TreeOK opens dead ∧ ((1, 0) ∈ opens ∨ (1, 0) ∈ dead)

theorem caseII_of_tree (h : CaseIITree) : CaseIIEmpty := by
  obtain ⟨opens, dead, hT, h10⟩ := h
  intro A _ hII
  refine KD.caseII_empty hT (fun l hl => ?_) A hII
  rcases Nat.eq_zero_or_pos l with h0 | hpos
  · subst h0; right; simpa using h10
  · left; exact root_caseII l hpos hl

/-- **a leaf node is a dead node of the tree** (its v7 record refutes the profile; `b`, `c` are nonzero by RR) -/
theorem leaf_empty2 (hrr : RRAll) {R S last : ℕ} (hR : BC7s.leafS R = true) (hb : KD.leafBind R S = true)
    (hS : S >>> last = 1) (hS511 : S < 2 ^ 511)
    (hcard : ((Finset.range 511).filter (fun l => S.testBit l = true)).card = 22) : KD.Empty2 S last :=
  fun A _ _ => KD.leaf_node_dead hR hb hS hS511 hcard A (dec22_bc hrr A)

/-- the capacity table of the main search (`R3RT.Spec.ClassFacts`, the hypothesis of `RT.K3eD.row_valid` and of the R3
contracts) from the 110 class certificates -/
theorem classFacts_of (hCap : ∀ p ∈ T_K3eD_Cls.RL, p.1 ≠ 492 → ClassLB p.1 p.2) : R3RT.Spec.ClassFacts :=
  hclsN_K3eD_Cls_final hCap

/-- **`R_F2(<3,3,3>) ≥ 23`, from the tiers' conclusions.** -/
theorem rank_ge_23_skeleton
    (hPoint : ClassLB 492 21)
    (hCap : ∀ p ∈ T_K3eD_Cls.RL, p.1 ≠ 492 → ClassLB p.1 p.2)
    (hTypes : KD.TypeFacts)
    (hII : R3RT.Spec.ClassFacts → KD.TypeFacts → CaseIITree)
    (hI : R3RT.Spec.ClassFacts → KD.TypeFacts → CaseIEmpty)
    (hI13 : R3RT.Spec.ClassFacts → KD.TypeFacts → CaseI13Empty) :
    RankGe23 :=
  rank_ge_23_of_cases rr_all hPoint (hI (classFacts_of hCap) hTypes) (hI13 (classFacts_of hCap) hTypes)
    (caseII_of_tree (hII (classFacts_of hCap) hTypes))

end Top

#print axioms Top.rank_ge_23_of_cases
#print axioms Top.rank_ge_23_skeleton
#print axioms Top.leaf_empty2
#print axioms Top.dec22_of
#print axioms Top.rank_ge_22
#print axioms Top.root_caseII
#print axioms Top.caseII_of_tree
