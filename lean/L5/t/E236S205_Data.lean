module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S205 "data/lean/310c8a5cf8cd78fd604f8ccc57f080fd/E236S205.bin"
namespace E236S205
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [254, 412], [276], 21)], 0, E236S205.L1),
([(5, true, false, [254, 412], [276], 24)], 0, E236S205.L2),
([(5, true, false, [254, 412], [276], 36)], 0, E236S205.L3),
([(5, true, false, [254, 412], [276], 40)], 0, E236S205.L4),
([(5, true, false, [254, 412], [276], 67)], 0, E236S205.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S205
