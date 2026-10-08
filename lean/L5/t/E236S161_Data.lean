module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S161 "data/lean/4d685fc408a8b796a46e614ed4f8cb2c/E236S161.bin"
namespace E236S161
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158], [232], 1)], 0, E236S161.L1),
([(2, true, false, [158], [232], 4)], 0, E236S161.L2),
([(2, true, false, [158], [232], 5)], 0, E236S161.L3),
([(2, true, false, [158], [232], 6)], 0, E236S161.L4),
([(2, true, false, [158], [232], 7)], 0, E236S161.L5),
([(2, true, false, [158], [232], 8)], 0, E236S161.L6),
([(2, true, false, [158], [232], 10)], 0, E236S161.L7),
([(2, true, false, [158], [232], 16)], 0, E236S161.L8),
([(2, true, false, [158], [232], 28)], 0, E236S161.L9),
([(2, true, false, [158], [232], 32)], 0, E236S161.L10),
([(2, true, false, [158], [232], 35)], 0, E236S161.L11),
([(2, true, false, [158], [232], 42)], 0, E236S161.L12),
([(2, true, false, [158], [232], 43)], 0, E236S161.L13),
([(2, true, false, [158], [232], 44)], 0, E236S161.L14),
([(2, true, false, [158], [232], 45)], 0, E236S161.L15),
([(2, true, false, [158], [232], 47)], 0, E236S161.L16),
([(2, true, false, [158], [232], 49)], 0, E236S161.L17),
([(2, true, false, [158], [232], 55)], 0, E236S161.L18),
([(2, true, false, [158], [232], 59)], 0, E236S161.L19),
([(2, true, false, [158], [232], 66)], 0, E236S161.L20),
([(2, true, false, [158], [232], 70)], 0, E236S161.L21),
([(2, true, false, [158], [232], 73)], 0, E236S161.L22),
([(2, true, false, [158], [232], 100)], 0, E236S161.L23),
([(2, true, false, [158], [232], 101)], 0, E236S161.L24),
([(2, true, false, [158], [232], 108)], 0, E236S161.L25),
([(2, true, false, [158], [232], 110)], 0, E236S161.L26),
([(2, true, false, [158], [232], 116)], 0, E236S161.L27),
([(2, true, false, [158], [232], 117)], 0, E236S161.L28),
([(2, true, false, [158], [232], 118)], 0, E236S161.L29),
([(2, true, false, [158], [232], 119)], 0, E236S161.L30),
([(2, true, false, [158], [232], 120)], 0, E236S161.L31),
([(2, true, false, [158], [232], 121)], 0, E236S161.L32),
([(2, true, false, [158], [232], 122)], 0, E236S161.L33),
([(2, true, false, [158], [232], 123)], 0, E236S161.L34),
([(2, true, false, [158], [232], 124)], 0, E236S161.L35),
([(2, true, false, [158], [232], 125)], 0, E236S161.L36),
([(2, true, false, [158], [232], 126)], 0, E236S161.L37),
([(2, true, false, [158], [232], 127)], 0, E236S161.L38),
([(2, true, false, [158], [232], 129)], 0, E236S161.L39),
([(2, true, false, [158], [232], 132)], 0, E236S161.L40),
([(2, true, false, [158], [232], 133)], 0, E236S161.L41),
([(2, true, false, [158], [232], 142)], 0, E236S161.L42),
([(2, true, false, [158], [232], 145)], 0, E236S161.L43),
([(2, true, false, [158], [232], 146)], 0, E236S161.L44),
([(2, true, false, [158], [232], 148)], 0, E236S161.L45),
([(2, true, false, [158], [232], 153)], 0, E236S161.L46),
([(2, true, false, [158], [232], 157)], 0, E236S161.L47),
([(2, true, false, [158], [232], 159)], 0, E236S161.L48),
([(2, true, false, [158], [232], 180)], 0, E236S161.L49),
([(2, true, false, [158], [232], 182)], 0, E236S161.L50),
([(2, true, false, [158], [232], 212)], 0, E236S161.L51),
([(2, true, false, [158], [232], 220)], 0, E236S161.L52),
([(2, true, false, [158], [232], 231)], 0, E236S161.L53),
([(2, true, false, [158], [232], 244)], 0, E236S161.L54),
([(2, true, false, [158], [232], 248)], 0, E236S161.L55),
([(2, true, false, [158], [232], 260)], 0, E236S161.L56),
([(2, true, false, [158], [232], 264)], 0, E236S161.L57),
([(2, true, false, [158], [232], 269)], 0, E236S161.L58)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 58
end E236S161
