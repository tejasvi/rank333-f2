module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S47 "data/lean/d9e0492219ee84ec3e72e4cf443c14b9/E237S47.bin"
namespace E237S47
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [234, 354, 412, 116], [], 0)], 0, E237S47.L1),
([(9, true, false, [234, 354, 412, 116], [], 2)], 0, E237S47.L2),
([(9, true, false, [234, 354, 412, 116], [], 24)], 0, E237S47.L3),
([(9, true, false, [234, 354, 412, 116], [], 25)], 0, E237S47.L4),
([(9, true, false, [234, 354, 412, 116], [], 36)], 0, E237S47.L5),
([(9, true, false, [234, 354, 412, 116], [], 44)], 0, E237S47.L6),
([(9, true, false, [234, 354, 412, 116], [], 45)], 0, E237S47.L7),
([(9, true, false, [234, 354, 412, 116], [], 51)], 0, E237S47.L8),
([(9, true, false, [234, 354, 412, 116], [], 53)], 0, E237S47.L9),
([(9, true, false, [234, 354, 412, 116], [], 65)], 0, E237S47.L10),
([(9, true, false, [234, 354, 412, 116], [], 75)], 0, E237S47.L11),
([(9, true, false, [234, 354, 412, 116], [], 78)], 0, E237S47.L12),
([(9, true, false, [234, 354, 412, 116], [], 88)], 0, E237S47.L13),
([(9, true, false, [234, 354, 412, 116], [], 90)], 0, E237S47.L14),
([(9, true, false, [234, 354, 412, 116], [], 99)], 0, E237S47.L15),
([(9, true, false, [234, 354, 412, 116], [], 101)], 0, E237S47.L16),
([(9, true, false, [234, 354, 412, 116], [], 112)], 0, E237S47.L17),
([(9, true, false, [234, 354, 412, 116], [], 114)], 0, E237S47.L18),
([(9, true, false, [234, 354, 412, 116], [], 136)], 0, E237S47.L19),
([(9, true, false, [234, 354, 412, 116], [], 138)], 0, E237S47.L20),
([(9, true, false, [234, 354, 412, 116], [], 146)], 0, E237S47.L21),
([(9, true, false, [234, 354, 412, 116], [], 158)], 0, E237S47.L22),
([(9, true, false, [234, 354, 412, 116], [], 162)], 0, E237S47.L23),
([(9, true, false, [234, 354, 412, 116], [], 172)], 0, E237S47.L24),
([(9, true, false, [234, 354, 412, 116], [], 204)], 0, E237S47.L25),
([(9, true, false, [234, 354, 412, 116], [], 206)], 0, E237S47.L26),
([(9, true, false, [234, 354, 412, 116], [], 216)], 0, E237S47.L27),
([(9, true, false, [234, 354, 412, 116], [], 218)], 0, E237S47.L28),
([(9, true, false, [234, 354, 412, 116], [], 232)], 0, E237S47.L29),
([(9, true, false, [234, 354, 412, 116], [], 234)], 0, E237S47.L30),
([(9, true, false, [234, 354, 412, 116], [], 254)], 0, E237S47.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E237S47
