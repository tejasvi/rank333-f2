module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S163 "data/lean/6f2caac01c01a9519c11bb0ff9b7243e/E236S163.bin"
namespace E236S163
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254], [96], 1)], 0, E236S163.L1),
([(10, true, false, [254], [96], 3)], 0, E236S163.L2),
([(10, true, false, [254], [96], 9)], 0, E236S163.L3),
([(10, true, false, [254], [96], 20)], 0, E236S163.L4),
([(10, true, false, [254], [96], 21)], 0, E236S163.L5),
([(10, true, false, [254], [96], 22)], 0, E236S163.L6),
([(10, true, false, [254], [96], 23)], 0, E236S163.L7),
([(10, true, false, [254], [96], 25)], 0, E236S163.L8),
([(10, true, false, [254], [96], 27)], 0, E236S163.L9),
([(10, true, false, [254], [96], 28)], 0, E236S163.L10),
([(10, true, false, [254], [96], 30)], 0, E236S163.L11),
([(10, true, false, [254], [96], 31)], 0, E236S163.L12),
([(10, true, false, [254], [96], 34)], 0, E236S163.L13),
([(10, true, false, [254], [96], 36)], 0, E236S163.L14),
([(10, true, false, [254], [96], 42)], 0, E236S163.L15),
([(10, true, false, [254], [96], 44)], 0, E236S163.L16),
([(10, true, false, [254], [96], 50)], 0, E236S163.L17),
([(10, true, false, [254], [96], 54)], 0, E236S163.L18),
([(10, true, false, [254], [96], 64)], 0, E236S163.L19),
([(10, true, false, [254], [96], 70)], 0, E236S163.L20),
([(10, true, false, [254], [96], 82)], 0, E236S163.L21),
([(10, true, false, [254], [96], 90)], 0, E236S163.L22),
([(10, true, false, [254], [96], 92)], 0, E236S163.L23),
([(10, true, false, [254], [96], 100)], 0, E236S163.L24),
([(10, true, false, [254], [96], 106)], 0, E236S163.L25),
([(10, true, false, [254], [96], 142)], 0, E236S163.L26),
([(10, true, false, [254], [96], 146)], 0, E236S163.L27),
([(10, true, false, [254], [96], 156)], 0, E236S163.L28),
([(10, true, false, [254], [96], 170)], 0, E236S163.L29),
([(10, true, false, [254], [96], 173)], 0, E236S163.L30),
([(10, true, false, [254], [96], 174)], 0, E236S163.L31),
([(10, true, false, [254], [96], 175)], 0, E236S163.L32),
([(10, true, false, [254], [96], 178)], 0, E236S163.L33),
([(10, true, false, [254], [96], 186)], 0, E236S163.L34),
([(10, true, false, [254], [96], 187)], 0, E236S163.L35),
([(10, true, false, [254], [96], 188)], 0, E236S163.L36),
([(10, true, false, [254], [96], 189)], 0, E236S163.L37),
([(10, true, false, [254], [96], 190)], 0, E236S163.L38),
([(10, true, false, [254], [96], 191)], 0, E236S163.L39),
([(10, true, false, [254], [96], 192)], 0, E236S163.L40),
([(10, true, false, [254], [96], 193)], 0, E236S163.L41),
([(10, true, false, [254], [96], 194)], 0, E236S163.L42),
([(10, true, false, [254], [96], 195)], 0, E236S163.L43),
([(10, true, false, [254], [96], 196)], 0, E236S163.L44),
([(10, true, false, [254], [96], 197)], 0, E236S163.L45),
([(10, true, false, [254], [96], 198)], 0, E236S163.L46),
([(10, true, false, [254], [96], 200)], 0, E236S163.L47),
([(10, true, false, [254], [96], 201)], 0, E236S163.L48),
([(10, true, false, [254], [96], 206)], 0, E236S163.L49),
([(10, true, false, [254], [96], 208)], 0, E236S163.L50),
([(10, true, false, [254], [96], 211)], 0, E236S163.L51),
([(10, true, false, [254], [96], 212)], 0, E236S163.L52),
([(10, true, false, [254], [96], 214)], 0, E236S163.L53),
([(10, true, false, [254], [96], 227)], 0, E236S163.L54),
([(10, true, false, [254], [96], 229)], 0, E236S163.L55),
([(10, true, false, [254], [96], 231)], 0, E236S163.L56),
([(10, true, false, [254], [96], 232)], 0, E236S163.L57),
([(10, true, false, [254], [96], 234)], 0, E236S163.L58),
([(10, true, false, [254], [96], 235)], 0, E236S163.L59),
([(10, true, false, [254], [96], 236)], 0, E236S163.L60),
([(10, true, false, [254], [96], 237)], 0, E236S163.L61),
([(10, true, false, [254], [96], 238)], 0, E236S163.L62),
([(10, true, false, [254], [96], 240)], 0, E236S163.L63),
([(10, true, false, [254], [96], 241)], 0, E236S163.L64),
([(10, true, false, [254], [96], 246)], 0, E236S163.L65),
([(10, true, false, [254], [96], 248)], 0, E236S163.L66),
([(10, true, false, [254], [96], 255)], 0, E236S163.L67),
([(10, true, false, [254], [96], 262)], 0, E236S163.L68)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 68
end E236S163
