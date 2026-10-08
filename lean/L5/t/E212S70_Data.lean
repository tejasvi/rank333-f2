module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S70 "data/lean/f893624555fc0404559d371c687384bf/E212S70.bin"
namespace E212S70
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494], [96], 1)], 0, E212S70.L1),
([(2, true, false, [266, 494], [96], 4)], 0, E212S70.L2),
([(2, true, false, [266, 494], [96], 21)], 0, E212S70.L3),
([(2, true, false, [266, 494], [96], 22)], 0, E212S70.L4),
([(2, true, false, [266, 494], [96], 23)], 0, E212S70.L5),
([(2, true, false, [266, 494], [96], 24)], 0, E212S70.L6),
([(2, true, false, [266, 494], [96], 25)], 0, E212S70.L7),
([(2, true, false, [266, 494], [96], 27)], 0, E212S70.L8),
([(2, true, false, [266, 494], [96], 28)], 0, E212S70.L9),
([(2, true, false, [266, 494], [96], 29)], 0, E212S70.L10),
([(2, true, false, [266, 494], [96], 30)], 0, E212S70.L11),
([(2, true, false, [266, 494], [96], 31)], 0, E212S70.L12),
([(2, true, false, [266, 494], [96], 35)], 0, E212S70.L13),
([(2, true, false, [266, 494], [96], 41)], 0, E212S70.L14),
([(2, true, false, [266, 494], [96], 46)], 0, E212S70.L15),
([(2, true, false, [266, 494], [96], 53)], 0, E212S70.L16),
([(2, true, false, [266, 494], [96], 57)], 0, E212S70.L17),
([(2, true, false, [266, 494], [96], 67)], 0, E212S70.L18),
([(2, true, false, [266, 494], [96], 73)], 0, E212S70.L19),
([(2, true, false, [266, 494], [96], 79)], 0, E212S70.L20),
([(2, true, false, [266, 494], [96], 85)], 0, E212S70.L21),
([(2, true, false, [266, 494], [96], 87)], 0, E212S70.L22),
([(2, true, false, [266, 494], [96], 93)], 0, E212S70.L23),
([(2, true, false, [266, 494], [96], 94)], 0, E212S70.L24),
([(2, true, false, [266, 494], [96], 95)], 0, E212S70.L25),
([(2, true, false, [266, 494], [96], 96)], 0, E212S70.L26),
([(2, true, false, [266, 494], [96], 97)], 0, E212S70.L27),
([(2, true, false, [266, 494], [96], 100)], 0, E212S70.L28),
([(2, true, false, [266, 494], [96], 104)], 0, E212S70.L29),
([(2, true, false, [266, 494], [96], 105)], 0, E212S70.L30),
([(2, true, false, [266, 494], [96], 106)], 0, E212S70.L31),
([(2, true, false, [266, 494], [96], 107)], 0, E212S70.L32),
([(2, true, false, [266, 494], [96], 108)], 0, E212S70.L33),
([(2, true, false, [266, 494], [96], 119)], 0, E212S70.L34),
([(2, true, false, [266, 494], [96], 123)], 0, E212S70.L35),
([(2, true, false, [266, 494], [96], 129)], 0, E212S70.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E212S70
