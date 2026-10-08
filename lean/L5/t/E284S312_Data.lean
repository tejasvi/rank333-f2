module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S312 "data/lean/3b217e4ce42864e51f73936351499fbf/E284S312.bin"
namespace E284S312
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 298, 340, 372], [], 23)], 0, E284S312.L1),
([(3, true, false, [266, 298, 340, 372], [], 25)], 0, E284S312.L2),
([(3, true, false, [266, 298, 340, 372], [], 33)], 0, E284S312.L3),
([(3, true, false, [266, 298, 340, 372], [], 41)], 0, E284S312.L4),
([(3, true, false, [266, 298, 340, 372], [], 54)], 0, E284S312.L5),
([(3, true, false, [266, 298, 340, 372], [], 55)], 0, E284S312.L6),
([(3, true, false, [266, 298, 340, 372], [], 56)], 0, E284S312.L7),
([(3, true, false, [266, 298, 340, 372], [], 57)], 0, E284S312.L8),
([(3, true, false, [266, 298, 340, 372], [], 58)], 0, E284S312.L9),
([(3, true, false, [266, 298, 340, 372], [], 59)], 0, E284S312.L10),
([(3, true, false, [266, 298, 340, 372], [], 60)], 0, E284S312.L11),
([(3, true, false, [266, 298, 340, 372], [], 61)], 0, E284S312.L12),
([(3, true, false, [266, 298, 340, 372], [], 62)], 0, E284S312.L13),
([(3, true, false, [266, 298, 340, 372], [], 63)], 0, E284S312.L14),
([(3, true, false, [266, 298, 340, 372], [], 64)], 0, E284S312.L15),
([(3, true, false, [266, 298, 340, 372], [], 66)], 0, E284S312.L16),
([(3, true, false, [266, 298, 340, 372], [], 69)], 0, E284S312.L17),
([(3, true, false, [266, 298, 340, 372], [], 71)], 0, E284S312.L18),
([(3, true, false, [266, 298, 340, 372], [], 74)], 0, E284S312.L19),
([(3, true, false, [266, 298, 340, 372], [], 85)], 0, E284S312.L20),
([(3, true, false, [266, 298, 340, 372], [], 87)], 0, E284S312.L21),
([(3, true, false, [266, 298, 340, 372], [], 92)], 0, E284S312.L22),
([(3, true, false, [266, 298, 340, 372], [], 111)], 0, E284S312.L23),
([(3, true, false, [266, 298, 340, 372], [], 128)], 0, E284S312.L24),
([(3, true, false, [266, 298, 340, 372], [], 139)], 0, E284S312.L25),
([(3, true, false, [266, 298, 340, 372], [], 145)], 0, E284S312.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E284S312
