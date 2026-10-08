module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S132 "data/lean/6495a72fc3043f8dc190a802db99cbdc/E212S132.bin"
namespace E212S132
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 158, 266], [], 0)], 0, E212S132.L1),
([(2, true, false, [122, 158, 266], [], 1)], 0, E212S132.L2),
([(2, true, false, [122, 158, 266], [], 2)], 0, E212S132.L3),
([(2, true, false, [122, 158, 266], [], 3)], 0, E212S132.L4),
([(2, true, false, [122, 158, 266], [], 4)], 0, E212S132.L5),
([(2, true, false, [122, 158, 266], [], 5)], 0, E212S132.L6),
([(2, true, false, [122, 158, 266], [], 6)], 0, E212S132.L7),
([(2, true, false, [122, 158, 266], [], 8)], 0, E212S132.L8),
([(2, true, false, [122, 158, 266], [], 9)], 0, E212S132.L9),
([(2, true, false, [122, 158, 266], [], 10)], 0, E212S132.L10),
([(2, true, false, [122, 158, 266], [], 20)], 0, E212S132.L11),
([(2, true, false, [122, 158, 266], [], 37)], 0, E212S132.L12),
([(2, true, false, [122, 158, 266], [], 38)], 0, E212S132.L13),
([(2, true, false, [122, 158, 266], [], 39)], 0, E212S132.L14),
([(2, true, false, [122, 158, 266], [], 40)], 0, E212S132.L15),
([(2, true, false, [122, 158, 266], [], 41)], 0, E212S132.L16),
([(2, true, false, [122, 158, 266], [], 42)], 0, E212S132.L17),
([(2, true, false, [122, 158, 266], [], 43)], 0, E212S132.L18),
([(2, true, false, [122, 158, 266], [], 45)], 0, E212S132.L19),
([(2, true, false, [122, 158, 266], [], 48)], 0, E212S132.L20),
([(2, true, false, [122, 158, 266], [], 52)], 0, E212S132.L21),
([(2, true, false, [122, 158, 266], [], 54)], 0, E212S132.L22),
([(2, true, false, [122, 158, 266], [], 57)], 0, E212S132.L23),
([(2, true, false, [122, 158, 266], [], 71)], 0, E212S132.L24),
([(2, true, false, [122, 158, 266], [], 74)], 0, E212S132.L25),
([(2, true, false, [122, 158, 266], [], 75)], 0, E212S132.L26),
([(2, true, false, [122, 158, 266], [], 76)], 0, E212S132.L27),
([(2, true, false, [122, 158, 266], [], 77)], 0, E212S132.L28),
([(2, true, false, [122, 158, 266], [], 78)], 0, E212S132.L29),
([(2, true, false, [122, 158, 266], [], 79)], 0, E212S132.L30),
([(2, true, false, [122, 158, 266], [], 85)], 0, E212S132.L31),
([(2, true, false, [122, 158, 266], [], 91)], 0, E212S132.L32),
([(2, true, false, [122, 158, 266], [], 111)], 0, E212S132.L33),
([(2, true, false, [122, 158, 266], [], 113)], 0, E212S132.L34),
([(2, true, false, [122, 158, 266], [], 115)], 0, E212S132.L35),
([(2, true, false, [122, 158, 266], [], 116)], 0, E212S132.L36),
([(2, true, false, [122, 158, 266], [], 118)], 0, E212S132.L37),
([(2, true, false, [122, 158, 266], [], 123)], 0, E212S132.L38),
([(2, true, false, [122, 158, 266], [], 125)], 0, E212S132.L39),
([(2, true, false, [122, 158, 266], [], 126)], 0, E212S132.L40),
([(2, true, false, [122, 158, 266], [], 129)], 0, E212S132.L41),
([(2, true, false, [122, 158, 266], [], 133)], 0, E212S132.L42),
([(2, true, false, [122, 158, 266], [], 135)], 0, E212S132.L43),
([(2, true, false, [122, 158, 266], [], 137)], 0, E212S132.L44),
([(2, true, false, [122, 158, 266], [], 159)], 0, E212S132.L45),
([(2, true, false, [122, 158, 266], [], 163)], 0, E212S132.L46),
([(2, true, false, [122, 158, 266], [], 169)], 0, E212S132.L47),
([(2, true, false, [122, 158, 266], [], 177)], 0, E212S132.L48),
([(2, true, false, [122, 158, 266], [], 179)], 0, E212S132.L49),
([(2, true, false, [122, 158, 266], [], 187)], 0, E212S132.L50),
([(2, true, false, [122, 158, 266], [], 193)], 0, E212S132.L51),
([(2, true, false, [122, 158, 266], [], 211)], 0, E212S132.L52),
([(2, true, false, [122, 158, 266], [], 227)], 0, E212S132.L53),
([(2, true, false, [122, 158, 266], [], 229)], 0, E212S132.L54),
([(2, true, false, [122, 158, 266], [], 265)], 0, E212S132.L55)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E212S132
