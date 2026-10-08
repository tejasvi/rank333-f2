module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S23 "data/lean/7df1ff89d2dc5ccbf1550987148c29c5/E207S23.bin"
namespace E207S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 286, 494], [], 20)], 0, E207S23.L1),
([(3, true, false, [266, 286, 494], [], 21)], 0, E207S23.L2),
([(3, true, false, [266, 286, 494], [], 24)], 0, E207S23.L3),
([(3, true, false, [266, 286, 494], [], 25)], 0, E207S23.L4),
([(3, true, false, [266, 286, 494], [], 26)], 0, E207S23.L5),
([(3, true, false, [266, 286, 494], [], 43)], 0, E207S23.L6),
([(3, true, false, [266, 286, 494], [], 74)], 0, E207S23.L7),
([(3, true, false, [266, 286, 494], [], 75)], 0, E207S23.L8),
([(3, true, false, [266, 286, 494], [], 76)], 0, E207S23.L9),
([(3, true, false, [266, 286, 494], [], 77)], 0, E207S23.L10),
([(3, true, false, [266, 286, 494], [], 82)], 0, E207S23.L11),
([(3, true, false, [266, 286, 494], [], 84)], 0, E207S23.L12),
([(3, true, false, [266, 286, 494], [], 85)], 0, E207S23.L13),
([(3, true, false, [266, 286, 494], [], 89)], 0, E207S23.L14),
([(3, true, false, [266, 286, 494], [], 104)], 0, E207S23.L15),
([(3, true, false, [266, 286, 494], [], 106)], 0, E207S23.L16),
([(3, true, false, [266, 286, 494], [], 153)], 0, E207S23.L17),
([(3, true, false, [266, 286, 494], [], 157)], 0, E207S23.L18),
([(3, true, false, [266, 286, 494], [], 158)], 0, E207S23.L19),
([(3, true, false, [266, 286, 494], [], 163)], 0, E207S23.L20),
([(3, true, false, [266, 286, 494], [], 166)], 0, E207S23.L21),
([(3, true, false, [266, 286, 494], [], 168)], 0, E207S23.L22),
([(3, true, false, [266, 286, 494], [], 180)], 0, E207S23.L23),
([(3, true, false, [266, 286, 494], [], 216)], 0, E207S23.L24),
([(3, true, false, [266, 286, 494], [], 218)], 0, E207S23.L25),
([(3, true, false, [266, 286, 494], [], 226)], 0, E207S23.L26),
([(3, true, false, [266, 286, 494], [], 273)], 0, E207S23.L27),
([(3, true, false, [266, 286, 494], [], 308)], 0, E207S23.L28),
([(3, true, false, [266, 286, 494], [], 310)], 0, E207S23.L29),
([(3, true, false, [266, 286, 494], [], 312)], 0, E207S23.L30),
([(3, true, false, [266, 286, 494], [], 314)], 0, E207S23.L31),
([(3, true, false, [266, 286, 494], [], 316)], 0, E207S23.L32),
([(3, true, false, [266, 286, 494], [], 320)], 0, E207S23.L33),
([(3, true, false, [266, 286, 494], [], 336)], 0, E207S23.L34),
([(3, true, false, [266, 286, 494], [], 338)], 0, E207S23.L35),
([(3, true, false, [266, 286, 494], [], 350)], 0, E207S23.L36),
([(3, true, false, [266, 286, 494], [], 352)], 0, E207S23.L37),
([(3, true, false, [266, 286, 494], [], 362)], 0, E207S23.L38),
([(3, true, false, [266, 286, 494], [], 368)], 0, E207S23.L39),
([(3, true, false, [266, 286, 494], [], 400)], 0, E207S23.L40),
([(3, true, false, [266, 286, 494], [], 464)], 0, E207S23.L41),
([(3, true, false, [266, 286, 494], [], 504)], 0, E207S23.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E207S23
