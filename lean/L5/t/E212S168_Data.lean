module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S168 "data/lean/bbfd5dd474f7d02e39608cddd1ab872f/E212S168.bin"
namespace E212S168
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [254, 266], [26], 0)], 0, E212S168.L1),
([(0, true, false, [254, 266], [26], 1)], 0, E212S168.L2),
([(0, true, false, [254, 266], [26], 2)], 0, E212S168.L3),
([(0, true, false, [254, 266], [26], 10)], 0, E212S168.L4),
([(0, true, false, [254, 266], [26], 11)], 0, E212S168.L5),
([(0, true, false, [254, 266], [26], 12)], 0, E212S168.L6),
([(0, true, false, [254, 266], [26], 13)], 0, E212S168.L7),
([(0, true, false, [254, 266], [26], 14)], 0, E212S168.L8),
([(0, true, false, [254, 266], [26], 17)], 0, E212S168.L9),
([(0, true, false, [254, 266], [26], 30)], 0, E212S168.L10),
([(0, true, false, [254, 266], [26], 31)], 0, E212S168.L11),
([(0, true, false, [254, 266], [26], 34)], 0, E212S168.L12),
([(0, true, false, [254, 266], [26], 82)], 0, E212S168.L13),
([(0, true, false, [254, 266], [26], 86)], 0, E212S168.L14),
([(0, true, false, [254, 266], [26], 90)], 0, E212S168.L15),
([(0, true, false, [254, 266], [26], 91)], 0, E212S168.L16),
([(0, true, false, [254, 266], [26], 105)], 0, E212S168.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E212S168
