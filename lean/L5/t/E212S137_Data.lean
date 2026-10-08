module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S137 "data/lean/4cd65087774a3960bb2965d6a8d031cb/E212S137.bin"
namespace E212S137
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 494], [96, 272], 0)], 0, E212S137.L1),
([(2, true, false, [158, 494], [96, 272], 1)], 0, E212S137.L2),
([(2, true, false, [158, 494], [96, 272], 17)], 0, E212S137.L3),
([(2, true, false, [158, 494], [96, 272], 20)], 0, E212S137.L4),
([(2, true, false, [158, 494], [96, 272], 26)], 0, E212S137.L5),
([(2, true, false, [158, 494], [96, 272], 29)], 0, E212S137.L6),
([(2, true, false, [158, 494], [96, 272], 31)], 0, E212S137.L7),
([(2, true, false, [158, 494], [96, 272], 32)], 0, E212S137.L8),
([(2, true, false, [158, 494], [96, 272], 37)], 0, E212S137.L9),
([(2, true, false, [158, 494], [96, 272], 46)], 0, E212S137.L10),
([(2, true, false, [158, 494], [96, 272], 49)], 0, E212S137.L11),
([(2, true, false, [158, 494], [96, 272], 50)], 0, E212S137.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E212S137
