module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S53 "data/lean/40cde1b56bfbb1e1b1ffbf6a447864c2/E213S53.bin"
namespace E213S53
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [494], [272, 368], 4)], 0, E213S53.L1),
([(15, true, false, [494], [272, 368], 7)], 0, E213S53.L2),
([(15, true, false, [494], [272, 368], 8)], 0, E213S53.L3),
([(15, true, false, [494], [272, 368], 11)], 0, E213S53.L4),
([(15, true, false, [494], [272, 368], 27)], 0, E213S53.L5),
([(15, true, false, [494], [272, 368], 28)], 0, E213S53.L6),
([(15, true, false, [494], [272, 368], 31)], 0, E213S53.L7),
([(15, true, false, [494], [272, 368], 32)], 0, E213S53.L8),
([(15, true, false, [494], [272, 368], 85)], 0, E213S53.L9),
([(15, true, false, [494], [272, 368], 89)], 0, E213S53.L10),
([(15, true, false, [494], [272, 368], 90)], 0, E213S53.L11),
([(15, true, false, [494], [272, 368], 92)], 0, E213S53.L12),
([(15, true, false, [494], [272, 368], 95)], 0, E213S53.L13),
([(15, true, false, [494], [272, 368], 125)], 0, E213S53.L14),
([(15, true, false, [494], [272, 368], 128)], 0, E213S53.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E213S53
