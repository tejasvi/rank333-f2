module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S83 "data/lean/034681ebff3003752dc1408b72045784/E212S83.bin"
namespace E212S83
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 254], [96], 38)], 0, E212S83.L1),
([(2, true, false, [266, 254], [96], 41)], 0, E212S83.L2),
([(2, true, false, [266, 254], [96], 56)], 0, E212S83.L3),
([(2, true, false, [266, 254], [96], 58)], 0, E212S83.L4),
([(2, true, false, [266, 254], [96], 86)], 0, E212S83.L5),
([(2, true, false, [266, 254], [96], 92)], 0, E212S83.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S83
