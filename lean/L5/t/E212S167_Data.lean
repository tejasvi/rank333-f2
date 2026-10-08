module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S167 "data/lean/a5fce7d6a8a4427089ef4efa49c37338/E212S167.bin"
namespace E212S167
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 266], [26], 0)], 0, E212S167.L1),
([(0, true, false, [158, 266], [26], 10)], 0, E212S167.L2),
([(0, true, false, [158, 266], [26], 11)], 0, E212S167.L3),
([(0, true, false, [158, 266], [26], 13)], 0, E212S167.L4),
([(0, true, false, [158, 266], [26], 14)], 0, E212S167.L5),
([(0, true, false, [158, 266], [26], 15)], 0, E212S167.L6),
([(0, true, false, [158, 266], [26], 17)], 0, E212S167.L7),
([(0, true, false, [158, 266], [26], 19)], 0, E212S167.L8),
([(0, true, false, [158, 266], [26], 20)], 0, E212S167.L9),
([(0, true, false, [158, 266], [26], 21)], 0, E212S167.L10),
([(0, true, false, [158, 266], [26], 22)], 0, E212S167.L11),
([(0, true, false, [158, 266], [26], 23)], 0, E212S167.L12),
([(0, true, false, [158, 266], [26], 34)], 0, E212S167.L13),
([(0, true, false, [158, 266], [26], 35)], 0, E212S167.L14),
([(0, true, false, [158, 266], [26], 43)], 0, E212S167.L15),
([(0, true, false, [158, 266], [26], 48)], 0, E212S167.L16),
([(0, true, false, [158, 266], [26], 49)], 0, E212S167.L17),
([(0, true, false, [158, 266], [26], 54)], 0, E212S167.L18),
([(0, true, false, [158, 266], [26], 74)], 0, E212S167.L19),
([(0, true, false, [158, 266], [26], 77)], 0, E212S167.L20),
([(0, true, false, [158, 266], [26], 83)], 0, E212S167.L21),
([(0, true, false, [158, 266], [26], 88)], 0, E212S167.L22),
([(0, true, false, [158, 266], [26], 91)], 0, E212S167.L23),
([(0, true, false, [158, 266], [26], 95)], 0, E212S167.L24),
([(0, true, false, [158, 266], [26], 96)], 0, E212S167.L25),
([(0, true, false, [158, 266], [26], 111)], 0, E212S167.L26),
([(0, true, false, [158, 266], [26], 113)], 0, E212S167.L27),
([(0, true, false, [158, 266], [26], 125)], 0, E212S167.L28),
([(0, true, false, [158, 266], [26], 126)], 0, E212S167.L29),
([(0, true, false, [158, 266], [26], 142)], 0, E212S167.L30),
([(0, true, false, [158, 266], [26], 143)], 0, E212S167.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E212S167
