module
public meta import R22D.Load
public import R22N.Rec
@[expose] public section
-- loaders add thousands of declarations: synchronous elaboration is linear
set_option Elab.async false
/-! Copy of the `--rord 321` row-mask table `RT.K3eDL321` (RT.K3eD_Lab321D; same file, same `#rttablew` structure) and of
`L5O.rowE321` (verbatim, computable).  Bridge: `R22B.K3eDL321`. -/
#r22d_rttablew R22D.K3eDL321 "data/lean/84094130e289fac5f7c3e4bbf361a89a/kept3eD_lab321.bin" 64 520
/-- `L5O.rowE321`, verbatim -/
def R22D.rowE321 (i : Nat) : Nat := Bool.rec 0 (R22D.K3eDL321.entry i) (Nat.blt i 3781613)
