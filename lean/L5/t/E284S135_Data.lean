module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S135 "data/lean/13cc7bab728bc308c4d3c324135d927f/E284S135.bin"
namespace E284S135
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [394, 426, 254, 382], [10, 42], 2)], 0, E284S135.L1),
([(3, true, false, [394, 426, 254, 382], [10, 42], 3)], 0, E284S135.L2),
([(3, true, false, [394, 426, 254, 382], [10, 42], 6)], 0, E284S135.L3),
([(3, true, false, [394, 426, 254, 382], [10, 42], 9)], 0, E284S135.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S135
