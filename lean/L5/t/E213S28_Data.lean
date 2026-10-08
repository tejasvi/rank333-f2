module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S28 "data/lean/2eca1e3cfff8cff5d5d5ad0baa0c0e4e/E213S28.bin"
namespace E213S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [158, 282], [272, 368], 2)], 0, E213S28.L1),
([(9, true, false, [158, 282], [272, 368], 5)], 0, E213S28.L2),
([(9, true, false, [158, 282], [272, 368], 14)], 0, E213S28.L3),
([(9, true, false, [158, 282], [272, 368], 49)], 0, E213S28.L4),
([(9, true, false, [158, 282], [272, 368], 62)], 0, E213S28.L5),
([(9, true, false, [158, 282], [272, 368], 77)], 0, E213S28.L6),
([(9, true, false, [158, 282], [272, 368], 81)], 0, E213S28.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S28
