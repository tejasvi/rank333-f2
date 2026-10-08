module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S168 "data/lean/cdfac7c8fc177c8d08635ff7a905a801/E236S168.bin"
namespace E236S168
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(12, true, false, [254], [96, 232], 1)], 0, E236S168.L1),
([(12, true, false, [254], [96, 232], 2)], 0, E236S168.L2),
([(12, true, false, [254], [96, 232], 8)], 0, E236S168.L3),
([(12, true, false, [254], [96, 232], 9)], 0, E236S168.L4),
([(12, true, false, [254], [96, 232], 10)], 0, E236S168.L5),
([(12, true, false, [254], [96, 232], 11)], 0, E236S168.L6),
([(12, true, false, [254], [96, 232], 18)], 0, E236S168.L7),
([(12, true, false, [254], [96, 232], 19)], 0, E236S168.L8),
([(12, true, false, [254], [96, 232], 26)], 0, E236S168.L9),
([(12, true, false, [254], [96, 232], 29)], 0, E236S168.L10),
([(12, true, false, [254], [96, 232], 32)], 0, E236S168.L11),
([(12, true, false, [254], [96, 232], 33)], 0, E236S168.L12),
([(12, true, false, [254], [96, 232], 38)], 0, E236S168.L13),
([(12, true, false, [254], [96, 232], 39)], 0, E236S168.L14),
([(12, true, false, [254], [96, 232], 50)], 0, E236S168.L15),
([(12, true, false, [254], [96, 232], 53)], 0, E236S168.L16),
([(12, true, false, [254], [96, 232], 55)], 0, E236S168.L17),
([(12, true, false, [254], [96, 232], 56)], 0, E236S168.L18),
([(12, true, false, [254], [96, 232], 57)], 0, E236S168.L19),
([(12, true, false, [254], [96, 232], 59)], 0, E236S168.L20),
([(12, true, false, [254], [96, 232], 60)], 0, E236S168.L21),
([(12, true, false, [254], [96, 232], 62)], 0, E236S168.L22),
([(12, true, false, [254], [96, 232], 64)], 0, E236S168.L23),
([(12, true, false, [254], [96, 232], 65)], 0, E236S168.L24),
([(12, true, false, [254], [96, 232], 66)], 0, E236S168.L25),
([(12, true, false, [254], [96, 232], 72)], 0, E236S168.L26),
([(12, true, false, [254], [96, 232], 75)], 0, E236S168.L27),
([(12, true, false, [254], [96, 232], 93)], 0, E236S168.L28),
([(12, true, false, [254], [96, 232], 99)], 0, E236S168.L29),
([(12, true, false, [254], [96, 232], 112)], 0, E236S168.L30),
([(12, true, false, [254], [96, 232], 113)], 0, E236S168.L31),
([(12, true, false, [254], [96, 232], 121)], 0, E236S168.L32),
([(12, true, false, [254], [96, 232], 123)], 0, E236S168.L33),
([(12, true, false, [254], [96, 232], 124)], 0, E236S168.L34),
([(12, true, false, [254], [96, 232], 126)], 0, E236S168.L35),
([(12, true, false, [254], [96, 232], 129)], 0, E236S168.L36),
([(12, true, false, [254], [96, 232], 130)], 0, E236S168.L37),
([(12, true, false, [254], [96, 232], 131)], 0, E236S168.L38),
([(12, true, false, [254], [96, 232], 156)], 0, E236S168.L39),
([(12, true, false, [254], [96, 232], 157)], 0, E236S168.L40),
([(12, true, false, [254], [96, 232], 162)], 0, E236S168.L41),
([(12, true, false, [254], [96, 232], 163)], 0, E236S168.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E236S168
