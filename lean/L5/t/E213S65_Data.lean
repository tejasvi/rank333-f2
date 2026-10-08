module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S65 "data/lean/bc7a16ed9a2a468c261334061ddfbdad/E213S65.bin"
namespace E213S65
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(16, true, false, [158], [96, 368], 1)], 0, E213S65.L1),
([(16, true, false, [158], [96, 368], 2)], 0, E213S65.L2),
([(16, true, false, [158], [96, 368], 6)], 0, E213S65.L3),
([(16, true, false, [158], [96, 368], 8)], 0, E213S65.L4),
([(16, true, false, [158], [96, 368], 9)], 0, E213S65.L5),
([(16, true, false, [158], [96, 368], 11)], 0, E213S65.L6),
([(16, true, false, [158], [96, 368], 19)], 0, E213S65.L7),
([(16, true, false, [158], [96, 368], 27)], 0, E213S65.L8),
([(16, true, false, [158], [96, 368], 29)], 0, E213S65.L9),
([(16, true, false, [158], [96, 368], 31)], 0, E213S65.L10),
([(16, true, false, [158], [96, 368], 33)], 0, E213S65.L11),
([(16, true, false, [158], [96, 368], 39)], 0, E213S65.L12),
([(16, true, false, [158], [96, 368], 43)], 0, E213S65.L13),
([(16, true, false, [158], [96, 368], 51)], 0, E213S65.L14),
([(16, true, false, [158], [96, 368], 53)], 0, E213S65.L15),
([(16, true, false, [158], [96, 368], 54)], 0, E213S65.L16),
([(16, true, false, [158], [96, 368], 56)], 0, E213S65.L17),
([(16, true, false, [158], [96, 368], 57)], 0, E213S65.L18),
([(16, true, false, [158], [96, 368], 59)], 0, E213S65.L19),
([(16, true, false, [158], [96, 368], 60)], 0, E213S65.L20),
([(16, true, false, [158], [96, 368], 63)], 0, E213S65.L21),
([(16, true, false, [158], [96, 368], 81)], 0, E213S65.L22),
([(16, true, false, [158], [96, 368], 86)], 0, E213S65.L23),
([(16, true, false, [158], [96, 368], 93)], 0, E213S65.L24),
([(16, true, false, [158], [96, 368], 107)], 0, E213S65.L25),
([(16, true, false, [158], [96, 368], 112)], 0, E213S65.L26),
([(16, true, false, [158], [96, 368], 121)], 0, E213S65.L27),
([(16, true, false, [158], [96, 368], 122)], 0, E213S65.L28),
([(16, true, false, [158], [96, 368], 124)], 0, E213S65.L29),
([(16, true, false, [158], [96, 368], 126)], 0, E213S65.L30),
([(16, true, false, [158], [96, 368], 127)], 0, E213S65.L31),
([(16, true, false, [158], [96, 368], 128)], 0, E213S65.L32),
([(16, true, false, [158], [96, 368], 131)], 0, E213S65.L33),
([(16, true, false, [158], [96, 368], 133)], 0, E213S65.L34),
([(16, true, false, [158], [96, 368], 138)], 0, E213S65.L35),
([(16, true, false, [158], [96, 368], 157)], 0, E213S65.L36),
([(16, true, false, [158], [96, 368], 162)], 0, E213S65.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E213S65
