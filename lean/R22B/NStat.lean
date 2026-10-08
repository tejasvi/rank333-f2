module
public import R22Port.U_512cf3286167
public import R22B.Cmd
public import R22D.NStat
public import R3RT.LabT
public import RT.LabM321
public import RootSound.RootTables
public import C3.Tab
/-! # R22B.NStat: the module-land copies `R22D.NStat` equal the kernel constants (`rfl`) -/
@[expose] public section
#r22b_const R22D.R3RT.VECL R3RT.VECL
#r22b_const R22D.RT.O321.VECL RT.O321.VECL
#r22b_const R22D.RootCheck.RKT RootCheck.RKT
#r22b_const R22D.C3.GLM C3.GLM
#print axioms R22B.R22D_R3RT_VECL_eq
#print axioms R22B.R22D_RT_O321_VECL_eq
#print axioms R22B.R22D_RootCheck_RKT_eq
#print axioms R22B.R22D_C3_GLM_eq
