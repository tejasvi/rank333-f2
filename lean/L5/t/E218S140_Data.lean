module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S140 "data/lean/6dd5fdaa406e97b05b5a412b642337a0/E218S140.bin"
namespace E218S140
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [106, 142], [272, 352], 11)], 0, E218S140.L1),
([(3, true, false, [106, 142], [272, 352], 14)], 0, E218S140.L2),
([(3, true, false, [106, 142], [272, 352], 40)], 0, E218S140.L3),
([(3, true, false, [106, 142], [272, 352], 43)], 0, E218S140.L4),
([(3, true, false, [106, 142], [272, 352], 44)], 0, E218S140.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S140
