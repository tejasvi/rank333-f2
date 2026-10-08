module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S112 "data/lean/2d5d2faad1c690036f3850758a1118b9/E236S112.bin"
namespace E236S112
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [394], [22, 276], 4)], 0, E236S112.L1),
([(11, true, false, [394], [22, 276], 10)], 0, E236S112.L2),
([(11, true, false, [394], [22, 276], 24)], 0, E236S112.L3),
([(11, true, false, [394], [22, 276], 25)], 0, E236S112.L4),
([(11, true, false, [394], [22, 276], 26)], 0, E236S112.L5),
([(11, true, false, [394], [22, 276], 27)], 0, E236S112.L6),
([(11, true, false, [394], [22, 276], 28)], 0, E236S112.L7),
([(11, true, false, [394], [22, 276], 29)], 0, E236S112.L8),
([(11, true, false, [394], [22, 276], 30)], 0, E236S112.L9),
([(11, true, false, [394], [22, 276], 31)], 0, E236S112.L10),
([(11, true, false, [394], [22, 276], 32)], 0, E236S112.L11),
([(11, true, false, [394], [22, 276], 33)], 0, E236S112.L12),
([(11, true, false, [394], [22, 276], 34)], 0, E236S112.L13),
([(11, true, false, [394], [22, 276], 35)], 0, E236S112.L14),
([(11, true, false, [394], [22, 276], 36)], 0, E236S112.L15),
([(11, true, false, [394], [22, 276], 37)], 0, E236S112.L16),
([(11, true, false, [394], [22, 276], 38)], 0, E236S112.L17),
([(11, true, false, [394], [22, 276], 43)], 0, E236S112.L18),
([(11, true, false, [394], [22, 276], 48)], 0, E236S112.L19),
([(11, true, false, [394], [22, 276], 56)], 0, E236S112.L20),
([(11, true, false, [394], [22, 276], 70)], 0, E236S112.L21),
([(11, true, false, [394], [22, 276], 73)], 0, E236S112.L22),
([(11, true, false, [394], [22, 276], 92)], 0, E236S112.L23),
([(11, true, false, [394], [22, 276], 93)], 0, E236S112.L24),
([(11, true, false, [394], [22, 276], 97)], 0, E236S112.L25),
([(11, true, false, [394], [22, 276], 98)], 0, E236S112.L26),
([(11, true, false, [394], [22, 276], 99)], 0, E236S112.L27),
([(11, true, false, [394], [22, 276], 133)], 0, E236S112.L28),
([(11, true, false, [394], [22, 276], 136)], 0, E236S112.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E236S112
