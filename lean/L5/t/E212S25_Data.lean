module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S25 "data/lean/0be2974575d41c38902b76e2c5a4079b/E212S25.bin"
namespace E212S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [], [26, 272], 0)], 0, E212S25.L1),
([(12, true, false, [], [26, 272], 2)], 0, E212S25.L2),
([(12, true, false, [], [26, 272], 8)], 0, E212S25.L3),
([(12, true, false, [], [26, 272], 10)], 0, E212S25.L4),
([(12, true, false, [], [26, 272], 11)], 0, E212S25.L5),
([(12, true, false, [], [26, 272], 12)], 0, E212S25.L6),
([(12, true, false, [], [26, 272], 15)], 0, E212S25.L7),
([(12, true, false, [], [26, 272], 19)], 0, E212S25.L8),
([(12, true, false, [], [26, 272], 25)], 0, E212S25.L9),
([(12, true, false, [], [26, 272], 28)], 0, E212S25.L10),
([(12, true, false, [], [26, 272], 37)], 0, E212S25.L11),
([(12, true, false, [], [26, 272], 59)], 0, E212S25.L12),
([(12, true, false, [], [26, 272], 63)], 0, E212S25.L13),
([(12, true, false, [], [26, 272], 66)], 0, E212S25.L14),
([(12, true, false, [], [26, 272], 71)], 0, E212S25.L15),
([(12, true, false, [], [26, 272], 72)], 0, E212S25.L16),
([(12, true, false, [], [26, 272], 73)], 0, E212S25.L17),
([(12, true, false, [], [26, 272], 80)], 0, E212S25.L18),
([(12, true, false, [], [26, 272], 95)], 0, E212S25.L19),
([(12, true, false, [], [26, 272], 112)], 0, E212S25.L20),
([(12, true, false, [], [26, 272], 113)], 0, E212S25.L21),
([(12, true, false, [], [26, 272], 115)], 0, E212S25.L22),
([(12, true, false, [], [26, 272], 116)], 0, E212S25.L23),
([(12, true, false, [], [26, 272], 119)], 0, E212S25.L24),
([(12, true, false, [], [26, 272], 121)], 0, E212S25.L25),
([(12, true, false, [], [26, 272], 130)], 0, E212S25.L26),
([(12, true, false, [], [26, 272], 135)], 0, E212S25.L27),
([(12, true, false, [], [26, 272], 137)], 0, E212S25.L28),
([(12, true, false, [], [26, 272], 139)], 0, E212S25.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E212S25
