module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S23 "data/lean/4b689978e9bdd919c903f00c4add35c5/E218S23.bin"
namespace E218S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [266], [352], 0)], 0, E218S23.L1),
([(14, true, false, [266], [352], 20)], 0, E218S23.L2),
([(14, true, false, [266], [352], 84)], 0, E218S23.L3),
([(14, true, false, [266], [352], 168)], 0, E218S23.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S23
