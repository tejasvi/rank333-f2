module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S135 "data/lean/1927d080a4d24031297d375a9a9817b1/E218S135.bin"
namespace E218S135
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [142, 500, 106], [], 74)], 0, E218S135.L1),
([(5, true, false, [142, 500, 106], [], 75)], 0, E218S135.L2),
([(5, true, false, [142, 500, 106], [], 76)], 0, E218S135.L3),
([(5, true, false, [142, 500, 106], [], 77)], 0, E218S135.L4),
([(5, true, false, [142, 500, 106], [], 78)], 0, E218S135.L5),
([(5, true, false, [142, 500, 106], [], 79)], 0, E218S135.L6),
([(5, true, false, [142, 500, 106], [], 80)], 0, E218S135.L7),
([(5, true, false, [142, 500, 106], [], 81)], 0, E218S135.L8),
([(5, true, false, [142, 500, 106], [], 82)], 0, E218S135.L9),
([(5, true, false, [142, 500, 106], [], 83)], 0, E218S135.L10),
([(5, true, false, [142, 500, 106], [], 84)], 0, E218S135.L11),
([(5, true, false, [142, 500, 106], [], 87)], 0, E218S135.L12),
([(5, true, false, [142, 500, 106], [], 99)], 0, E218S135.L13),
([(5, true, false, [142, 500, 106], [], 119)], 0, E218S135.L14),
([(5, true, false, [142, 500, 106], [], 152)], 0, E218S135.L15),
([(5, true, false, [142, 500, 106], [], 153)], 0, E218S135.L16),
([(5, true, false, [142, 500, 106], [], 154)], 0, E218S135.L17),
([(5, true, false, [142, 500, 106], [], 155)], 0, E218S135.L18),
([(5, true, false, [142, 500, 106], [], 156)], 0, E218S135.L19),
([(5, true, false, [142, 500, 106], [], 157)], 0, E218S135.L20),
([(5, true, false, [142, 500, 106], [], 158)], 0, E218S135.L21),
([(5, true, false, [142, 500, 106], [], 159)], 0, E218S135.L22),
([(5, true, false, [142, 500, 106], [], 160)], 0, E218S135.L23),
([(5, true, false, [142, 500, 106], [], 161)], 0, E218S135.L24),
([(5, true, false, [142, 500, 106], [], 173)], 0, E218S135.L25),
([(5, true, false, [142, 500, 106], [], 217)], 0, E218S135.L26),
([(5, true, false, [142, 500, 106], [], 225)], 0, E218S135.L27),
([(5, true, false, [142, 500, 106], [], 231)], 0, E218S135.L28),
([(5, true, false, [142, 500, 106], [], 252)], 0, E218S135.L29),
([(5, true, false, [142, 500, 106], [], 254)], 0, E218S135.L30),
([(5, true, false, [142, 500, 106], [], 256)], 0, E218S135.L31),
([(5, true, false, [142, 500, 106], [], 263)], 0, E218S135.L32),
([(5, true, false, [142, 500, 106], [], 352)], 0, E218S135.L33),
([(5, true, false, [142, 500, 106], [], 355)], 0, E218S135.L34),
([(5, true, false, [142, 500, 106], [], 364)], 0, E218S135.L35),
([(5, true, false, [142, 500, 106], [], 367)], 0, E218S135.L36),
([(5, true, false, [142, 500, 106], [], 370)], 0, E218S135.L37),
([(5, true, false, [142, 500, 106], [], 380)], 0, E218S135.L38),
([(5, true, false, [142, 500, 106], [], 399)], 0, E218S135.L39),
([(5, true, false, [142, 500, 106], [], 415)], 0, E218S135.L40),
([(5, true, false, [142, 500, 106], [], 513)], 0, E218S135.L41)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 41
end E218S135
