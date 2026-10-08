module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S308 "data/lean/544e8fc623c78db1c5d55e84196c83bf/E284S308.bin"
namespace E284S308
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116, 394, 426], [], 5)], 0, E284S308.L1),
([(2, true, false, [84, 116, 394, 426], [], 10)], 0, E284S308.L2),
([(2, true, false, [84, 116, 394, 426], [], 22)], 0, E284S308.L3),
([(2, true, false, [84, 116, 394, 426], [], 23)], 0, E284S308.L4),
([(2, true, false, [84, 116, 394, 426], [], 59)], 0, E284S308.L5),
([(2, true, false, [84, 116, 394, 426], [], 65)], 0, E284S308.L6),
([(2, true, false, [84, 116, 394, 426], [], 78)], 0, E284S308.L7),
([(2, true, false, [84, 116, 394, 426], [], 79)], 0, E284S308.L8),
([(2, true, false, [84, 116, 394, 426], [], 112)], 0, E284S308.L9),
([(2, true, false, [84, 116, 394, 426], [], 113)], 0, E284S308.L10),
([(2, true, false, [84, 116, 394, 426], [], 126)], 0, E284S308.L11),
([(2, true, false, [84, 116, 394, 426], [], 148)], 0, E284S308.L12),
([(2, true, false, [84, 116, 394, 426], [], 149)], 0, E284S308.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E284S308
