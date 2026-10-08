module
public meta import R22D.Load
public import R22N.Rec
public import R22D.K3eDL
@[expose] public section
-- loaders add thousands of declarations: synchronous elaboration is linear (async: 3-5x CPU and memory, superlinear)
set_option Elab.async false
/-! Copy of `RT.K3eD479L` (the 441 class-479 rows' label masks; same file, same `#rttablew` structure) and of batch 10's row
interface `L5II.rowEII` (verbatim, computable).  Bridge: `R22B.K3eD479L`. -/
#r22d_rttablew R22D.K3eD479L "data/lean/ebedb798c582fa54dc94beada20dba39/kept479_lab.bin" 64 520
/-- `L5II.rowEII`, verbatim: `K3eD`'s rows, then the 441 class-479 rows (ids 3781613..3782053), 0 beyond -/
def R22D.rowEII (i : Nat) : Nat :=
  Bool.rec (Bool.rec 0 (R22D.K3eD479L.entry (i - 3781613)) (Nat.blt i 3782054)) (R22D.K3eDL.entry i) (Nat.blt i 3781613)
