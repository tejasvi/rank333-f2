module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S188 "data/lean/44f112b6271822265a6222c11c54f2c2/E212S188.bin"
namespace E212S188
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [122, 158, 266, 494, 254], [], 5)], 0, E212S188.L1),
([(1, true, false, [122, 158, 266, 494, 254], [], 12)], 0, E212S188.L2),
([(1, true, false, [122, 158, 266, 494, 254], [], 22)], 0, E212S188.L3),
([(1, true, false, [122, 158, 266, 494, 254], [], 24)], 0, E212S188.L4),
([(1, true, false, [122, 158, 266, 494, 254], [], 25)], 0, E212S188.L5),
([(1, true, false, [122, 158, 266, 494, 254], [], 26)], 0, E212S188.L6),
([(1, true, false, [122, 158, 266, 494, 254], [], 27)], 0, E212S188.L7),
([(1, true, false, [122, 158, 266, 494, 254], [], 29)], 0, E212S188.L8),
([(1, true, false, [122, 158, 266, 494, 254], [], 32)], 0, E212S188.L9),
([(1, true, false, [122, 158, 266, 494, 254], [], 33)], 0, E212S188.L10),
([(1, true, false, [122, 158, 266, 494, 254], [], 66)], 0, E212S188.L11),
([(1, true, false, [122, 158, 266, 494, 254], [], 80)], 0, E212S188.L12),
([(1, true, false, [122, 158, 266, 494, 254], [], 94)], 0, E212S188.L13),
([(1, true, false, [122, 158, 266, 494, 254], [], 96)], 0, E212S188.L14),
([(1, true, false, [122, 158, 266, 494, 254], [], 108)], 0, E212S188.L15),
([(1, true, false, [122, 158, 266, 494, 254], [], 122)], 0, E212S188.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E212S188
