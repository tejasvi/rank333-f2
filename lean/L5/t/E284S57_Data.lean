module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S57 "data/lean/44b1ecf13db162e2edd0654cb28968a6/E284S57.bin"
namespace E284S57
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 340, 394], [10, 42], 2)], 0, E284S57.L1),
([(3, true, false, [266, 340, 394], [10, 42], 4)], 0, E284S57.L2),
([(3, true, false, [266, 340, 394], [10, 42], 13)], 0, E284S57.L3),
([(3, true, false, [266, 340, 394], [10, 42], 18)], 0, E284S57.L4),
([(3, true, false, [266, 340, 394], [10, 42], 27)], 0, E284S57.L5),
([(3, true, false, [266, 340, 394], [10, 42], 28)], 0, E284S57.L6),
([(3, true, false, [266, 340, 394], [10, 42], 36)], 0, E284S57.L7),
([(3, true, false, [266, 340, 394], [10, 42], 37)], 0, E284S57.L8),
([(3, true, false, [266, 340, 394], [10, 42], 38)], 0, E284S57.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S57
