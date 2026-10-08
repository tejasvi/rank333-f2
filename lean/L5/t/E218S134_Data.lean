module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S134 "data/lean/0d61a5ee25540681f00d5c2958388997/E218S134.bin"
namespace E218S134
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 494], [414], 5)], 0, E218S134.L1),
([(0, true, false, [106, 142, 494], [414], 12)], 0, E218S134.L2),
([(0, true, false, [106, 142, 494], [414], 20)], 0, E218S134.L3),
([(0, true, false, [106, 142, 494], [414], 23)], 0, E218S134.L4),
([(0, true, false, [106, 142, 494], [414], 50)], 0, E218S134.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S134
