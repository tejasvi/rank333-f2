module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S58 "data/lean/729d2514c11841fe88e3f14492bc0d88/E212S58.bin"
namespace E212S58
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254], [272], 5)], 0, E212S58.L1),
([(7, true, false, [254], [272], 6)], 0, E212S58.L2),
([(7, true, false, [254], [272], 12)], 0, E212S58.L3),
([(7, true, false, [254], [272], 17)], 0, E212S58.L4),
([(7, true, false, [254], [272], 24)], 0, E212S58.L5),
([(7, true, false, [254], [272], 25)], 0, E212S58.L6),
([(7, true, false, [254], [272], 26)], 0, E212S58.L7),
([(7, true, false, [254], [272], 34)], 0, E212S58.L8),
([(7, true, false, [254], [272], 35)], 0, E212S58.L9),
([(7, true, false, [254], [272], 44)], 0, E212S58.L10),
([(7, true, false, [254], [272], 50)], 0, E212S58.L11),
([(7, true, false, [254], [272], 62)], 0, E212S58.L12),
([(7, true, false, [254], [272], 63)], 0, E212S58.L13),
([(7, true, false, [254], [272], 64)], 0, E212S58.L14),
([(7, true, false, [254], [272], 65)], 0, E212S58.L15),
([(7, true, false, [254], [272], 67)], 0, E212S58.L16),
([(7, true, false, [254], [272], 72)], 0, E212S58.L17),
([(7, true, false, [254], [272], 73)], 0, E212S58.L18),
([(7, true, false, [254], [272], 74)], 0, E212S58.L19),
([(7, true, false, [254], [272], 80)], 0, E212S58.L20),
([(7, true, false, [254], [272], 83)], 0, E212S58.L21),
([(7, true, false, [254], [272], 86)], 0, E212S58.L22),
([(7, true, false, [254], [272], 95)], 0, E212S58.L23),
([(7, true, false, [254], [272], 100)], 0, E212S58.L24),
([(7, true, false, [254], [272], 101)], 0, E212S58.L25),
([(7, true, false, [254], [272], 102)], 0, E212S58.L26),
([(7, true, false, [254], [272], 103)], 0, E212S58.L27),
([(7, true, false, [254], [272], 108)], 0, E212S58.L28),
([(7, true, false, [254], [272], 111)], 0, E212S58.L29),
([(7, true, false, [254], [272], 118)], 0, E212S58.L30),
([(7, true, false, [254], [272], 124)], 0, E212S58.L31),
([(7, true, false, [254], [272], 134)], 0, E212S58.L32),
([(7, true, false, [254], [272], 140)], 0, E212S58.L33),
([(7, true, false, [254], [272], 170)], 0, E212S58.L34),
([(7, true, false, [254], [272], 194)], 0, E212S58.L35),
([(7, true, false, [254], [272], 204)], 0, E212S58.L36),
([(7, true, false, [254], [272], 205)], 0, E212S58.L37),
([(7, true, false, [254], [272], 206)], 0, E212S58.L38),
([(7, true, false, [254], [272], 207)], 0, E212S58.L39),
([(7, true, false, [254], [272], 208)], 0, E212S58.L40),
([(7, true, false, [254], [272], 209)], 0, E212S58.L41),
([(7, true, false, [254], [272], 210)], 0, E212S58.L42),
([(7, true, false, [254], [272], 211)], 0, E212S58.L43),
([(7, true, false, [254], [272], 212)], 0, E212S58.L44),
([(7, true, false, [254], [272], 213)], 0, E212S58.L45),
([(7, true, false, [254], [272], 214)], 0, E212S58.L46),
([(7, true, false, [254], [272], 215)], 0, E212S58.L47),
([(7, true, false, [254], [272], 216)], 0, E212S58.L48),
([(7, true, false, [254], [272], 217)], 0, E212S58.L49),
([(7, true, false, [254], [272], 219)], 0, E212S58.L50),
([(7, true, false, [254], [272], 220)], 0, E212S58.L51),
([(7, true, false, [254], [272], 221)], 0, E212S58.L52),
([(7, true, false, [254], [272], 222)], 0, E212S58.L53),
([(7, true, false, [254], [272], 223)], 0, E212S58.L54),
([(7, true, false, [254], [272], 224)], 0, E212S58.L55),
([(7, true, false, [254], [272], 225)], 0, E212S58.L56),
([(7, true, false, [254], [272], 226)], 0, E212S58.L57),
([(7, true, false, [254], [272], 227)], 0, E212S58.L58),
([(7, true, false, [254], [272], 228)], 0, E212S58.L59),
([(7, true, false, [254], [272], 231)], 0, E212S58.L60),
([(7, true, false, [254], [272], 233)], 0, E212S58.L61),
([(7, true, false, [254], [272], 236)], 0, E212S58.L62),
([(7, true, false, [254], [272], 237)], 0, E212S58.L63),
([(7, true, false, [254], [272], 238)], 0, E212S58.L64),
([(7, true, false, [254], [272], 241)], 0, E212S58.L65),
([(7, true, false, [254], [272], 245)], 0, E212S58.L66),
([(7, true, false, [254], [272], 246)], 0, E212S58.L67),
([(7, true, false, [254], [272], 249)], 0, E212S58.L68),
([(7, true, false, [254], [272], 250)], 0, E212S58.L69),
([(7, true, false, [254], [272], 251)], 0, E212S58.L70),
([(7, true, false, [254], [272], 253)], 0, E212S58.L71),
([(7, true, false, [254], [272], 260)], 0, E212S58.L72),
([(7, true, false, [254], [272], 265)], 0, E212S58.L73),
([(7, true, false, [254], [272], 268)], 0, E212S58.L74),
([(7, true, false, [254], [272], 269)], 0, E212S58.L75),
([(7, true, false, [254], [272], 274)], 0, E212S58.L76),
([(7, true, false, [254], [272], 275)], 0, E212S58.L77)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 77
end E212S58
