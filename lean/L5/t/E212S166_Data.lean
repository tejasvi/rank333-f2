module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S166 "data/lean/f05d10fd741b94e6892ebbe8525751df/E212S166.bin"
namespace E212S166
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [122, 158, 266], [], 0)], 0, E212S166.L1),
([(0, true, false, [122, 158, 266], [], 1)], 0, E212S166.L2),
([(0, true, false, [122, 158, 266], [], 2)], 0, E212S166.L3),
([(0, true, false, [122, 158, 266], [], 3)], 0, E212S166.L4),
([(0, true, false, [122, 158, 266], [], 4)], 0, E212S166.L5),
([(0, true, false, [122, 158, 266], [], 5)], 0, E212S166.L6),
([(0, true, false, [122, 158, 266], [], 6)], 0, E212S166.L7),
([(0, true, false, [122, 158, 266], [], 7)], 0, E212S166.L8),
([(0, true, false, [122, 158, 266], [], 8)], 0, E212S166.L9),
([(0, true, false, [122, 158, 266], [], 9)], 0, E212S166.L10),
([(0, true, false, [122, 158, 266], [], 10)], 0, E212S166.L11),
([(0, true, false, [122, 158, 266], [], 11)], 0, E212S166.L12),
([(0, true, false, [122, 158, 266], [], 15)], 0, E212S166.L13),
([(0, true, false, [122, 158, 266], [], 16)], 0, E212S166.L14),
([(0, true, false, [122, 158, 266], [], 20)], 0, E212S166.L15),
([(0, true, false, [122, 158, 266], [], 26)], 0, E212S166.L16),
([(0, true, false, [122, 158, 266], [], 28)], 0, E212S166.L17),
([(0, true, false, [122, 158, 266], [], 29)], 0, E212S166.L18),
([(0, true, false, [122, 158, 266], [], 42)], 0, E212S166.L19),
([(0, true, false, [122, 158, 266], [], 43)], 0, E212S166.L20),
([(0, true, false, [122, 158, 266], [], 44)], 0, E212S166.L21),
([(0, true, false, [122, 158, 266], [], 46)], 0, E212S166.L22),
([(0, true, false, [122, 158, 266], [], 49)], 0, E212S166.L23),
([(0, true, false, [122, 158, 266], [], 54)], 0, E212S166.L24),
([(0, true, false, [122, 158, 266], [], 74)], 0, E212S166.L25),
([(0, true, false, [122, 158, 266], [], 75)], 0, E212S166.L26),
([(0, true, false, [122, 158, 266], [], 79)], 0, E212S166.L27),
([(0, true, false, [122, 158, 266], [], 81)], 0, E212S166.L28),
([(0, true, false, [122, 158, 266], [], 85)], 0, E212S166.L29),
([(0, true, false, [122, 158, 266], [], 86)], 0, E212S166.L30),
([(0, true, false, [122, 158, 266], [], 88)], 0, E212S166.L31),
([(0, true, false, [122, 158, 266], [], 89)], 0, E212S166.L32),
([(0, true, false, [122, 158, 266], [], 91)], 0, E212S166.L33),
([(0, true, false, [122, 158, 266], [], 97)], 0, E212S166.L34),
([(0, true, false, [122, 158, 266], [], 118)], 0, E212S166.L35),
([(0, true, false, [122, 158, 266], [], 135)], 0, E212S166.L36),
([(0, true, false, [122, 158, 266], [], 137)], 0, E212S166.L37),
([(0, true, false, [122, 158, 266], [], 139)], 0, E212S166.L38),
([(0, true, false, [122, 158, 266], [], 141)], 0, E212S166.L39),
([(0, true, false, [122, 158, 266], [], 143)], 0, E212S166.L40),
([(0, true, false, [122, 158, 266], [], 145)], 0, E212S166.L41),
([(0, true, false, [122, 158, 266], [], 165)], 0, E212S166.L42),
([(0, true, false, [122, 158, 266], [], 187)], 0, E212S166.L43),
([(0, true, false, [122, 158, 266], [], 218)], 0, E212S166.L44),
([(0, true, false, [122, 158, 266], [], 227)], 0, E212S166.L45),
([(0, true, false, [122, 158, 266], [], 229)], 0, E212S166.L46)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 46
end E212S166
