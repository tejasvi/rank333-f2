module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S85 "data/lean/8441be18d1394c5f1b06a55ae2ed9797/E236S85.bin"
namespace E236S85
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [394], [490], 1)], 0, E236S85.L1),
([(9, true, false, [394], [490], 2)], 0, E236S85.L2),
([(9, true, false, [394], [490], 3)], 0, E236S85.L3),
([(9, true, false, [394], [490], 4)], 0, E236S85.L4),
([(9, true, false, [394], [490], 5)], 0, E236S85.L5),
([(9, true, false, [394], [490], 6)], 0, E236S85.L6),
([(9, true, false, [394], [490], 7)], 0, E236S85.L7),
([(9, true, false, [394], [490], 8)], 0, E236S85.L8),
([(9, true, false, [394], [490], 9)], 0, E236S85.L9),
([(9, true, false, [394], [490], 10)], 0, E236S85.L10),
([(9, true, false, [394], [490], 11)], 0, E236S85.L11),
([(9, true, false, [394], [490], 12)], 0, E236S85.L12),
([(9, true, false, [394], [490], 13)], 0, E236S85.L13),
([(9, true, false, [394], [490], 14)], 0, E236S85.L14),
([(9, true, false, [394], [490], 15)], 0, E236S85.L15),
([(9, true, false, [394], [490], 16)], 0, E236S85.L16),
([(9, true, false, [394], [490], 17)], 0, E236S85.L17),
([(9, true, false, [394], [490], 18)], 0, E236S85.L18),
([(9, true, false, [394], [490], 19)], 0, E236S85.L19),
([(9, true, false, [394], [490], 20)], 0, E236S85.L20),
([(9, true, false, [394], [490], 21)], 0, E236S85.L21),
([(9, true, false, [394], [490], 22)], 0, E236S85.L22),
([(9, true, false, [394], [490], 23)], 0, E236S85.L23),
([(9, true, false, [394], [490], 24)], 0, E236S85.L24),
([(9, true, false, [394], [490], 25)], 0, E236S85.L25),
([(9, true, false, [394], [490], 26)], 0, E236S85.L26),
([(9, true, false, [394], [490], 27)], 0, E236S85.L27),
([(9, true, false, [394], [490], 28)], 0, E236S85.L28),
([(9, true, false, [394], [490], 29)], 0, E236S85.L29),
([(9, true, false, [394], [490], 31)], 0, E236S85.L30),
([(9, true, false, [394], [490], 32)], 0, E236S85.L31),
([(9, true, false, [394], [490], 33)], 0, E236S85.L32),
([(9, true, false, [394], [490], 34)], 0, E236S85.L33),
([(9, true, false, [394], [490], 35)], 0, E236S85.L34),
([(9, true, false, [394], [490], 36)], 0, E236S85.L35),
([(9, true, false, [394], [490], 37)], 0, E236S85.L36),
([(9, true, false, [394], [490], 38)], 0, E236S85.L37),
([(9, true, false, [394], [490], 39)], 0, E236S85.L38),
([(9, true, false, [394], [490], 40)], 0, E236S85.L39),
([(9, true, false, [394], [490], 41)], 0, E236S85.L40),
([(9, true, false, [394], [490], 48)], 0, E236S85.L41),
([(9, true, false, [394], [490], 54)], 0, E236S85.L42),
([(9, true, false, [394], [490], 72)], 0, E236S85.L43),
([(9, true, false, [394], [490], 82)], 0, E236S85.L44),
([(9, true, false, [394], [490], 85)], 0, E236S85.L45),
([(9, true, false, [394], [490], 86)], 0, E236S85.L46),
([(9, true, false, [394], [490], 93)], 0, E236S85.L47),
([(9, true, false, [394], [490], 94)], 0, E236S85.L48),
([(9, true, false, [394], [490], 108)], 0, E236S85.L49),
([(9, true, false, [394], [490], 131)], 0, E236S85.L50),
([(9, true, false, [394], [490], 132)], 0, E236S85.L51),
([(9, true, false, [394], [490], 139)], 0, E236S85.L52),
([(9, true, false, [394], [490], 142)], 0, E236S85.L53),
([(9, true, false, [394], [490], 144)], 0, E236S85.L54),
([(9, true, false, [394], [490], 147)], 0, E236S85.L55),
([(9, true, false, [394], [490], 148)], 0, E236S85.L56),
([(9, true, false, [394], [490], 150)], 0, E236S85.L57),
([(9, true, false, [394], [490], 152)], 0, E236S85.L58),
([(9, true, false, [394], [490], 156)], 0, E236S85.L59),
([(9, true, false, [394], [490], 185)], 0, E236S85.L60),
([(9, true, false, [394], [490], 191)], 0, E236S85.L61),
([(9, true, false, [394], [490], 201)], 0, E236S85.L62),
([(9, true, false, [394], [490], 202)], 0, E236S85.L63),
([(9, true, false, [394], [490], 205)], 0, E236S85.L64),
([(9, true, false, [394], [490], 209)], 0, E236S85.L65),
([(9, true, false, [394], [490], 214)], 0, E236S85.L66),
([(9, true, false, [394], [490], 224)], 0, E236S85.L67),
([(9, true, false, [394], [490], 236)], 0, E236S85.L68),
([(9, true, false, [394], [490], 268)], 0, E236S85.L69),
([(9, true, false, [394], [490], 274)], 0, E236S85.L70)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 70
end E236S85
