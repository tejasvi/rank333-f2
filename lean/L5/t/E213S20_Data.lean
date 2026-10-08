module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S20 "data/lean/be56f03574f3e66c8c9a83b86fc9eb7c/E213S20.bin"
namespace E213S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [282], [148, 368], 20)], 3, E213S20.L1),
([(9, true, false, [282], [148, 368], 20), (10, false, false, [], [148, 368], 184)], 0, E213S20.L2),
([(9, true, false, [282], [148, 368], 20), (10, false, false, [], [148, 368], 280)], 0, E213S20.L3),
([(9, true, false, [282], [148, 368], 20), (10, false, false, [], [148, 368], 584)], 0, E213S20.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E213S20
