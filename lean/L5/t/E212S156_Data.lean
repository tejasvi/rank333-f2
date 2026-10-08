module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S156 "data/lean/ba4694915af95e7d100fb0b720bf9807/E212S156.bin"
namespace E212S156
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494, 500, 158], [], 0)], 0, E212S156.L1),
([(4, true, false, [254, 494, 500, 158], [], 2)], 0, E212S156.L2),
([(4, true, false, [254, 494, 500, 158], [], 5)], 0, E212S156.L3),
([(4, true, false, [254, 494, 500, 158], [], 7)], 0, E212S156.L4),
([(4, true, false, [254, 494, 500, 158], [], 10)], 0, E212S156.L5),
([(4, true, false, [254, 494, 500, 158], [], 16)], 0, E212S156.L6),
([(4, true, false, [254, 494, 500, 158], [], 25)], 0, E212S156.L7),
([(4, true, false, [254, 494, 500, 158], [], 27)], 0, E212S156.L8),
([(4, true, false, [254, 494, 500, 158], [], 40)], 0, E212S156.L9),
([(4, true, false, [254, 494, 500, 158], [], 44)], 0, E212S156.L10),
([(4, true, false, [254, 494, 500, 158], [], 54)], 0, E212S156.L11),
([(4, true, false, [254, 494, 500, 158], [], 55)], 0, E212S156.L12),
([(4, true, false, [254, 494, 500, 158], [], 66)], 0, E212S156.L13),
([(4, true, false, [254, 494, 500, 158], [], 74)], 0, E212S156.L14),
([(4, true, false, [254, 494, 500, 158], [], 75)], 0, E212S156.L15),
([(4, true, false, [254, 494, 500, 158], [], 78)], 0, E212S156.L16),
([(4, true, false, [254, 494, 500, 158], [], 79)], 0, E212S156.L17),
([(4, true, false, [254, 494, 500, 158], [], 92)], 0, E212S156.L18),
([(4, true, false, [254, 494, 500, 158], [], 96)], 0, E212S156.L19),
([(4, true, false, [254, 494, 500, 158], [], 101)], 0, E212S156.L20),
([(4, true, false, [254, 494, 500, 158], [], 111)], 0, E212S156.L21),
([(4, true, false, [254, 494, 500, 158], [], 115)], 0, E212S156.L22),
([(4, true, false, [254, 494, 500, 158], [], 122)], 0, E212S156.L23),
([(4, true, false, [254, 494, 500, 158], [], 123)], 0, E212S156.L24),
([(4, true, false, [254, 494, 500, 158], [], 131)], 0, E212S156.L25),
([(4, true, false, [254, 494, 500, 158], [], 132)], 0, E212S156.L26),
([(4, true, false, [254, 494, 500, 158], [], 141)], 0, E212S156.L27),
([(4, true, false, [254, 494, 500, 158], [], 144)], 0, E212S156.L28),
([(4, true, false, [254, 494, 500, 158], [], 155)], 0, E212S156.L29),
([(4, true, false, [254, 494, 500, 158], [], 162)], 0, E212S156.L30),
([(4, true, false, [254, 494, 500, 158], [], 163)], 0, E212S156.L31),
([(4, true, false, [254, 494, 500, 158], [], 166)], 0, E212S156.L32),
([(4, true, false, [254, 494, 500, 158], [], 167)], 0, E212S156.L33),
([(4, true, false, [254, 494, 500, 158], [], 210)], 0, E212S156.L34),
([(4, true, false, [254, 494, 500, 158], [], 211)], 0, E212S156.L35),
([(4, true, false, [254, 494, 500, 158], [], 214)], 0, E212S156.L36),
([(4, true, false, [254, 494, 500, 158], [], 215)], 0, E212S156.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E212S156
