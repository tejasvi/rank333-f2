module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S78 "data/lean/13cc6818a9c2f0582169bdbde3e03302/E212S78.bin"
namespace E212S78
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [122, 254, 500], [368], 1)], 0, E212S78.L1),
([(16, true, false, [122, 254, 500], [368], 7)], 0, E212S78.L2),
([(16, true, false, [122, 254, 500], [368], 12)], 0, E212S78.L3),
([(16, true, false, [122, 254, 500], [368], 28)], 0, E212S78.L4),
([(16, true, false, [122, 254, 500], [368], 31)], 0, E212S78.L5),
([(16, true, false, [122, 254, 500], [368], 42)], 0, E212S78.L6),
([(16, true, false, [122, 254, 500], [368], 43)], 8, E212S78.L7),
([(16, true, false, [122, 254, 500], [368], 49)], 0, E212S78.L8),
([(16, true, false, [122, 254, 500], [368], 50)], 0, E212S78.L9),
([(16, true, false, [122, 254, 500], [368], 51)], 0, E212S78.L10),
([(16, true, false, [122, 254, 500], [368], 66)], 0, E212S78.L11),
([(16, true, false, [122, 254, 500], [368], 67)], 0, E212S78.L12),
([(16, true, false, [122, 254, 500], [368], 74)], 0, E212S78.L13),
([(16, true, false, [122, 254, 500], [368], 86)], 0, E212S78.L14),
([(16, true, false, [122, 254, 500], [368], 95)], 0, E212S78.L15),
([(16, true, false, [122, 254, 500], [368], 104)], 0, E212S78.L16),
([(16, true, false, [122, 254, 500], [368], 105)], 0, E212S78.L17),
([(16, true, false, [122, 254, 500], [368], 114)], 0, E212S78.L18),
([(16, true, false, [122, 254, 500], [368], 118)], 0, E212S78.L19),
([(16, true, false, [122, 254, 500], [368], 119)], 0, E212S78.L20),
([(16, true, false, [122, 254, 500], [368], 125)], 0, E212S78.L21),
([(16, true, false, [122, 254, 500], [368], 126)], 0, E212S78.L22),
([(16, true, false, [122, 254, 500], [368], 131)], 0, E212S78.L23),
([(16, true, false, [122, 254, 500], [368], 135)], 0, E212S78.L24),
([(16, true, false, [122, 254, 500], [368], 142)], 0, E212S78.L25),
([(16, true, false, [122, 254, 500], [368], 143)], 0, E212S78.L26),
([(16, true, false, [122, 254, 500], [368], 153)], 0, E212S78.L27),
([(16, true, false, [122, 254, 500], [368], 159)], 0, E212S78.L28),
([(16, true, false, [122, 254, 500], [368], 166)], 0, E212S78.L29),
([(16, true, false, [122, 254, 500], [368], 174)], 0, E212S78.L30),
([(16, true, false, [122, 254, 500], [368], 176)], 0, E212S78.L31),
([(16, true, false, [122, 254, 500], [368], 206)], 0, E212S78.L32),
([(16, true, false, [122, 254, 500], [368], 210)], 0, E212S78.L33),
([(16, true, false, [122, 254, 500], [368], 229)], 0, E212S78.L34),
([(16, true, false, [122, 254, 500], [368], 262)], 0, E212S78.L35),
([(16, true, false, [122, 254, 500], [368], 263)], 0, E212S78.L36),
([(16, true, false, [122, 254, 500], [368], 268)], 0, E212S78.L37),
([(16, true, false, [122, 254, 500], [368], 269)], 0, E212S78.L38),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 0)], 0, E212S78.L39),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 32)], 0, E212S78.L40),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 82)], 0, E212S78.L41),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 98)], 0, E212S78.L42),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 164)], 0, E212S78.L43),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 196)], 0, E212S78.L44),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 416)], 0, E212S78.L45),
([(16, true, false, [122, 254, 500], [368], 43), (6, false, false, [], [368], 462)], 0, E212S78.L46)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 38
end E212S78
