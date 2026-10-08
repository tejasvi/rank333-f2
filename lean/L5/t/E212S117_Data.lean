module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S117 "data/lean/9b037adb2873b5aa74a152a6c0903c3a/E212S117.bin"
namespace E212S117
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [122, 500, 158], [], 10)], 0, E212S117.L1),
([(8, true, false, [122, 500, 158], [], 11)], 0, E212S117.L2),
([(8, true, false, [122, 500, 158], [], 12)], 0, E212S117.L3),
([(8, true, false, [122, 500, 158], [], 13)], 0, E212S117.L4),
([(8, true, false, [122, 500, 158], [], 14)], 0, E212S117.L5),
([(8, true, false, [122, 500, 158], [], 15)], 0, E212S117.L6),
([(8, true, false, [122, 500, 158], [], 16)], 0, E212S117.L7),
([(8, true, false, [122, 500, 158], [], 17)], 0, E212S117.L8),
([(8, true, false, [122, 500, 158], [], 18)], 0, E212S117.L9),
([(8, true, false, [122, 500, 158], [], 19)], 0, E212S117.L10),
([(8, true, false, [122, 500, 158], [], 20)], 0, E212S117.L11),
([(8, true, false, [122, 500, 158], [], 21)], 0, E212S117.L12),
([(8, true, false, [122, 500, 158], [], 23)], 0, E212S117.L13),
([(8, true, false, [122, 500, 158], [], 26)], 0, E212S117.L14),
([(8, true, false, [122, 500, 158], [], 34)], 0, E212S117.L15),
([(8, true, false, [122, 500, 158], [], 35)], 0, E212S117.L16),
([(8, true, false, [122, 500, 158], [], 53)], 0, E212S117.L17),
([(8, true, false, [122, 500, 158], [], 88)], 0, E212S117.L18),
([(8, true, false, [122, 500, 158], [], 89)], 0, E212S117.L19),
([(8, true, false, [122, 500, 158], [], 90)], 0, E212S117.L20),
([(8, true, false, [122, 500, 158], [], 91)], 0, E212S117.L21),
([(8, true, false, [122, 500, 158], [], 92)], 0, E212S117.L22),
([(8, true, false, [122, 500, 158], [], 93)], 0, E212S117.L23),
([(8, true, false, [122, 500, 158], [], 94)], 0, E212S117.L24),
([(8, true, false, [122, 500, 158], [], 95)], 0, E212S117.L25),
([(8, true, false, [122, 500, 158], [], 96)], 0, E212S117.L26),
([(8, true, false, [122, 500, 158], [], 97)], 0, E212S117.L27),
([(8, true, false, [122, 500, 158], [], 162)], 0, E212S117.L28),
([(8, true, false, [122, 500, 158], [], 168)], 0, E212S117.L29),
([(8, true, false, [122, 500, 158], [], 184)], 0, E212S117.L30),
([(8, true, false, [122, 500, 158], [], 217)], 0, E212S117.L31),
([(8, true, false, [122, 500, 158], [], 218)], 0, E212S117.L32),
([(8, true, false, [122, 500, 158], [], 219)], 0, E212S117.L33),
([(8, true, false, [122, 500, 158], [], 232)], 0, E212S117.L34),
([(8, true, false, [122, 500, 158], [], 258)], 0, E212S117.L35),
([(8, true, false, [122, 500, 158], [], 259)], 0, E212S117.L36),
([(8, true, false, [122, 500, 158], [], 273)], 0, E212S117.L37),
([(8, true, false, [122, 500, 158], [], 295)], 0, E212S117.L38),
([(8, true, false, [122, 500, 158], [], 304)], 0, E212S117.L39),
([(8, true, false, [122, 500, 158], [], 305)], 0, E212S117.L40),
([(8, true, false, [122, 500, 158], [], 306)], 0, E212S117.L41),
([(8, true, false, [122, 500, 158], [], 310)], 0, E212S117.L42),
([(8, true, false, [122, 500, 158], [], 311)], 0, E212S117.L43),
([(8, true, false, [122, 500, 158], [], 316)], 0, E212S117.L44),
([(8, true, false, [122, 500, 158], [], 317)], 0, E212S117.L45),
([(8, true, false, [122, 500, 158], [], 318)], 0, E212S117.L46),
([(8, true, false, [122, 500, 158], [], 320)], 0, E212S117.L47),
([(8, true, false, [122, 500, 158], [], 342)], 0, E212S117.L48),
([(8, true, false, [122, 500, 158], [], 343)], 0, E212S117.L49),
([(8, true, false, [122, 500, 158], [], 349)], 0, E212S117.L50),
([(8, true, false, [122, 500, 158], [], 350)], 0, E212S117.L51),
([(8, true, false, [122, 500, 158], [], 364)], 0, E212S117.L52),
([(8, true, false, [122, 500, 158], [], 401)], 0, E212S117.L53),
([(8, true, false, [122, 500, 158], [], 508)], 0, E212S117.L54),
([(8, true, false, [122, 500, 158], [], 509)], 0, E212S117.L55)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E212S117
