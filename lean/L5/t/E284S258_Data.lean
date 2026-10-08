module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S258 "data/lean/cca5b24c0472f38692921294960be3fa/E284S258.bin"
namespace E284S258
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 468, 478], [], 0)], 0, E284S258.L1),
([(0, true, false, [84, 94, 468, 478], [], 1)], 0, E284S258.L2),
([(0, true, false, [84, 94, 468, 478], [], 2)], 0, E284S258.L3),
([(0, true, false, [84, 94, 468, 478], [], 3)], 0, E284S258.L4),
([(0, true, false, [84, 94, 468, 478], [], 4)], 0, E284S258.L5),
([(0, true, false, [84, 94, 468, 478], [], 5)], 0, E284S258.L6),
([(0, true, false, [84, 94, 468, 478], [], 7)], 0, E284S258.L7),
([(0, true, false, [84, 94, 468, 478], [], 39)], 0, E284S258.L8),
([(0, true, false, [84, 94, 468, 478], [], 40)], 0, E284S258.L9),
([(0, true, false, [84, 94, 468, 478], [], 41)], 0, E284S258.L10),
([(0, true, false, [84, 94, 468, 478], [], 42)], 0, E284S258.L11),
([(0, true, false, [84, 94, 468, 478], [], 43)], 0, E284S258.L12),
([(0, true, false, [84, 94, 468, 478], [], 45)], 0, E284S258.L13),
([(0, true, false, [84, 94, 468, 478], [], 47)], 0, E284S258.L14),
([(0, true, false, [84, 94, 468, 478], [], 48)], 0, E284S258.L15),
([(0, true, false, [84, 94, 468, 478], [], 49)], 0, E284S258.L16),
([(0, true, false, [84, 94, 468, 478], [], 51)], 0, E284S258.L17),
([(0, true, false, [84, 94, 468, 478], [], 52)], 0, E284S258.L18),
([(0, true, false, [84, 94, 468, 478], [], 53)], 0, E284S258.L19),
([(0, true, false, [84, 94, 468, 478], [], 55)], 0, E284S258.L20),
([(0, true, false, [84, 94, 468, 478], [], 56)], 0, E284S258.L21),
([(0, true, false, [84, 94, 468, 478], [], 57)], 0, E284S258.L22),
([(0, true, false, [84, 94, 468, 478], [], 63)], 0, E284S258.L23),
([(0, true, false, [84, 94, 468, 478], [], 64)], 0, E284S258.L24),
([(0, true, false, [84, 94, 468, 478], [], 70)], 0, E284S258.L25),
([(0, true, false, [84, 94, 468, 478], [], 72)], 0, E284S258.L26),
([(0, true, false, [84, 94, 468, 478], [], 73)], 0, E284S258.L27),
([(0, true, false, [84, 94, 468, 478], [], 75)], 0, E284S258.L28),
([(0, true, false, [84, 94, 468, 478], [], 76)], 0, E284S258.L29),
([(0, true, false, [84, 94, 468, 478], [], 77)], 0, E284S258.L30),
([(0, true, false, [84, 94, 468, 478], [], 81)], 0, E284S258.L31),
([(0, true, false, [84, 94, 468, 478], [], 89)], 0, E284S258.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E284S258
