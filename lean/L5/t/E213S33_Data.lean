module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S33 "data/lean/7c8cc5b464855da536eecb5e1a6780d7/E213S33.bin"
namespace E213S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 282, 494], [], 0)], 0, E213S33.L1),
([(0, true, false, [106, 158, 282, 494], [], 1)], 0, E213S33.L2),
([(0, true, false, [106, 158, 282, 494], [], 2)], 0, E213S33.L3),
([(0, true, false, [106, 158, 282, 494], [], 3)], 0, E213S33.L4),
([(0, true, false, [106, 158, 282, 494], [], 4)], 0, E213S33.L5),
([(0, true, false, [106, 158, 282, 494], [], 5)], 0, E213S33.L6),
([(0, true, false, [106, 158, 282, 494], [], 10)], 0, E213S33.L7),
([(0, true, false, [106, 158, 282, 494], [], 12)], 0, E213S33.L8),
([(0, true, false, [106, 158, 282, 494], [], 13)], 0, E213S33.L9),
([(0, true, false, [106, 158, 282, 494], [], 17)], 0, E213S33.L10),
([(0, true, false, [106, 158, 282, 494], [], 27)], 0, E213S33.L11),
([(0, true, false, [106, 158, 282, 494], [], 30)], 0, E213S33.L12),
([(0, true, false, [106, 158, 282, 494], [], 34)], 0, E213S33.L13),
([(0, true, false, [106, 158, 282, 494], [], 44)], 0, E213S33.L14),
([(0, true, false, [106, 158, 282, 494], [], 45)], 0, E213S33.L15),
([(0, true, false, [106, 158, 282, 494], [], 46)], 0, E213S33.L16),
([(0, true, false, [106, 158, 282, 494], [], 62)], 0, E213S33.L17),
([(0, true, false, [106, 158, 282, 494], [], 73)], 0, E213S33.L18),
([(0, true, false, [106, 158, 282, 494], [], 75)], 0, E213S33.L19),
([(0, true, false, [106, 158, 282, 494], [], 97)], 0, E213S33.L20),
([(0, true, false, [106, 158, 282, 494], [], 114)], 0, E213S33.L21),
([(0, true, false, [106, 158, 282, 494], [], 119)], 0, E213S33.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E213S33
