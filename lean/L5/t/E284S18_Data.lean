module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S18 "data/lean/f2b06fc105181872c4d4d1ed8ee98f42/E284S18.bin"
namespace E284S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [426, 478, 84], [10], 10)], 0, E284S18.L1),
([(9, true, false, [426, 478, 84], [10], 20)], 0, E284S18.L2),
([(9, true, false, [426, 478, 84], [10], 30)], 0, E284S18.L3),
([(9, true, false, [426, 478, 84], [10], 34)], 0, E284S18.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S18
