module
public import R22Port.U_d41d8cd98f00
public import S7.Nest
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E339S1 "data/lean/499b2002c875bcee56748ebbbb7f61f3/E339S1.bin"
namespace E339S1
open BC7x
/-- records `(path, first sub-record, sub-record count, certificate)`, BFS order of the record tree -/
noncomputable def recs : List (List Step × Nat × Nat × Nat) := [
([(5, true, false, [], [], 2)], 74, 0, E339S1.L1),
([(5, true, false, [], [], 6)], 74, 0, E339S1.L2),
([(5, true, false, [], [], 34)], 74, 0, E339S1.L3),
([(5, true, false, [], [], 49)], 74, 0, E339S1.L4),
([(5, true, false, [], [], 51)], 74, 0, E339S1.L5),
([(5, true, false, [], [], 52)], 74, 0, E339S1.L6),
([(5, true, false, [], [], 53)], 74, 0, E339S1.L7),
([(5, true, false, [], [], 54)], 74, 0, E339S1.L8),
([(5, true, false, [], [], 55)], 74, 0, E339S1.L9),
([(5, true, false, [], [], 58)], 74, 0, E339S1.L10),
([(5, true, false, [], [], 60)], 74, 0, E339S1.L11),
([(5, true, false, [], [], 62)], 74, 0, E339S1.L12),
([(5, true, false, [], [], 64)], 74, 0, E339S1.L13),
([(5, true, false, [], [], 66)], 74, 0, E339S1.L14),
([(5, true, false, [], [], 68)], 74, 0, E339S1.L15),
([(5, true, false, [], [], 69)], 74, 0, E339S1.L16),
([(5, true, false, [], [], 70)], 74, 0, E339S1.L17),
([(5, true, false, [], [], 71)], 74, 0, E339S1.L18),
([(5, true, false, [], [], 72)], 74, 0, E339S1.L19),
([(5, true, false, [], [], 73)], 74, 0, E339S1.L20),
([(5, true, false, [], [], 74)], 74, 0, E339S1.L21),
([(5, true, false, [], [], 75)], 74, 0, E339S1.L22),
([(5, true, false, [], [], 77)], 74, 0, E339S1.L23),
([(5, true, false, [], [], 78)], 74, 0, E339S1.L24),
([(5, true, false, [], [], 80)], 74, 0, E339S1.L25),
([(5, true, false, [], [], 81)], 74, 0, E339S1.L26),
([(5, true, false, [], [], 82)], 74, 0, E339S1.L27),
([(5, true, false, [], [], 83)], 74, 0, E339S1.L28),
([(5, true, false, [], [], 86)], 74, 0, E339S1.L29),
([(5, true, false, [], [], 88)], 74, 0, E339S1.L30),
([(5, true, false, [], [], 91)], 74, 0, E339S1.L31),
([(5, true, false, [], [], 94)], 74, 0, E339S1.L32),
([(5, true, false, [], [], 96)], 74, 0, E339S1.L33),
([(5, true, false, [], [], 97)], 74, 0, E339S1.L34),
([(5, true, false, [], [], 100)], 74, 0, E339S1.L35),
([(5, true, false, [], [], 149)], 74, 0, E339S1.L36),
([(5, true, false, [], [], 170)], 74, 0, E339S1.L37),
([(5, true, false, [], [], 173)], 74, 0, E339S1.L38),
([(5, true, false, [], [], 202)], 74, 0, E339S1.L39),
([(5, true, false, [], [], 321)], 74, 0, E339S1.L40),
([(5, true, false, [], [], 322)], 74, 0, E339S1.L41),
([(5, true, false, [], [], 323)], 74, 0, E339S1.L42),
([(5, true, false, [], [], 324)], 74, 0, E339S1.L43),
([(5, true, false, [], [], 326)], 74, 0, E339S1.L44),
([(5, true, false, [], [], 327)], 74, 0, E339S1.L45),
([(5, true, false, [], [], 328)], 74, 0, E339S1.L46),
([(5, true, false, [], [], 333)], 74, 0, E339S1.L47),
([(5, true, false, [], [], 336)], 74, 0, E339S1.L48),
([(5, true, false, [], [], 346)], 74, 0, E339S1.L49),
([(5, true, false, [], [], 350)], 74, 0, E339S1.L50),
([(5, true, false, [], [], 351)], 74, 0, E339S1.L51),
([(5, true, false, [], [], 373)], 74, 0, E339S1.L52),
([(5, true, false, [], [], 374)], 74, 0, E339S1.L53),
([(5, true, false, [], [], 377)], 74, 0, E339S1.L54),
([(5, true, false, [], [], 396)], 74, 0, E339S1.L55),
([(5, true, false, [], [], 597)], 74, 0, E339S1.L56),
([(5, true, false, [], [], 598)], 74, 0, E339S1.L57),
([(5, true, false, [], [], 601)], 74, 0, E339S1.L58),
([(5, true, false, [], [], 620)], 74, 0, E339S1.L59),
([(5, true, false, [], [], 647)], 74, 0, E339S1.L60),
([(5, true, false, [], [], 648)], 74, 0, E339S1.L61),
([(5, true, false, [], [], 673)], 74, 0, E339S1.L62),
([(5, true, false, [], [], 870)], 74, 0, E339S1.L63),
([(5, true, false, [], [], 871)], 74, 0, E339S1.L64),
([(5, true, false, [], [], 874)], 74, 0, E339S1.L65),
([(5, true, false, [], [], 891)], 74, 0, E339S1.L66),
([(5, true, false, [], [], 899)], 74, 0, E339S1.L67),
([(5, true, false, [], [], 903)], 74, 0, E339S1.L68),
([(5, true, false, [], [], 923)], 74, 0, E339S1.L69),
([(5, true, false, [], [], 1015)], 74, 0, E339S1.L70),
([(5, true, false, [], [], 1045)], 74, 0, E339S1.L71),
([(5, true, false, [], [], 1046)], 74, 0, E339S1.L72),
([(5, true, false, [], [], 1066)], 74, 0, E339S1.L73),
([(5, true, false, [], [], 1078)], 74, 0, E339S1.L74)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 74
end E339S1
