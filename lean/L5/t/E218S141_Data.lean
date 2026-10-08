module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S141 "data/lean/a835c56002908012b9b22a419f54fa7a/E218S141.bin"
namespace E218S141
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 142, 266], [], 0)], 0, E218S141.L1),
([(2, true, false, [106, 142, 266], [], 1)], 0, E218S141.L2),
([(2, true, false, [106, 142, 266], [], 4)], 0, E218S141.L3),
([(2, true, false, [106, 142, 266], [], 10)], 0, E218S141.L4),
([(2, true, false, [106, 142, 266], [], 11)], 0, E218S141.L5),
([(2, true, false, [106, 142, 266], [], 12)], 0, E218S141.L6),
([(2, true, false, [106, 142, 266], [], 13)], 0, E218S141.L7),
([(2, true, false, [106, 142, 266], [], 14)], 0, E218S141.L8),
([(2, true, false, [106, 142, 266], [], 15)], 0, E218S141.L9),
([(2, true, false, [106, 142, 266], [], 16)], 0, E218S141.L10),
([(2, true, false, [106, 142, 266], [], 17)], 0, E218S141.L11),
([(2, true, false, [106, 142, 266], [], 18)], 0, E218S141.L12),
([(2, true, false, [106, 142, 266], [], 24)], 0, E218S141.L13),
([(2, true, false, [106, 142, 266], [], 44)], 11, E218S141.L14),
([(2, true, false, [106, 142, 266], [], 45)], 0, E218S141.L15),
([(2, true, false, [106, 142, 266], [], 46)], 0, E218S141.L16),
([(2, true, false, [106, 142, 266], [], 47)], 0, E218S141.L17),
([(2, true, false, [106, 142, 266], [], 48)], 0, E218S141.L18),
([(2, true, false, [106, 142, 266], [], 49)], 0, E218S141.L19),
([(2, true, false, [106, 142, 266], [], 54)], 0, E218S141.L20),
([(2, true, false, [106, 142, 266], [], 56)], 0, E218S141.L21),
([(2, true, false, [106, 142, 266], [], 58)], 0, E218S141.L22),
([(2, true, false, [106, 142, 266], [], 60)], 0, E218S141.L23),
([(2, true, false, [106, 142, 266], [], 75)], 0, E218S141.L24),
([(2, true, false, [106, 142, 266], [], 78)], 0, E218S141.L25),
([(2, true, false, [106, 142, 266], [], 79)], 0, E218S141.L26),
([(2, true, false, [106, 142, 266], [], 80)], 0, E218S141.L27),
([(2, true, false, [106, 142, 266], [], 81)], 0, E218S141.L28),
([(2, true, false, [106, 142, 266], [], 82)], 0, E218S141.L29),
([(2, true, false, [106, 142, 266], [], 83)], 0, E218S141.L30),
([(2, true, false, [106, 142, 266], [], 84)], 0, E218S141.L31),
([(2, true, false, [106, 142, 266], [], 95)], 0, E218S141.L32),
([(2, true, false, [106, 142, 266], [], 99)], 0, E218S141.L33),
([(2, true, false, [106, 142, 266], [], 119)], 0, E218S141.L34),
([(2, true, false, [106, 142, 266], [], 120)], 0, E218S141.L35),
([(2, true, false, [106, 142, 266], [], 121)], 0, E218S141.L36),
([(2, true, false, [106, 142, 266], [], 123)], 0, E218S141.L37),
([(2, true, false, [106, 142, 266], [], 129)], 0, E218S141.L38),
([(2, true, false, [106, 142, 266], [], 132)], 0, E218S141.L39),
([(2, true, false, [106, 142, 266], [], 134)], 0, E218S141.L40),
([(2, true, false, [106, 142, 266], [], 143)], 0, E218S141.L41),
([(2, true, false, [106, 142, 266], [], 145)], 0, E218S141.L42),
([(2, true, false, [106, 142, 266], [], 169)], 0, E218S141.L43),
([(2, true, false, [106, 142, 266], [], 191)], 0, E218S141.L44),
([(2, true, false, [106, 142, 266], [], 211)], 0, E218S141.L45),
([(2, true, false, [106, 142, 266], [], 227)], 0, E218S141.L46),
([(2, true, false, [106, 142, 266], [], 243)], 0, E218S141.L47),
([(2, true, false, [106, 142, 266], [], 259)], 0, E218S141.L48),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 49)], 0, E218S141.L49),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 63)], 0, E218S141.L50),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 88)], 0, E218S141.L51),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 95)], 0, E218S141.L52),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 113)], 0, E218S141.L53),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 126)], 0, E218S141.L54),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 185)], 0, E218S141.L55),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 189)], 0, E218S141.L56),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 368)], 0, E218S141.L57),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 370)], 0, E218S141.L58),
([(2, true, false, [106, 142, 266], [], 44), (0, false, false, [500], [], 537)], 0, E218S141.L59)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E218S141
