module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S137 "data/lean/3024168e5fbbc17a7aa450246a807e83/E218S137.bin"
namespace E218S137
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 266, 494, 142], [], 0)], 0, E218S137.L1),
([(7, true, false, [254, 266, 494, 142], [], 6)], 0, E218S137.L2),
([(7, true, false, [254, 266, 494, 142], [], 19)], 0, E218S137.L3),
([(7, true, false, [254, 266, 494, 142], [], 88)], 0, E218S137.L4),
([(7, true, false, [254, 266, 494, 142], [], 248)], 0, E218S137.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S137
