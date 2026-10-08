module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S9 "data/lean/1dc32b15e8d03cbcb35c948ec0b22c3f/E284S9.bin"
namespace E284S9
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [382, 426, 84], [10], 1)], 0, E284S9.L1),
([(9, true, false, [382, 426, 84], [10], 2)], 0, E284S9.L2),
([(9, true, false, [382, 426, 84], [10], 10)], 0, E284S9.L3),
([(9, true, false, [382, 426, 84], [10], 12)], 0, E284S9.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S9
