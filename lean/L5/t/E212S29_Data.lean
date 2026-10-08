module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S29 "data/lean/c81dca0f85596797ce59ac4914826874/E212S29.bin"
namespace E212S29
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266], [26], 0)], 0, E212S29.L1),
([(0, true, false, [254, 266], [26], 1)], 0, E212S29.L2),
([(0, true, false, [254, 266], [26], 2)], 0, E212S29.L3),
([(0, true, false, [254, 266], [26], 3)], 0, E212S29.L4),
([(0, true, false, [254, 266], [26], 4)], 0, E212S29.L5),
([(0, true, false, [254, 266], [26], 6)], 0, E212S29.L6),
([(0, true, false, [254, 266], [26], 7)], 0, E212S29.L7),
([(0, true, false, [254, 266], [26], 8)], 0, E212S29.L8),
([(0, true, false, [254, 266], [26], 9)], 0, E212S29.L9),
([(0, true, false, [254, 266], [26], 10)], 0, E212S29.L10),
([(0, true, false, [254, 266], [26], 11)], 0, E212S29.L11),
([(0, true, false, [254, 266], [26], 12)], 0, E212S29.L12),
([(0, true, false, [254, 266], [26], 13)], 0, E212S29.L13),
([(0, true, false, [254, 266], [26], 14)], 0, E212S29.L14),
([(0, true, false, [254, 266], [26], 15)], 0, E212S29.L15),
([(0, true, false, [254, 266], [26], 16)], 0, E212S29.L16),
([(0, true, false, [254, 266], [26], 17)], 0, E212S29.L17),
([(0, true, false, [254, 266], [26], 18)], 0, E212S29.L18),
([(0, true, false, [254, 266], [26], 19)], 0, E212S29.L19),
([(0, true, false, [254, 266], [26], 30)], 0, E212S29.L20),
([(0, true, false, [254, 266], [26], 31)], 0, E212S29.L21),
([(0, true, false, [254, 266], [26], 34)], 0, E212S29.L22),
([(0, true, false, [254, 266], [26], 35)], 0, E212S29.L23),
([(0, true, false, [254, 266], [26], 42)], 0, E212S29.L24),
([(0, true, false, [254, 266], [26], 43)], 0, E212S29.L25),
([(0, true, false, [254, 266], [26], 46)], 0, E212S29.L26),
([(0, true, false, [254, 266], [26], 47)], 0, E212S29.L27),
([(0, true, false, [254, 266], [26], 48)], 0, E212S29.L28),
([(0, true, false, [254, 266], [26], 57)], 0, E212S29.L29),
([(0, true, false, [254, 266], [26], 61)], 0, E212S29.L30),
([(0, true, false, [254, 266], [26], 72)], 0, E212S29.L31),
([(0, true, false, [254, 266], [26], 73)], 0, E212S29.L32),
([(0, true, false, [254, 266], [26], 76)], 0, E212S29.L33),
([(0, true, false, [254, 266], [26], 82)], 0, E212S29.L34),
([(0, true, false, [254, 266], [26], 84)], 0, E212S29.L35),
([(0, true, false, [254, 266], [26], 85)], 0, E212S29.L36),
([(0, true, false, [254, 266], [26], 86)], 0, E212S29.L37),
([(0, true, false, [254, 266], [26], 87)], 0, E212S29.L38),
([(0, true, false, [254, 266], [26], 88)], 0, E212S29.L39),
([(0, true, false, [254, 266], [26], 90)], 0, E212S29.L40),
([(0, true, false, [254, 266], [26], 91)], 0, E212S29.L41),
([(0, true, false, [254, 266], [26], 93)], 0, E212S29.L42),
([(0, true, false, [254, 266], [26], 94)], 0, E212S29.L43),
([(0, true, false, [254, 266], [26], 96)], 0, E212S29.L44),
([(0, true, false, [254, 266], [26], 97)], 0, E212S29.L45),
([(0, true, false, [254, 266], [26], 98)], 0, E212S29.L46),
([(0, true, false, [254, 266], [26], 104)], 0, E212S29.L47),
([(0, true, false, [254, 266], [26], 105)], 0, E212S29.L48),
([(0, true, false, [254, 266], [26], 109)], 0, E212S29.L49),
([(0, true, false, [254, 266], [26], 112)], 0, E212S29.L50),
([(0, true, false, [254, 266], [26], 122)], 0, E212S29.L51),
([(0, true, false, [254, 266], [26], 123)], 0, E212S29.L52),
([(0, true, false, [254, 266], [26], 124)], 0, E212S29.L53),
([(0, true, false, [254, 266], [26], 130)], 0, E212S29.L54),
([(0, true, false, [254, 266], [26], 132)], 0, E212S29.L55)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E212S29
