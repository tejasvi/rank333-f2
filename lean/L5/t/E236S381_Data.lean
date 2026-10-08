module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S381 "data/lean/84d616ac5f8606b8b68d285edd246ae3/E236S381.bin"
namespace E236S381
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 394, 412], [], 40)], 0, E236S381.L1),
([(0, true, false, [372, 394, 412], [], 49)], 0, E236S381.L2),
([(0, true, false, [372, 394, 412], [], 67)], 0, E236S381.L3),
([(0, true, false, [372, 394, 412], [], 71)], 0, E236S381.L4),
([(0, true, false, [372, 394, 412], [], 77)], 0, E236S381.L5),
([(0, true, false, [372, 394, 412], [], 79)], 0, E236S381.L6),
([(0, true, false, [372, 394, 412], [], 82)], 0, E236S381.L7),
([(0, true, false, [372, 394, 412], [], 84)], 0, E236S381.L8),
([(0, true, false, [372, 394, 412], [], 101)], 0, E236S381.L9),
([(0, true, false, [372, 394, 412], [], 130)], 0, E236S381.L10),
([(0, true, false, [372, 394, 412], [], 176)], 0, E236S381.L11),
([(0, true, false, [372, 394, 412], [], 232)], 0, E236S381.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E236S381
