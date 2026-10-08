module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S77 "data/lean/0dcf2995e0d0221e0db033022399715a/E213S77.bin"
namespace E213S77
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [494], [148, 272], 24)], 0, E213S77.L1),
([(7, true, false, [494], [148, 272], 26)], 0, E213S77.L2),
([(7, true, false, [494], [148, 272], 27)], 0, E213S77.L3),
([(7, true, false, [494], [148, 272], 30)], 0, E213S77.L4),
([(7, true, false, [494], [148, 272], 32)], 0, E213S77.L5),
([(7, true, false, [494], [148, 272], 39)], 0, E213S77.L6),
([(7, true, false, [494], [148, 272], 72)], 0, E213S77.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S77
