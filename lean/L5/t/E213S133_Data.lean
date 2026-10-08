module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S133 "data/lean/4e5d2550336f15919360358694304dc5/E213S133.bin"
namespace E213S133
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [106, 282], [10, 388], 2)], 8, E213S133.L1),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 484)], 0, E213S133.L2),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 492)], 0, E213S133.L3),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 516)], 0, E213S133.L4),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 524)], 0, E213S133.L5),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 888)], 0, E213S133.L6),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 908)], 0, E213S133.L7),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 1236)], 0, E213S133.L8),
([(11, true, false, [106, 282], [10, 388], 2), (2, false, false, [], [388], 1272)], 0, E213S133.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E213S133
