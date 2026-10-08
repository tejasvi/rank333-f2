module
public import R22Port.U_1220ddfa2eb4
public import Top.TopL479
public import R22N.Glue
/-! # R22B.Segs: from the module-land closure `R22N.Cov` to the glue agent's segment hypotheses (non-module bridge, native/infra)

`Top.rank_ge_23_L479` consumes, per case, `segs : ι → Seg` with `SegOKO` for each, `GlueOK segs`, and a root.  `SegRef` is the
per-item refinement contract (PROOF_OBJECT.md §3.2a): every checked key has a certified segment with exactly its interface.
**`segs_of_cov`**: a `Cov` derivation of `(r, lo)` gives such a family (indexed by the covered interfaces), glued, with `(r, lo)` as
a root.  Generic in the checker (`checked`), the label order and the case predicate. -/
@[expose] public section
noncomputable section
namespace R22B
open Top R3RT.SpecO

/-- the refinement contract of a checker: every checked key has a certified segment with exactly its interface -/
def SegRef (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop) : Prop :=
  ∀ k, checked k → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
    g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧ SegOKO O C g

theorem segs_of_cov (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop) (href : SegRef O C checked)
    (x : (ℕ × ℕ) × ℕ) (hx : R22N.Cov checked x) :
    ∃ (ι : Type) (segs : ι → Seg), (∀ i, SegOKO O C (segs i)) ∧ GlueOK segs ∧
      ∃ i, (segs i).root = x.1 ∧ (segs i).lo = x.2 := by
  classical
  let ι := {p : (ℕ × ℕ) × ℕ // R22N.Cov checked p}
  choose kOf hk using fun p : ι => R22N.Cov.step p.2
  choose g hg using fun p : ι => href (kOf p) (hk p).1
  have hroot : ∀ p : ι, (g p).root = p.1.1 := fun p => by
    rw [(hg p).1]; exact congrArg Prod.fst (hk p).2.1
  have hlo : ∀ p : ι, (g p).lo = p.1.2 := fun p => by
    rw [(hg p).2.1]; exact congrArg Prod.snd (hk p).2.1
  refine ⟨ι, g, fun p => (hg p).2.2.2.2, ⟨?_, ?_⟩, ⟨⟨x, hx⟩, hroot _, hlo _⟩⟩
  · intro p e he
    rw [(hg p).2.2.1] at he
    exact ⟨⟨(e, 0), (hk p).2.2.1 e he⟩, hroot _, hlo _⟩
  · intro p q hq
    rw [(hg p).2.2.2.1] at hq
    exact ⟨⟨q, (hk p).2.2.2 q hq⟩, hroot _, hlo _⟩

/-! ## With hypotheses: the segment exists unconditionally (its node sets come from the data); only its certification needs the
facts `H` (for case II: `ClassFactsC (CaseK 14 22) HC.cLBII ∧ KD.TypeFacts`).  This is the order `Top.rank_ge_23_L479` needs:
the family `segII` is fixed before its hypothesis `hsegII : ClassFactsC … → TypeFacts → ∀ k, SegOKO …`. -/

/-- the refinement contract under facts `H` -/
def SegRefH (H : Prop) (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop) : Prop :=
  ∀ k, checked k → ∃ g : Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
    g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧ (H → SegOKO O C g)

theorem segs_of_covH (H : Prop) (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop)
    (href : SegRefH H O C checked) (x : (ℕ × ℕ) × ℕ) (hx : R22N.Cov checked x) :
    ∃ (ι : Type) (segs : ι → Seg), (H → ∀ i, SegOKO O C (segs i)) ∧ GlueOK segs ∧
      ∃ i, (segs i).root = x.1 ∧ (segs i).lo = x.2 := by
  classical
  let ι := {p : (ℕ × ℕ) × ℕ // R22N.Cov checked p}
  choose kOf hk using fun p : ι => R22N.Cov.step p.2
  choose g hg using fun p : ι => href (kOf p) (hk p).1
  have hroot : ∀ p : ι, (g p).root = p.1.1 := fun p => by
    rw [(hg p).1]; exact congrArg Prod.fst (hk p).2.1
  have hlo : ∀ p : ι, (g p).lo = p.1.2 := fun p => by
    rw [(hg p).2.1]; exact congrArg Prod.snd (hk p).2.1
  refine ⟨ι, g, fun hH p => (hg p).2.2.2.2 hH, ⟨?_, ?_⟩, ⟨⟨x, hx⟩, hroot _, hlo _⟩⟩
  · intro p e he
    rw [(hg p).2.2.1] at he
    exact ⟨⟨(e, 0), (hk p).2.2.1 e he⟩, hroot _, hlo _⟩
  · intro p q hq
    rw [(hg p).2.2.2.1] at hq
    exact ⟨⟨q, (hk p).2.2.2 q hq⟩, hroot _, hlo _⟩

/-- the same family covers any set of covered roots (the family is indexed by all covered interfaces, independent of the root) -/
theorem segs_of_covH_roots (H : Prop) (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop)
    (href : SegRefH H O C checked) (R : (ℕ × ℕ) × ℕ → Prop) (hR : ∀ x, R x → R22N.Cov checked x) :
    ∃ (ι : Type) (segs : ι → Seg), (H → ∀ i, SegOKO O C (segs i)) ∧ GlueOK segs ∧
      ∀ x, R x → ∃ i, (segs i).root = x.1 ∧ (segs i).lo = x.2 := by
  classical
  let ι := {p : (ℕ × ℕ) × ℕ // R22N.Cov checked p}
  choose kOf hk using fun p : ι => R22N.Cov.step p.2
  choose g hg using fun p : ι => href (kOf p) (hk p).1
  have hroot : ∀ p : ι, (g p).root = p.1.1 := fun p => by
    rw [(hg p).1]; exact congrArg Prod.fst (hk p).2.1
  have hlo : ∀ p : ι, (g p).lo = p.1.2 := fun p => by
    rw [(hg p).2.1]; exact congrArg Prod.snd (hk p).2.1
  refine ⟨ι, g, fun hH p => (hg p).2.2.2.2 hH, ⟨?_, ?_⟩, fun x hx => ⟨⟨x, hR x hx⟩, hroot _, hlo _⟩⟩
  · intro p e he
    rw [(hg p).2.2.1] at he
    exact ⟨⟨(e, 0), (hk p).2.2.1 e he⟩, hroot _, hlo _⟩
  · intro p q hq
    rw [(hg p).2.2.2.1] at hq
    exact ⟨⟨q, (hk p).2.2.2 q hq⟩, hroot _, hlo _⟩

end R22B
end
#print axioms R22B.segs_of_cov
#print axioms R22B.segs_of_covH
