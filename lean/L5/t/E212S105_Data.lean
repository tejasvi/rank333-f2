module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S105 "data/lean/c1f409c9da0ba78319cdc95c77320f18/E212S105.bin"
namespace E212S105
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 494, 500], [96], 0)], 0, E212S105.L1),
([(2, true, false, [122, 494, 500], [96], 2)], 0, E212S105.L2),
([(2, true, false, [122, 494, 500], [96], 5)], 0, E212S105.L3),
([(2, true, false, [122, 494, 500], [96], 6)], 0, E212S105.L4),
([(2, true, false, [122, 494, 500], [96], 7)], 0, E212S105.L5),
([(2, true, false, [122, 494, 500], [96], 8)], 0, E212S105.L6),
([(2, true, false, [122, 494, 500], [96], 9)], 0, E212S105.L7),
([(2, true, false, [122, 494, 500], [96], 10)], 0, E212S105.L8),
([(2, true, false, [122, 494, 500], [96], 11)], 0, E212S105.L9),
([(2, true, false, [122, 494, 500], [96], 12)], 0, E212S105.L10),
([(2, true, false, [122, 494, 500], [96], 21)], 5, E212S105.L11),
([(2, true, false, [122, 494, 500], [96], 23)], 0, E212S105.L12),
([(2, true, false, [122, 494, 500], [96], 28)], 0, E212S105.L13),
([(2, true, false, [122, 494, 500], [96], 29)], 0, E212S105.L14),
([(2, true, false, [122, 494, 500], [96], 30)], 0, E212S105.L15),
([(2, true, false, [122, 494, 500], [96], 31)], 0, E212S105.L16),
([(2, true, false, [122, 494, 500], [96], 43)], 0, E212S105.L17),
([(2, true, false, [122, 494, 500], [96], 47)], 0, E212S105.L18),
([(2, true, false, [122, 494, 500], [96], 50)], 0, E212S105.L19),
([(2, true, false, [122, 494, 500], [96], 51)], 0, E212S105.L20),
([(2, true, false, [122, 494, 500], [96], 52)], 0, E212S105.L21),
([(2, true, false, [122, 494, 500], [96], 54)], 0, E212S105.L22),
([(2, true, false, [122, 494, 500], [96], 55)], 0, E212S105.L23),
([(2, true, false, [122, 494, 500], [96], 58)], 0, E212S105.L24),
([(2, true, false, [122, 494, 500], [96], 59)], 0, E212S105.L25),
([(2, true, false, [122, 494, 500], [96], 60)], 0, E212S105.L26),
([(2, true, false, [122, 494, 500], [96], 61)], 0, E212S105.L27),
([(2, true, false, [122, 494, 500], [96], 66)], 0, E212S105.L28),
([(2, true, false, [122, 494, 500], [96], 67)], 0, E212S105.L29),
([(2, true, false, [122, 494, 500], [96], 68)], 0, E212S105.L30),
([(2, true, false, [122, 494, 500], [96], 69)], 0, E212S105.L31),
([(2, true, false, [122, 494, 500], [96], 70)], 0, E212S105.L32),
([(2, true, false, [122, 494, 500], [96], 71)], 0, E212S105.L33),
([(2, true, false, [122, 494, 500], [96], 72)], 0, E212S105.L34),
([(2, true, false, [122, 494, 500], [96], 74)], 0, E212S105.L35),
([(2, true, false, [122, 494, 500], [96], 76)], 0, E212S105.L36),
([(2, true, false, [122, 494, 500], [96], 21), (3, false, false, [], [96], 64)], 0, E212S105.L37),
([(2, true, false, [122, 494, 500], [96], 21), (3, false, false, [], [96], 66)], 0, E212S105.L38),
([(2, true, false, [122, 494, 500], [96], 21), (3, false, false, [], [96], 136)], 0, E212S105.L39),
([(2, true, false, [122, 494, 500], [96], 21), (3, false, false, [], [96], 138)], 0, E212S105.L40),
([(2, true, false, [122, 494, 500], [96], 21), (3, false, false, [], [96], 208)], 0, E212S105.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E212S105
