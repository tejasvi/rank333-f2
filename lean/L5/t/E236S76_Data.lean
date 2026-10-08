module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S76 "data/lean/fc52f834b30d116330c856e606258304/E236S76.bin"
namespace E236S76
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [372, 394, 412], [], 0)], 0, E236S76.L1),
([(7, true, false, [372, 394, 412], [], 3)], 0, E236S76.L2),
([(7, true, false, [372, 394, 412], [], 30)], 0, E236S76.L3),
([(7, true, false, [372, 394, 412], [], 31)], 0, E236S76.L4),
([(7, true, false, [372, 394, 412], [], 36)], 0, E236S76.L5),
([(7, true, false, [372, 394, 412], [], 67)], 0, E236S76.L6),
([(7, true, false, [372, 394, 412], [], 77)], 0, E236S76.L7),
([(7, true, false, [372, 394, 412], [], 80)], 0, E236S76.L8),
([(7, true, false, [372, 394, 412], [], 109)], 0, E236S76.L9),
([(7, true, false, [372, 394, 412], [], 131)], 0, E236S76.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S76
