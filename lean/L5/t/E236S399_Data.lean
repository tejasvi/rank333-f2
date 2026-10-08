module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S399 "data/lean/db4cb63c2384748208db673bd009c15d/E236S399.bin"
namespace E236S399
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158], [96, 136], 0)], 0, E236S399.L1),
([(0, true, false, [158], [96, 136], 2)], 0, E236S399.L2),
([(0, true, false, [158], [96, 136], 8)], 0, E236S399.L3),
([(0, true, false, [158], [96, 136], 12)], 0, E236S399.L4),
([(0, true, false, [158], [96, 136], 21)], 0, E236S399.L5),
([(0, true, false, [158], [96, 136], 22)], 0, E236S399.L6),
([(0, true, false, [158], [96, 136], 23)], 0, E236S399.L7),
([(0, true, false, [158], [96, 136], 24)], 0, E236S399.L8),
([(0, true, false, [158], [96, 136], 27)], 0, E236S399.L9),
([(0, true, false, [158], [96, 136], 28)], 0, E236S399.L10),
([(0, true, false, [158], [96, 136], 29)], 0, E236S399.L11),
([(0, true, false, [158], [96, 136], 30)], 0, E236S399.L12),
([(0, true, false, [158], [96, 136], 31)], 0, E236S399.L13),
([(0, true, false, [158], [96, 136], 32)], 0, E236S399.L14),
([(0, true, false, [158], [96, 136], 33)], 0, E236S399.L15),
([(0, true, false, [158], [96, 136], 36)], 0, E236S399.L16),
([(0, true, false, [158], [96, 136], 37)], 0, E236S399.L17),
([(0, true, false, [158], [96, 136], 38)], 0, E236S399.L18),
([(0, true, false, [158], [96, 136], 40)], 0, E236S399.L19),
([(0, true, false, [158], [96, 136], 41)], 0, E236S399.L20),
([(0, true, false, [158], [96, 136], 43)], 0, E236S399.L21),
([(0, true, false, [158], [96, 136], 45)], 0, E236S399.L22),
([(0, true, false, [158], [96, 136], 46)], 0, E236S399.L23),
([(0, true, false, [158], [96, 136], 49)], 0, E236S399.L24),
([(0, true, false, [158], [96, 136], 51)], 0, E236S399.L25),
([(0, true, false, [158], [96, 136], 52)], 0, E236S399.L26),
([(0, true, false, [158], [96, 136], 53)], 0, E236S399.L27),
([(0, true, false, [158], [96, 136], 54)], 0, E236S399.L28),
([(0, true, false, [158], [96, 136], 56)], 0, E236S399.L29),
([(0, true, false, [158], [96, 136], 59)], 0, E236S399.L30),
([(0, true, false, [158], [96, 136], 60)], 0, E236S399.L31),
([(0, true, false, [158], [96, 136], 63)], 0, E236S399.L32),
([(0, true, false, [158], [96, 136], 68)], 0, E236S399.L33),
([(0, true, false, [158], [96, 136], 72)], 0, E236S399.L34),
([(0, true, false, [158], [96, 136], 81)], 0, E236S399.L35),
([(0, true, false, [158], [96, 136], 83)], 0, E236S399.L36),
([(0, true, false, [158], [96, 136], 86)], 0, E236S399.L37),
([(0, true, false, [158], [96, 136], 87)], 0, E236S399.L38),
([(0, true, false, [158], [96, 136], 92)], 0, E236S399.L39),
([(0, true, false, [158], [96, 136], 93)], 0, E236S399.L40),
([(0, true, false, [158], [96, 136], 98)], 0, E236S399.L41),
([(0, true, false, [158], [96, 136], 108)], 0, E236S399.L42),
([(0, true, false, [158], [96, 136], 118)], 0, E236S399.L43),
([(0, true, false, [158], [96, 136], 120)], 0, E236S399.L44),
([(0, true, false, [158], [96, 136], 121)], 0, E236S399.L45),
([(0, true, false, [158], [96, 136], 122)], 0, E236S399.L46),
([(0, true, false, [158], [96, 136], 124)], 0, E236S399.L47),
([(0, true, false, [158], [96, 136], 131)], 0, E236S399.L48),
([(0, true, false, [158], [96, 136], 133)], 0, E236S399.L49),
([(0, true, false, [158], [96, 136], 135)], 0, E236S399.L50),
([(0, true, false, [158], [96, 136], 138)], 0, E236S399.L51),
([(0, true, false, [158], [96, 136], 140)], 0, E236S399.L52),
([(0, true, false, [158], [96, 136], 141)], 0, E236S399.L53),
([(0, true, false, [158], [96, 136], 142)], 0, E236S399.L54),
([(0, true, false, [158], [96, 136], 146)], 0, E236S399.L55),
([(0, true, false, [158], [96, 136], 148)], 0, E236S399.L56),
([(0, true, false, [158], [96, 136], 161)], 0, E236S399.L57)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 57
end E236S399
