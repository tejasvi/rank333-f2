module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S54 "data/lean/861d4d3e45ce4234f8f21e6853893062/E218S54.bin"
namespace E218S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [106], [352], 0)], 0, E218S54.L1),
([(9, true, false, [106], [352], 1)], 0, E218S54.L2),
([(9, true, false, [106], [352], 3)], 0, E218S54.L3),
([(9, true, false, [106], [352], 50)], 0, E218S54.L4),
([(9, true, false, [106], [352], 51)], 0, E218S54.L5),
([(9, true, false, [106], [352], 53)], 0, E218S54.L6),
([(9, true, false, [106], [352], 54)], 0, E218S54.L7),
([(9, true, false, [106], [352], 56)], 0, E218S54.L8),
([(9, true, false, [106], [352], 96)], 0, E218S54.L9),
([(9, true, false, [106], [352], 97)], 0, E218S54.L10),
([(9, true, false, [106], [352], 114)], 0, E218S54.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E218S54
