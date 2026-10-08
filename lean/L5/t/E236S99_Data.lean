module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S99 "data/lean/cdcd24e96be034c530b503afbb2d8b1b/E236S99.bin"
namespace E236S99
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [354, 394, 412], [], 5)], 0, E236S99.L1),
([(7, true, false, [354, 394, 412], [], 6)], 0, E236S99.L2),
([(7, true, false, [354, 394, 412], [], 9)], 0, E236S99.L3),
([(7, true, false, [354, 394, 412], [], 10)], 0, E236S99.L4),
([(7, true, false, [354, 394, 412], [], 11)], 0, E236S99.L5),
([(7, true, false, [354, 394, 412], [], 12)], 0, E236S99.L6),
([(7, true, false, [354, 394, 412], [], 44)], 0, E236S99.L7),
([(7, true, false, [354, 394, 412], [], 47)], 0, E236S99.L8),
([(7, true, false, [354, 394, 412], [], 77)], 0, E236S99.L9),
([(7, true, false, [354, 394, 412], [], 87)], 0, E236S99.L10),
([(7, true, false, [354, 394, 412], [], 114)], 0, E236S99.L11),
([(7, true, false, [354, 394, 412], [], 135)], 0, E236S99.L12),
([(7, true, false, [354, 394, 412], [], 156)], 0, E236S99.L13),
([(7, true, false, [354, 394, 412], [], 159)], 0, E236S99.L14),
([(7, true, false, [354, 394, 412], [], 182)], 0, E236S99.L15),
([(7, true, false, [354, 394, 412], [], 206)], 0, E236S99.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E236S99
