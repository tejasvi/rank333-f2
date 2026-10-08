module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E204S33 "data/lean/0edfbd8003fcb430dd6377f1c0e9e575/E204S33.bin"
namespace E204S33
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 334, 468], [], 1)], 0, E204S33.L1),
([(0, true, false, [266, 334, 468], [], 6)], 0, E204S33.L2),
([(0, true, false, [266, 334, 468], [], 15)], 0, E204S33.L3),
([(0, true, false, [266, 334, 468], [], 19)], 0, E204S33.L4),
([(0, true, false, [266, 334, 468], [], 60)], 0, E204S33.L5),
([(0, true, false, [266, 334, 468], [], 119)], 0, E204S33.L6),
([(0, true, false, [266, 334, 468], [], 120)], 0, E204S33.L7),
([(0, true, false, [266, 334, 468], [], 121)], 0, E204S33.L8),
([(0, true, false, [266, 334, 468], [], 125)], 0, E204S33.L9),
([(0, true, false, [266, 334, 468], [], 126)], 0, E204S33.L10),
([(0, true, false, [266, 334, 468], [], 128)], 0, E204S33.L11),
([(0, true, false, [266, 334, 468], [], 129)], 0, E204S33.L12),
([(0, true, false, [266, 334, 468], [], 130)], 0, E204S33.L13),
([(0, true, false, [266, 334, 468], [], 131)], 0, E204S33.L14),
([(0, true, false, [266, 334, 468], [], 139)], 0, E204S33.L15),
([(0, true, false, [266, 334, 468], [], 213)], 0, E204S33.L16),
([(0, true, false, [266, 334, 468], [], 217)], 0, E204S33.L17),
([(0, true, false, [266, 334, 468], [], 221)], 0, E204S33.L18),
([(0, true, false, [266, 334, 468], [], 225)], 0, E204S33.L19),
([(0, true, false, [266, 334, 468], [], 228)], 0, E204S33.L20),
([(0, true, false, [266, 334, 468], [], 231)], 0, E204S33.L21),
([(0, true, false, [266, 334, 468], [], 232)], 0, E204S33.L22),
([(0, true, false, [266, 334, 468], [], 245)], 0, E204S33.L23),
([(0, true, false, [266, 334, 468], [], 247)], 0, E204S33.L24),
([(0, true, false, [266, 334, 468], [], 249)], 0, E204S33.L25),
([(0, true, false, [266, 334, 468], [], 253)], 0, E204S33.L26),
([(0, true, false, [266, 334, 468], [], 257)], 0, E204S33.L27),
([(0, true, false, [266, 334, 468], [], 260)], 0, E204S33.L28),
([(0, true, false, [266, 334, 468], [], 261)], 0, E204S33.L29),
([(0, true, false, [266, 334, 468], [], 264)], 0, E204S33.L30),
([(0, true, false, [266, 334, 468], [], 268)], 0, E204S33.L31),
([(0, true, false, [266, 334, 468], [], 272)], 0, E204S33.L32)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 32
end E204S33
