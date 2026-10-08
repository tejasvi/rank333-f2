module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S187 "data/lean/551d541d44307fccfdb8562713a85906/E212S187.bin"
namespace E212S187
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [158, 254, 500, 494], [], 0)], 0, E212S187.L1),
([(11, true, false, [158, 254, 500, 494], [], 6)], 0, E212S187.L2),
([(11, true, false, [158, 254, 500, 494], [], 10)], 0, E212S187.L3),
([(11, true, false, [158, 254, 500, 494], [], 12)], 0, E212S187.L4),
([(11, true, false, [158, 254, 500, 494], [], 17)], 0, E212S187.L5),
([(11, true, false, [158, 254, 500, 494], [], 71)], 0, E212S187.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S187
