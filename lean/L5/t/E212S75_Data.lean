module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S75 "data/lean/8a9fa0f4905de4a3e90dab374c61c8a8/E212S75.bin"
namespace E212S75
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [266, 500], [368], 1)], 0, E212S75.L1),
([(13, true, false, [266, 500], [368], 5)], 0, E212S75.L2),
([(13, true, false, [266, 500], [368], 6)], 0, E212S75.L3),
([(13, true, false, [266, 500], [368], 7)], 0, E212S75.L4),
([(13, true, false, [266, 500], [368], 14)], 0, E212S75.L5),
([(13, true, false, [266, 500], [368], 15)], 0, E212S75.L6),
([(13, true, false, [266, 500], [368], 28)], 0, E212S75.L7),
([(13, true, false, [266, 500], [368], 31)], 0, E212S75.L8),
([(13, true, false, [266, 500], [368], 41)], 0, E212S75.L9),
([(13, true, false, [266, 500], [368], 42)], 0, E212S75.L10),
([(13, true, false, [266, 500], [368], 48)], 0, E212S75.L11),
([(13, true, false, [266, 500], [368], 74)], 0, E212S75.L12),
([(13, true, false, [266, 500], [368], 75)], 0, E212S75.L13),
([(13, true, false, [266, 500], [368], 77)], 0, E212S75.L14),
([(13, true, false, [266, 500], [368], 81)], 0, E212S75.L15),
([(13, true, false, [266, 500], [368], 83)], 0, E212S75.L16),
([(13, true, false, [266, 500], [368], 151)], 0, E212S75.L17),
([(13, true, false, [266, 500], [368], 158)], 0, E212S75.L18),
([(13, true, false, [266, 500], [368], 163)], 0, E212S75.L19),
([(13, true, false, [266, 500], [368], 176)], 0, E212S75.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E212S75
