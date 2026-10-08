module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S4 "data/lean/9d7ef705837b1f7f9698d038fc1276e7/E236S4.bin"
namespace E236S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254], [258], 4)], 0, E236S4.L1),
([(10, true, false, [254], [258], 5)], 0, E236S4.L2),
([(10, true, false, [254], [258], 8)], 0, E236S4.L3),
([(10, true, false, [254], [258], 11)], 0, E236S4.L4),
([(10, true, false, [254], [258], 16)], 0, E236S4.L5),
([(10, true, false, [254], [258], 17)], 0, E236S4.L6),
([(10, true, false, [254], [258], 18)], 0, E236S4.L7),
([(10, true, false, [254], [258], 22)], 0, E236S4.L8),
([(10, true, false, [254], [258], 23)], 0, E236S4.L9),
([(10, true, false, [254], [258], 43)], 0, E236S4.L10),
([(10, true, false, [254], [258], 45)], 13, E236S4.L11),
([(10, true, false, [254], [258], 48)], 0, E236S4.L12),
([(10, true, false, [254], [258], 49)], 0, E236S4.L13),
([(10, true, false, [254], [258], 53)], 0, E236S4.L14),
([(10, true, false, [254], [258], 57)], 0, E236S4.L15),
([(10, true, false, [254], [258], 81)], 0, E236S4.L16),
([(10, true, false, [254], [258], 115)], 0, E236S4.L17),
([(10, true, false, [254], [258], 125)], 0, E236S4.L18),
([(10, true, false, [254], [258], 139)], 0, E236S4.L19),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 12)], 0, E236S4.L20),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 516)], 0, E236S4.L21),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 596)], 0, E236S4.L22),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 804)], 0, E236S4.L23),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1024)], 0, E236S4.L24),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1224)], 0, E236S4.L25),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1244)], 0, E236S4.L26),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1352)], 0, E236S4.L27),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1648)], 0, E236S4.L28),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1764)], 0, E236S4.L29),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1832)], 0, E236S4.L30),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 1976)], 0, E236S4.L31),
([(10, true, false, [254], [258], 45), (3, false, false, [], [258, 276, 372], 2052)], 0, E236S4.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E236S4
