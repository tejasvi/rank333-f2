module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S113 "data/lean/2144654b43d2a0111aa6f6287810dcaf/E284S113.bin"
namespace E284S113
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 426, 382], [10], 10)], 0, E284S113.L1),
([(3, true, false, [84, 426, 382], [10], 12)], 0, E284S113.L2),
([(3, true, false, [84, 426, 382], [10], 20)], 0, E284S113.L3),
([(3, true, false, [84, 426, 382], [10], 44)], 0, E284S113.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S113
