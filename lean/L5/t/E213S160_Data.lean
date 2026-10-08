module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S160 "data/lean/6a9c54e6dc5e2b30fb6d1793279e38a9/E213S160.bin"
namespace E213S160
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [106, 244], [368], 2)], 0, E213S160.L1),
([(5, true, false, [106, 244], [368], 45)], 0, E213S160.L2),
([(5, true, false, [106, 244], [368], 80)], 0, E213S160.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S160
