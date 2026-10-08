module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S8 "data/lean/18623756e5f4d08565d96ec998492224/E213S8.bin"
namespace E213S8
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [244], [96, 272], 46)], 0, E213S8.L1),
([(3, true, false, [244], [96, 272], 47)], 0, E213S8.L2),
([(3, true, false, [244], [96, 272], 48)], 0, E213S8.L3),
([(3, true, false, [244], [96, 272], 49)], 0, E213S8.L4),
([(3, true, false, [244], [96, 272], 51)], 0, E213S8.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S8
