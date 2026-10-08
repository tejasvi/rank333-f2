module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S138 "data/lean/818798a322364c1c68fe7ba68ec33f46/E212S138.bin"
namespace E212S138
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [494, 122], [272, 368], 4)], 0, E212S138.L1),
([(14, true, false, [494, 122], [272, 368], 7)], 0, E212S138.L2),
([(14, true, false, [494, 122], [272, 368], 8)], 0, E212S138.L3),
([(14, true, false, [494, 122], [272, 368], 12)], 0, E212S138.L4),
([(14, true, false, [494, 122], [272, 368], 32)], 0, E212S138.L5),
([(14, true, false, [494, 122], [272, 368], 86)], 0, E212S138.L6),
([(14, true, false, [494, 122], [272, 368], 89)], 0, E212S138.L7),
([(14, true, false, [494, 122], [272, 368], 90)], 0, E212S138.L8),
([(14, true, false, [494, 122], [272, 368], 92)], 0, E212S138.L9),
([(14, true, false, [494, 122], [272, 368], 95)], 0, E212S138.L10),
([(14, true, false, [494, 122], [272, 368], 126)], 0, E212S138.L11),
([(14, true, false, [494, 122], [272, 368], 128)], 0, E212S138.L12),
([(14, true, false, [494, 122], [272, 368], 135)], 0, E212S138.L13),
([(14, true, false, [494, 122], [272, 368], 138)], 0, E212S138.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E212S138
