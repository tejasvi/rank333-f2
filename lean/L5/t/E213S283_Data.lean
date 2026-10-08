module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S283 "data/lean/16b40734ff2d9388e3d7db5bdcaa2600/E213S283.bin"
namespace E213S283
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 244, 254, 494], [], 5)], 0, E213S283.L1),
([(7, true, false, [158, 244, 254, 494], [], 69)], 0, E213S283.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S283
