module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S199 "data/lean/4a4c65290c8bbb77128c8ef9c5d7ff98/E236S199.bin"
namespace E236S199
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 394, 412], [136], 0)], 0, E236S199.L1),
([(0, true, false, [354, 394, 412], [136], 1)], 0, E236S199.L2),
([(0, true, false, [354, 394, 412], [136], 2)], 0, E236S199.L3),
([(0, true, false, [354, 394, 412], [136], 15)], 0, E236S199.L4),
([(0, true, false, [354, 394, 412], [136], 17)], 0, E236S199.L5),
([(0, true, false, [354, 394, 412], [136], 24)], 0, E236S199.L6),
([(0, true, false, [354, 394, 412], [136], 25)], 0, E236S199.L7),
([(0, true, false, [354, 394, 412], [136], 38)], 0, E236S199.L8),
([(0, true, false, [354, 394, 412], [136], 39)], 0, E236S199.L9),
([(0, true, false, [354, 394, 412], [136], 44)], 0, E236S199.L10),
([(0, true, false, [354, 394, 412], [136], 45)], 0, E236S199.L11),
([(0, true, false, [354, 394, 412], [136], 46)], 0, E236S199.L12),
([(0, true, false, [354, 394, 412], [136], 50)], 0, E236S199.L13),
([(0, true, false, [354, 394, 412], [136], 51)], 0, E236S199.L14),
([(0, true, false, [354, 394, 412], [136], 53)], 0, E236S199.L15),
([(0, true, false, [354, 394, 412], [136], 57)], 0, E236S199.L16),
([(0, true, false, [354, 394, 412], [136], 62)], 0, E236S199.L17),
([(0, true, false, [354, 394, 412], [136], 65)], 0, E236S199.L18),
([(0, true, false, [354, 394, 412], [136], 66)], 0, E236S199.L19),
([(0, true, false, [354, 394, 412], [136], 68)], 0, E236S199.L20),
([(0, true, false, [354, 394, 412], [136], 74)], 0, E236S199.L21),
([(0, true, false, [354, 394, 412], [136], 75)], 0, E236S199.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S199
