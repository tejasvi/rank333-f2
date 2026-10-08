module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S143 "data/lean/4b030aa9d36901cfcc53faf3498c0e24/E218S143.bin"
namespace E218S143
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [142, 266], [272, 352], 5)], 0, E218S143.L1),
([(3, true, false, [142, 266], [272, 352], 28)], 0, E218S143.L2),
([(3, true, false, [142, 266], [272, 352], 29)], 0, E218S143.L3),
([(3, true, false, [142, 266], [272, 352], 34)], 0, E218S143.L4),
([(3, true, false, [142, 266], [272, 352], 35)], 0, E218S143.L5),
([(3, true, false, [142, 266], [272, 352], 86)], 0, E218S143.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E218S143
