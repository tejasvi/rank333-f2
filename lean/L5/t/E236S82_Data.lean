module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S82 "data/lean/1a7b1a9ff414155656accebc02f3733a/E236S82.bin"
namespace E236S82
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [372, 412], [276, 508], 27)], 0, E236S82.L1),
([(11, true, false, [372, 412], [276, 508], 32)], 0, E236S82.L2),
([(11, true, false, [372, 412], [276, 508], 53)], 0, E236S82.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S82
