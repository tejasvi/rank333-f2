module
public meta import R22D.Load
public import R22N.Rec
@[expose] public section
-- loaders add thousands of declarations: synchronous elaboration is linear (async: 3-5x CPU and memory, superlinear)
set_option Elab.async false
/-! Copy of the row table's stored label masks `RT.K3eDL` (RT.K3eD_LabD, same file, same `#rttablew` structure) and of
`R3RT.rowE3eD` (here computable: `Bool.rec` compiles through `R22N.bool_rec_eq_impl`).  Bridge: `R22B.K3eDL`. -/
#r22d_rttablew R22D.K3eDL "data/lean/c2624c174a573a8334132808166253b2/kept3eD_lab.bin" 64 520
/-- `R3RT.rowE3eD`, verbatim -/
def R22D.rowE3eD (i : Nat) : Nat := Bool.rec 0 (R22D.K3eDL.entry i) (Nat.blt i 3781613)
