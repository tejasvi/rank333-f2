module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S59 "data/lean/bf52e424b069d29c99b251923b37d6a6/E212S59.bin"
namespace E212S59
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [158], [96, 368], 4)], 0, E212S59.L1),
([(16, true, false, [158], [96, 368], 5)], 0, E212S59.L2),
([(16, true, false, [158], [96, 368], 6)], 0, E212S59.L3),
([(16, true, false, [158], [96, 368], 7)], 0, E212S59.L4),
([(16, true, false, [158], [96, 368], 8)], 0, E212S59.L5),
([(16, true, false, [158], [96, 368], 9)], 0, E212S59.L6),
([(16, true, false, [158], [96, 368], 11)], 0, E212S59.L7),
([(16, true, false, [158], [96, 368], 13)], 0, E212S59.L8),
([(16, true, false, [158], [96, 368], 19)], 0, E212S59.L9),
([(16, true, false, [158], [96, 368], 27)], 0, E212S59.L10),
([(16, true, false, [158], [96, 368], 29)], 0, E212S59.L11),
([(16, true, false, [158], [96, 368], 33)], 0, E212S59.L12),
([(16, true, false, [158], [96, 368], 39)], 0, E212S59.L13),
([(16, true, false, [158], [96, 368], 51)], 0, E212S59.L14),
([(16, true, false, [158], [96, 368], 57)], 0, E212S59.L15),
([(16, true, false, [158], [96, 368], 81)], 0, E212S59.L16),
([(16, true, false, [158], [96, 368], 84)], 0, E212S59.L17),
([(16, true, false, [158], [96, 368], 86)], 0, E212S59.L18),
([(16, true, false, [158], [96, 368], 93)], 0, E212S59.L19),
([(16, true, false, [158], [96, 368], 98)], 0, E212S59.L20),
([(16, true, false, [158], [96, 368], 107)], 0, E212S59.L21),
([(16, true, false, [158], [96, 368], 112)], 0, E212S59.L22),
([(16, true, false, [158], [96, 368], 121)], 0, E212S59.L23),
([(16, true, false, [158], [96, 368], 122)], 0, E212S59.L24),
([(16, true, false, [158], [96, 368], 124)], 0, E212S59.L25),
([(16, true, false, [158], [96, 368], 126)], 0, E212S59.L26),
([(16, true, false, [158], [96, 368], 127)], 0, E212S59.L27),
([(16, true, false, [158], [96, 368], 128)], 0, E212S59.L28),
([(16, true, false, [158], [96, 368], 131)], 0, E212S59.L29),
([(16, true, false, [158], [96, 368], 133)], 0, E212S59.L30),
([(16, true, false, [158], [96, 368], 138)], 0, E212S59.L31),
([(16, true, false, [158], [96, 368], 157)], 0, E212S59.L32),
([(16, true, false, [158], [96, 368], 162)], 0, E212S59.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E212S59
