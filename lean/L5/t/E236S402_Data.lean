module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S402 "data/lean/a864e0f86ac9ae3b14ec44d8b0a7ef5a/E236S402.bin"
namespace E236S402
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [158, 354, 412], [232], 4)], 0, E236S402.L1),
([(1, true, false, [158, 354, 412], [232], 24)], 0, E236S402.L2),
([(1, true, false, [158, 354, 412], [232], 28)], 0, E236S402.L3),
([(1, true, false, [158, 354, 412], [232], 35)], 0, E236S402.L4),
([(1, true, false, [158, 354, 412], [232], 36)], 0, E236S402.L5),
([(1, true, false, [158, 354, 412], [232], 63)], 0, E236S402.L6),
([(1, true, false, [158, 354, 412], [232], 65)], 0, E236S402.L7),
([(1, true, false, [158, 354, 412], [232], 79)], 0, E236S402.L8),
([(1, true, false, [158, 354, 412], [232], 90)], 0, E236S402.L9),
([(1, true, false, [158, 354, 412], [232], 106)], 0, E236S402.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S402
