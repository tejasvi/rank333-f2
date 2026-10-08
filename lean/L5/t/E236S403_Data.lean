module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S403 "data/lean/0359372cce20ab6b5042dde477d4143e/E236S403.bin"
namespace E236S403
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 372, 394], [96], 5)], 0, E236S403.L1),
([(0, true, false, [158, 372, 394], [96], 6)], 0, E236S403.L2),
([(0, true, false, [158, 372, 394], [96], 7)], 0, E236S403.L3),
([(0, true, false, [158, 372, 394], [96], 47)], 0, E236S403.L4),
([(0, true, false, [158, 372, 394], [96], 53)], 0, E236S403.L5),
([(0, true, false, [158, 372, 394], [96], 63)], 0, E236S403.L6),
([(0, true, false, [158, 372, 394], [96], 68)], 0, E236S403.L7),
([(0, true, false, [158, 372, 394], [96], 70)], 0, E236S403.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S403
