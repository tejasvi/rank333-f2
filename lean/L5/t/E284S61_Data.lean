module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S61 "data/lean/0890d3b4db20afd3ad334f14358df1f6/E284S61.bin"
namespace E284S61
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 394, 468], [10, 42], 2)], 0, E284S61.L1),
([(3, true, false, [266, 394, 468], [10, 42], 4)], 0, E284S61.L2),
([(3, true, false, [266, 394, 468], [10, 42], 21)], 0, E284S61.L3),
([(3, true, false, [266, 394, 468], [10, 42], 22)], 0, E284S61.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S61
