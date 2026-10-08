module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S277 "data/lean/b44e554226bcec349aedf7d2dac63b18/E213S277.bin"
namespace E213S277
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [158, 282, 494], [272], 6)], 0, E213S277.L1),
([(6, true, false, [158, 282, 494], [272], 7)], 0, E213S277.L2),
([(6, true, false, [158, 282, 494], [272], 13)], 0, E213S277.L3),
([(6, true, false, [158, 282, 494], [272], 15)], 0, E213S277.L4),
([(6, true, false, [158, 282, 494], [272], 39)], 0, E213S277.L5),
([(6, true, false, [158, 282, 494], [272], 52)], 0, E213S277.L6),
([(6, true, false, [158, 282, 494], [272], 67)], 0, E213S277.L7),
([(6, true, false, [158, 282, 494], [272], 69)], 0, E213S277.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S277
