module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S141 "data/lean/93ca33f5104198aeb9c7e4483ef71fca/E284S141.bin"
namespace E284S141
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [298, 426, 468], [10, 138], 0)], 0, E284S141.L1),
([(3, true, false, [298, 426, 468], [10, 138], 10)], 0, E284S141.L2),
([(3, true, false, [298, 426, 468], [10, 138], 27)], 0, E284S141.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S141
