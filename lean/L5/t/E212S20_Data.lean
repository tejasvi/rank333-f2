module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S20 "data/lean/e90296985609fd65e5655dd19f89b063/E212S20.bin"
namespace E212S20
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266], [26, 404], 2)], 0, E212S20.L1),
([(13, true, false, [266], [26, 404], 11)], 0, E212S20.L2),
([(13, true, false, [266], [26, 404], 12)], 0, E212S20.L3),
([(13, true, false, [266], [26, 404], 13)], 0, E212S20.L4),
([(13, true, false, [266], [26, 404], 15)], 0, E212S20.L5),
([(13, true, false, [266], [26, 404], 26)], 0, E212S20.L6),
([(13, true, false, [266], [26, 404], 28)], 0, E212S20.L7),
([(13, true, false, [266], [26, 404], 35)], 0, E212S20.L8),
([(13, true, false, [266], [26, 404], 37)], 0, E212S20.L9),
([(13, true, false, [266], [26, 404], 42)], 0, E212S20.L10),
([(13, true, false, [266], [26, 404], 54)], 0, E212S20.L11),
([(13, true, false, [266], [26, 404], 97)], 0, E212S20.L12),
([(13, true, false, [266], [26, 404], 102)], 0, E212S20.L13),
([(13, true, false, [266], [26, 404], 112)], 0, E212S20.L14),
([(13, true, false, [266], [26, 404], 113)], 0, E212S20.L15),
([(13, true, false, [266], [26, 404], 116)], 0, E212S20.L16),
([(13, true, false, [266], [26, 404], 117)], 0, E212S20.L17),
([(13, true, false, [266], [26, 404], 118)], 0, E212S20.L18),
([(13, true, false, [266], [26, 404], 119)], 0, E212S20.L19),
([(13, true, false, [266], [26, 404], 121)], 0, E212S20.L20),
([(13, true, false, [266], [26, 404], 129)], 0, E212S20.L21),
([(13, true, false, [266], [26, 404], 135)], 0, E212S20.L22),
([(13, true, false, [266], [26, 404], 137)], 0, E212S20.L23),
([(13, true, false, [266], [26, 404], 150)], 0, E212S20.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E212S20
