module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S246 "data/lean/4a2f910cd979c4d19ce4fb8c1f982087/E213S246.bin"
namespace E213S246
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 254, 494], [], 0)], 0, E213S246.L1),
([(0, true, false, [106, 158, 254, 494], [], 37)], 0, E213S246.L2),
([(0, true, false, [106, 158, 254, 494], [], 39)], 0, E213S246.L3),
([(0, true, false, [106, 158, 254, 494], [], 40)], 0, E213S246.L4),
([(0, true, false, [106, 158, 254, 494], [], 41)], 0, E213S246.L5),
([(0, true, false, [106, 158, 254, 494], [], 44)], 0, E213S246.L6),
([(0, true, false, [106, 158, 254, 494], [], 45)], 0, E213S246.L7),
([(0, true, false, [106, 158, 254, 494], [], 46)], 0, E213S246.L8),
([(0, true, false, [106, 158, 254, 494], [], 47)], 0, E213S246.L9),
([(0, true, false, [106, 158, 254, 494], [], 96)], 0, E213S246.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S246
