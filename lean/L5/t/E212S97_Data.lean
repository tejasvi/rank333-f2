module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S97 "data/lean/ab938c0066fdd1a31b804d2d0b8d6674/E212S97.bin"
namespace E212S97
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [266, 254], [96], 1)], 0, E212S97.L1),
([(9, true, false, [266, 254], [96], 2)], 0, E212S97.L2),
([(9, true, false, [266, 254], [96], 3)], 0, E212S97.L3),
([(9, true, false, [266, 254], [96], 8)], 0, E212S97.L4),
([(9, true, false, [266, 254], [96], 11)], 0, E212S97.L5),
([(9, true, false, [266, 254], [96], 13)], 0, E212S97.L6),
([(9, true, false, [266, 254], [96], 20)], 0, E212S97.L7),
([(9, true, false, [266, 254], [96], 21)], 0, E212S97.L8),
([(9, true, false, [266, 254], [96], 22)], 0, E212S97.L9),
([(9, true, false, [266, 254], [96], 23)], 0, E212S97.L10),
([(9, true, false, [266, 254], [96], 25)], 0, E212S97.L11),
([(9, true, false, [266, 254], [96], 37)], 0, E212S97.L12),
([(9, true, false, [266, 254], [96], 38)], 0, E212S97.L13),
([(9, true, false, [266, 254], [96], 39)], 0, E212S97.L14),
([(9, true, false, [266, 254], [96], 41)], 0, E212S97.L15),
([(9, true, false, [266, 254], [96], 45)], 0, E212S97.L16),
([(9, true, false, [266, 254], [96], 46)], 0, E212S97.L17),
([(9, true, false, [266, 254], [96], 47)], 0, E212S97.L18),
([(9, true, false, [266, 254], [96], 49)], 0, E212S97.L19),
([(9, true, false, [266, 254], [96], 56)], 0, E212S97.L20),
([(9, true, false, [266, 254], [96], 58)], 0, E212S97.L21),
([(9, true, false, [266, 254], [96], 64)], 0, E212S97.L22),
([(9, true, false, [266, 254], [96], 66)], 0, E212S97.L23),
([(9, true, false, [266, 254], [96], 68)], 0, E212S97.L24),
([(9, true, false, [266, 254], [96], 78)], 0, E212S97.L25),
([(9, true, false, [266, 254], [96], 79)], 0, E212S97.L26),
([(9, true, false, [266, 254], [96], 86)], 0, E212S97.L27),
([(9, true, false, [266, 254], [96], 92)], 0, E212S97.L28),
([(9, true, false, [266, 254], [96], 104)], 0, E212S97.L29),
([(9, true, false, [266, 254], [96], 130)], 0, E212S97.L30),
([(9, true, false, [266, 254], [96], 136)], 0, E212S97.L31),
([(9, true, false, [266, 254], [96], 140)], 0, E212S97.L32),
([(9, true, false, [266, 254], [96], 154)], 0, E212S97.L33),
([(9, true, false, [266, 254], [96], 168)], 0, E212S97.L34),
([(9, true, false, [266, 254], [96], 169)], 0, E212S97.L35),
([(9, true, false, [266, 254], [96], 170)], 0, E212S97.L36),
([(9, true, false, [266, 254], [96], 171)], 0, E212S97.L37),
([(9, true, false, [266, 254], [96], 176)], 0, E212S97.L38),
([(9, true, false, [266, 254], [96], 190)], 0, E212S97.L39),
([(9, true, false, [266, 254], [96], 199)], 0, E212S97.L40),
([(9, true, false, [266, 254], [96], 211)], 0, E212S97.L41),
([(9, true, false, [266, 254], [96], 212)], 0, E212S97.L42),
([(9, true, false, [266, 254], [96], 213)], 0, E212S97.L43),
([(9, true, false, [266, 254], [96], 214)], 0, E212S97.L44),
([(9, true, false, [266, 254], [96], 215)], 0, E212S97.L45),
([(9, true, false, [266, 254], [96], 216)], 0, E212S97.L46),
([(9, true, false, [266, 254], [96], 218)], 0, E212S97.L47),
([(9, true, false, [266, 254], [96], 219)], 0, E212S97.L48),
([(9, true, false, [266, 254], [96], 220)], 0, E212S97.L49),
([(9, true, false, [266, 254], [96], 221)], 0, E212S97.L50),
([(9, true, false, [266, 254], [96], 223)], 0, E212S97.L51),
([(9, true, false, [266, 254], [96], 225)], 0, E212S97.L52),
([(9, true, false, [266, 254], [96], 226)], 0, E212S97.L53),
([(9, true, false, [266, 254], [96], 229)], 0, E212S97.L54),
([(9, true, false, [266, 254], [96], 242)], 0, E212S97.L55),
([(9, true, false, [266, 254], [96], 248)], 0, E212S97.L56),
([(9, true, false, [266, 254], [96], 254)], 0, E212S97.L57)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 57
end E212S97
