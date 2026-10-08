module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S75 "data/lean/f5a72e3988b9590bc17189d9d6cc6274/E213S75.bin"
namespace E213S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494], [148, 388], 25)], 0, E213S75.L1),
([(4, true, false, [254, 494], [148, 388], 28)], 0, E213S75.L2),
([(4, true, false, [254, 494], [148, 388], 56)], 0, E213S75.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S75
