module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S214 "data/lean/7b56bd40a09a6511d2d23e70f0473bc9/E236S214.bin"
namespace E236S214
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [354], [276, 508], 13)], 6, E236S214.L1),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 162)], 0, E236S214.L2),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 274)], 0, E236S214.L3),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 526)], 0, E236S214.L4),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 554)], 0, E236S214.L5),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 722)], 0, E236S214.L6),
([(6, true, false, [354], [276, 508], 13), (7, false, false, [], [276, 508], 822)], 0, E236S214.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E236S214
