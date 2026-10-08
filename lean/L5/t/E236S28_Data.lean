module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S28 "data/lean/c8a4ca05bfb86581bade23a5c66815a1/E236S28.bin"
namespace E236S28
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [354, 412], [96], 38)], 0, E236S28.L1),
([(14, true, false, [354, 412], [96], 78)], 0, E236S28.L2),
([(14, true, false, [354, 412], [96], 168)], 0, E236S28.L3),
([(14, true, false, [354, 412], [96], 169)], 0, E236S28.L4),
([(14, true, false, [354, 412], [96], 170)], 0, E236S28.L5),
([(14, true, false, [354, 412], [96], 171)], 0, E236S28.L6),
([(14, true, false, [354, 412], [96], 217)], 0, E236S28.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S28
