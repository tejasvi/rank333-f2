module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S142 "data/lean/8bedec5f1e06cf1be94a18f3a39f0489/E284S142.bin"
namespace E284S142
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [340, 394, 426], [10, 42], 0)], 0, E284S142.L1),
([(3, true, false, [340, 394, 426], [10, 42], 2)], 0, E284S142.L2),
([(3, true, false, [340, 394, 426], [10, 42], 10)], 0, E284S142.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S142
