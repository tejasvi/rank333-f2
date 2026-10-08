module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S147 "data/lean/74816b2ada3ef98407fbd763c3ada763/E284S147.bin"
namespace E284S147
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [116, 266, 426, 94], [], 5)], 0, E284S147.L1),
([(3, true, false, [116, 266, 426, 94], [], 6)], 0, E284S147.L2),
([(3, true, false, [116, 266, 426, 94], [], 8)], 0, E284S147.L3),
([(3, true, false, [116, 266, 426, 94], [], 9)], 0, E284S147.L4),
([(3, true, false, [116, 266, 426, 94], [], 15)], 0, E284S147.L5),
([(3, true, false, [116, 266, 426, 94], [], 16)], 0, E284S147.L6),
([(3, true, false, [116, 266, 426, 94], [], 20)], 0, E284S147.L7),
([(3, true, false, [116, 266, 426, 94], [], 21)], 0, E284S147.L8),
([(3, true, false, [116, 266, 426, 94], [], 22)], 0, E284S147.L9),
([(3, true, false, [116, 266, 426, 94], [], 74)], 0, E284S147.L10),
([(3, true, false, [116, 266, 426, 94], [], 77)], 0, E284S147.L11),
([(3, true, false, [116, 266, 426, 94], [], 125)], 0, E284S147.L12),
([(3, true, false, [116, 266, 426, 94], [], 128)], 0, E284S147.L13),
([(3, true, false, [116, 266, 426, 94], [], 145)], 0, E284S147.L14),
([(3, true, false, [116, 266, 426, 94], [], 147)], 0, E284S147.L15),
([(3, true, false, [116, 266, 426, 94], [], 207)], 0, E284S147.L16),
([(3, true, false, [116, 266, 426, 94], [], 208)], 0, E284S147.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E284S147
