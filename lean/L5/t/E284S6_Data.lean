module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S6 "data/lean/6491bcf7029e8960386d0c65f88f3f4f/E284S6.bin"
namespace E284S6
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [84], [10, 510], 0)], 0, E284S6.L1),
([(9, true, false, [84], [10, 510], 1)], 0, E284S6.L2),
([(9, true, false, [84], [10, 510], 2)], 0, E284S6.L3),
([(9, true, false, [84], [10, 510], 5)], 0, E284S6.L4),
([(9, true, false, [84], [10, 510], 8)], 0, E284S6.L5),
([(9, true, false, [84], [10, 510], 9)], 0, E284S6.L6),
([(9, true, false, [84], [10, 510], 12)], 0, E284S6.L7),
([(9, true, false, [84], [10, 510], 14)], 0, E284S6.L8),
([(9, true, false, [84], [10, 510], 15)], 0, E284S6.L9),
([(9, true, false, [84], [10, 510], 20)], 0, E284S6.L10),
([(9, true, false, [84], [10, 510], 33)], 0, E284S6.L11),
([(9, true, false, [84], [10, 510], 49)], 0, E284S6.L12),
([(9, true, false, [84], [10, 510], 51)], 0, E284S6.L13),
([(9, true, false, [84], [10, 510], 53)], 0, E284S6.L14),
([(9, true, false, [84], [10, 510], 54)], 0, E284S6.L15),
([(9, true, false, [84], [10, 510], 56)], 0, E284S6.L16),
([(9, true, false, [84], [10, 510], 58)], 0, E284S6.L17),
([(9, true, false, [84], [10, 510], 59)], 0, E284S6.L18),
([(9, true, false, [84], [10, 510], 69)], 0, E284S6.L19),
([(9, true, false, [84], [10, 510], 72)], 0, E284S6.L20),
([(9, true, false, [84], [10, 510], 73)], 0, E284S6.L21),
([(9, true, false, [84], [10, 510], 104)], 0, E284S6.L22),
([(9, true, false, [84], [10, 510], 115)], 0, E284S6.L23),
([(9, true, false, [84], [10, 510], 124)], 0, E284S6.L24),
([(9, true, false, [84], [10, 510], 125)], 0, E284S6.L25),
([(9, true, false, [84], [10, 510], 127)], 0, E284S6.L26),
([(9, true, false, [84], [10, 510], 131)], 0, E284S6.L27),
([(9, true, false, [84], [10, 510], 133)], 0, E284S6.L28),
([(9, true, false, [84], [10, 510], 146)], 0, E284S6.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E284S6
