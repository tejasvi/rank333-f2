module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E237S27 "data/lean/06c86492ff85cc2e843d234e51029fa3/E237S27.bin"
namespace E237S27
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [234, 412], [258, 392], 6)], 14, E237S27.L1),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 24)], 0, E237S27.L2),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 28)], 0, E237S27.L3),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 40)], 0, E237S27.L4),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 44)], 0, E237S27.L5),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 64)], 0, E237S27.L6),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 66)], 0, E237S27.L7),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 104)], 0, E237S27.L8),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 108)], 0, E237S27.L9),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 304)], 0, E237S27.L10),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 348)], 0, E237S27.L11),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 504)], 0, E237S27.L12),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 604)], 0, E237S27.L13),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 770)], 0, E237S27.L14),
([(12, true, false, [234, 412], [258, 392], 6), (4, false, false, [], [258], 812)], 0, E237S27.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E237S27
