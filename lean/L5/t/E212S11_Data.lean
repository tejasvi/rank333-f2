module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S11 "data/lean/287ee44973ad03a970b1fc1e841d47ec/E212S11.bin"
namespace E212S11
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [254], [368], 0)], 0, E212S11.L1),
([(13, true, false, [254], [368], 1)], 0, E212S11.L2),
([(13, true, false, [254], [368], 3)], 0, E212S11.L3),
([(13, true, false, [254], [368], 4)], 0, E212S11.L4),
([(13, true, false, [254], [368], 5)], 0, E212S11.L5),
([(13, true, false, [254], [368], 6)], 0, E212S11.L6),
([(13, true, false, [254], [368], 7)], 0, E212S11.L7),
([(13, true, false, [254], [368], 8)], 0, E212S11.L8),
([(13, true, false, [254], [368], 10)], 0, E212S11.L9),
([(13, true, false, [254], [368], 16)], 0, E212S11.L10),
([(13, true, false, [254], [368], 28)], 0, E212S11.L11),
([(13, true, false, [254], [368], 29)], 0, E212S11.L12),
([(13, true, false, [254], [368], 30)], 0, E212S11.L13),
([(13, true, false, [254], [368], 31)], 0, E212S11.L14),
([(13, true, false, [254], [368], 32)], 0, E212S11.L15),
([(13, true, false, [254], [368], 33)], 0, E212S11.L16),
([(13, true, false, [254], [368], 34)], 0, E212S11.L17),
([(13, true, false, [254], [368], 35)], 0, E212S11.L18),
([(13, true, false, [254], [368], 37)], 0, E212S11.L19),
([(13, true, false, [254], [368], 39)], 0, E212S11.L20),
([(13, true, false, [254], [368], 41)], 0, E212S11.L21),
([(13, true, false, [254], [368], 42)], 0, E212S11.L22),
([(13, true, false, [254], [368], 66)], 0, E212S11.L23),
([(13, true, false, [254], [368], 68)], 0, E212S11.L24),
([(13, true, false, [254], [368], 80)], 0, E212S11.L25),
([(13, true, false, [254], [368], 81)], 0, E212S11.L26),
([(13, true, false, [254], [368], 84)], 0, E212S11.L27),
([(13, true, false, [254], [368], 87)], 0, E212S11.L28),
([(13, true, false, [254], [368], 100)], 0, E212S11.L29),
([(13, true, false, [254], [368], 101)], 0, E212S11.L30),
([(13, true, false, [254], [368], 104)], 0, E212S11.L31),
([(13, true, false, [254], [368], 105)], 0, E212S11.L32),
([(13, true, false, [254], [368], 111)], 0, E212S11.L33),
([(13, true, false, [254], [368], 116)], 0, E212S11.L34),
([(13, true, false, [254], [368], 118)], 0, E212S11.L35),
([(13, true, false, [254], [368], 130)], 0, E212S11.L36),
([(13, true, false, [254], [368], 131)], 0, E212S11.L37),
([(13, true, false, [254], [368], 135)], 0, E212S11.L38),
([(13, true, false, [254], [368], 142)], 0, E212S11.L39),
([(13, true, false, [254], [368], 144)], 0, E212S11.L40),
([(13, true, false, [254], [368], 148)], 0, E212S11.L41),
([(13, true, false, [254], [368], 149)], 0, E212S11.L42),
([(13, true, false, [254], [368], 180)], 0, E212S11.L43),
([(13, true, false, [254], [368], 244)], 0, E212S11.L44),
([(13, true, false, [254], [368], 246)], 0, E212S11.L45),
([(13, true, false, [254], [368], 252)], 0, E212S11.L46),
([(13, true, false, [254], [368], 254)], 0, E212S11.L47),
([(13, true, false, [254], [368], 274)], 0, E212S11.L48),
([(13, true, false, [254], [368], 275)], 0, E212S11.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 49
end E212S11
