module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S329 "data/lean/16f95d9bdecd8e98672e7c539820feef/E236S329.bin"
namespace E236S329
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 254], [258, 276], 1)], 0, E236S329.L1),
([(2, true, false, [158, 254], [258, 276], 2)], 0, E236S329.L2),
([(2, true, false, [158, 254], [258, 276], 5)], 0, E236S329.L3),
([(2, true, false, [158, 254], [258, 276], 13)], 0, E236S329.L4),
([(2, true, false, [158, 254], [258, 276], 16)], 0, E236S329.L5),
([(2, true, false, [158, 254], [258, 276], 23)], 0, E236S329.L6),
([(2, true, false, [158, 254], [258, 276], 25)], 0, E236S329.L7),
([(2, true, false, [158, 254], [258, 276], 27)], 0, E236S329.L8),
([(2, true, false, [158, 254], [258, 276], 28)], 0, E236S329.L9),
([(2, true, false, [158, 254], [258, 276], 29)], 0, E236S329.L10),
([(2, true, false, [158, 254], [258, 276], 30)], 0, E236S329.L11),
([(2, true, false, [158, 254], [258, 276], 31)], 0, E236S329.L12),
([(2, true, false, [158, 254], [258, 276], 33)], 0, E236S329.L13),
([(2, true, false, [158, 254], [258, 276], 35)], 0, E236S329.L14),
([(2, true, false, [158, 254], [258, 276], 36)], 0, E236S329.L15),
([(2, true, false, [158, 254], [258, 276], 38)], 0, E236S329.L16),
([(2, true, false, [158, 254], [258, 276], 39)], 0, E236S329.L17),
([(2, true, false, [158, 254], [258, 276], 40)], 0, E236S329.L18),
([(2, true, false, [158, 254], [258, 276], 41)], 0, E236S329.L19),
([(2, true, false, [158, 254], [258, 276], 42)], 0, E236S329.L20),
([(2, true, false, [158, 254], [258, 276], 46)], 0, E236S329.L21),
([(2, true, false, [158, 254], [258, 276], 50)], 0, E236S329.L22),
([(2, true, false, [158, 254], [258, 276], 53)], 0, E236S329.L23),
([(2, true, false, [158, 254], [258, 276], 57)], 0, E236S329.L24),
([(2, true, false, [158, 254], [258, 276], 59)], 0, E236S329.L25),
([(2, true, false, [158, 254], [258, 276], 74)], 0, E236S329.L26),
([(2, true, false, [158, 254], [258, 276], 77)], 0, E236S329.L27)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 27
end E236S329
