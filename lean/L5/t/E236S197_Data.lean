module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S197 "data/lean/ea2728ec35cf2e5efbc834fd786f012e/E236S197.bin"
namespace E236S197
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [394, 372], [232], 6)], 0, E236S197.L1),
([(9, true, false, [394, 372], [232], 7)], 0, E236S197.L2),
([(9, true, false, [394, 372], [232], 13)], 0, E236S197.L3),
([(9, true, false, [394, 372], [232], 41)], 0, E236S197.L4),
([(9, true, false, [394, 372], [232], 42)], 0, E236S197.L5),
([(9, true, false, [394, 372], [232], 45)], 0, E236S197.L6),
([(9, true, false, [394, 372], [232], 53)], 0, E236S197.L7),
([(9, true, false, [394, 372], [232], 60)], 0, E236S197.L8),
([(9, true, false, [394, 372], [232], 64)], 0, E236S197.L9),
([(9, true, false, [394, 372], [232], 74)], 0, E236S197.L10),
([(9, true, false, [394, 372], [232], 75)], 0, E236S197.L11),
([(9, true, false, [394, 372], [232], 78)], 0, E236S197.L12),
([(9, true, false, [394, 372], [232], 79)], 0, E236S197.L13),
([(9, true, false, [394, 372], [232], 81)], 0, E236S197.L14),
([(9, true, false, [394, 372], [232], 82)], 0, E236S197.L15),
([(9, true, false, [394, 372], [232], 83)], 0, E236S197.L16),
([(9, true, false, [394, 372], [232], 86)], 0, E236S197.L17),
([(9, true, false, [394, 372], [232], 87)], 0, E236S197.L18),
([(9, true, false, [394, 372], [232], 91)], 0, E236S197.L19),
([(9, true, false, [394, 372], [232], 112)], 0, E236S197.L20),
([(9, true, false, [394, 372], [232], 115)], 0, E236S197.L21),
([(9, true, false, [394, 372], [232], 116)], 0, E236S197.L22),
([(9, true, false, [394, 372], [232], 117)], 0, E236S197.L23),
([(9, true, false, [394, 372], [232], 118)], 0, E236S197.L24),
([(9, true, false, [394, 372], [232], 120)], 0, E236S197.L25),
([(9, true, false, [394, 372], [232], 121)], 0, E236S197.L26),
([(9, true, false, [394, 372], [232], 123)], 0, E236S197.L27),
([(9, true, false, [394, 372], [232], 136)], 0, E236S197.L28),
([(9, true, false, [394, 372], [232], 151)], 0, E236S197.L29),
([(9, true, false, [394, 372], [232], 161)], 0, E236S197.L30),
([(9, true, false, [394, 372], [232], 168)], 0, E236S197.L31),
([(9, true, false, [394, 372], [232], 174)], 0, E236S197.L32),
([(9, true, false, [394, 372], [232], 211)], 0, E236S197.L33),
([(9, true, false, [394, 372], [232], 214)], 0, E236S197.L34),
([(9, true, false, [394, 372], [232], 227)], 0, E236S197.L35),
([(9, true, false, [394, 372], [232], 238)], 0, E236S197.L36),
([(9, true, false, [394, 372], [232], 242)], 0, E236S197.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E236S197
