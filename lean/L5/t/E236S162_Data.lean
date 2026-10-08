module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S162 "data/lean/cc71e6f4fa31658a23f82399fc9ac555/E236S162.bin"
namespace E236S162
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254], [96, 232], 1)], 0, E236S162.L1),
([(10, true, false, [254], [96, 232], 2)], 0, E236S162.L2),
([(10, true, false, [254], [96, 232], 5)], 0, E236S162.L3),
([(10, true, false, [254], [96, 232], 6)], 0, E236S162.L4),
([(10, true, false, [254], [96, 232], 8)], 0, E236S162.L5),
([(10, true, false, [254], [96, 232], 9)], 0, E236S162.L6),
([(10, true, false, [254], [96, 232], 10)], 0, E236S162.L7),
([(10, true, false, [254], [96, 232], 11)], 0, E236S162.L8),
([(10, true, false, [254], [96, 232], 26)], 0, E236S162.L9),
([(10, true, false, [254], [96, 232], 27)], 0, E236S162.L10),
([(10, true, false, [254], [96, 232], 29)], 0, E236S162.L11),
([(10, true, false, [254], [96, 232], 33)], 0, E236S162.L12),
([(10, true, false, [254], [96, 232], 39)], 0, E236S162.L13),
([(10, true, false, [254], [96, 232], 50)], 0, E236S162.L14),
([(10, true, false, [254], [96, 232], 55)], 0, E236S162.L15),
([(10, true, false, [254], [96, 232], 56)], 0, E236S162.L16),
([(10, true, false, [254], [96, 232], 62)], 0, E236S162.L17),
([(10, true, false, [254], [96, 232], 80)], 0, E236S162.L18),
([(10, true, false, [254], [96, 232], 81)], 0, E236S162.L19),
([(10, true, false, [254], [96, 232], 83)], 0, E236S162.L20),
([(10, true, false, [254], [96, 232], 84)], 0, E236S162.L21),
([(10, true, false, [254], [96, 232], 85)], 0, E236S162.L22),
([(10, true, false, [254], [96, 232], 87)], 0, E236S162.L23),
([(10, true, false, [254], [96, 232], 88)], 0, E236S162.L24),
([(10, true, false, [254], [96, 232], 89)], 0, E236S162.L25),
([(10, true, false, [254], [96, 232], 91)], 0, E236S162.L26),
([(10, true, false, [254], [96, 232], 121)], 0, E236S162.L27),
([(10, true, false, [254], [96, 232], 123)], 0, E236S162.L28),
([(10, true, false, [254], [96, 232], 124)], 0, E236S162.L29),
([(10, true, false, [254], [96, 232], 126)], 0, E236S162.L30),
([(10, true, false, [254], [96, 232], 129)], 0, E236S162.L31),
([(10, true, false, [254], [96, 232], 130)], 0, E236S162.L32),
([(10, true, false, [254], [96, 232], 131)], 0, E236S162.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E236S162
