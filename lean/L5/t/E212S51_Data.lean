module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S51 "data/lean/19d4b75e6f64b6fa99b55a60ef8d578a/E212S51.bin"
namespace E212S51
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [158], [96, 368], 0)], 0, E212S51.L1),
([(11, true, false, [158], [96, 368], 1)], 0, E212S51.L2),
([(11, true, false, [158], [96, 368], 2)], 0, E212S51.L3),
([(11, true, false, [158], [96, 368], 3)], 0, E212S51.L4),
([(11, true, false, [158], [96, 368], 4)], 0, E212S51.L5),
([(11, true, false, [158], [96, 368], 8)], 0, E212S51.L6),
([(11, true, false, [158], [96, 368], 9)], 0, E212S51.L7),
([(11, true, false, [158], [96, 368], 10)], 0, E212S51.L8),
([(11, true, false, [158], [96, 368], 11)], 0, E212S51.L9),
([(11, true, false, [158], [96, 368], 12)], 0, E212S51.L10),
([(11, true, false, [158], [96, 368], 15)], 0, E212S51.L11),
([(11, true, false, [158], [96, 368], 16)], 0, E212S51.L12),
([(11, true, false, [158], [96, 368], 27)], 0, E212S51.L13),
([(11, true, false, [158], [96, 368], 29)], 0, E212S51.L14),
([(11, true, false, [158], [96, 368], 31)], 0, E212S51.L15),
([(11, true, false, [158], [96, 368], 33)], 0, E212S51.L16),
([(11, true, false, [158], [96, 368], 39)], 0, E212S51.L17),
([(11, true, false, [158], [96, 368], 53)], 0, E212S51.L18),
([(11, true, false, [158], [96, 368], 59)], 0, E212S51.L19),
([(11, true, false, [158], [96, 368], 60)], 0, E212S51.L20),
([(11, true, false, [158], [96, 368], 63)], 0, E212S51.L21),
([(11, true, false, [158], [96, 368], 64)], 0, E212S51.L22),
([(11, true, false, [158], [96, 368], 65)], 0, E212S51.L23),
([(11, true, false, [158], [96, 368], 72)], 0, E212S51.L24),
([(11, true, false, [158], [96, 368], 108)], 0, E212S51.L25),
([(11, true, false, [158], [96, 368], 109)], 0, E212S51.L26),
([(11, true, false, [158], [96, 368], 121)], 0, E212S51.L27),
([(11, true, false, [158], [96, 368], 122)], 0, E212S51.L28),
([(11, true, false, [158], [96, 368], 124)], 0, E212S51.L29),
([(11, true, false, [158], [96, 368], 127)], 0, E212S51.L30),
([(11, true, false, [158], [96, 368], 128)], 0, E212S51.L31),
([(11, true, false, [158], [96, 368], 131)], 0, E212S51.L32),
([(11, true, false, [158], [96, 368], 142)], 0, E212S51.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E212S51
