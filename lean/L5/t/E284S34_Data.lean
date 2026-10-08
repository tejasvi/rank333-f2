module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S34 "data/lean/0517159beba29c867a4c53241bb1e548/E284S34.bin"
namespace E284S34
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 394, 426, 468], [], 0)], 0, E284S34.L1),
([(8, true, false, [254, 394, 426, 468], [], 1)], 0, E284S34.L2),
([(8, true, false, [254, 394, 426, 468], [], 2)], 0, E284S34.L3),
([(8, true, false, [254, 394, 426, 468], [], 3)], 0, E284S34.L4),
([(8, true, false, [254, 394, 426, 468], [], 4)], 0, E284S34.L5),
([(8, true, false, [254, 394, 426, 468], [], 6)], 0, E284S34.L6),
([(8, true, false, [254, 394, 426, 468], [], 76)], 0, E284S34.L7),
([(8, true, false, [254, 394, 426, 468], [], 77)], 0, E284S34.L8),
([(8, true, false, [254, 394, 426, 468], [], 78)], 0, E284S34.L9),
([(8, true, false, [254, 394, 426, 468], [], 80)], 0, E284S34.L10),
([(8, true, false, [254, 394, 426, 468], [], 81)], 0, E284S34.L11),
([(8, true, false, [254, 394, 426, 468], [], 82)], 0, E284S34.L12),
([(8, true, false, [254, 394, 426, 468], [], 86)], 0, E284S34.L13),
([(8, true, false, [254, 394, 426, 468], [], 89)], 0, E284S34.L14),
([(8, true, false, [254, 394, 426, 468], [], 91)], 0, E284S34.L15),
([(8, true, false, [254, 394, 426, 468], [], 92)], 0, E284S34.L16),
([(8, true, false, [254, 394, 426, 468], [], 93)], 0, E284S34.L17),
([(8, true, false, [254, 394, 426, 468], [], 94)], 0, E284S34.L18),
([(8, true, false, [254, 394, 426, 468], [], 105)], 0, E284S34.L19),
([(8, true, false, [254, 394, 426, 468], [], 106)], 0, E284S34.L20),
([(8, true, false, [254, 394, 426, 468], [], 109)], 0, E284S34.L21),
([(8, true, false, [254, 394, 426, 468], [], 113)], 0, E284S34.L22),
([(8, true, false, [254, 394, 426, 468], [], 114)], 0, E284S34.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E284S34
