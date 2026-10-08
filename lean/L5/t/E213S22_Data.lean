module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S22 "data/lean/6fb70f1ddb1980a47eefd6c156c00fed/E213S22.bin"
namespace E213S22
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [282, 494], [368, 388], 12)], 0, E213S22.L1),
([(15, true, false, [282, 494], [368, 388], 13)], 0, E213S22.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E213S22
