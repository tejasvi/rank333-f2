module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S28 "data/lean/97a891c087e9868e71b783cd192718a6/E212S28.bin"
namespace E212S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [], [26, 272], 10)], 0, E212S28.L1),
([(12, true, false, [], [26, 272], 12)], 0, E212S28.L2),
([(12, true, false, [], [26, 272], 15)], 0, E212S28.L3),
([(12, true, false, [], [26, 272], 19)], 0, E212S28.L4),
([(12, true, false, [], [26, 272], 25)], 0, E212S28.L5),
([(12, true, false, [], [26, 272], 113)], 0, E212S28.L6),
([(12, true, false, [], [26, 272], 135)], 0, E212S28.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S28
