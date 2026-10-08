module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S14 "data/lean/df7384a3c195c18813cfad46e7e641ed/E213S14.bin"
namespace E213S14
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [494], [148, 388], 24)], 0, E213S14.L1),
([(4, true, false, [494], [148, 388], 27)], 0, E213S14.L2),
([(4, true, false, [494], [148, 388], 68)], 0, E213S14.L3),
([(4, true, false, [494], [148, 388], 71)], 0, E213S14.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S14
