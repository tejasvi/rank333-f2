module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S57 "data/lean/9b5f042a94c159cdd9b1fa8a3aa1746b/E212S57.bin"
namespace E212S57
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [254], [96, 368], 1)], 0, E212S57.L1),
([(13, true, false, [254], [96, 368], 2)], 0, E212S57.L2),
([(13, true, false, [254], [96, 368], 4)], 0, E212S57.L3),
([(13, true, false, [254], [96, 368], 5)], 0, E212S57.L4),
([(13, true, false, [254], [96, 368], 6)], 0, E212S57.L5),
([(13, true, false, [254], [96, 368], 7)], 0, E212S57.L6),
([(13, true, false, [254], [96, 368], 8)], 0, E212S57.L7),
([(13, true, false, [254], [96, 368], 10)], 0, E212S57.L8),
([(13, true, false, [254], [96, 368], 12)], 0, E212S57.L9),
([(13, true, false, [254], [96, 368], 13)], 0, E212S57.L10),
([(13, true, false, [254], [96, 368], 14)], 0, E212S57.L11),
([(13, true, false, [254], [96, 368], 26)], 0, E212S57.L12),
([(13, true, false, [254], [96, 368], 29)], 0, E212S57.L13),
([(13, true, false, [254], [96, 368], 32)], 0, E212S57.L14),
([(13, true, false, [254], [96, 368], 33)], 0, E212S57.L15),
([(13, true, false, [254], [96, 368], 38)], 0, E212S57.L16),
([(13, true, false, [254], [96, 368], 39)], 0, E212S57.L17),
([(13, true, false, [254], [96, 368], 50)], 0, E212S57.L18),
([(13, true, false, [254], [96, 368], 55)], 0, E212S57.L19),
([(13, true, false, [254], [96, 368], 56)], 0, E212S57.L20),
([(13, true, false, [254], [96, 368], 80)], 0, E212S57.L21),
([(13, true, false, [254], [96, 368], 82)], 0, E212S57.L22),
([(13, true, false, [254], [96, 368], 106)], 0, E212S57.L23),
([(13, true, false, [254], [96, 368], 120)], 0, E212S57.L24),
([(13, true, false, [254], [96, 368], 121)], 0, E212S57.L25),
([(13, true, false, [254], [96, 368], 124)], 0, E212S57.L26),
([(13, true, false, [254], [96, 368], 125)], 0, E212S57.L27),
([(13, true, false, [254], [96, 368], 128)], 0, E212S57.L28),
([(13, true, false, [254], [96, 368], 129)], 0, E212S57.L29),
([(13, true, false, [254], [96, 368], 130)], 0, E212S57.L30),
([(13, true, false, [254], [96, 368], 132)], 0, E212S57.L31),
([(13, true, false, [254], [96, 368], 134)], 0, E212S57.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E212S57
