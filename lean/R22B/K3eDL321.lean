module
public import R22Port.U_4c1de6488e07
public import R22B.Cmd
public import R22D.K3eDL321
public import RT.K3eD_Lab321D
public import L5.Bind5O
/-! # R22B.K3eDL321: the module-land `--rord 321` row-mask table and its row interface equal the kernel track's.
Table functions by `rfl`; `rowE321` by rewriting with the `entry` equality (as for `rowEII`). -/
@[expose] public section
set_option maxRecDepth 100000
#r22b_const R22D.K3eDL321.chunk RT.K3eDL321.chunk
#r22b_const R22D.K3eDL321.entry RT.K3eDL321.entry
#r22b_const R22D.K3eDL321.N RT.K3eDL321.N
theorem R22B.R22D_rowE321_eq : R22D.rowE321 = L5O.rowE321 := by
  funext i
  unfold R22D.rowE321 L5O.rowE321
  rw [R22B.R22D_K3eDL321_entry_eq]
#print axioms R22B.R22D_rowE321_eq
