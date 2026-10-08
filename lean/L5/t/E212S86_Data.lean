module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S86 "data/lean/d0e516626f412e89fe333a8958b8d46f/E212S86.bin"
namespace E212S86
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [122, 254], [96], 1)], 0, E212S86.L1),
([(6, true, false, [122, 254], [96], 11)], 0, E212S86.L2),
([(6, true, false, [122, 254], [96], 21)], 0, E212S86.L3),
([(6, true, false, [122, 254], [96], 27)], 0, E212S86.L4),
([(6, true, false, [122, 254], [96], 53)], 0, E212S86.L5),
([(6, true, false, [122, 254], [96], 85)], 0, E212S86.L6),
([(6, true, false, [122, 254], [96], 86)], 0, E212S86.L7),
([(6, true, false, [122, 254], [96], 87)], 0, E212S86.L8),
([(6, true, false, [122, 254], [96], 88)], 0, E212S86.L9),
([(6, true, false, [122, 254], [96], 102)], 0, E212S86.L10),
([(6, true, false, [122, 254], [96], 105)], 0, E212S86.L11),
([(6, true, false, [122, 254], [96], 115)], 0, E212S86.L12),
([(6, true, false, [122, 254], [96], 116)], 0, E212S86.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E212S86
