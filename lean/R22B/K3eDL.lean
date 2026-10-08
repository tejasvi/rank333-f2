module
public import R22Port.U_146580b13fd9
public import R22B.Cmd
public import R22D.K3eDL
public import RT.K3eD_LabD
public import R3RT.Rows3eD
/-! # R22B.K3eDL: the module-land row-mask table equals the kernel track's (`rfl`): `RT.K3eDL` and `R3RT.rowE3eD` -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.K3eDL.chunk RT.K3eDL.chunk
#r22b_const R22D.K3eDL.entry RT.K3eDL.entry
#r22b_const R22D.K3eDL.N RT.K3eDL.N
#r22b_const R22D.rowE3eD R3RT.rowE3eD
#print axioms R22B.R22D_rowE3eD_eq
