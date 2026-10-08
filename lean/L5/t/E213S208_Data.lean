module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S208 "data/lean/92ac0626a8f744d8d2cca7ff1b30e9f2/E213S208.bin"
namespace E213S208
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [282, 254], [148], 7)], 0, E213S208.L1),
([(10, true, false, [282, 254], [148], 45)], 0, E213S208.L2),
([(10, true, false, [282, 254], [148], 49)], 0, E213S208.L3),
([(10, true, false, [282, 254], [148], 80)], 0, E213S208.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S208
