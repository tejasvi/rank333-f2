module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S15 "data/lean/352ae8f18a3d250308b8be53176ca3fb/E212S15.bin"
namespace E212S15
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494], [272], 1)], 0, E212S15.L1),
([(2, true, false, [266, 494], [272], 2)], 0, E212S15.L2),
([(2, true, false, [266, 494], [272], 3)], 0, E212S15.L3),
([(2, true, false, [266, 494], [272], 12)], 0, E212S15.L4),
([(2, true, false, [266, 494], [272], 13)], 0, E212S15.L5),
([(2, true, false, [266, 494], [272], 14)], 0, E212S15.L6),
([(2, true, false, [266, 494], [272], 15)], 0, E212S15.L7),
([(2, true, false, [266, 494], [272], 23)], 0, E212S15.L8),
([(2, true, false, [266, 494], [272], 24)], 0, E212S15.L9),
([(2, true, false, [266, 494], [272], 25)], 0, E212S15.L10),
([(2, true, false, [266, 494], [272], 26)], 0, E212S15.L11),
([(2, true, false, [266, 494], [272], 27)], 0, E212S15.L12),
([(2, true, false, [266, 494], [272], 28)], 0, E212S15.L13),
([(2, true, false, [266, 494], [272], 29)], 0, E212S15.L14),
([(2, true, false, [266, 494], [272], 30)], 0, E212S15.L15),
([(2, true, false, [266, 494], [272], 31)], 0, E212S15.L16),
([(2, true, false, [266, 494], [272], 32)], 0, E212S15.L17),
([(2, true, false, [266, 494], [272], 33)], 0, E212S15.L18),
([(2, true, false, [266, 494], [272], 34)], 0, E212S15.L19),
([(2, true, false, [266, 494], [272], 35)], 0, E212S15.L20),
([(2, true, false, [266, 494], [272], 38)], 0, E212S15.L21),
([(2, true, false, [266, 494], [272], 40)], 0, E212S15.L22),
([(2, true, false, [266, 494], [272], 41)], 0, E212S15.L23),
([(2, true, false, [266, 494], [272], 43)], 0, E212S15.L24),
([(2, true, false, [266, 494], [272], 46)], 0, E212S15.L25),
([(2, true, false, [266, 494], [272], 52)], 0, E212S15.L26),
([(2, true, false, [266, 494], [272], 54)], 0, E212S15.L27),
([(2, true, false, [266, 494], [272], 60)], 0, E212S15.L28),
([(2, true, false, [266, 494], [272], 62)], 0, E212S15.L29),
([(2, true, false, [266, 494], [272], 66)], 0, E212S15.L30),
([(2, true, false, [266, 494], [272], 67)], 0, E212S15.L31),
([(2, true, false, [266, 494], [272], 69)], 0, E212S15.L32),
([(2, true, false, [266, 494], [272], 70)], 0, E212S15.L33),
([(2, true, false, [266, 494], [272], 82)], 0, E212S15.L34),
([(2, true, false, [266, 494], [272], 83)], 0, E212S15.L35),
([(2, true, false, [266, 494], [272], 86)], 0, E212S15.L36),
([(2, true, false, [266, 494], [272], 87)], 0, E212S15.L37),
([(2, true, false, [266, 494], [272], 97)], 0, E212S15.L38),
([(2, true, false, [266, 494], [272], 99)], 0, E212S15.L39),
([(2, true, false, [266, 494], [272], 100)], 0, E212S15.L40),
([(2, true, false, [266, 494], [272], 106)], 0, E212S15.L41),
([(2, true, false, [266, 494], [272], 110)], 0, E212S15.L42),
([(2, true, false, [266, 494], [272], 112)], 0, E212S15.L43),
([(2, true, false, [266, 494], [272], 116)], 0, E212S15.L44),
([(2, true, false, [266, 494], [272], 117)], 0, E212S15.L45),
([(2, true, false, [266, 494], [272], 125)], 0, E212S15.L46),
([(2, true, false, [266, 494], [272], 135)], 0, E212S15.L47)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E212S15
