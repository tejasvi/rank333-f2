module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S160 "data/lean/b71683e7bcae717334d5cfbd08409c60/E236S160.bin"
namespace E236S160
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158], [232], 0)], 0, E236S160.L1),
([(2, true, false, [158], [232], 4)], 0, E236S160.L2),
([(2, true, false, [158], [232], 6)], 0, E236S160.L3),
([(2, true, false, [158], [232], 7)], 0, E236S160.L4),
([(2, true, false, [158], [232], 10)], 0, E236S160.L5),
([(2, true, false, [158], [232], 16)], 0, E236S160.L6),
([(2, true, false, [158], [232], 30)], 0, E236S160.L7),
([(2, true, false, [158], [232], 42)], 0, E236S160.L8),
([(2, true, false, [158], [232], 44)], 0, E236S160.L9),
([(2, true, false, [158], [232], 45)], 0, E236S160.L10),
([(2, true, false, [158], [232], 47)], 0, E236S160.L11),
([(2, true, false, [158], [232], 49)], 0, E236S160.L12),
([(2, true, false, [158], [232], 55)], 0, E236S160.L13),
([(2, true, false, [158], [232], 59)], 0, E236S160.L14),
([(2, true, false, [158], [232], 68)], 0, E236S160.L15),
([(2, true, false, [158], [232], 69)], 0, E236S160.L16),
([(2, true, false, [158], [232], 104)], 0, E236S160.L17),
([(2, true, false, [158], [232], 116)], 0, E236S160.L18),
([(2, true, false, [158], [232], 118)], 0, E236S160.L19),
([(2, true, false, [158], [232], 119)], 0, E236S160.L20),
([(2, true, false, [158], [232], 120)], 0, E236S160.L21),
([(2, true, false, [158], [232], 121)], 0, E236S160.L22),
([(2, true, false, [158], [232], 123)], 0, E236S160.L23),
([(2, true, false, [158], [232], 124)], 0, E236S160.L24),
([(2, true, false, [158], [232], 125)], 0, E236S160.L25),
([(2, true, false, [158], [232], 126)], 0, E236S160.L26),
([(2, true, false, [158], [232], 127)], 0, E236S160.L27),
([(2, true, false, [158], [232], 128)], 0, E236S160.L28),
([(2, true, false, [158], [232], 157)], 0, E236S160.L29),
([(2, true, false, [158], [232], 159)], 0, E236S160.L30),
([(2, true, false, [158], [232], 180)], 0, E236S160.L31),
([(2, true, false, [158], [232], 182)], 0, E236S160.L32),
([(2, true, false, [158], [232], 212)], 0, E236S160.L33),
([(2, true, false, [158], [232], 220)], 0, E236S160.L34),
([(2, true, false, [158], [232], 231)], 0, E236S160.L35),
([(2, true, false, [158], [232], 252)], 0, E236S160.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E236S160
