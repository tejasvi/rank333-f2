module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S143 "data/lean/39d05d65b6036c2f8f9b67d4085f334b/E284S143.bin"
namespace E284S143
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [394, 426, 468], [10, 42], 0)], 0, E284S143.L1),
([(3, true, false, [394, 426, 468], [10, 42], 2)], 0, E284S143.L2),
([(3, true, false, [394, 426, 468], [10, 42], 4)], 0, E284S143.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S143
