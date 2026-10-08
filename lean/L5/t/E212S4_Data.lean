module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S4 "data/lean/8ae071028fa1945f317b3d4232a57cac/E212S4.bin"
namespace E212S4
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [500], [228, 404], 8)], 70, E212S4.L1),
([(5, true, false, [500], [228, 404], 9)], 0, E212S4.L2),
([(5, true, false, [500], [228, 404], 10)], 0, E212S4.L3),
([(5, true, false, [500], [228, 404], 17)], 0, E212S4.L4),
([(5, true, false, [500], [228, 404], 18)], 0, E212S4.L5),
([(5, true, false, [500], [228, 404], 21)], 0, E212S4.L6),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 142)], 0, E212S4.L7),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 145)], 0, E212S4.L8),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 146)], 0, E212S4.L9),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 149)], 0, E212S4.L10),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 150)], 0, E212S4.L11),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 152)], 0, E212S4.L12),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 190)], 0, E212S4.L13),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 193)], 0, E212S4.L14),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 194)], 0, E212S4.L15),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 197)], 0, E212S4.L16),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 198)], 0, E212S4.L17),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 200)], 0, E212S4.L18),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 214)], 0, E212S4.L19),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 216)], 0, E212S4.L20),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 222)], 0, E212S4.L21),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 225)], 0, E212S4.L22),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 226)], 0, E212S4.L23),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 229)], 0, E212S4.L24),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 238)], 0, E212S4.L25),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 241)], 0, E212S4.L26),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 242)], 0, E212S4.L27),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 245)], 0, E212S4.L28),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 262)], 0, E212S4.L29),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 264)], 0, E212S4.L30),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 478)], 0, E212S4.L31),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 481)], 0, E212S4.L32),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 490)], 0, E212S4.L33),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 493)], 0, E212S4.L34),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 498)], 0, E212S4.L35),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 501)], 0, E212S4.L36),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 502)], 0, E212S4.L37),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 505)], 0, E212S4.L38),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 510)], 0, E212S4.L39),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 513)], 0, E212S4.L40),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 522)], 0, E212S4.L41),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 525)], 0, E212S4.L42),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 530)], 0, E212S4.L43),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 533)], 0, E212S4.L44),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 534)], 0, E212S4.L45),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 537)], 0, E212S4.L46),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 542)], 0, E212S4.L47),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 544)], 0, E212S4.L48),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 554)], 0, E212S4.L49),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 556)], 0, E212S4.L50),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 558)], 0, E212S4.L51),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 560)], 0, E212S4.L52),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 570)], 0, E212S4.L53),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 572)], 0, E212S4.L54),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 758)], 0, E212S4.L55),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 761)], 0, E212S4.L56),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 762)], 0, E212S4.L57),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 765)], 0, E212S4.L58),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 766)], 0, E212S4.L59),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 768)], 0, E212S4.L60),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 802)], 0, E212S4.L61),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 805)], 0, E212S4.L62),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 810)], 0, E212S4.L63),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 812)], 0, E212S4.L64),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 814)], 0, E212S4.L65),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 817)], 0, E212S4.L66),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 834)], 0, E212S4.L67),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 837)], 0, E212S4.L68),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 846)], 0, E212S4.L69),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 849)], 0, E212S4.L70),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 854)], 0, E212S4.L71),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 857)], 0, E212S4.L72),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 858)], 0, E212S4.L73),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 861)], 0, E212S4.L74),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 866)], 0, E212S4.L75),
([(5, true, false, [500], [228, 404], 8), (6, false, false, [], [228, 404], 868)], 0, E212S4.L76)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S4
