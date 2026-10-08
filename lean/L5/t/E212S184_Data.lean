module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S184 "data/lean/7354d02f7099a69d7e6bff91dfe1cba4/E212S184.bin"
namespace E212S184
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266, 494], [], 0)], 0, E212S184.L1),
([(0, true, false, [254, 266, 494], [], 1)], 0, E212S184.L2),
([(0, true, false, [254, 266, 494], [], 69)], 0, E212S184.L3),
([(0, true, false, [254, 266, 494], [], 76)], 0, E212S184.L4),
([(0, true, false, [254, 266, 494], [], 84)], 0, E212S184.L5),
([(0, true, false, [254, 266, 494], [], 88)], 0, E212S184.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S184
