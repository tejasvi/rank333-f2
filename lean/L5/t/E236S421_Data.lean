module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S421 "data/lean/fc23c4e21690ecb50bcbc5629e1ff46b/E236S421.bin"
namespace E236S421
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 372], [96], 1)], 40, E236S421.L1),
([(0, true, false, [158, 372], [96], 3)], 0, E236S421.L2),
([(0, true, false, [158, 372], [96], 4)], 0, E236S421.L3),
([(0, true, false, [158, 372], [96], 5)], 0, E236S421.L4),
([(0, true, false, [158, 372], [96], 16)], 0, E236S421.L5),
([(0, true, false, [158, 372], [96], 49)], 0, E236S421.L6),
([(0, true, false, [158, 372], [96], 71)], 0, E236S421.L7),
([(0, true, false, [158, 372], [96], 91)], 0, E236S421.L8),
([(0, true, false, [158, 372], [96], 130)], 0, E236S421.L9),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 98)], 0, E236S421.L10),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 106)], 0, E236S421.L11),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 114)], 0, E236S421.L12),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 122)], 0, E236S421.L13),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 128)], 0, E236S421.L14),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 136)], 0, E236S421.L15),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 170)], 0, E236S421.L16),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 192)], 0, E236S421.L17),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 240)], 0, E236S421.L18),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 244)], 0, E236S421.L19),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 248)], 0, E236S421.L20),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 252)], 0, E236S421.L21),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 264)], 0, E236S421.L22),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 288)], 0, E236S421.L23),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 292)], 0, E236S421.L24),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 328)], 0, E236S421.L25),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 354)], 0, E236S421.L26),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 360)], 0, E236S421.L27),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 370)], 0, E236S421.L28),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 376)], 0, E236S421.L29),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 384)], 0, E236S421.L30),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 424)], 0, E236S421.L31),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 448)], 0, E236S421.L32),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 456)], 0, E236S421.L33),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 569)], 0, E236S421.L34),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 585)], 0, E236S421.L35),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 629)], 0, E236S421.L36),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 631)], 0, E236S421.L37),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 644)], 0, E236S421.L38),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 645)], 0, E236S421.L39),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 675)], 0, E236S421.L40),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 707)], 0, E236S421.L41),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 733)], 0, E236S421.L42),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 735)], 0, E236S421.L43),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 765)], 0, E236S421.L44),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 767)], 0, E236S421.L45),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 792)], 0, E236S421.L46),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 808)], 0, E236S421.L47),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 852)], 0, E236S421.L48),
([(0, true, false, [158, 372], [96], 1), (1, false, false, [], [136], 868)], 0, E236S421.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E236S421
