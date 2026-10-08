module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S295 "data/lean/115d780e079b4aa43d27f478546606ea/E236S295.bin"
namespace E236S295
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [354, 394], [22, 276], 0)], 0, E236S295.L1),
([(11, true, false, [354, 394], [22, 276], 2)], 0, E236S295.L2),
([(11, true, false, [354, 394], [22, 276], 4)], 0, E236S295.L3),
([(11, true, false, [354, 394], [22, 276], 10)], 0, E236S295.L4),
([(11, true, false, [354, 394], [22, 276], 25)], 0, E236S295.L5),
([(11, true, false, [354, 394], [22, 276], 28)], 0, E236S295.L6),
([(11, true, false, [354, 394], [22, 276], 36)], 0, E236S295.L7),
([(11, true, false, [354, 394], [22, 276], 47)], 0, E236S295.L8),
([(11, true, false, [354, 394], [22, 276], 51)], 0, E236S295.L9),
([(11, true, false, [354, 394], [22, 276], 55)], 0, E236S295.L10),
([(11, true, false, [354, 394], [22, 276], 59)], 0, E236S295.L11),
([(11, true, false, [354, 394], [22, 276], 75)], 0, E236S295.L12),
([(11, true, false, [354, 394], [22, 276], 80)], 0, E236S295.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S295
