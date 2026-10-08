module
public import R22Port.U_733ec8a13965
public import R22B.Cmd
public import R22B.K3eDL
public import R22D.K3eD479L
public import L5.Bind5II
/-! # R22B.K3eD479L: the module-land class-479 rows and batch 10's row interface equal the kernel track's.
The table functions by `rfl` (`#r22b_const`); `rowEII` by rewriting with the two `entry` equalities (unfolding both 16-level
dispatchers inside the nested `Bool.rec` exceeds the kernel's recursion limit). -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.K3eD479L.chunk RT.K3eD479L.chunk
#r22b_const R22D.K3eD479L.entry RT.K3eD479L.entry
#r22b_const R22D.K3eD479L.N RT.K3eD479L.N
theorem R22B.R22D_rowEII_eq : R22D.rowEII = L5II.rowEII := by
  funext i
  unfold R22D.rowEII L5II.rowEII
  rw [R22B.R22D_K3eDL_entry_eq, R22B.R22D_K3eD479L_entry_eq]
#print axioms R22B.R22D_rowEII_eq
