module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S172 "data/lean/035308705de2178efa66165feda2165b/E213S172.bin"
namespace E213S172
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 282, 494], [272], 18)], 0, E213S172.L1),
([(6, true, false, [106, 282, 494], [272], 20)], 0, E213S172.L2),
([(6, true, false, [106, 282, 494], [272], 40)], 0, E213S172.L3),
([(6, true, false, [106, 282, 494], [272], 53)], 0, E213S172.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S172
