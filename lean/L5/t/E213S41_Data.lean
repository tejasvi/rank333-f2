module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S41 "data/lean/5006d7631a7a931b11f72c50dc3127ce/E213S41.bin"
namespace E213S41
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 494], [10], 10)], 0, E213S41.L1),
([(0, true, false, [106, 494], [10], 11)], 0, E213S41.L2),
([(0, true, false, [106, 494], [10], 12)], 0, E213S41.L3),
([(0, true, false, [106, 494], [10], 14)], 0, E213S41.L4),
([(0, true, false, [106, 494], [10], 20)], 0, E213S41.L5),
([(0, true, false, [106, 494], [10], 23)], 0, E213S41.L6),
([(0, true, false, [106, 494], [10], 30)], 0, E213S41.L7),
([(0, true, false, [106, 494], [10], 31)], 0, E213S41.L8),
([(0, true, false, [106, 494], [10], 32)], 0, E213S41.L9),
([(0, true, false, [106, 494], [10], 58)], 0, E213S41.L10),
([(0, true, false, [106, 494], [10], 76)], 0, E213S41.L11),
([(0, true, false, [106, 494], [10], 87)], 0, E213S41.L12),
([(0, true, false, [106, 494], [10], 88)], 0, E213S41.L13),
([(0, true, false, [106, 494], [10], 89)], 0, E213S41.L14),
([(0, true, false, [106, 494], [10], 101)], 0, E213S41.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E213S41
