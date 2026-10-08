module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S75 "data/lean/84a453d4e96cea9a6cdafbec69e36ce7/E218S75.bin"
namespace E218S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [494, 500], [388], 21)], 0, E218S75.L1),
([(5, true, false, [494, 500], [388], 22)], 0, E218S75.L2),
([(5, true, false, [494, 500], [388], 27)], 0, E218S75.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E218S75
