module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S145 "data/lean/e5af07f3980a8eaab75e3546267cd0c8/E212S145.bin"
namespace E212S145
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494], [96], 1)], 0, E212S145.L1),
([(2, true, false, [266, 494], [96], 4)], 0, E212S145.L2),
([(2, true, false, [266, 494], [96], 31)], 0, E212S145.L3),
([(2, true, false, [266, 494], [96], 35)], 0, E212S145.L4),
([(2, true, false, [266, 494], [96], 46)], 0, E212S145.L5),
([(2, true, false, [266, 494], [96], 53)], 0, E212S145.L6),
([(2, true, false, [266, 494], [96], 79)], 0, E212S145.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S145
