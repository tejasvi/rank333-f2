module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S105 "data/lean/438ba636be7be79a2653b3f8083fb348/E218S105.bin"
namespace E218S105
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 494, 500], [112], 0)], 0, E218S105.L1),
([(2, true, false, [106, 494, 500], [112], 2)], 0, E218S105.L2),
([(2, true, false, [106, 494, 500], [112], 22)], 0, E218S105.L3),
([(2, true, false, [106, 494, 500], [112], 38)], 0, E218S105.L4),
([(2, true, false, [106, 494, 500], [112], 49)], 0, E218S105.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S105
