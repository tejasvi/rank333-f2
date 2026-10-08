module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S198 "data/lean/e7c38bdfbf1cb6d4624e68705602e148/E284S198.bin"
namespace E284S198
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [212, 382], [10, 42], 1)], 0, E284S198.L1),
([(2, true, false, [212, 382], [10, 42], 5)], 0, E284S198.L2),
([(2, true, false, [212, 382], [10, 42], 9)], 0, E284S198.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S198
