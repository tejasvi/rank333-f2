module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S125 "data/lean/adfc3e3a05665aa86e45a6b56728f3a7/E213S125.bin"
namespace E213S125
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [282, 244], [10], 1)], 0, E213S125.L1),
([(14, true, false, [282, 244], [10], 20)], 0, E213S125.L2),
([(14, true, false, [282, 244], [10], 21)], 0, E213S125.L3),
([(14, true, false, [282, 244], [10], 24)], 0, E213S125.L4),
([(14, true, false, [282, 244], [10], 27)], 0, E213S125.L5),
([(14, true, false, [282, 244], [10], 40)], 0, E213S125.L6),
([(14, true, false, [282, 244], [10], 60)], 0, E213S125.L7),
([(14, true, false, [282, 244], [10], 68)], 0, E213S125.L8),
([(14, true, false, [282, 244], [10], 69)], 0, E213S125.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S125
