module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S53 "data/lean/2d812727d56dbc9986c2f0eb1395b9b0/E212S53.bin"
namespace E212S53
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494], [272, 368], 0)], 0, E212S53.L1),
([(15, true, false, [494], [272, 368], 5)], 0, E212S53.L2),
([(15, true, false, [494], [272, 368], 7)], 0, E212S53.L3),
([(15, true, false, [494], [272, 368], 8)], 0, E212S53.L4),
([(15, true, false, [494], [272, 368], 9)], 0, E212S53.L5),
([(15, true, false, [494], [272, 368], 10)], 0, E212S53.L6),
([(15, true, false, [494], [272, 368], 11)], 0, E212S53.L7),
([(15, true, false, [494], [272, 368], 12)], 0, E212S53.L8),
([(15, true, false, [494], [272, 368], 13)], 0, E212S53.L9),
([(15, true, false, [494], [272, 368], 14)], 0, E212S53.L10),
([(15, true, false, [494], [272, 368], 16)], 0, E212S53.L11),
([(15, true, false, [494], [272, 368], 26)], 0, E212S53.L12),
([(15, true, false, [494], [272, 368], 28)], 0, E212S53.L13),
([(15, true, false, [494], [272, 368], 31)], 0, E212S53.L14),
([(15, true, false, [494], [272, 368], 32)], 0, E212S53.L15),
([(15, true, false, [494], [272, 368], 85)], 0, E212S53.L16),
([(15, true, false, [494], [272, 368], 89)], 0, E212S53.L17),
([(15, true, false, [494], [272, 368], 90)], 0, E212S53.L18),
([(15, true, false, [494], [272, 368], 92)], 0, E212S53.L19),
([(15, true, false, [494], [272, 368], 95)], 0, E212S53.L20),
([(15, true, false, [494], [272, 368], 110)], 0, E212S53.L21),
([(15, true, false, [494], [272, 368], 112)], 0, E212S53.L22),
([(15, true, false, [494], [272, 368], 125)], 0, E212S53.L23),
([(15, true, false, [494], [272, 368], 126)], 0, E212S53.L24),
([(15, true, false, [494], [272, 368], 128)], 0, E212S53.L25),
([(15, true, false, [494], [272, 368], 131)], 0, E212S53.L26),
([(15, true, false, [494], [272, 368], 132)], 0, E212S53.L27),
([(15, true, false, [494], [272, 368], 135)], 0, E212S53.L28),
([(15, true, false, [494], [272, 368], 146)], 0, E212S53.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E212S53
