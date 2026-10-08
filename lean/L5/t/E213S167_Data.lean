module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S167 "data/lean/7041c250468eee25929613cf235aee34/E213S167.bin"
namespace E213S167
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 282, 494], [], 15)], 0, E213S167.L1),
([(6, true, false, [106, 282, 494], [], 17)], 0, E213S167.L2),
([(6, true, false, [106, 282, 494], [], 44)], 0, E213S167.L3),
([(6, true, false, [106, 282, 494], [], 45)], 0, E213S167.L4),
([(6, true, false, [106, 282, 494], [], 46)], 0, E213S167.L5),
([(6, true, false, [106, 282, 494], [], 47)], 0, E213S167.L6),
([(6, true, false, [106, 282, 494], [], 48)], 0, E213S167.L7),
([(6, true, false, [106, 282, 494], [], 59)], 0, E213S167.L8),
([(6, true, false, [106, 282, 494], [], 115)], 0, E213S167.L9),
([(6, true, false, [106, 282, 494], [], 165)], 0, E213S167.L10),
([(6, true, false, [106, 282, 494], [], 171)], 0, E213S167.L11),
([(6, true, false, [106, 282, 494], [], 178)], 0, E213S167.L12),
([(6, true, false, [106, 282, 494], [], 181)], 0, E213S167.L13),
([(6, true, false, [106, 282, 494], [], 211)], 0, E213S167.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S167
