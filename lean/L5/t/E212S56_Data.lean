module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S56 "data/lean/81683a30b7bf3ac03b3f616c4a339ecf/E212S56.bin"
namespace E212S56
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [494], [96, 272], 0)], 0, E212S56.L1),
([(2, true, false, [494], [96, 272], 2)], 0, E212S56.L2),
([(2, true, false, [494], [96, 272], 3)], 0, E212S56.L3),
([(2, true, false, [494], [96, 272], 4)], 0, E212S56.L4),
([(2, true, false, [494], [96, 272], 7)], 0, E212S56.L5),
([(2, true, false, [494], [96, 272], 27)], 0, E212S56.L6),
([(2, true, false, [494], [96, 272], 28)], 0, E212S56.L7),
([(2, true, false, [494], [96, 272], 39)], 0, E212S56.L8),
([(2, true, false, [494], [96, 272], 82)], 0, E212S56.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S56
