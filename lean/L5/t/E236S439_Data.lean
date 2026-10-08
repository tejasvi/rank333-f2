module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S439 "data/lean/265d925502fff4c5e9abd2cfaafbee6f/E236S439.bin"
namespace E236S439
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 412, 394], [], 0)], 0, E236S439.L1),
([(3, true, false, [158, 254, 412, 394], [], 5)], 0, E236S439.L2),
([(3, true, false, [158, 254, 412, 394], [], 8)], 0, E236S439.L3),
([(3, true, false, [158, 254, 412, 394], [], 44)], 0, E236S439.L4),
([(3, true, false, [158, 254, 412, 394], [], 46)], 0, E236S439.L5),
([(3, true, false, [158, 254, 412, 394], [], 69)], 0, E236S439.L6),
([(3, true, false, [158, 254, 412, 394], [], 70)], 0, E236S439.L7),
([(3, true, false, [158, 254, 412, 394], [], 71)], 0, E236S439.L8),
([(3, true, false, [158, 254, 412, 394], [], 72)], 0, E236S439.L9),
([(3, true, false, [158, 254, 412, 394], [], 73)], 0, E236S439.L10),
([(3, true, false, [158, 254, 412, 394], [], 74)], 0, E236S439.L11),
([(3, true, false, [158, 254, 412, 394], [], 75)], 0, E236S439.L12),
([(3, true, false, [158, 254, 412, 394], [], 76)], 0, E236S439.L13),
([(3, true, false, [158, 254, 412, 394], [], 77)], 0, E236S439.L14),
([(3, true, false, [158, 254, 412, 394], [], 78)], 0, E236S439.L15),
([(3, true, false, [158, 254, 412, 394], [], 79)], 0, E236S439.L16),
([(3, true, false, [158, 254, 412, 394], [], 86)], 0, E236S439.L17),
([(3, true, false, [158, 254, 412, 394], [], 87)], 0, E236S439.L18),
([(3, true, false, [158, 254, 412, 394], [], 108)], 0, E236S439.L19),
([(3, true, false, [158, 254, 412, 394], [], 111)], 0, E236S439.L20),
([(3, true, false, [158, 254, 412, 394], [], 112)], 0, E236S439.L21),
([(3, true, false, [158, 254, 412, 394], [], 115)], 0, E236S439.L22),
([(3, true, false, [158, 254, 412, 394], [], 125)], 0, E236S439.L23),
([(3, true, false, [158, 254, 412, 394], [], 126)], 0, E236S439.L24),
([(3, true, false, [158, 254, 412, 394], [], 128)], 0, E236S439.L25),
([(3, true, false, [158, 254, 412, 394], [], 129)], 0, E236S439.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E236S439
