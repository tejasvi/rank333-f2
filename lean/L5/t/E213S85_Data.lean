module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S85 "data/lean/e9c90d6d8096a8b773ae4530f74305ad/E213S85.bin"
namespace E213S85
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [494], [484], 40)], 0, E213S85.L1),
([(4, true, false, [494], [484], 43)], 0, E213S85.L2),
([(4, true, false, [494], [484], 49)], 0, E213S85.L3),
([(4, true, false, [494], [484], 51)], 0, E213S85.L4),
([(4, true, false, [494], [484], 55)], 0, E213S85.L5),
([(4, true, false, [494], [484], 78)], 0, E213S85.L6),
([(4, true, false, [494], [484], 79)], 0, E213S85.L7),
([(4, true, false, [494], [484], 81)], 0, E213S85.L8),
([(4, true, false, [494], [484], 82)], 0, E213S85.L9),
([(4, true, false, [494], [484], 85)], 0, E213S85.L10),
([(4, true, false, [494], [484], 117)], 0, E213S85.L11),
([(4, true, false, [494], [484], 123)], 0, E213S85.L12),
([(4, true, false, [494], [484], 147)], 0, E213S85.L13),
([(4, true, false, [494], [484], 175)], 0, E213S85.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S85
