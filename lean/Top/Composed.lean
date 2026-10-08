module
public import R22Port.U_d41d8cd98f00
public import R3RT.L1v5Spec
/-! # Top/Composed: the composed main-search node (`R3RT.Spec.ComposedNodeSpec`) holds

The statement is the union of the per-record accountings: a child that is not OPEN lies in one of the record classes, and each
class gives `ChildDead` (the classes `tc`, `dead`, `x6`, `xp` give the stronger "no decomposition continues with `u`"). So
`ComposedNodeSpec` is a theorem; what remains is to prove each class's hypothesis from its checker (R3.md 5.10). -/
@[expose] public section
namespace Top
open R3RT.Spec

theorem composedNode : ComposedNodeSpec := by
  intro S' last opens dead tc x6 xp l3 other htc hdead hx6 hxp hl3 hother hcover u hlu hu hno A hcan hII hcont
  rcases hcover u hlu hu with h | h | h | h | h | h | h
  · exact hno h
  · exact hdead u h A hcont
  · exact htc u h A hcont
  · exact hx6 u h A hcont
  · exact hxp u h A hcont
  · exact hl3 u h A hcan hII hcont
  · exact hother u h A hcan hII hcont

end Top

#print axioms Top.composedNode
