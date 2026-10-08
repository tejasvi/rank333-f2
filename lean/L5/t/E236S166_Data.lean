module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S166 "data/lean/5fa3cbbbc47b5e7ba3b6cdd9e733f3fb/E236S166.bin"
namespace E236S166
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254], [96], 3)], 0, E236S166.L1),
([(10, true, false, [254], [96], 9)], 0, E236S166.L2),
([(10, true, false, [254], [96], 20)], 0, E236S166.L3),
([(10, true, false, [254], [96], 21)], 0, E236S166.L4),
([(10, true, false, [254], [96], 22)], 0, E236S166.L5),
([(10, true, false, [254], [96], 23)], 0, E236S166.L6),
([(10, true, false, [254], [96], 24)], 0, E236S166.L7),
([(10, true, false, [254], [96], 26)], 0, E236S166.L8),
([(10, true, false, [254], [96], 27)], 0, E236S166.L9),
([(10, true, false, [254], [96], 29)], 0, E236S166.L10),
([(10, true, false, [254], [96], 33)], 0, E236S166.L11),
([(10, true, false, [254], [96], 42)], 0, E236S166.L12),
([(10, true, false, [254], [96], 44)], 0, E236S166.L13),
([(10, true, false, [254], [96], 50)], 0, E236S166.L14),
([(10, true, false, [254], [96], 54)], 0, E236S166.L15),
([(10, true, false, [254], [96], 64)], 0, E236S166.L16),
([(10, true, false, [254], [96], 70)], 0, E236S166.L17),
([(10, true, false, [254], [96], 71)], 0, E236S166.L18),
([(10, true, false, [254], [96], 82)], 0, E236S166.L19),
([(10, true, false, [254], [96], 84)], 0, E236S166.L20),
([(10, true, false, [254], [96], 92)], 0, E236S166.L21),
([(10, true, false, [254], [96], 100)], 0, E236S166.L22),
([(10, true, false, [254], [96], 106)], 0, E236S166.L23),
([(10, true, false, [254], [96], 142)], 0, E236S166.L24),
([(10, true, false, [254], [96], 146)], 0, E236S166.L25),
([(10, true, false, [254], [96], 156)], 0, E236S166.L26),
([(10, true, false, [254], [96], 170)], 0, E236S166.L27),
([(10, true, false, [254], [96], 175)], 0, E236S166.L28),
([(10, true, false, [254], [96], 176)], 0, E236S166.L29),
([(10, true, false, [254], [96], 186)], 0, E236S166.L30),
([(10, true, false, [254], [96], 187)], 0, E236S166.L31),
([(10, true, false, [254], [96], 188)], 0, E236S166.L32),
([(10, true, false, [254], [96], 189)], 0, E236S166.L33),
([(10, true, false, [254], [96], 190)], 0, E236S166.L34),
([(10, true, false, [254], [96], 191)], 0, E236S166.L35),
([(10, true, false, [254], [96], 192)], 0, E236S166.L36),
([(10, true, false, [254], [96], 193)], 0, E236S166.L37),
([(10, true, false, [254], [96], 194)], 0, E236S166.L38),
([(10, true, false, [254], [96], 195)], 0, E236S166.L39),
([(10, true, false, [254], [96], 196)], 0, E236S166.L40),
([(10, true, false, [254], [96], 197)], 0, E236S166.L41),
([(10, true, false, [254], [96], 198)], 0, E236S166.L42),
([(10, true, false, [254], [96], 201)], 0, E236S166.L43),
([(10, true, false, [254], [96], 202)], 0, E236S166.L44),
([(10, true, false, [254], [96], 205)], 0, E236S166.L45),
([(10, true, false, [254], [96], 212)], 0, E236S166.L46),
([(10, true, false, [254], [96], 213)], 0, E236S166.L47),
([(10, true, false, [254], [96], 214)], 0, E236S166.L48),
([(10, true, false, [254], [96], 215)], 0, E236S166.L49),
([(10, true, false, [254], [96], 216)], 0, E236S166.L50),
([(10, true, false, [254], [96], 217)], 0, E236S166.L51),
([(10, true, false, [254], [96], 225)], 0, E236S166.L52),
([(10, true, false, [254], [96], 226)], 0, E236S166.L53),
([(10, true, false, [254], [96], 227)], 0, E236S166.L54),
([(10, true, false, [254], [96], 229)], 0, E236S166.L55),
([(10, true, false, [254], [96], 230)], 0, E236S166.L56),
([(10, true, false, [254], [96], 232)], 0, E236S166.L57),
([(10, true, false, [254], [96], 235)], 0, E236S166.L58),
([(10, true, false, [254], [96], 236)], 0, E236S166.L59),
([(10, true, false, [254], [96], 237)], 0, E236S166.L60),
([(10, true, false, [254], [96], 239)], 0, E236S166.L61),
([(10, true, false, [254], [96], 242)], 0, E236S166.L62),
([(10, true, false, [254], [96], 247)], 0, E236S166.L63),
([(10, true, false, [254], [96], 248)], 0, E236S166.L64),
([(10, true, false, [254], [96], 251)], 0, E236S166.L65),
([(10, true, false, [254], [96], 252)], 0, E236S166.L66),
([(10, true, false, [254], [96], 255)], 0, E236S166.L67),
([(10, true, false, [254], [96], 258)], 0, E236S166.L68),
([(10, true, false, [254], [96], 269)], 0, E236S166.L69)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 69
end E236S166
