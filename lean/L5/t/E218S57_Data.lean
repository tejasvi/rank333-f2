module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S57 "data/lean/310e52790e8ef3c2fd12f4ccdc1b267f/E218S57.bin"
namespace E218S57
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [], [26, 272], 0)], 0, E218S57.L1),
([(4, true, false, [], [26, 272], 11)], 0, E218S57.L2),
([(4, true, false, [], [26, 272], 59)], 0, E218S57.L3),
([(4, true, false, [], [26, 272], 72)], 0, E218S57.L4),
([(4, true, false, [], [26, 272], 73)], 0, E218S57.L5),
([(4, true, false, [], [26, 272], 113)], 0, E218S57.L6),
([(4, true, false, [], [26, 272], 137)], 0, E218S57.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E218S57
