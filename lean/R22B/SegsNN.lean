module
public import R22Port.U_d41d8cd98f00
public import R22B.Segs
public import NNP.Seg
/-! # R22B.SegsNN: the node checker's segment copies (`NNP.Seg`, `NNP.SegOKO`, `NNP.EmptyO`) to the glue's `Top.Seg` / `Top.SegOKO`

native/node states its per-item theorems with verbatim copies of `Top.Seg` / `Top.SegOKO` / `Top.EmptyO`. Both are in one
environment here, so `ofNN` copies the fields and `segOKO_ofNN` holds by definitional unfolding. **`segRefH_of_nn`** turns a
per-item theorem in the node's shape into `R22B.SegRefH`, the shape `R22B.final_generic` consumes (`rII`, `rI`, `rI13`). -/
@[expose] public section
namespace R22B
open R3RT.SpecO

/-- the glue's segment with the fields of the node's copy -/
def ofNN (g : NNP.Seg) : Top.Seg := ⟨g.root, g.lo, g.opens, g.dead, g.ext, g.rng⟩

theorem segOKO_ofNN (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (g : NNP.Seg) (h : NNP.SegOKO O C g) :
    Top.SegOKO O C (ofNN g) := h

/-- the node's per-item shape ⇒ `SegRefH` -/
theorem segRefH_of_nn (H : Prop) (O : LabelOrder) (C : R3RT.Spec.Dec22 → Prop) (checked : ℕ → Prop)
    (h : ∀ k, checked k → ∃ g : NNP.Seg, g.root = (R22N.SegI.ofKey k).root ∧ g.lo = (R22N.SegI.ofKey k).lo ∧
      g.ext = {e | e ∈ (R22N.SegI.ofKey k).ext} ∧ g.rng = {p | p ∈ (R22N.SegI.ofKey k).rng} ∧ (H → NNP.SegOKO O C g)) :
    SegRefH H O C checked := fun k hk => by
  obtain ⟨g, h1, h2, h3, h4, h5⟩ := h k hk
  exact ⟨ofNN g, h1, h2, h3, h4, fun hH => segOKO_ofNN O C g (h5 hH)⟩

end R22B
#print axioms R22B.segRefH_of_nn
