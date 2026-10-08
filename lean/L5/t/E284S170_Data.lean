module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S170 "data/lean/aa71b2e3cca7b189bf87aa00be37fe35/E284S170.bin"
namespace E284S170
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [254, 478], [], 10)], 0, E284S170.L1),
([(6, true, false, [254, 478], [], 11)], 0, E284S170.L2),
([(6, true, false, [254, 478], [], 12)], 0, E284S170.L3),
([(6, true, false, [254, 478], [], 13)], 0, E284S170.L4),
([(6, true, false, [254, 478], [], 14)], 0, E284S170.L5),
([(6, true, false, [254, 478], [], 15)], 0, E284S170.L6),
([(6, true, false, [254, 478], [], 16)], 0, E284S170.L7),
([(6, true, false, [254, 478], [], 17)], 0, E284S170.L8),
([(6, true, false, [254, 478], [], 18)], 0, E284S170.L9),
([(6, true, false, [254, 478], [], 19)], 0, E284S170.L10),
([(6, true, false, [254, 478], [], 20)], 0, E284S170.L11),
([(6, true, false, [254, 478], [], 21)], 0, E284S170.L12),
([(6, true, false, [254, 478], [], 22)], 0, E284S170.L13),
([(6, true, false, [254, 478], [], 23)], 0, E284S170.L14),
([(6, true, false, [254, 478], [], 24)], 0, E284S170.L15),
([(6, true, false, [254, 478], [], 25)], 0, E284S170.L16),
([(6, true, false, [254, 478], [], 26)], 0, E284S170.L17),
([(6, true, false, [254, 478], [], 27)], 0, E284S170.L18),
([(6, true, false, [254, 478], [], 28)], 0, E284S170.L19),
([(6, true, false, [254, 478], [], 29)], 0, E284S170.L20),
([(6, true, false, [254, 478], [], 42)], 0, E284S170.L21),
([(6, true, false, [254, 478], [], 90)], 0, E284S170.L22),
([(6, true, false, [254, 478], [], 120)], 0, E284S170.L23),
([(6, true, false, [254, 478], [], 246)], 0, E284S170.L24),
([(6, true, false, [254, 478], [], 260)], 0, E284S170.L25),
([(6, true, false, [254, 478], [], 340)], 0, E284S170.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E284S170
