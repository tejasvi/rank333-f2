module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S180 "data/lean/c1d98acfb10421579f15361d80de326b/E212S180.bin"
namespace E212S180
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [122, 254, 494, 500], [], 0)], 0, E212S180.L1),
([(0, true, false, [122, 254, 494, 500], [], 1)], 0, E212S180.L2),
([(0, true, false, [122, 254, 494, 500], [], 69)], 0, E212S180.L3),
([(0, true, false, [122, 254, 494, 500], [], 71)], 0, E212S180.L4),
([(0, true, false, [122, 254, 494, 500], [], 89)], 0, E212S180.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S180
