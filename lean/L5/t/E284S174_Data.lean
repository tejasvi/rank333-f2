module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S174 "data/lean/1af0c8e30b299257c033756ddc3d1c19/E284S174.bin"
namespace E284S174
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [254, 372, 84, 478], [], 10)], 0, E284S174.L1),
([(9, true, false, [254, 372, 84, 478], [], 11)], 0, E284S174.L2),
([(9, true, false, [254, 372, 84, 478], [], 13)], 0, E284S174.L3),
([(9, true, false, [254, 372, 84, 478], [], 15)], 0, E284S174.L4),
([(9, true, false, [254, 372, 84, 478], [], 31)], 0, E284S174.L5),
([(9, true, false, [254, 372, 84, 478], [], 84)], 0, E284S174.L6),
([(9, true, false, [254, 372, 84, 478], [], 85)], 0, E284S174.L7),
([(9, true, false, [254, 372, 84, 478], [], 88)], 0, E284S174.L8),
([(9, true, false, [254, 372, 84, 478], [], 89)], 0, E284S174.L9),
([(9, true, false, [254, 372, 84, 478], [], 148)], 0, E284S174.L10),
([(9, true, false, [254, 372, 84, 478], [], 154)], 0, E284S174.L11),
([(9, true, false, [254, 372, 84, 478], [], 162)], 0, E284S174.L12),
([(9, true, false, [254, 372, 84, 478], [], 206)], 0, E284S174.L13),
([(9, true, false, [254, 372, 84, 478], [], 246)], 0, E284S174.L14),
([(9, true, false, [254, 372, 84, 478], [], 247)], 0, E284S174.L15),
([(9, true, false, [254, 372, 84, 478], [], 250)], 0, E284S174.L16),
([(9, true, false, [254, 372, 84, 478], [], 251)], 0, E284S174.L17),
([(9, true, false, [254, 372, 84, 478], [], 274)], 0, E284S174.L18),
([(9, true, false, [254, 372, 84, 478], [], 286)], 0, E284S174.L19),
([(9, true, false, [254, 372, 84, 478], [], 294)], 0, E284S174.L20),
([(9, true, false, [254, 372, 84, 478], [], 414)], 0, E284S174.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E284S174
