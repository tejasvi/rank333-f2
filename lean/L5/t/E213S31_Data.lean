module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S31 "data/lean/b2fdbbee42e76a80fd7f2ef0ce70fdb0/E213S31.bin"
namespace E213S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 282, 494], [], 0)], 0, E213S31.L1),
([(0, true, false, [158, 282, 494], [], 1)], 0, E213S31.L2),
([(0, true, false, [158, 282, 494], [], 2)], 0, E213S31.L3),
([(0, true, false, [158, 282, 494], [], 3)], 0, E213S31.L4),
([(0, true, false, [158, 282, 494], [], 4)], 0, E213S31.L5),
([(0, true, false, [158, 282, 494], [], 5)], 0, E213S31.L6),
([(0, true, false, [158, 282, 494], [], 6)], 0, E213S31.L7),
([(0, true, false, [158, 282, 494], [], 10)], 0, E213S31.L8),
([(0, true, false, [158, 282, 494], [], 15)], 0, E213S31.L9),
([(0, true, false, [158, 282, 494], [], 42)], 0, E213S31.L10),
([(0, true, false, [158, 282, 494], [], 68)], 0, E213S31.L11),
([(0, true, false, [158, 282, 494], [], 107)], 0, E213S31.L12),
([(0, true, false, [158, 282, 494], [], 128)], 0, E213S31.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E213S31
