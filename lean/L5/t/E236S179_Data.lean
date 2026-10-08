module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S179 "data/lean/91be62d6ebacc890f45d08d911d421c1/E236S179.bin"
namespace E236S179
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 354, 372], [], 0)], 0, E236S179.L1),
([(2, true, false, [254, 354, 372], [], 1)], 0, E236S179.L2),
([(2, true, false, [254, 354, 372], [], 2)], 0, E236S179.L3),
([(2, true, false, [254, 354, 372], [], 3)], 0, E236S179.L4),
([(2, true, false, [254, 354, 372], [], 4)], 0, E236S179.L5),
([(2, true, false, [254, 354, 372], [], 31)], 0, E236S179.L6),
([(2, true, false, [254, 354, 372], [], 33)], 0, E236S179.L7),
([(2, true, false, [254, 354, 372], [], 35)], 0, E236S179.L8),
([(2, true, false, [254, 354, 372], [], 67)], 0, E236S179.L9),
([(2, true, false, [254, 354, 372], [], 69)], 0, E236S179.L10),
([(2, true, false, [254, 354, 372], [], 71)], 0, E236S179.L11),
([(2, true, false, [254, 354, 372], [], 73)], 0, E236S179.L12),
([(2, true, false, [254, 354, 372], [], 78)], 0, E236S179.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E236S179
