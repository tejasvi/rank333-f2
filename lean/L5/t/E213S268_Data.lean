module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S268 "data/lean/f64c9e36c0c924630ee0d85b6bf0f2bd/E213S268.bin"
namespace E213S268
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 282, 494], [], 0)], 0, E213S268.L1),
([(0, true, false, [106, 158, 282, 494], [], 1)], 0, E213S268.L2),
([(0, true, false, [106, 158, 282, 494], [], 2)], 0, E213S268.L3),
([(0, true, false, [106, 158, 282, 494], [], 3)], 0, E213S268.L4),
([(0, true, false, [106, 158, 282, 494], [], 4)], 0, E213S268.L5),
([(0, true, false, [106, 158, 282, 494], [], 5)], 0, E213S268.L6),
([(0, true, false, [106, 158, 282, 494], [], 27)], 0, E213S268.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S268
