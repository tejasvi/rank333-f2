module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S397 "data/lean/3ce31136f95dd84277c4a76fc3282d0a/E236S397.bin"
namespace E236S397
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354], [96, 136], 2)], 0, E236S397.L1),
([(0, true, false, [354], [96, 136], 21)], 0, E236S397.L2),
([(0, true, false, [354], [96, 136], 30)], 0, E236S397.L3),
([(0, true, false, [354], [96, 136], 48)], 0, E236S397.L4),
([(0, true, false, [354], [96, 136], 49)], 0, E236S397.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S397
