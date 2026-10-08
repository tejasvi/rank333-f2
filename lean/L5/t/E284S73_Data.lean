module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S73 "data/lean/68243ffdb3f8246cba48268d709b9de2/E284S73.bin"
namespace E284S73
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [94, 426], [10], 20)], 0, E284S73.L1),
([(9, true, false, [94, 426], [10], 22)], 0, E284S73.L2),
([(9, true, false, [94, 426], [10], 34)], 0, E284S73.L3),
([(9, true, false, [94, 426], [10], 112)], 0, E284S73.L4),
([(9, true, false, [94, 426], [10], 114)], 0, E284S73.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S73
