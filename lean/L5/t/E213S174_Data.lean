module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S174 "data/lean/4e4b04318e5744d2e2c7d57d77f1ec47/E213S174.bin"
namespace E213S174
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254], [96, 272], 1)], 0, E213S174.L1),
([(2, true, false, [254], [96, 272], 2)], 0, E213S174.L2),
([(2, true, false, [254], [96, 272], 4)], 0, E213S174.L3),
([(2, true, false, [254], [96, 272], 7)], 0, E213S174.L4),
([(2, true, false, [254], [96, 272], 17)], 0, E213S174.L5),
([(2, true, false, [254], [96, 272], 18)], 0, E213S174.L6),
([(2, true, false, [254], [96, 272], 19)], 0, E213S174.L7),
([(2, true, false, [254], [96, 272], 25)], 0, E213S174.L8),
([(2, true, false, [254], [96, 272], 26)], 0, E213S174.L9),
([(2, true, false, [254], [96, 272], 28)], 0, E213S174.L10),
([(2, true, false, [254], [96, 272], 34)], 0, E213S174.L11),
([(2, true, false, [254], [96, 272], 38)], 0, E213S174.L12),
([(2, true, false, [254], [96, 272], 46)], 0, E213S174.L13),
([(2, true, false, [254], [96, 272], 48)], 0, E213S174.L14),
([(2, true, false, [254], [96, 272], 50)], 0, E213S174.L15),
([(2, true, false, [254], [96, 272], 51)], 0, E213S174.L16),
([(2, true, false, [254], [96, 272], 52)], 0, E213S174.L17),
([(2, true, false, [254], [96, 272], 53)], 0, E213S174.L18),
([(2, true, false, [254], [96, 272], 55)], 0, E213S174.L19),
([(2, true, false, [254], [96, 272], 56)], 0, E213S174.L20),
([(2, true, false, [254], [96, 272], 59)], 0, E213S174.L21),
([(2, true, false, [254], [96, 272], 60)], 0, E213S174.L22),
([(2, true, false, [254], [96, 272], 62)], 0, E213S174.L23),
([(2, true, false, [254], [96, 272], 65)], 0, E213S174.L24),
([(2, true, false, [254], [96, 272], 66)], 0, E213S174.L25),
([(2, true, false, [254], [96, 272], 68)], 0, E213S174.L26),
([(2, true, false, [254], [96, 272], 70)], 0, E213S174.L27),
([(2, true, false, [254], [96, 272], 72)], 0, E213S174.L28),
([(2, true, false, [254], [96, 272], 75)], 0, E213S174.L29),
([(2, true, false, [254], [96, 272], 78)], 0, E213S174.L30),
([(2, true, false, [254], [96, 272], 81)], 0, E213S174.L31),
([(2, true, false, [254], [96, 272], 82)], 0, E213S174.L32),
([(2, true, false, [254], [96, 272], 85)], 0, E213S174.L33),
([(2, true, false, [254], [96, 272], 86)], 0, E213S174.L34),
([(2, true, false, [254], [96, 272], 88)], 0, E213S174.L35),
([(2, true, false, [254], [96, 272], 91)], 0, E213S174.L36),
([(2, true, false, [254], [96, 272], 97)], 0, E213S174.L37),
([(2, true, false, [254], [96, 272], 99)], 0, E213S174.L38),
([(2, true, false, [254], [96, 272], 107)], 0, E213S174.L39),
([(2, true, false, [254], [96, 272], 110)], 0, E213S174.L40),
([(2, true, false, [254], [96, 272], 111)], 0, E213S174.L41),
([(2, true, false, [254], [96, 272], 112)], 0, E213S174.L42),
([(2, true, false, [254], [96, 272], 113)], 0, E213S174.L43),
([(2, true, false, [254], [96, 272], 116)], 0, E213S174.L44),
([(2, true, false, [254], [96, 272], 117)], 0, E213S174.L45),
([(2, true, false, [254], [96, 272], 124)], 0, E213S174.L46),
([(2, true, false, [254], [96, 272], 126)], 0, E213S174.L47),
([(2, true, false, [254], [96, 272], 130)], 0, E213S174.L48),
([(2, true, false, [254], [96, 272], 131)], 0, E213S174.L49),
([(2, true, false, [254], [96, 272], 133)], 0, E213S174.L50),
([(2, true, false, [254], [96, 272], 137)], 0, E213S174.L51),
([(2, true, false, [254], [96, 272], 140)], 0, E213S174.L52),
([(2, true, false, [254], [96, 272], 143)], 0, E213S174.L53),
([(2, true, false, [254], [96, 272], 144)], 0, E213S174.L54),
([(2, true, false, [254], [96, 272], 145)], 0, E213S174.L55),
([(2, true, false, [254], [96, 272], 152)], 0, E213S174.L56),
([(2, true, false, [254], [96, 272], 153)], 0, E213S174.L57),
([(2, true, false, [254], [96, 272], 156)], 0, E213S174.L58),
([(2, true, false, [254], [96, 272], 162)], 0, E213S174.L59),
([(2, true, false, [254], [96, 272], 163)], 0, E213S174.L60)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 60
end E213S174
