module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S11 "data/lean/71be33b921e661904209e707d27e4c3d/E207S11.bin"
namespace E207S11
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [286, 346], [], 11)], 0, E207S11.L1),
([(3, true, false, [286, 346], [], 15)], 0, E207S11.L2),
([(3, true, false, [286, 346], [], 20)], 0, E207S11.L3),
([(3, true, false, [286, 346], [], 22)], 0, E207S11.L4),
([(3, true, false, [286, 346], [], 23)], 0, E207S11.L5),
([(3, true, false, [286, 346], [], 28)], 0, E207S11.L6),
([(3, true, false, [286, 346], [], 31)], 0, E207S11.L7),
([(3, true, false, [286, 346], [], 32)], 0, E207S11.L8),
([(3, true, false, [286, 346], [], 53)], 0, E207S11.L9),
([(3, true, false, [286, 346], [], 88)], 0, E207S11.L10),
([(3, true, false, [286, 346], [], 89)], 0, E207S11.L11),
([(3, true, false, [286, 346], [], 90)], 0, E207S11.L12),
([(3, true, false, [286, 346], [], 91)], 0, E207S11.L13),
([(3, true, false, [286, 346], [], 92)], 0, E207S11.L14),
([(3, true, false, [286, 346], [], 93)], 0, E207S11.L15),
([(3, true, false, [286, 346], [], 94)], 0, E207S11.L16),
([(3, true, false, [286, 346], [], 95)], 0, E207S11.L17),
([(3, true, false, [286, 346], [], 96)], 0, E207S11.L18),
([(3, true, false, [286, 346], [], 97)], 0, E207S11.L19),
([(3, true, false, [286, 346], [], 108)], 0, E207S11.L20),
([(3, true, false, [286, 346], [], 121)], 0, E207S11.L21),
([(3, true, false, [286, 346], [], 152)], 0, E207S11.L22),
([(3, true, false, [286, 346], [], 154)], 0, E207S11.L23),
([(3, true, false, [286, 346], [], 155)], 0, E207S11.L24),
([(3, true, false, [286, 346], [], 157)], 0, E207S11.L25),
([(3, true, false, [286, 346], [], 158)], 0, E207S11.L26),
([(3, true, false, [286, 346], [], 159)], 0, E207S11.L27),
([(3, true, false, [286, 346], [], 160)], 0, E207S11.L28),
([(3, true, false, [286, 346], [], 161)], 0, E207S11.L29),
([(3, true, false, [286, 346], [], 162)], 0, E207S11.L30),
([(3, true, false, [286, 346], [], 163)], 0, E207S11.L31),
([(3, true, false, [286, 346], [], 166)], 0, E207S11.L32),
([(3, true, false, [286, 346], [], 181)], 0, E207S11.L33),
([(3, true, false, [286, 346], [], 216)], 0, E207S11.L34),
([(3, true, false, [286, 346], [], 217)], 0, E207S11.L35),
([(3, true, false, [286, 346], [], 222)], 0, E207S11.L36),
([(3, true, false, [286, 346], [], 223)], 0, E207S11.L37),
([(3, true, false, [286, 346], [], 250)], 0, E207S11.L38),
([(3, true, false, [286, 346], [], 251)], 0, E207S11.L39),
([(3, true, false, [286, 346], [], 255)], 0, E207S11.L40),
([(3, true, false, [286, 346], [], 256)], 0, E207S11.L41),
([(3, true, false, [286, 346], [], 268)], 0, E207S11.L42),
([(3, true, false, [286, 346], [], 304)], 0, E207S11.L43),
([(3, true, false, [286, 346], [], 308)], 0, E207S11.L44),
([(3, true, false, [286, 346], [], 311)], 0, E207S11.L45),
([(3, true, false, [286, 346], [], 312)], 0, E207S11.L46),
([(3, true, false, [286, 346], [], 316)], 0, E207S11.L47),
([(3, true, false, [286, 346], [], 332)], 0, E207S11.L48),
([(3, true, false, [286, 346], [], 336)], 0, E207S11.L49),
([(3, true, false, [286, 346], [], 338)], 0, E207S11.L50),
([(3, true, false, [286, 346], [], 341)], 0, E207S11.L51),
([(3, true, false, [286, 346], [], 342)], 0, E207S11.L52),
([(3, true, false, [286, 346], [], 345)], 0, E207S11.L53),
([(3, true, false, [286, 346], [], 364)], 0, E207S11.L54),
([(3, true, false, [286, 346], [], 400)], 0, E207S11.L55),
([(3, true, false, [286, 346], [], 472)], 0, E207S11.L56),
([(3, true, false, [286, 346], [], 508)], 0, E207S11.L57)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 57
end E207S11
