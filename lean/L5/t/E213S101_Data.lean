module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S101 "data/lean/e0101a6f3179f21a1fe661110abdd0ed/E213S101.bin"
namespace E213S101
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 158, 494], [], 10)], 0, E213S101.L1),
([(6, true, false, [106, 158, 494], [], 37)], 0, E213S101.L2),
([(6, true, false, [106, 158, 494], [], 160)], 0, E213S101.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E213S101
