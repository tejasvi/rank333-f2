module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S282 "data/lean/5ca0f6c6eb551a18ac0c94076bf40991/E213S282.bin"
namespace E213S282
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 282, 494], [], 0)], 0, E213S282.L1),
([(0, true, false, [106, 282, 494], [], 3)], 0, E213S282.L2),
([(0, true, false, [106, 282, 494], [], 6)], 0, E213S282.L3),
([(0, true, false, [106, 282, 494], [], 9)], 0, E213S282.L4),
([(0, true, false, [106, 282, 494], [], 21)], 0, E213S282.L5),
([(0, true, false, [106, 282, 494], [], 49)], 0, E213S282.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S282
