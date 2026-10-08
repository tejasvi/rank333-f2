module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S283 "data/lean/874ff6b471faa1b5e9f7954218e1244c/E236S283.bin"
namespace E236S283
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 394], [136], 0)], 0, E236S283.L1),
([(8, true, false, [158, 394], [136], 21)], 0, E236S283.L2),
([(8, true, false, [158, 394], [136], 88)], 0, E236S283.L3),
([(8, true, false, [158, 394], [136], 105)], 0, E236S283.L4),
([(8, true, false, [158, 394], [136], 106)], 0, E236S283.L5),
([(8, true, false, [158, 394], [136], 118)], 0, E236S283.L6),
([(8, true, false, [158, 394], [136], 129)], 0, E236S283.L7),
([(8, true, false, [158, 394], [136], 147)], 0, E236S283.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S283
