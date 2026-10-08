module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S41 "data/lean/ffe11389de4d9264ceb110f3c22b113d/E237S41.bin"
namespace E237S41
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [116, 234], [488], 24)], 23, E237S41.L1),
([(6, true, false, [116, 234], [488], 27)], 0, E237S41.L2),
([(6, true, false, [116, 234], [488], 36)], 0, E237S41.L3),
([(6, true, false, [116, 234], [488], 66)], 0, E237S41.L4),
([(6, true, false, [116, 234], [488], 92)], 0, E237S41.L5),
([(6, true, false, [116, 234], [488], 135)], 0, E237S41.L6),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 12)], 0, E237S41.L7),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 13)], 0, E237S41.L8),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 14)], 0, E237S41.L9),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 15)], 0, E237S41.L10),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 56)], 0, E237S41.L11),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 57)], 0, E237S41.L12),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 58)], 0, E237S41.L13),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 59)], 0, E237S41.L14),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 100)], 0, E237S41.L15),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 101)], 0, E237S41.L16),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 102)], 0, E237S41.L17),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 103)], 0, E237S41.L18),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 240)], 0, E237S41.L19),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 244)], 0, E237S41.L20),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 412)], 0, E237S41.L21),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 414)], 0, E237S41.L22),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 520)], 0, E237S41.L23),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 522)], 0, E237S41.L24),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 692)], 0, E237S41.L25),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 693)], 0, E237S41.L26),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 800)], 0, E237S41.L27),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 804)], 0, E237S41.L28),
([(6, true, false, [116, 234], [488], 24), (4, false, false, [], [354, 508], 972)], 0, E237S41.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E237S41
