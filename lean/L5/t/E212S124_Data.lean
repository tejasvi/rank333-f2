module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S124 "data/lean/4c82e8cee80550f632ef25f6ccc0510a/E212S124.bin"
namespace E212S124
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [122, 158, 254, 500], [], 5)], 0, E212S124.L1),
([(0, true, false, [122, 158, 254, 500], [], 7)], 0, E212S124.L2),
([(0, true, false, [122, 158, 254, 500], [], 15)], 0, E212S124.L3),
([(0, true, false, [122, 158, 254, 500], [], 86)], 0, E212S124.L4),
([(0, true, false, [122, 158, 254, 500], [], 88)], 0, E212S124.L5),
([(0, true, false, [122, 158, 254, 500], [], 93)], 0, E212S124.L6),
([(0, true, false, [122, 158, 254, 500], [], 148)], 0, E212S124.L7),
([(0, true, false, [122, 158, 254, 500], [], 152)], 0, E212S124.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E212S124
