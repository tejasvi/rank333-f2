module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S341 "data/lean/ac018dc6cc9e4b5a6538c7ea6cfa9556/E236S341.bin"
namespace E236S341
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 354, 372], [], 0)], 0, E236S341.L1),
([(2, true, false, [254, 354, 372], [], 1)], 0, E236S341.L2),
([(2, true, false, [254, 354, 372], [], 2)], 0, E236S341.L3),
([(2, true, false, [254, 354, 372], [], 3)], 0, E236S341.L4),
([(2, true, false, [254, 354, 372], [], 4)], 0, E236S341.L5),
([(2, true, false, [254, 354, 372], [], 30)], 0, E236S341.L6),
([(2, true, false, [254, 354, 372], [], 31)], 0, E236S341.L7),
([(2, true, false, [254, 354, 372], [], 32)], 0, E236S341.L8),
([(2, true, false, [254, 354, 372], [], 33)], 0, E236S341.L9),
([(2, true, false, [254, 354, 372], [], 34)], 0, E236S341.L10),
([(2, true, false, [254, 354, 372], [], 67)], 0, E236S341.L11),
([(2, true, false, [254, 354, 372], [], 68)], 0, E236S341.L12),
([(2, true, false, [254, 354, 372], [], 69)], 0, E236S341.L13),
([(2, true, false, [254, 354, 372], [], 70)], 0, E236S341.L14),
([(2, true, false, [254, 354, 372], [], 71)], 0, E236S341.L15),
([(2, true, false, [254, 354, 372], [], 72)], 0, E236S341.L16),
([(2, true, false, [254, 354, 372], [], 73)], 0, E236S341.L17),
([(2, true, false, [254, 354, 372], [], 74)], 0, E236S341.L18),
([(2, true, false, [254, 354, 372], [], 75)], 0, E236S341.L19),
([(2, true, false, [254, 354, 372], [], 76)], 0, E236S341.L20),
([(2, true, false, [254, 354, 372], [], 77)], 0, E236S341.L21),
([(2, true, false, [254, 354, 372], [], 78)], 0, E236S341.L22),
([(2, true, false, [254, 354, 372], [], 79)], 0, E236S341.L23),
([(2, true, false, [254, 354, 372], [], 80)], 0, E236S341.L24),
([(2, true, false, [254, 354, 372], [], 81)], 0, E236S341.L25),
([(2, true, false, [254, 354, 372], [], 82)], 0, E236S341.L26),
([(2, true, false, [254, 354, 372], [], 83)], 0, E236S341.L27),
([(2, true, false, [254, 354, 372], [], 84)], 0, E236S341.L28),
([(2, true, false, [254, 354, 372], [], 85)], 0, E236S341.L29),
([(2, true, false, [254, 354, 372], [], 86)], 0, E236S341.L30),
([(2, true, false, [254, 354, 372], [], 89)], 0, E236S341.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S341
