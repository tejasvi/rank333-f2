module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S122 "data/lean/3ab1446dda207791fba0e3c01a66d185/E218S122.bin"
namespace E218S122
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 254, 500], [352], 6)], 0, E218S122.L1),
([(6, true, false, [106, 254, 500], [352], 13)], 0, E218S122.L2),
([(6, true, false, [106, 254, 500], [352], 14)], 0, E218S122.L3),
([(6, true, false, [106, 254, 500], [352], 18)], 0, E218S122.L4),
([(6, true, false, [106, 254, 500], [352], 20)], 0, E218S122.L5),
([(6, true, false, [106, 254, 500], [352], 45)], 0, E218S122.L6),
([(6, true, false, [106, 254, 500], [352], 46)], 0, E218S122.L7),
([(6, true, false, [106, 254, 500], [352], 57)], 0, E218S122.L8),
([(6, true, false, [106, 254, 500], [352], 58)], 0, E218S122.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S122
