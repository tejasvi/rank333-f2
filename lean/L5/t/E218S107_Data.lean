module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S107 "data/lean/a8afcebcca2e92a45d4f650984075f0d/E218S107.bin"
namespace E218S107
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [106, 254, 500], [352], 0)], 0, E218S107.L1),
([(4, true, false, [106, 254, 500], [352], 1)], 0, E218S107.L2),
([(4, true, false, [106, 254, 500], [352], 5)], 0, E218S107.L3),
([(4, true, false, [106, 254, 500], [352], 9)], 0, E218S107.L4),
([(4, true, false, [106, 254, 500], [352], 13)], 0, E218S107.L5),
([(4, true, false, [106, 254, 500], [352], 15)], 0, E218S107.L6),
([(4, true, false, [106, 254, 500], [352], 62)], 0, E218S107.L7),
([(4, true, false, [106, 254, 500], [352], 70)], 0, E218S107.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E218S107
