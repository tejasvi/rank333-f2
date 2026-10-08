module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S58 "data/lean/07e0923611802ad75340979f98520d7d/E236S58.bin"
namespace E236S58
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [412], [508], 0)], 0, E236S58.L1),
([(6, true, false, [412], [508], 1)], 0, E236S58.L2),
([(6, true, false, [412], [508], 3)], 0, E236S58.L3),
([(6, true, false, [412], [508], 9)], 0, E236S58.L4),
([(6, true, false, [412], [508], 10)], 0, E236S58.L5),
([(6, true, false, [412], [508], 11)], 0, E236S58.L6),
([(6, true, false, [412], [508], 14)], 0, E236S58.L7),
([(6, true, false, [412], [508], 19)], 0, E236S58.L8),
([(6, true, false, [412], [508], 21)], 0, E236S58.L9),
([(6, true, false, [412], [508], 34)], 0, E236S58.L10),
([(6, true, false, [412], [508], 35)], 0, E236S58.L11),
([(6, true, false, [412], [508], 42)], 0, E236S58.L12),
([(6, true, false, [412], [508], 43)], 0, E236S58.L13),
([(6, true, false, [412], [508], 44)], 0, E236S58.L14),
([(6, true, false, [412], [508], 45)], 0, E236S58.L15),
([(6, true, false, [412], [508], 47)], 0, E236S58.L16),
([(6, true, false, [412], [508], 48)], 0, E236S58.L17),
([(6, true, false, [412], [508], 49)], 0, E236S58.L18),
([(6, true, false, [412], [508], 50)], 0, E236S58.L19),
([(6, true, false, [412], [508], 51)], 0, E236S58.L20),
([(6, true, false, [412], [508], 52)], 0, E236S58.L21),
([(6, true, false, [412], [508], 53)], 0, E236S58.L22),
([(6, true, false, [412], [508], 54)], 0, E236S58.L23),
([(6, true, false, [412], [508], 55)], 0, E236S58.L24),
([(6, true, false, [412], [508], 56)], 0, E236S58.L25),
([(6, true, false, [412], [508], 57)], 0, E236S58.L26),
([(6, true, false, [412], [508], 58)], 0, E236S58.L27),
([(6, true, false, [412], [508], 59)], 0, E236S58.L28),
([(6, true, false, [412], [508], 60)], 0, E236S58.L29),
([(6, true, false, [412], [508], 61)], 0, E236S58.L30),
([(6, true, false, [412], [508], 68)], 0, E236S58.L31),
([(6, true, false, [412], [508], 74)], 0, E236S58.L32),
([(6, true, false, [412], [508], 75)], 0, E236S58.L33),
([(6, true, false, [412], [508], 76)], 0, E236S58.L34),
([(6, true, false, [412], [508], 77)], 0, E236S58.L35),
([(6, true, false, [412], [508], 78)], 0, E236S58.L36),
([(6, true, false, [412], [508], 79)], 0, E236S58.L37),
([(6, true, false, [412], [508], 81)], 0, E236S58.L38),
([(6, true, false, [412], [508], 82)], 0, E236S58.L39),
([(6, true, false, [412], [508], 84)], 0, E236S58.L40),
([(6, true, false, [412], [508], 85)], 0, E236S58.L41),
([(6, true, false, [412], [508], 91)], 0, E236S58.L42),
([(6, true, false, [412], [508], 92)], 0, E236S58.L43),
([(6, true, false, [412], [508], 96)], 0, E236S58.L44),
([(6, true, false, [412], [508], 99)], 0, E236S58.L45),
([(6, true, false, [412], [508], 100)], 0, E236S58.L46),
([(6, true, false, [412], [508], 101)], 0, E236S58.L47),
([(6, true, false, [412], [508], 102)], 0, E236S58.L48),
([(6, true, false, [412], [508], 105)], 0, E236S58.L49),
([(6, true, false, [412], [508], 108)], 0, E236S58.L50),
([(6, true, false, [412], [508], 110)], 0, E236S58.L51),
([(6, true, false, [412], [508], 113)], 0, E236S58.L52),
([(6, true, false, [412], [508], 118)], 0, E236S58.L53),
([(6, true, false, [412], [508], 119)], 0, E236S58.L54),
([(6, true, false, [412], [508], 138)], 0, E236S58.L55),
([(6, true, false, [412], [508], 139)], 0, E236S58.L56),
([(6, true, false, [412], [508], 140)], 0, E236S58.L57),
([(6, true, false, [412], [508], 141)], 0, E236S58.L58),
([(6, true, false, [412], [508], 150)], 0, E236S58.L59),
([(6, true, false, [412], [508], 152)], 0, E236S58.L60),
([(6, true, false, [412], [508], 157)], 0, E236S58.L61),
([(6, true, false, [412], [508], 162)], 0, E236S58.L62),
([(6, true, false, [412], [508], 165)], 0, E236S58.L63),
([(6, true, false, [412], [508], 166)], 0, E236S58.L64),
([(6, true, false, [412], [508], 168)], 0, E236S58.L65),
([(6, true, false, [412], [508], 172)], 0, E236S58.L66),
([(6, true, false, [412], [508], 185)], 0, E236S58.L67),
([(6, true, false, [412], [508], 188)], 0, E236S58.L68),
([(6, true, false, [412], [508], 207)], 0, E236S58.L69),
([(6, true, false, [412], [508], 211)], 0, E236S58.L70),
([(6, true, false, [412], [508], 213)], 0, E236S58.L71),
([(6, true, false, [412], [508], 218)], 0, E236S58.L72),
([(6, true, false, [412], [508], 224)], 0, E236S58.L73),
([(6, true, false, [412], [508], 230)], 0, E236S58.L74),
([(6, true, false, [412], [508], 268)], 0, E236S58.L75)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 75
end E236S58
