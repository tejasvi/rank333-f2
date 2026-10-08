module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S270 "data/lean/4acaa67304b8752943f175f7347d65bf/E213S270.bin"
namespace E213S270
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 158, 494], [148], 20)], 0, E213S270.L1),
([(6, true, false, [106, 158, 494], [148], 27)], 0, E213S270.L2),
([(6, true, false, [106, 158, 494], [148], 35)], 0, E213S270.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S270
