module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S255 "data/lean/a8b1bb73f5994c07a4d8054d24786b55/E236S255.bin"
namespace E236S255
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [372, 412, 158], [], 10)], 0, E236S255.L1),
([(6, true, false, [372, 412, 158], [], 11)], 0, E236S255.L2),
([(6, true, false, [372, 412, 158], [], 12)], 0, E236S255.L3),
([(6, true, false, [372, 412, 158], [], 14)], 0, E236S255.L4),
([(6, true, false, [372, 412, 158], [], 15)], 0, E236S255.L5),
([(6, true, false, [372, 412, 158], [], 16)], 0, E236S255.L6),
([(6, true, false, [372, 412, 158], [], 17)], 0, E236S255.L7),
([(6, true, false, [372, 412, 158], [], 18)], 0, E236S255.L8),
([(6, true, false, [372, 412, 158], [], 19)], 0, E236S255.L9),
([(6, true, false, [372, 412, 158], [], 74)], 0, E236S255.L10),
([(6, true, false, [372, 412, 158], [], 75)], 0, E236S255.L11),
([(6, true, false, [372, 412, 158], [], 76)], 2, E236S255.L12),
([(6, true, false, [372, 412, 158], [], 79)], 0, E236S255.L13),
([(6, true, false, [372, 412, 158], [], 80)], 0, E236S255.L14),
([(6, true, false, [372, 412, 158], [], 84)], 0, E236S255.L15),
([(6, true, false, [372, 412, 158], [], 86)], 0, E236S255.L16),
([(6, true, false, [372, 412, 158], [], 88)], 0, E236S255.L17),
([(6, true, false, [372, 412, 158], [], 89)], 0, E236S255.L18),
([(6, true, false, [372, 412, 158], [], 90)], 0, E236S255.L19),
([(6, true, false, [372, 412, 158], [], 91)], 0, E236S255.L20),
([(6, true, false, [372, 412, 158], [], 92)], 0, E236S255.L21),
([(6, true, false, [372, 412, 158], [], 95)], 0, E236S255.L22),
([(6, true, false, [372, 412, 158], [], 106)], 0, E236S255.L23),
([(6, true, false, [372, 412, 158], [], 118)], 0, E236S255.L24),
([(6, true, false, [372, 412, 158], [], 152)], 0, E236S255.L25),
([(6, true, false, [372, 412, 158], [], 158)], 0, E236S255.L26),
([(6, true, false, [372, 412, 158], [], 218)], 0, E236S255.L27),
([(6, true, false, [372, 412, 158], [], 224)], 0, E236S255.L28),
([(6, true, false, [372, 412, 158], [], 227)], 0, E236S255.L29),
([(6, true, false, [372, 412, 158], [], 252)], 0, E236S255.L30),
([(6, true, false, [372, 412, 158], [], 254)], 0, E236S255.L31),
([(6, true, false, [372, 412, 158], [], 255)], 0, E236S255.L32),
([(6, true, false, [372, 412, 158], [], 261)], 0, E236S255.L33),
([(6, true, false, [372, 412, 158], [], 265)], 0, E236S255.L34),
([(6, true, false, [372, 412, 158], [], 310)], 0, E236S255.L35),
([(6, true, false, [372, 412, 158], [], 357)], 0, E236S255.L36),
([(6, true, false, [372, 412, 158], [], 402)], 0, E236S255.L37),
([(6, true, false, [372, 412, 158], [], 482)], 0, E236S255.L38),
([(6, true, false, [372, 412, 158], [], 76), (12, false, false, [], [490, 508], 536)], 0, E236S255.L39),
([(6, true, false, [372, 412, 158], [], 76), (12, false, false, [], [490, 508], 539)], 0, E236S255.L40)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 38
end E236S255
