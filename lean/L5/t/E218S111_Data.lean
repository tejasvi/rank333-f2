module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S111 "data/lean/db4f67b5107af82f51cce54d99d83dbb/E218S111.bin"
namespace E218S111
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [106, 254, 142], [], 20)], 0, E218S111.L1),
([(8, true, false, [106, 254, 142], [], 21)], 0, E218S111.L2),
([(8, true, false, [106, 254, 142], [], 22)], 0, E218S111.L3),
([(8, true, false, [106, 254, 142], [], 39)], 0, E218S111.L4),
([(8, true, false, [106, 254, 142], [], 74)], 0, E218S111.L5),
([(8, true, false, [106, 254, 142], [], 75)], 0, E218S111.L6),
([(8, true, false, [106, 254, 142], [], 76)], 0, E218S111.L7),
([(8, true, false, [106, 254, 142], [], 77)], 0, E218S111.L8),
([(8, true, false, [106, 254, 142], [], 79)], 0, E218S111.L9),
([(8, true, false, [106, 254, 142], [], 80)], 0, E218S111.L10),
([(8, true, false, [106, 254, 142], [], 81)], 0, E218S111.L11),
([(8, true, false, [106, 254, 142], [], 82)], 0, E218S111.L12),
([(8, true, false, [106, 254, 142], [], 83)], 0, E218S111.L13),
([(8, true, false, [106, 254, 142], [], 84)], 0, E218S111.L14),
([(8, true, false, [106, 254, 142], [], 85)], 0, E218S111.L15),
([(8, true, false, [106, 254, 142], [], 86)], 0, E218S111.L16),
([(8, true, false, [106, 254, 142], [], 87)], 0, E218S111.L17),
([(8, true, false, [106, 254, 142], [], 88)], 0, E218S111.L18),
([(8, true, false, [106, 254, 142], [], 89)], 0, E218S111.L19),
([(8, true, false, [106, 254, 142], [], 90)], 0, E218S111.L20),
([(8, true, false, [106, 254, 142], [], 91)], 0, E218S111.L21),
([(8, true, false, [106, 254, 142], [], 93)], 0, E218S111.L22),
([(8, true, false, [106, 254, 142], [], 106)], 0, E218S111.L23),
([(8, true, false, [106, 254, 142], [], 153)], 0, E218S111.L24),
([(8, true, false, [106, 254, 142], [], 156)], 0, E218S111.L25),
([(8, true, false, [106, 254, 142], [], 157)], 0, E218S111.L26),
([(8, true, false, [106, 254, 142], [], 160)], 0, E218S111.L27),
([(8, true, false, [106, 254, 142], [], 173)], 0, E218S111.L28),
([(8, true, false, [106, 254, 142], [], 216)], 0, E218S111.L29),
([(8, true, false, [106, 254, 142], [], 218)], 0, E218S111.L30),
([(8, true, false, [106, 254, 142], [], 224)], 0, E218S111.L31),
([(8, true, false, [106, 254, 142], [], 231)], 0, E218S111.L32),
([(8, true, false, [106, 254, 142], [], 308)], 0, E218S111.L33),
([(8, true, false, [106, 254, 142], [], 310)], 0, E218S111.L34),
([(8, true, false, [106, 254, 142], [], 311)], 0, E218S111.L35),
([(8, true, false, [106, 254, 142], [], 316)], 0, E218S111.L36),
([(8, true, false, [106, 254, 142], [], 317)], 0, E218S111.L37),
([(8, true, false, [106, 254, 142], [], 326)], 0, E218S111.L38),
([(8, true, false, [106, 254, 142], [], 327)], 0, E218S111.L39),
([(8, true, false, [106, 254, 142], [], 331)], 0, E218S111.L40),
([(8, true, false, [106, 254, 142], [], 364)], 0, E218S111.L41),
([(8, true, false, [106, 254, 142], [], 402)], 0, E218S111.L42),
([(8, true, false, [106, 254, 142], [], 472)], 0, E218S111.L43)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 43
end E218S111
