module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S73 "data/lean/09a229ce8b3141467baf8a650a2befaf/E213S73.bin"
namespace E213S73
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [254, 494], [96, 368], 0)], 0, E213S73.L1),
([(14, true, false, [254, 494], [96, 368], 16)], 0, E213S73.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S73
