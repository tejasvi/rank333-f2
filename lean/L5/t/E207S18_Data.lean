module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S18 "data/lean/93f21e519dc8a26363902d3ace19fa8a/E207S18.bin"
namespace E207S18
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 346, 426], [], 30)], 0, E207S18.L1),
([(3, true, false, [266, 346, 426], [], 31)], 0, E207S18.L2),
([(3, true, false, [266, 346, 426], [], 34)], 0, E207S18.L3),
([(3, true, false, [266, 346, 426], [], 35)], 0, E207S18.L4),
([(3, true, false, [266, 346, 426], [], 36)], 0, E207S18.L5),
([(3, true, false, [266, 346, 426], [], 88)], 0, E207S18.L6),
([(3, true, false, [266, 346, 426], [], 92)], 0, E207S18.L7),
([(3, true, false, [266, 346, 426], [], 95)], 0, E207S18.L8),
([(3, true, false, [266, 346, 426], [], 97)], 0, E207S18.L9),
([(3, true, false, [266, 346, 426], [], 98)], 0, E207S18.L10),
([(3, true, false, [266, 346, 426], [], 102)], 0, E207S18.L11),
([(3, true, false, [266, 346, 426], [], 116)], 0, E207S18.L12),
([(3, true, false, [266, 346, 426], [], 152)], 0, E207S18.L13),
([(3, true, false, [266, 346, 426], [], 153)], 0, E207S18.L14),
([(3, true, false, [266, 346, 426], [], 157)], 0, E207S18.L15),
([(3, true, false, [266, 346, 426], [], 158)], 0, E207S18.L16),
([(3, true, false, [266, 346, 426], [], 159)], 0, E207S18.L17),
([(3, true, false, [266, 346, 426], [], 163)], 0, E207S18.L18),
([(3, true, false, [266, 346, 426], [], 166)], 0, E207S18.L19),
([(3, true, false, [266, 346, 426], [], 173)], 0, E207S18.L20),
([(3, true, false, [266, 346, 426], [], 181)], 0, E207S18.L21),
([(3, true, false, [266, 346, 426], [], 216)], 0, E207S18.L22),
([(3, true, false, [266, 346, 426], [], 220)], 0, E207S18.L23),
([(3, true, false, [266, 346, 426], [], 224)], 0, E207S18.L24),
([(3, true, false, [266, 346, 426], [], 228)], 0, E207S18.L25),
([(3, true, false, [266, 346, 426], [], 245)], 0, E207S18.L26),
([(3, true, false, [266, 346, 426], [], 248)], 0, E207S18.L27),
([(3, true, false, [266, 346, 426], [], 264)], 0, E207S18.L28),
([(3, true, false, [266, 346, 426], [], 272)], 0, E207S18.L29),
([(3, true, false, [266, 346, 426], [], 316)], 0, E207S18.L30),
([(3, true, false, [266, 346, 426], [], 320)], 0, E207S18.L31),
([(3, true, false, [266, 346, 426], [], 324)], 0, E207S18.L32),
([(3, true, false, [266, 346, 426], [], 339)], 0, E207S18.L33),
([(3, true, false, [266, 346, 426], [], 342)], 0, E207S18.L34),
([(3, true, false, [266, 346, 426], [], 344)], 0, E207S18.L35),
([(3, true, false, [266, 346, 426], [], 352)], 0, E207S18.L36),
([(3, true, false, [266, 346, 426], [], 356)], 0, E207S18.L37),
([(3, true, false, [266, 346, 426], [], 363)], 0, E207S18.L38),
([(3, true, false, [266, 346, 426], [], 364)], 0, E207S18.L39),
([(3, true, false, [266, 346, 426], [], 368)], 0, E207S18.L40),
([(3, true, false, [266, 346, 426], [], 382)], 0, E207S18.L41),
([(3, true, false, [266, 346, 426], [], 408)], 0, E207S18.L42),
([(3, true, false, [266, 346, 426], [], 464)], 0, E207S18.L43),
([(3, true, false, [266, 346, 426], [], 472)], 0, E207S18.L44),
([(3, true, false, [266, 346, 426], [], 508)], 0, E207S18.L45)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 45
end E207S18
