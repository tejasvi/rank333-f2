module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S7 "data/lean/cc589e38b9565f7b31369ea17de66113/E212S7.bin"
namespace E212S7
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [500], [228, 404], 8)], 44, E212S7.L1),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 51)], 0, E212S7.L2),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 67)], 0, E212S7.L3),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 171)], 0, E212S7.L4),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 179)], 0, E212S7.L5),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 291)], 0, E212S7.L6),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 307)], 0, E212S7.L7),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 432)], 0, E212S7.L8),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 435)], 0, E212S7.L9),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 444)], 0, E212S7.L10),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 447)], 0, E212S7.L11),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 448)], 0, E212S7.L12),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 454)], 0, E212S7.L13),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 456)], 0, E212S7.L14),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 459)], 0, E212S7.L15),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 464)], 0, E212S7.L16),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 471)], 0, E212S7.L17),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 504)], 0, E212S7.L18),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 512)], 0, E212S7.L19),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 520)], 0, E212S7.L20),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 528)], 0, E212S7.L21),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 568)], 0, E212S7.L22),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 576)], 0, E212S7.L23),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 584)], 0, E212S7.L24),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 592)], 0, E212S7.L25),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 632)], 0, E212S7.L26),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 640)], 0, E212S7.L27),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 648)], 0, E212S7.L28),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 656)], 0, E212S7.L29),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 835)], 0, E212S7.L30),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 847)], 0, E212S7.L31),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 855)], 0, E212S7.L32),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 859)], 0, E212S7.L33),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1160)], 0, E212S7.L34),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1168)], 0, E212S7.L35),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1176)], 0, E212S7.L36),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1184)], 0, E212S7.L37),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1224)], 0, E212S7.L38),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1230)], 0, E212S7.L39),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1232)], 0, E212S7.L40),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1244)], 0, E212S7.L41),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1248)], 0, E212S7.L42),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1256)], 0, E212S7.L43),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1296)], 0, E212S7.L44),
([(5, true, false, [500], [228, 404], 8), (14, false, false, [494], [404], 1304)], 0, E212S7.L45)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 1
end E212S7
