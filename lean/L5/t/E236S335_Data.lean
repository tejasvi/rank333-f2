module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S335 "data/lean/f3f092a0f1a19645c224aa008170d670/E236S335.bin"
namespace E236S335
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158], [258, 276], 2)], 0, E236S335.L1),
([(2, true, false, [158], [258, 276], 4)], 0, E236S335.L2),
([(2, true, false, [158], [258, 276], 6)], 0, E236S335.L3),
([(2, true, false, [158], [258, 276], 8)], 0, E236S335.L4),
([(2, true, false, [158], [258, 276], 10)], 0, E236S335.L5),
([(2, true, false, [158], [258, 276], 12)], 0, E236S335.L6),
([(2, true, false, [158], [258, 276], 14)], 0, E236S335.L7),
([(2, true, false, [158], [258, 276], 16)], 0, E236S335.L8),
([(2, true, false, [158], [258, 276], 18)], 0, E236S335.L9),
([(2, true, false, [158], [258, 276], 20)], 0, E236S335.L10),
([(2, true, false, [158], [258, 276], 24)], 0, E236S335.L11),
([(2, true, false, [158], [258, 276], 27)], 0, E236S335.L12),
([(2, true, false, [158], [258, 276], 36)], 0, E236S335.L13),
([(2, true, false, [158], [258, 276], 37)], 0, E236S335.L14),
([(2, true, false, [158], [258, 276], 41)], 0, E236S335.L15),
([(2, true, false, [158], [258, 276], 46)], 0, E236S335.L16),
([(2, true, false, [158], [258, 276], 48)], 0, E236S335.L17),
([(2, true, false, [158], [258, 276], 51)], 0, E236S335.L18),
([(2, true, false, [158], [258, 276], 53)], 0, E236S335.L19),
([(2, true, false, [158], [258, 276], 54)], 0, E236S335.L20),
([(2, true, false, [158], [258, 276], 56)], 0, E236S335.L21),
([(2, true, false, [158], [258, 276], 58)], 0, E236S335.L22),
([(2, true, false, [158], [258, 276], 61)], 0, E236S335.L23),
([(2, true, false, [158], [258, 276], 62)], 0, E236S335.L24),
([(2, true, false, [158], [258, 276], 69)], 0, E236S335.L25),
([(2, true, false, [158], [258, 276], 72)], 0, E236S335.L26),
([(2, true, false, [158], [258, 276], 74)], 0, E236S335.L27),
([(2, true, false, [158], [258, 276], 79)], 0, E236S335.L28),
([(2, true, false, [158], [258, 276], 82)], 0, E236S335.L29),
([(2, true, false, [158], [258, 276], 86)], 0, E236S335.L30),
([(2, true, false, [158], [258, 276], 87)], 0, E236S335.L31),
([(2, true, false, [158], [258, 276], 88)], 0, E236S335.L32),
([(2, true, false, [158], [258, 276], 90)], 0, E236S335.L33),
([(2, true, false, [158], [258, 276], 91)], 0, E236S335.L34),
([(2, true, false, [158], [258, 276], 93)], 0, E236S335.L35),
([(2, true, false, [158], [258, 276], 96)], 0, E236S335.L36),
([(2, true, false, [158], [258, 276], 97)], 0, E236S335.L37),
([(2, true, false, [158], [258, 276], 100)], 0, E236S335.L38),
([(2, true, false, [158], [258, 276], 101)], 0, E236S335.L39),
([(2, true, false, [158], [258, 276], 110)], 0, E236S335.L40),
([(2, true, false, [158], [258, 276], 111)], 0, E236S335.L41),
([(2, true, false, [158], [258, 276], 116)], 0, E236S335.L42),
([(2, true, false, [158], [258, 276], 120)], 0, E236S335.L43),
([(2, true, false, [158], [258, 276], 130)], 0, E236S335.L44),
([(2, true, false, [158], [258, 276], 131)], 0, E236S335.L45),
([(2, true, false, [158], [258, 276], 134)], 0, E236S335.L46),
([(2, true, false, [158], [258, 276], 135)], 0, E236S335.L47),
([(2, true, false, [158], [258, 276], 145)], 0, E236S335.L48),
([(2, true, false, [158], [258, 276], 146)], 0, E236S335.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 49
end E236S335
