module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S40 "data/lean/dfbf49bd4b7d4e274442c0c9a4d87e5b/E213S40.bin"
namespace E213S40
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [494], [484], 1)], 0, E213S40.L1),
([(6, true, false, [494], [484], 68)], 0, E213S40.L2),
([(6, true, false, [494], [484], 82)], 0, E213S40.L3),
([(6, true, false, [494], [484], 84)], 0, E213S40.L4),
([(6, true, false, [494], [484], 162)], 0, E213S40.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S40
