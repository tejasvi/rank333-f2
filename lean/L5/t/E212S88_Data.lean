module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S88 "data/lean/746734748fb1264953cc8e191fb6f5b5/E212S88.bin"
namespace E212S88
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 266, 500], [96], 0)], 0, E212S88.L1),
([(2, true, false, [158, 266, 500], [96], 16)], 0, E212S88.L2),
([(2, true, false, [158, 266, 500], [96], 18)], 0, E212S88.L3),
([(2, true, false, [158, 266, 500], [96], 21)], 0, E212S88.L4),
([(2, true, false, [158, 266, 500], [96], 22)], 0, E212S88.L5),
([(2, true, false, [158, 266, 500], [96], 37)], 0, E212S88.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S88
