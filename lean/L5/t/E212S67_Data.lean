module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S67 "data/lean/156c5f3f0bdca5552d6c020afe4d2cac/E212S67.bin"
namespace E212S67
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [122, 254], [272], 12)], 0, E212S67.L1),
([(12, true, false, [122, 254], [272], 13)], 0, E212S67.L2),
([(12, true, false, [122, 254], [272], 14)], 0, E212S67.L3),
([(12, true, false, [122, 254], [272], 15)], 0, E212S67.L4),
([(12, true, false, [122, 254], [272], 17)], 0, E212S67.L5),
([(12, true, false, [122, 254], [272], 19)], 0, E212S67.L6),
([(12, true, false, [122, 254], [272], 22)], 0, E212S67.L7),
([(12, true, false, [122, 254], [272], 23)], 0, E212S67.L8),
([(12, true, false, [122, 254], [272], 33)], 0, E212S67.L9),
([(12, true, false, [122, 254], [272], 43)], 0, E212S67.L10),
([(12, true, false, [122, 254], [272], 45)], 0, E212S67.L11),
([(12, true, false, [122, 254], [272], 54)], 0, E212S67.L12),
([(12, true, false, [122, 254], [272], 65)], 0, E212S67.L13),
([(12, true, false, [122, 254], [272], 76)], 0, E212S67.L14),
([(12, true, false, [122, 254], [272], 91)], 0, E212S67.L15),
([(12, true, false, [122, 254], [272], 108)], 0, E212S67.L16),
([(12, true, false, [122, 254], [272], 117)], 0, E212S67.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E212S67
