module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S40 "data/lean/125072317661fe3d73014572c04fcbaa/E207S40.bin"
namespace E207S40
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [286, 346], [], 0)], 0, E207S40.L1),
([(0, true, false, [286, 346], [], 1)], 0, E207S40.L2),
([(0, true, false, [286, 346], [], 5)], 0, E207S40.L3),
([(0, true, false, [286, 346], [], 6)], 0, E207S40.L4),
([(0, true, false, [286, 346], [], 7)], 0, E207S40.L5),
([(0, true, false, [286, 346], [], 10)], 0, E207S40.L6),
([(0, true, false, [286, 346], [], 14)], 0, E207S40.L7),
([(0, true, false, [286, 346], [], 17)], 0, E207S40.L8),
([(0, true, false, [286, 346], [], 98)], 0, E207S40.L9),
([(0, true, false, [286, 346], [], 99)], 0, E207S40.L10),
([(0, true, false, [286, 346], [], 101)], 0, E207S40.L11),
([(0, true, false, [286, 346], [], 103)], 0, E207S40.L12),
([(0, true, false, [286, 346], [], 105)], 0, E207S40.L13),
([(0, true, false, [286, 346], [], 107)], 0, E207S40.L14),
([(0, true, false, [286, 346], [], 112)], 0, E207S40.L15),
([(0, true, false, [286, 346], [], 121)], 0, E207S40.L16),
([(0, true, false, [286, 346], [], 153)], 0, E207S40.L17),
([(0, true, false, [286, 346], [], 155)], 0, E207S40.L18),
([(0, true, false, [286, 346], [], 156)], 0, E207S40.L19),
([(0, true, false, [286, 346], [], 157)], 0, E207S40.L20),
([(0, true, false, [286, 346], [], 160)], 0, E207S40.L21),
([(0, true, false, [286, 346], [], 173)], 0, E207S40.L22),
([(0, true, false, [286, 346], [], 174)], 0, E207S40.L23),
([(0, true, false, [286, 346], [], 175)], 0, E207S40.L24),
([(0, true, false, [286, 346], [], 176)], 0, E207S40.L25),
([(0, true, false, [286, 346], [], 185)], 0, E207S40.L26),
([(0, true, false, [286, 346], [], 199)], 0, E207S40.L27),
([(0, true, false, [286, 346], [], 206)], 0, E207S40.L28),
([(0, true, false, [286, 346], [], 210)], 0, E207S40.L29),
([(0, true, false, [286, 346], [], 215)], 0, E207S40.L30),
([(0, true, false, [286, 346], [], 218)], 0, E207S40.L31),
([(0, true, false, [286, 346], [], 226)], 0, E207S40.L32),
([(0, true, false, [286, 346], [], 261)], 0, E207S40.L33),
([(0, true, false, [286, 346], [], 262)], 0, E207S40.L34),
([(0, true, false, [286, 346], [], 277)], 0, E207S40.L35),
([(0, true, false, [286, 346], [], 295)], 0, E207S40.L36),
([(0, true, false, [286, 346], [], 353)], 0, E207S40.L37),
([(0, true, false, [286, 346], [], 362)], 0, E207S40.L38),
([(0, true, false, [286, 346], [], 369)], 0, E207S40.L39),
([(0, true, false, [286, 346], [], 385)], 0, E207S40.L40),
([(0, true, false, [286, 346], [], 410)], 0, E207S40.L41),
([(0, true, false, [286, 346], [], 497)], 0, E207S40.L42)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 42
end E207S40
