module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S387 "data/lean/0a8bcf3eb169445c1aeaabb45706b096/E236S387.bin"
namespace E236S387
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 394, 412], [], 0)], 0, E236S387.L1),
([(0, true, false, [354, 394, 412], [], 1)], 0, E236S387.L2),
([(0, true, false, [354, 394, 412], [], 2)], 0, E236S387.L3),
([(0, true, false, [354, 394, 412], [], 3)], 0, E236S387.L4),
([(0, true, false, [354, 394, 412], [], 4)], 0, E236S387.L5),
([(0, true, false, [354, 394, 412], [], 49)], 0, E236S387.L6),
([(0, true, false, [354, 394, 412], [], 58)], 0, E236S387.L7),
([(0, true, false, [354, 394, 412], [], 77)], 0, E236S387.L8),
([(0, true, false, [354, 394, 412], [], 81)], 0, E236S387.L9),
([(0, true, false, [354, 394, 412], [], 87)], 0, E236S387.L10),
([(0, true, false, [354, 394, 412], [], 88)], 0, E236S387.L11),
([(0, true, false, [354, 394, 412], [], 105)], 0, E236S387.L12),
([(0, true, false, [354, 394, 412], [], 134)], 0, E236S387.L13),
([(0, true, false, [354, 394, 412], [], 176)], 0, E236S387.L14),
([(0, true, false, [354, 394, 412], [], 232)], 0, E236S387.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E236S387
