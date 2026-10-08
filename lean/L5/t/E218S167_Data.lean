module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S167 "data/lean/7beeab957d4fe4aca4b8dfdeac518066/E218S167.bin"
namespace E218S167
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [266, 500, 494], [352], 0)], 0, E218S167.L1),
([(11, true, false, [266, 500, 494], [352], 2)], 0, E218S167.L2),
([(11, true, false, [266, 500, 494], [352], 4)], 0, E218S167.L3),
([(11, true, false, [266, 500, 494], [352], 42)], 0, E218S167.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S167
