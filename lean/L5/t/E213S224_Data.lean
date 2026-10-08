module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S224 "data/lean/a8484441f747ff5532fb806a67c29f70/E213S224.bin"
namespace E213S224
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 244, 494], [272], 5)], 0, E213S224.L1),
([(7, true, false, [158, 244, 494], [272], 9)], 0, E213S224.L2),
([(7, true, false, [158, 244, 494], [272], 74)], 0, E213S224.L3),
([(7, true, false, [158, 244, 494], [272], 75)], 0, E213S224.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E213S224
