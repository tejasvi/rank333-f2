module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S62 "data/lean/ea4d7c059727c6d94dcf43433fcd9707/E218S62.bin"
namespace E218S62
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106], [148, 272], 4)], 0, E218S62.L1),
([(2, true, false, [106], [148, 272], 26)], 0, E218S62.L2),
([(2, true, false, [106], [148, 272], 47)], 0, E218S62.L3),
([(2, true, false, [106], [148, 272], 49)], 0, E218S62.L4),
([(2, true, false, [106], [148, 272], 62)], 0, E218S62.L5),
([(2, true, false, [106], [148, 272], 72)], 0, E218S62.L6),
([(2, true, false, [106], [148, 272], 75)], 0, E218S62.L7),
([(2, true, false, [106], [148, 272], 88)], 0, E218S62.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E218S62
