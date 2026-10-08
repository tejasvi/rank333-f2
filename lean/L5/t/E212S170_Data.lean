module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S170 "data/lean/24794841f91579f9ab92612fe4871523/E212S170.bin"
namespace E212S170
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [122, 158, 494], [96], 0)], 0, E212S170.L1),
([(1, true, false, [122, 158, 494], [96], 2)], 0, E212S170.L2),
([(1, true, false, [122, 158, 494], [96], 5)], 0, E212S170.L3),
([(1, true, false, [122, 158, 494], [96], 6)], 0, E212S170.L4),
([(1, true, false, [122, 158, 494], [96], 7)], 0, E212S170.L5),
([(1, true, false, [122, 158, 494], [96], 8)], 0, E212S170.L6),
([(1, true, false, [122, 158, 494], [96], 11)], 0, E212S170.L7),
([(1, true, false, [122, 158, 494], [96], 12)], 0, E212S170.L8),
([(1, true, false, [122, 158, 494], [96], 13)], 0, E212S170.L9),
([(1, true, false, [122, 158, 494], [96], 15)], 0, E212S170.L10),
([(1, true, false, [122, 158, 494], [96], 17)], 0, E212S170.L11),
([(1, true, false, [122, 158, 494], [96], 21)], 0, E212S170.L12),
([(1, true, false, [122, 158, 494], [96], 22)], 0, E212S170.L13),
([(1, true, false, [122, 158, 494], [96], 25)], 0, E212S170.L14),
([(1, true, false, [122, 158, 494], [96], 27)], 0, E212S170.L15),
([(1, true, false, [122, 158, 494], [96], 32)], 0, E212S170.L16),
([(1, true, false, [122, 158, 494], [96], 33)], 0, E212S170.L17),
([(1, true, false, [122, 158, 494], [96], 35)], 0, E212S170.L18),
([(1, true, false, [122, 158, 494], [96], 38)], 0, E212S170.L19),
([(1, true, false, [122, 158, 494], [96], 46)], 0, E212S170.L20),
([(1, true, false, [122, 158, 494], [96], 47)], 0, E212S170.L21),
([(1, true, false, [122, 158, 494], [96], 49)], 0, E212S170.L22),
([(1, true, false, [122, 158, 494], [96], 54)], 0, E212S170.L23),
([(1, true, false, [122, 158, 494], [96], 60)], 0, E212S170.L24),
([(1, true, false, [122, 158, 494], [96], 63)], 0, E212S170.L25),
([(1, true, false, [122, 158, 494], [96], 65)], 0, E212S170.L26),
([(1, true, false, [122, 158, 494], [96], 67)], 0, E212S170.L27),
([(1, true, false, [122, 158, 494], [96], 68)], 0, E212S170.L28),
([(1, true, false, [122, 158, 494], [96], 70)], 0, E212S170.L29),
([(1, true, false, [122, 158, 494], [96], 71)], 0, E212S170.L30),
([(1, true, false, [122, 158, 494], [96], 72)], 0, E212S170.L31),
([(1, true, false, [122, 158, 494], [96], 73)], 0, E212S170.L32),
([(1, true, false, [122, 158, 494], [96], 74)], 0, E212S170.L33),
([(1, true, false, [122, 158, 494], [96], 75)], 0, E212S170.L34),
([(1, true, false, [122, 158, 494], [96], 76)], 0, E212S170.L35),
([(1, true, false, [122, 158, 494], [96], 77)], 0, E212S170.L36),
([(1, true, false, [122, 158, 494], [96], 78)], 0, E212S170.L37),
([(1, true, false, [122, 158, 494], [96], 80)], 0, E212S170.L38),
([(1, true, false, [122, 158, 494], [96], 82)], 0, E212S170.L39),
([(1, true, false, [122, 158, 494], [96], 85)], 0, E212S170.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 40
end E212S170
