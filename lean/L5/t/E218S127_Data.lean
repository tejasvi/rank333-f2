module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S127 "data/lean/c8fe8280b5d1d277cb0a3583863067d7/E218S127.bin"
namespace E218S127
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [142, 266, 494], [378], 4)], 0, E218S127.L1),
([(0, true, false, [142, 266, 494], [378], 7)], 0, E218S127.L2),
([(0, true, false, [142, 266, 494], [378], 46)], 0, E218S127.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E218S127
