module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S400 "data/lean/f300acd6e1b1f7f22b8e6919a7bdb0f3/E236S400.bin"
namespace E236S400
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [372, 394], [136, 232], 10)], 0, E236S400.L1),
([(1, true, false, [372, 394], [136, 232], 16)], 0, E236S400.L2),
([(1, true, false, [372, 394], [136, 232], 43)], 0, E236S400.L3),
([(1, true, false, [372, 394], [136, 232], 45)], 0, E236S400.L4),
([(1, true, false, [372, 394], [136, 232], 119)], 0, E236S400.L5),
([(1, true, false, [372, 394], [136, 232], 122)], 0, E236S400.L6),
([(1, true, false, [372, 394], [136, 232], 127)], 0, E236S400.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S400
