module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S153 "data/lean/755bf6a057403ba45d751244eb1aba17/E218S153.bin"
namespace E218S153
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [494, 106], [272, 352], 0)], 0, E218S153.L1),
([(10, true, false, [494, 106], [272, 352], 2)], 0, E218S153.L2),
([(10, true, false, [494, 106], [272, 352], 82)], 0, E218S153.L3),
([(10, true, false, [494, 106], [272, 352], 91)], 0, E218S153.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S153
