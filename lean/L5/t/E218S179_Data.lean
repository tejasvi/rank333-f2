module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S179 "data/lean/c57766c7d4ca78b397c0ba5267b6168b/E218S179.bin"
namespace E218S179
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [142, 266, 494], [272], 13)], 0, E218S179.L1),
([(1, true, false, [142, 266, 494], [272], 15)], 0, E218S179.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E218S179
