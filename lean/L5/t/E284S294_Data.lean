module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S294 "data/lean/259883895541c417d8072f604d8be05d/E284S294.bin"
namespace E284S294
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 212, 382, 266], [], 0)], 0, E284S294.L1),
([(0, true, false, [84, 94, 212, 382, 266], [], 3)], 0, E284S294.L2),
([(0, true, false, [84, 94, 212, 382, 266], [], 12)], 0, E284S294.L3),
([(0, true, false, [84, 94, 212, 382, 266], [], 29)], 0, E284S294.L4),
([(0, true, false, [84, 94, 212, 382, 266], [], 30)], 0, E284S294.L5),
([(0, true, false, [84, 94, 212, 382, 266], [], 31)], 0, E284S294.L6),
([(0, true, false, [84, 94, 212, 382, 266], [], 34)], 0, E284S294.L7),
([(0, true, false, [84, 94, 212, 382, 266], [], 35)], 0, E284S294.L8),
([(0, true, false, [84, 94, 212, 382, 266], [], 37)], 0, E284S294.L9),
([(0, true, false, [84, 94, 212, 382, 266], [], 39)], 0, E284S294.L10),
([(0, true, false, [84, 94, 212, 382, 266], [], 53)], 0, E284S294.L11),
([(0, true, false, [84, 94, 212, 382, 266], [], 54)], 0, E284S294.L12),
([(0, true, false, [84, 94, 212, 382, 266], [], 55)], 0, E284S294.L13),
([(0, true, false, [84, 94, 212, 382, 266], [], 57)], 0, E284S294.L14),
([(0, true, false, [84, 94, 212, 382, 266], [], 58)], 0, E284S294.L15),
([(0, true, false, [84, 94, 212, 382, 266], [], 59)], 0, E284S294.L16),
([(0, true, false, [84, 94, 212, 382, 266], [], 60)], 0, E284S294.L17),
([(0, true, false, [84, 94, 212, 382, 266], [], 61)], 0, E284S294.L18),
([(0, true, false, [84, 94, 212, 382, 266], [], 62)], 0, E284S294.L19),
([(0, true, false, [84, 94, 212, 382, 266], [], 63)], 0, E284S294.L20),
([(0, true, false, [84, 94, 212, 382, 266], [], 73)], 0, E284S294.L21),
([(0, true, false, [84, 94, 212, 382, 266], [], 77)], 0, E284S294.L22),
([(0, true, false, [84, 94, 212, 382, 266], [], 78)], 0, E284S294.L23),
([(0, true, false, [84, 94, 212, 382, 266], [], 85)], 0, E284S294.L24),
([(0, true, false, [84, 94, 212, 382, 266], [], 86)], 0, E284S294.L25),
([(0, true, false, [84, 94, 212, 382, 266], [], 87)], 0, E284S294.L26),
([(0, true, false, [84, 94, 212, 382, 266], [], 88)], 0, E284S294.L27),
([(0, true, false, [84, 94, 212, 382, 266], [], 93)], 0, E284S294.L28),
([(0, true, false, [84, 94, 212, 382, 266], [], 112)], 0, E284S294.L29),
([(0, true, false, [84, 94, 212, 382, 266], [], 113)], 0, E284S294.L30),
([(0, true, false, [84, 94, 212, 382, 266], [], 133)], 0, E284S294.L31),
([(0, true, false, [84, 94, 212, 382, 266], [], 143)], 0, E284S294.L32),
([(0, true, false, [84, 94, 212, 382, 266], [], 157)], 0, E284S294.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E284S294
