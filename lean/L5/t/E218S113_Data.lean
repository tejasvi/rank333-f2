module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S113 "data/lean/44de505be653b62e48fe3a7229757951/E218S113.bin"
namespace E218S113
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [142, 254], [352], 33)], 0, E218S113.L1),
([(4, true, false, [142, 254], [352], 36)], 0, E218S113.L2),
([(4, true, false, [142, 254], [352], 51)], 0, E218S113.L3),
([(4, true, false, [142, 254], [352], 108)], 0, E218S113.L4),
([(4, true, false, [142, 254], [352], 138)], 0, E218S113.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S113
