module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S260 "data/lean/5cb0995e768c4b6089a96089e0646a3e/E213S260.bin"
namespace E213S260
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [244, 254, 282], [272], 5)], 0, E213S260.L1),
([(11, true, false, [244, 254, 282], [272], 7)], 0, E213S260.L2),
([(11, true, false, [244, 254, 282], [272], 13)], 0, E213S260.L3),
([(11, true, false, [244, 254, 282], [272], 78)], 0, E213S260.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S260
