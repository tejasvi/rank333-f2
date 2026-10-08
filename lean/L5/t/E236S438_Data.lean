module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S438 "data/lean/6a9ac936fdbea5b6d3b06d8c3d70ddf8/E236S438.bin"
namespace E236S438
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 354, 372, 158], [], 5)], 0, E236S438.L1),
([(11, true, false, [254, 354, 372, 158], [], 7)], 0, E236S438.L2),
([(11, true, false, [254, 354, 372, 158], [], 8)], 0, E236S438.L3),
([(11, true, false, [254, 354, 372, 158], [], 14)], 0, E236S438.L4),
([(11, true, false, [254, 354, 372, 158], [], 26)], 0, E236S438.L5),
([(11, true, false, [254, 354, 372, 158], [], 30)], 0, E236S438.L6),
([(11, true, false, [254, 354, 372, 158], [], 32)], 0, E236S438.L7),
([(11, true, false, [254, 354, 372, 158], [], 35)], 0, E236S438.L8),
([(11, true, false, [254, 354, 372, 158], [], 41)], 0, E236S438.L9),
([(11, true, false, [254, 354, 372, 158], [], 45)], 0, E236S438.L10),
([(11, true, false, [254, 354, 372, 158], [], 48)], 0, E236S438.L11),
([(11, true, false, [254, 354, 372, 158], [], 49)], 0, E236S438.L12),
([(11, true, false, [254, 354, 372, 158], [], 52)], 0, E236S438.L13),
([(11, true, false, [254, 354, 372, 158], [], 62)], 0, E236S438.L14),
([(11, true, false, [254, 354, 372, 158], [], 64)], 0, E236S438.L15),
([(11, true, false, [254, 354, 372, 158], [], 67)], 0, E236S438.L16),
([(11, true, false, [254, 354, 372, 158], [], 87)], 0, E236S438.L17),
([(11, true, false, [254, 354, 372, 158], [], 92)], 0, E236S438.L18),
([(11, true, false, [254, 354, 372, 158], [], 109)], 0, E236S438.L19),
([(11, true, false, [254, 354, 372, 158], [], 113)], 0, E236S438.L20),
([(11, true, false, [254, 354, 372, 158], [], 125)], 0, E236S438.L21),
([(11, true, false, [254, 354, 372, 158], [], 126)], 0, E236S438.L22),
([(11, true, false, [254, 354, 372, 158], [], 129)], 0, E236S438.L23),
([(11, true, false, [254, 354, 372, 158], [], 133)], 0, E236S438.L24),
([(11, true, false, [254, 354, 372, 158], [], 146)], 0, E236S438.L25),
([(11, true, false, [254, 354, 372, 158], [], 148)], 0, E236S438.L26),
([(11, true, false, [254, 354, 372, 158], [], 151)], 0, E236S438.L27),
([(11, true, false, [254, 354, 372, 158], [], 155)], 0, E236S438.L28),
([(11, true, false, [254, 354, 372, 158], [], 183)], 0, E236S438.L29),
([(11, true, false, [254, 354, 372, 158], [], 187)], 0, E236S438.L30),
([(11, true, false, [254, 354, 372, 158], [], 207)], 0, E236S438.L31),
([(11, true, false, [254, 354, 372, 158], [], 211)], 0, E236S438.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E236S438
