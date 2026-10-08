module
public import R22Port.U_d41d8cd98f00
public import NNP.RefStat
public import NNP.BindII
public import NNP.Bind321
/-! # NNP.Ref: the refinement of the batch checkers' item predicates (`NN.CheckedII`, `NN.CheckedI`, `NN.CheckedI13`)

Each states infra's `SegRefH` shape (PROOF_OBJECT.md §3.2a) for the item predicate of `NN.Case`, with only the hypotheses that
`R22B.final_generic` provides for that case, and the nonzero-factor fact `hnz` (discharged at composition by
`Top.dec22_bc HC.rr_all`):
* **`refII_gen`** (any class bounds `lb` with class 479 at 21 and the others at `cLB`; `HC.cLBII` is one:
  `refII_gen HC.cLBII (if_pos rfl) (fun c h => if_neg h)`): certified under `ClassFactsC (CaseK 14 22) lb ∧ KD.TypeFacts`;
* **`refI`**, **`refI13`**: certified under revision 5's `R3RT.Spec.ClassFacts`.

The static premises: `NNP.RefStat` (tables, kinds, masks, rows) and the bindings `NNB.bII`, `NNB.bII_c1`, `NNB.b321`,
`NNB.b321_c1` (`NNP.BindII`, `NNP.Bind321`) through `BindQSpec` (`L5II.bindQ_specII`, `L5O.bindQ_spec`). -/
@[expose] public section
set_option maxHeartbeats 4000000
namespace NNP
open NN R3RT.SpecO

/-! ## Case (II) -/

theorem tabII (lb : ℕ → ℕ) (h479 : lb 479 = 21) (hother : ∀ c, c ≠ 479 → lb c = RT.cLB RT.K3eD_Cls.CL c)
    (hcls : ClassFactsC (CaseK 14 22) lb) : TabFactsII (CaseK 14 22) NN.statII R22D.rowEII where
  c1 := by
    rw [c1II]
    obtain ⟨rows, hb⟩ := NNB.bII_c1
    exact (L5II.bindQ_specII lb h479 hother 511 rows _ _ hcls).2 hb
  c2 := fun l hl => by
    rw [c2II l hl]
    obtain ⟨rows, hb⟩ := NNB.bII l hl
    exact (L5II.bindQ_specII lb h479 hother l rows _ _ hcls).1 hl hb
  h := hII
  ks := ksII
  gl := glII
  row := rowII lb h479 hother hcls

/-- **case (II)**: every checked key has a segment with its interface, certified under the case-(II) facts -/
theorem refII_gen (lb : ℕ → ℕ) (h479 : lb 479 = 21) (hother : ∀ c, c ≠ 479 → lb c = RT.cLB RT.K3eD_Cls.CL c)
    (hnz : ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) :
    ∀ k, NN.CheckedII k → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧
      (ClassFactsC (CaseK 14 22) lb ∧ KD.TypeFacts → SegOKO LO123 (CaseK 14 22) g) := by
  intro k ⟨s, hs⟩
  exact itemII_sound NN.statII R22D.rowEII NN.scanII k (R22N.Bin7.decode s) _ (fun hH => tabII lb h479 hother hH.1) (fun hH => hH.2)
    (fun _ => hnz) szII c2WII npII hs

/-! ## Cases (I) / (I13) -/

theorem tab321 (hcls : R3RT.Spec.ClassFacts) : TabFacts321 NN.stat321 R22D.rowE321 where
  c1 := by
    rw [c1321]
    obtain ⟨rows, hb⟩ := NNB.b321_c1
    exact (L5O.bindQ_spec (L5O.is321 _) 511 rows _ _ (classFactsC_true.mpr hcls)).2 hb
  c2 := fun l hl => by
    rw [c2321 l hl]
    obtain ⟨rows, hb⟩ := NNB.b321 l hl
    exact (L5O.bindQ_spec (L5O.is321 _) l rows _ _ (classFactsC_true.mpr hcls)).1 hl hb
  h := h321
  ks := ks321
  gl := gl321
  row := row321 hcls

/-- **case (I)** -/
theorem refI (hnz : ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) :
    ∀ k, NN.CheckedI k → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧
      (R3RT.Spec.ClassFacts → SegOKO Top321.O (CaseK 0 12) g) := by
  intro k ⟨s, hs⟩
  exact itemI_sound NN.stat321 R22D.rowE321 NN.scan321 k (R22N.Bin7.decode s) _ tab321 (fun _ => hnz) sz321 c2W321 np321 hs

/-- **case (I13)** -/
theorem refI13 (hnz : ∀ A : R3RT.Spec.Dec22, ∀ s, A.b s ≠ 0 ∧ A.c s ≠ 0) :
    ∀ k, NN.CheckedI13 k → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧
      (R3RT.Spec.ClassFacts → SegOKO Top321.O (CaseK 13 13) g) := by
  intro k ⟨s, hs⟩
  exact itemI13_sound NN.stat321 R22D.rowE321 NN.scan321 k (R22N.Bin7.decode s) _ tab321 (fun _ => hnz) sz321 c2W321 np321 hs

end NNP
#print axioms NNP.refII_gen
#print axioms NNP.refI
#print axioms NNP.refI13
