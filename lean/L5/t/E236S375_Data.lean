module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S375 "data/lean/2febebc9e85a911121b398427339ac5b/E236S375.bin"
namespace E236S375
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394, 412], [], 27)], 0, E236S375.L1),
([(0, true, false, [354, 372, 394, 412], [], 34)], 0, E236S375.L2),
([(0, true, false, [354, 372, 394, 412], [], 73)], 0, E236S375.L3),
([(0, true, false, [354, 372, 394, 412], [], 97)], 0, E236S375.L4),
([(0, true, false, [354, 372, 394, 412], [], 127)], 0, E236S375.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S375
