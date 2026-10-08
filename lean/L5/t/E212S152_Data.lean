module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S152 "data/lean/6b607e7f76470a904140445de5d84c17/E212S152.bin"
namespace E212S152
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 158, 266, 254], [], 37)], 0, E212S152.L1),
([(2, true, false, [122, 158, 266, 254], [], 38)], 0, E212S152.L2),
([(2, true, false, [122, 158, 266, 254], [], 39)], 0, E212S152.L3),
([(2, true, false, [122, 158, 266, 254], [], 40)], 0, E212S152.L4),
([(2, true, false, [122, 158, 266, 254], [], 41)], 0, E212S152.L5),
([(2, true, false, [122, 158, 266, 254], [], 42)], 0, E212S152.L6),
([(2, true, false, [122, 158, 266, 254], [], 48)], 0, E212S152.L7),
([(2, true, false, [122, 158, 266, 254], [], 52)], 0, E212S152.L8),
([(2, true, false, [122, 158, 266, 254], [], 111)], 0, E212S152.L9),
([(2, true, false, [122, 158, 266, 254], [], 163)], 0, E212S152.L10),
([(2, true, false, [122, 158, 266, 254], [], 211)], 0, E212S152.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E212S152
