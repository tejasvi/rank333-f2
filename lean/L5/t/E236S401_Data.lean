module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S401 "data/lean/b3f743c042df31b9531eb110748d38e1/E236S401.bin"
namespace E236S401
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [354, 412], [136, 232], 6)], 2, E236S401.L1),
([(1, true, false, [354, 412], [136, 232], 12)], 0, E236S401.L2),
([(1, true, false, [354, 412], [136, 232], 41)], 0, E236S401.L3),
([(1, true, false, [354, 412], [136, 232], 43)], 0, E236S401.L4),
([(1, true, false, [354, 412], [136, 232], 119)], 0, E236S401.L5),
([(1, true, false, [354, 412], [136, 232], 122)], 0, E236S401.L6),
([(1, true, false, [354, 412], [136, 232], 6), (14, false, false, [158], [232], 352)], 0, E236S401.L7),
([(1, true, false, [354, 412], [136, 232], 6), (14, false, false, [158], [232], 357)], 0, E236S401.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S401
