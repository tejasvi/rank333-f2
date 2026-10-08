module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S353 "data/lean/83e8b97ae34ce15c50c82fbbf20e5210/E284S353.bin"
namespace E284S353
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [298, 340, 426, 468, 84, 212], [], 46)], 0, E284S353.L1),
([(2, true, false, [298, 340, 426, 468, 84, 212], [], 48)], 0, E284S353.L2),
([(2, true, false, [298, 340, 426, 468, 84, 212], [], 75)], 0, E284S353.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S353
