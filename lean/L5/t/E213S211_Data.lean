module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S211 "data/lean/14c4d1b4f77e1aa03bc181f36eb3f773/E213S211.bin"
namespace E213S211
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106, 158], [388], 0)], 0, E213S211.L1),
([(13, true, false, [106, 158], [388], 5)], 0, E213S211.L2),
([(13, true, false, [106, 158], [388], 7)], 0, E213S211.L3),
([(13, true, false, [106, 158], [388], 9)], 0, E213S211.L4),
([(13, true, false, [106, 158], [388], 10)], 0, E213S211.L5),
([(13, true, false, [106, 158], [388], 11)], 0, E213S211.L6),
([(13, true, false, [106, 158], [388], 13)], 0, E213S211.L7),
([(13, true, false, [106, 158], [388], 16)], 0, E213S211.L8),
([(13, true, false, [106, 158], [388], 21)], 0, E213S211.L9),
([(13, true, false, [106, 158], [388], 22)], 0, E213S211.L10),
([(13, true, false, [106, 158], [388], 23)], 0, E213S211.L11),
([(13, true, false, [106, 158], [388], 24)], 0, E213S211.L12),
([(13, true, false, [106, 158], [388], 25)], 0, E213S211.L13),
([(13, true, false, [106, 158], [388], 26)], 0, E213S211.L14),
([(13, true, false, [106, 158], [388], 27)], 0, E213S211.L15),
([(13, true, false, [106, 158], [388], 28)], 0, E213S211.L16),
([(13, true, false, [106, 158], [388], 29)], 0, E213S211.L17),
([(13, true, false, [106, 158], [388], 30)], 0, E213S211.L18),
([(13, true, false, [106, 158], [388], 31)], 0, E213S211.L19),
([(13, true, false, [106, 158], [388], 33)], 0, E213S211.L20),
([(13, true, false, [106, 158], [388], 39)], 0, E213S211.L21),
([(13, true, false, [106, 158], [388], 41)], 0, E213S211.L22),
([(13, true, false, [106, 158], [388], 43)], 0, E213S211.L23),
([(13, true, false, [106, 158], [388], 48)], 0, E213S211.L24),
([(13, true, false, [106, 158], [388], 49)], 0, E213S211.L25),
([(13, true, false, [106, 158], [388], 51)], 0, E213S211.L26),
([(13, true, false, [106, 158], [388], 52)], 0, E213S211.L27),
([(13, true, false, [106, 158], [388], 58)], 0, E213S211.L28),
([(13, true, false, [106, 158], [388], 59)], 0, E213S211.L29),
([(13, true, false, [106, 158], [388], 62)], 0, E213S211.L30),
([(13, true, false, [106, 158], [388], 64)], 0, E213S211.L31),
([(13, true, false, [106, 158], [388], 72)], 0, E213S211.L32),
([(13, true, false, [106, 158], [388], 73)], 0, E213S211.L33),
([(13, true, false, [106, 158], [388], 74)], 0, E213S211.L34),
([(13, true, false, [106, 158], [388], 86)], 0, E213S211.L35),
([(13, true, false, [106, 158], [388], 92)], 0, E213S211.L36),
([(13, true, false, [106, 158], [388], 94)], 0, E213S211.L37),
([(13, true, false, [106, 158], [388], 95)], 0, E213S211.L38),
([(13, true, false, [106, 158], [388], 96)], 0, E213S211.L39),
([(13, true, false, [106, 158], [388], 102)], 0, E213S211.L40),
([(13, true, false, [106, 158], [388], 108)], 0, E213S211.L41),
([(13, true, false, [106, 158], [388], 109)], 0, E213S211.L42),
([(13, true, false, [106, 158], [388], 110)], 0, E213S211.L43),
([(13, true, false, [106, 158], [388], 111)], 0, E213S211.L44),
([(13, true, false, [106, 158], [388], 112)], 0, E213S211.L45),
([(13, true, false, [106, 158], [388], 119)], 0, E213S211.L46),
([(13, true, false, [106, 158], [388], 124)], 0, E213S211.L47),
([(13, true, false, [106, 158], [388], 127)], 0, E213S211.L48)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 48
end E213S211
