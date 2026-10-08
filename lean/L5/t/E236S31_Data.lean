module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S31 "data/lean/255bb76c151ef9562e1f3e5ad979d50f/E236S31.bin"
namespace E236S31
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [372, 394], [22], 0)], 0, E236S31.L1),
([(6, true, false, [372, 394], [22], 42)], 40, E236S31.L2),
([(6, true, false, [372, 394], [22], 43)], 0, E236S31.L3),
([(6, true, false, [372, 394], [22], 45)], 0, E236S31.L4),
([(6, true, false, [372, 394], [22], 48)], 0, E236S31.L5),
([(6, true, false, [372, 394], [22], 49)], 0, E236S31.L6),
([(6, true, false, [372, 394], [22], 53)], 0, E236S31.L7),
([(6, true, false, [372, 394], [22], 55)], 0, E236S31.L8),
([(6, true, false, [372, 394], [22], 57)], 0, E236S31.L9),
([(6, true, false, [372, 394], [22], 59)], 0, E236S31.L10),
([(6, true, false, [372, 394], [22], 61)], 0, E236S31.L11),
([(6, true, false, [372, 394], [22], 75)], 0, E236S31.L12),
([(6, true, false, [372, 394], [22], 76)], 0, E236S31.L13),
([(6, true, false, [372, 394], [22], 77)], 0, E236S31.L14),
([(6, true, false, [372, 394], [22], 79)], 0, E236S31.L15),
([(6, true, false, [372, 394], [22], 80)], 0, E236S31.L16),
([(6, true, false, [372, 394], [22], 81)], 0, E236S31.L17),
([(6, true, false, [372, 394], [22], 94)], 0, E236S31.L18),
([(6, true, false, [372, 394], [22], 100)], 0, E236S31.L19),
([(6, true, false, [372, 394], [22], 101)], 0, E236S31.L20),
([(6, true, false, [372, 394], [22], 112)], 0, E236S31.L21),
([(6, true, false, [372, 394], [22], 115)], 0, E236S31.L22),
([(6, true, false, [372, 394], [22], 125)], 0, E236S31.L23),
([(6, true, false, [372, 394], [22], 140)], 0, E236S31.L24),
([(6, true, false, [372, 394], [22], 143)], 0, E236S31.L25),
([(6, true, false, [372, 394], [22], 151)], 0, E236S31.L26),
([(6, true, false, [372, 394], [22], 165)], 0, E236S31.L27),
([(6, true, false, [372, 394], [22], 166)], 0, E236S31.L28),
([(6, true, false, [372, 394], [22], 212)], 0, E236S31.L29),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 172)], 0, E236S31.L30),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 175)], 0, E236S31.L31),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 180)], 0, E236S31.L32),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 183)], 0, E236S31.L33),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 188)], 0, E236S31.L34),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 191)], 0, E236S31.L35),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 196)], 0, E236S31.L36),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 199)], 0, E236S31.L37),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 214)], 0, E236S31.L38),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 222)], 0, E236S31.L39),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 225)], 0, E236S31.L40),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 262)], 0, E236S31.L41),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 334)], 0, E236S31.L42),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 337)], 0, E236S31.L43),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 594)], 0, E236S31.L44),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 597)], 0, E236S31.L45),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 598)], 0, E236S31.L46),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 601)], 0, E236S31.L47),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 602)], 0, E236S31.L48),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 605)], 0, E236S31.L49),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 606)], 0, E236S31.L50),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 609)], 0, E236S31.L51),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 694)], 0, E236S31.L52),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 706)], 0, E236S31.L53),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 758)], 0, E236S31.L54),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 761)], 0, E236S31.L55),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 786)], 0, E236S31.L56),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 789)], 0, E236S31.L57),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 992)], 0, E236S31.L58),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 995)], 0, E236S31.L59),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1000)], 0, E236S31.L60),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1003)], 0, E236S31.L61),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1004)], 0, E236S31.L62),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1007)], 0, E236S31.L63),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1012)], 0, E236S31.L64),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1015)], 0, E236S31.L65),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1118)], 0, E236S31.L66),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1129)], 0, E236S31.L67),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1162)], 0, E236S31.L68),
([(6, true, false, [372, 394], [22], 42), (7, false, false, [], [22, 118], 1229)], 0, E236S31.L69)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E236S31
