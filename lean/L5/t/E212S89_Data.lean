module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S89 "data/lean/ba0d2190a740e880e8d2a451a7cae11e/E212S89.bin"
namespace E212S89
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [266, 500], [368], 0)], 0, E212S89.L1),
([(12, true, false, [266, 500], [368], 1)], 0, E212S89.L2),
([(12, true, false, [266, 500], [368], 5)], 0, E212S89.L3),
([(12, true, false, [266, 500], [368], 6)], 0, E212S89.L4),
([(12, true, false, [266, 500], [368], 7)], 0, E212S89.L5),
([(12, true, false, [266, 500], [368], 14)], 0, E212S89.L6),
([(12, true, false, [266, 500], [368], 15)], 0, E212S89.L7),
([(12, true, false, [266, 500], [368], 17)], 0, E212S89.L8),
([(12, true, false, [266, 500], [368], 24)], 0, E212S89.L9),
([(12, true, false, [266, 500], [368], 25)], 0, E212S89.L10),
([(12, true, false, [266, 500], [368], 28)], 0, E212S89.L11),
([(12, true, false, [266, 500], [368], 31)], 0, E212S89.L12),
([(12, true, false, [266, 500], [368], 41)], 0, E212S89.L13),
([(12, true, false, [266, 500], [368], 42)], 0, E212S89.L14),
([(12, true, false, [266, 500], [368], 45)], 0, E212S89.L15),
([(12, true, false, [266, 500], [368], 48)], 0, E212S89.L16),
([(12, true, false, [266, 500], [368], 74)], 0, E212S89.L17),
([(12, true, false, [266, 500], [368], 75)], 0, E212S89.L18),
([(12, true, false, [266, 500], [368], 77)], 0, E212S89.L19),
([(12, true, false, [266, 500], [368], 78)], 0, E212S89.L20),
([(12, true, false, [266, 500], [368], 81)], 0, E212S89.L21),
([(12, true, false, [266, 500], [368], 83)], 0, E212S89.L22),
([(12, true, false, [266, 500], [368], 151)], 0, E212S89.L23),
([(12, true, false, [266, 500], [368], 152)], 0, E212S89.L24),
([(12, true, false, [266, 500], [368], 158)], 0, E212S89.L25),
([(12, true, false, [266, 500], [368], 163)], 0, E212S89.L26),
([(12, true, false, [266, 500], [368], 176)], 0, E212S89.L27),
([(12, true, false, [266, 500], [368], 204)], 0, E212S89.L28)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 28
end E212S89
