module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S149 "data/lean/ede942f561696aa874acdd1d879bca9d/E284S149.bin"
namespace E284S149
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266, 426], [10], 5)], 0, E284S149.L1),
([(3, true, false, [84, 266, 426], [10], 7)], 0, E284S149.L2),
([(3, true, false, [84, 266, 426], [10], 15)], 0, E284S149.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S149
