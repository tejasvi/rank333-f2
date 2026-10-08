module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S395 "data/lean/94199ce07e02f1716417aa5b6a2bf4b3/E236S395.bin"
namespace E236S395
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394, 412], [], 22)], 0, E236S395.L1),
([(0, true, false, [354, 372, 394, 412], [], 24)], 0, E236S395.L2),
([(0, true, false, [354, 372, 394, 412], [], 27)], 0, E236S395.L3),
([(0, true, false, [354, 372, 394, 412], [], 30)], 0, E236S395.L4),
([(0, true, false, [354, 372, 394, 412], [], 32)], 0, E236S395.L5),
([(0, true, false, [354, 372, 394, 412], [], 34)], 0, E236S395.L6),
([(0, true, false, [354, 372, 394, 412], [], 44)], 0, E236S395.L7),
([(0, true, false, [354, 372, 394, 412], [], 73)], 0, E236S395.L8),
([(0, true, false, [354, 372, 394, 412], [], 97)], 0, E236S395.L9),
([(0, true, false, [354, 372, 394, 412], [], 127)], 0, E236S395.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S395
