module
public import R22Port.U_d41d8cd98f00
public import L5.Batch5O
public import L5.Batch5cO
public import L5.Frame5O
public import L5.O321
public import L5.T321H
/-! # Revision 6a (`R3RT.SpecO`, md5 1191f91572ac): the order-free contracts of the L1 v5 checker, for every label order
`O` and every universe `Ω` of decompositions -/
@[expose] public section
theorem L5O.node5_specO : ∀ (O : R3RT.SpecO.LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop), R3RT.SpecO.Node5Spec O Ω :=
  fun O Ω => L5O.node5_spec (O := O) (Ω := Ω)
theorem L5O.frame5_specO : ∀ (O : R3RT.SpecO.LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop), R3RT.SpecO.Frame5Spec O Ω :=
  fun O Ω => L5O.frame5_spec (O := O) (Ω := Ω)
theorem L5O.batch5TD_specO : ∀ (O : R3RT.SpecO.LabelOrder) (Ω : R3RT.Spec.Dec22 → Prop), R3RT.SpecO.Batch5TDSpec O Ω :=
  fun O Ω => L5O.batch5TD_spec (O := O) (Ω := Ω)
#print axioms L5O.node5_specO
#print axioms L5O.frame5_specO
#print axioms L5O.batch5TD_specO
#print axioms L5O.table_spec321
#print axioms L5O.bindQ_spec321
#print axioms L5O.O321
#print axioms L5O.hok321_0
#print axioms L5O.hok321_510
#print axioms L5O.batch5TDc_specO
