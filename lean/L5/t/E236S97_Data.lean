module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S97 "data/lean/402ec9f31f23e501968dc1fadf3dce88/E236S97.bin"
namespace E236S97
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 394, 412], [], 0)], 0, E236S97.L1),
([(0, true, false, [354, 394, 412], [], 44)], 0, E236S97.L2),
([(0, true, false, [354, 394, 412], [], 49)], 0, E236S97.L3),
([(0, true, false, [354, 394, 412], [], 58)], 0, E236S97.L4),
([(0, true, false, [354, 394, 412], [], 77)], 0, E236S97.L5),
([(0, true, false, [354, 394, 412], [], 134)], 0, E236S97.L6),
([(0, true, false, [354, 394, 412], [], 176)], 0, E236S97.L7),
([(0, true, false, [354, 394, 412], [], 232)], 0, E236S97.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S97
