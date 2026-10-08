module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S151 "data/lean/3c29cec7fbef4d4a54818320b3ef2c9a/E236S151.bin"
namespace E236S151
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [372], [96, 232], 0)], 0, E236S151.L1),
([(14, true, false, [372], [96, 232], 1)], 0, E236S151.L2),
([(14, true, false, [372], [96, 232], 2)], 0, E236S151.L3),
([(14, true, false, [372], [96, 232], 3)], 0, E236S151.L4),
([(14, true, false, [372], [96, 232], 4)], 0, E236S151.L5),
([(14, true, false, [372], [96, 232], 5)], 0, E236S151.L6),
([(14, true, false, [372], [96, 232], 6)], 0, E236S151.L7),
([(14, true, false, [372], [96, 232], 7)], 0, E236S151.L8),
([(14, true, false, [372], [96, 232], 9)], 0, E236S151.L9),
([(14, true, false, [372], [96, 232], 26)], 0, E236S151.L10),
([(14, true, false, [372], [96, 232], 34)], 0, E236S151.L11),
([(14, true, false, [372], [96, 232], 46)], 0, E236S151.L12),
([(14, true, false, [372], [96, 232], 48)], 0, E236S151.L13),
([(14, true, false, [372], [96, 232], 50)], 0, E236S151.L14),
([(14, true, false, [372], [96, 232], 52)], 0, E236S151.L15),
([(14, true, false, [372], [96, 232], 54)], 0, E236S151.L16),
([(14, true, false, [372], [96, 232], 55)], 0, E236S151.L17),
([(14, true, false, [372], [96, 232], 56)], 0, E236S151.L18),
([(14, true, false, [372], [96, 232], 58)], 0, E236S151.L19),
([(14, true, false, [372], [96, 232], 59)], 0, E236S151.L20),
([(14, true, false, [372], [96, 232], 60)], 0, E236S151.L21),
([(14, true, false, [372], [96, 232], 61)], 0, E236S151.L22),
([(14, true, false, [372], [96, 232], 80)], 0, E236S151.L23),
([(14, true, false, [372], [96, 232], 81)], 0, E236S151.L24),
([(14, true, false, [372], [96, 232], 82)], 0, E236S151.L25),
([(14, true, false, [372], [96, 232], 83)], 0, E236S151.L26),
([(14, true, false, [372], [96, 232], 84)], 0, E236S151.L27),
([(14, true, false, [372], [96, 232], 86)], 0, E236S151.L28),
([(14, true, false, [372], [96, 232], 88)], 0, E236S151.L29),
([(14, true, false, [372], [96, 232], 121)], 0, E236S151.L30),
([(14, true, false, [372], [96, 232], 122)], 0, E236S151.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S151
