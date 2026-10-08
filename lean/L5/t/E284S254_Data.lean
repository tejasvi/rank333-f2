module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S254 "data/lean/d5ff05a484f6026df65ce67004c46724/E284S254.bin"
namespace E284S254
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [84, 94, 372, 382], [], 0)], 0, E284S254.L1),
([(0, true, false, [84, 94, 372, 382], [], 1)], 0, E284S254.L2),
([(0, true, false, [84, 94, 372, 382], [], 2)], 0, E284S254.L3),
([(0, true, false, [84, 94, 372, 382], [], 5)], 0, E284S254.L4),
([(0, true, false, [84, 94, 372, 382], [], 7)], 0, E284S254.L5),
([(0, true, false, [84, 94, 372, 382], [], 18)], 0, E284S254.L6),
([(0, true, false, [84, 94, 372, 382], [], 29)], 0, E284S254.L7),
([(0, true, false, [84, 94, 372, 382], [], 30)], 0, E284S254.L8),
([(0, true, false, [84, 94, 372, 382], [], 31)], 0, E284S254.L9),
([(0, true, false, [84, 94, 372, 382], [], 36)], 0, E284S254.L10),
([(0, true, false, [84, 94, 372, 382], [], 39)], 0, E284S254.L11),
([(0, true, false, [84, 94, 372, 382], [], 40)], 0, E284S254.L12),
([(0, true, false, [84, 94, 372, 382], [], 41)], 0, E284S254.L13),
([(0, true, false, [84, 94, 372, 382], [], 46)], 0, E284S254.L14),
([(0, true, false, [84, 94, 372, 382], [], 47)], 0, E284S254.L15),
([(0, true, false, [84, 94, 372, 382], [], 54)], 0, E284S254.L16),
([(0, true, false, [84, 94, 372, 382], [], 70)], 0, E284S254.L17),
([(0, true, false, [84, 94, 372, 382], [], 71)], 0, E284S254.L18),
([(0, true, false, [84, 94, 372, 382], [], 72)], 0, E284S254.L19),
([(0, true, false, [84, 94, 372, 382], [], 73)], 0, E284S254.L20),
([(0, true, false, [84, 94, 372, 382], [], 76)], 0, E284S254.L21),
([(0, true, false, [84, 94, 372, 382], [], 77)], 0, E284S254.L22),
([(0, true, false, [84, 94, 372, 382], [], 78)], 0, E284S254.L23),
([(0, true, false, [84, 94, 372, 382], [], 89)], 0, E284S254.L24),
([(0, true, false, [84, 94, 372, 382], [], 91)], 0, E284S254.L25),
([(0, true, false, [84, 94, 372, 382], [], 92)], 0, E284S254.L26),
([(0, true, false, [84, 94, 372, 382], [], 104)], 0, E284S254.L27),
([(0, true, false, [84, 94, 372, 382], [], 105)], 0, E284S254.L28),
([(0, true, false, [84, 94, 372, 382], [], 138)], 0, E284S254.L29),
([(0, true, false, [84, 94, 372, 382], [], 139)], 0, E284S254.L30),
([(0, true, false, [84, 94, 372, 382], [], 162)], 0, E284S254.L31),
([(0, true, false, [84, 94, 372, 382], [], 163)], 0, E284S254.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E284S254
