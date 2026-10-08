module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S391 "data/lean/6556dbb9bbf6d8011f4d7a86477de65c/E236S391.bin"
namespace E236S391
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [354, 372, 158], [], 74)], 0, E236S391.L1),
([(12, true, false, [354, 372, 158], [], 84)], 0, E236S391.L2),
([(12, true, false, [354, 372, 158], [], 86)], 0, E236S391.L3),
([(12, true, false, [354, 372, 158], [], 87)], 0, E236S391.L4),
([(12, true, false, [354, 372, 158], [], 90)], 0, E236S391.L5),
([(12, true, false, [354, 372, 158], [], 91)], 0, E236S391.L6),
([(12, true, false, [354, 372, 158], [], 117)], 0, E236S391.L7),
([(12, true, false, [354, 372, 158], [], 153)], 0, E236S391.L8),
([(12, true, false, [354, 372, 158], [], 163)], 0, E236S391.L9),
([(12, true, false, [354, 372, 158], [], 166)], 0, E236S391.L10),
([(12, true, false, [354, 372, 158], [], 173)], 0, E236S391.L11),
([(12, true, false, [354, 372, 158], [], 229)], 0, E236S391.L12),
([(12, true, false, [354, 372, 158], [], 262)], 0, E236S391.L13),
([(12, true, false, [354, 372, 158], [], 316)], 0, E236S391.L14),
([(12, true, false, [354, 372, 158], [], 317)], 0, E236S391.L15),
([(12, true, false, [354, 372, 158], [], 354)], 0, E236S391.L16),
([(12, true, false, [354, 372, 158], [], 366)], 0, E236S391.L17),
([(12, true, false, [354, 372, 158], [], 413)], 0, E236S391.L18),
([(12, true, false, [354, 372, 158], [], 497)], 0, E236S391.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E236S391
