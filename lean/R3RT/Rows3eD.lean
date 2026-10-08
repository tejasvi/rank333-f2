module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_LabD
public import R3RT.LabT
/-! # The row interface of the main search (table C3eD): row `i` = line `i` of `kept_C3eDc4d.txt`.
`rowL i` and `rowC i` come from RT's stored label-mask table `RT.K3eDL` (bits 0..510 = the row's points in `--rord 123` label
order, bits 511.. = its cap): `RT.K3eDL.labMask_spec` and `RT.K3eDL.capL_spec` (module `RT.K3eD_Lab`) tie them to
`dualM (RT.K3eD.entry i)` and `eCap (RT.K3eD.entry i)`, and `RT.K3eD.row_valid` gives their meaning.  The labM bridge version is
`Rows3eDB` (`R3RT.labM_spec`). -/
@[expose] public section
namespace R3RT
noncomputable def rowL3eD (i : Nat) : Nat := Nat.land (RT.K3eDL.entry i) M511
noncomputable def rowC3eD (i : Nat) : Nat := Nat.shiftRight (RT.K3eDL.entry i) 511
end R3RT
namespace R3RT
/-- the 520-bit (label mask, cap) of kept row `i`, as stored by RT (row tables of the production path compare against this);
0 for `i ≥ 3781613` (RT's dispatcher aliases ids with period 2^22) -/
noncomputable def rowE3eD (i : Nat) : Nat := Bool.rec 0 (RT.K3eDL.entry i) (Nat.blt i 3781613)
end R3RT
