module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S138 "data/lean/7715cecccb6b4659e0e9e35eba329b42/E218S138.bin"
namespace E218S138
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [494, 500], [352], 1)], 0, E218S138.L1),
([(6, true, false, [494, 500], [352], 4)], 0, E218S138.L2),
([(6, true, false, [494, 500], [352], 49)], 0, E218S138.L3),
([(6, true, false, [494, 500], [352], 85)], 0, E218S138.L4),
([(6, true, false, [494, 500], [352], 86)], 0, E218S138.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S138
