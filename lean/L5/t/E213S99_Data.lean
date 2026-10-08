module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S99 "data/lean/3ff5969f25831a82fa92d9dee5e0812f/E213S99.bin"
namespace E213S99
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [244, 254], [], 10)], 0, E213S99.L1),
([(8, true, false, [244, 254], [], 11)], 0, E213S99.L2),
([(8, true, false, [244, 254], [], 12)], 0, E213S99.L3),
([(8, true, false, [244, 254], [], 13)], 0, E213S99.L4),
([(8, true, false, [244, 254], [], 14)], 0, E213S99.L5),
([(8, true, false, [244, 254], [], 15)], 0, E213S99.L6),
([(8, true, false, [244, 254], [], 16)], 0, E213S99.L7),
([(8, true, false, [244, 254], [], 17)], 0, E213S99.L8),
([(8, true, false, [244, 254], [], 18)], 0, E213S99.L9),
([(8, true, false, [244, 254], [], 19)], 0, E213S99.L10),
([(8, true, false, [244, 254], [], 21)], 0, E213S99.L11),
([(8, true, false, [244, 254], [], 22)], 0, E213S99.L12),
([(8, true, false, [244, 254], [], 23)], 0, E213S99.L13),
([(8, true, false, [244, 254], [], 26)], 0, E213S99.L14),
([(8, true, false, [244, 254], [], 27)], 0, E213S99.L15),
([(8, true, false, [244, 254], [], 28)], 0, E213S99.L16),
([(8, true, false, [244, 254], [], 33)], 0, E213S99.L17),
([(8, true, false, [244, 254], [], 34)], 0, E213S99.L18),
([(8, true, false, [244, 254], [], 53)], 0, E213S99.L19),
([(8, true, false, [244, 254], [], 88)], 0, E213S99.L20),
([(8, true, false, [244, 254], [], 89)], 0, E213S99.L21),
([(8, true, false, [244, 254], [], 152)], 0, E213S99.L22),
([(8, true, false, [244, 254], [], 153)], 0, E213S99.L23),
([(8, true, false, [244, 254], [], 154)], 0, E213S99.L24),
([(8, true, false, [244, 254], [], 155)], 0, E213S99.L25),
([(8, true, false, [244, 254], [], 156)], 0, E213S99.L26),
([(8, true, false, [244, 254], [], 157)], 0, E213S99.L27),
([(8, true, false, [244, 254], [], 158)], 0, E213S99.L28),
([(8, true, false, [244, 254], [], 159)], 0, E213S99.L29),
([(8, true, false, [244, 254], [], 160)], 0, E213S99.L30),
([(8, true, false, [244, 254], [], 161)], 0, E213S99.L31),
([(8, true, false, [244, 254], [], 163)], 0, E213S99.L32),
([(8, true, false, [244, 254], [], 165)], 0, E213S99.L33),
([(8, true, false, [244, 254], [], 166)], 0, E213S99.L34),
([(8, true, false, [244, 254], [], 173)], 0, E213S99.L35),
([(8, true, false, [244, 254], [], 185)], 0, E213S99.L36),
([(8, true, false, [244, 254], [], 216)], 0, E213S99.L37),
([(8, true, false, [244, 254], [], 217)], 0, E213S99.L38),
([(8, true, false, [244, 254], [], 220)], 0, E213S99.L39),
([(8, true, false, [244, 254], [], 221)], 0, E213S99.L40),
([(8, true, false, [244, 254], [], 222)], 0, E213S99.L41),
([(8, true, false, [244, 254], [], 224)], 0, E213S99.L42),
([(8, true, false, [244, 254], [], 225)], 0, E213S99.L43),
([(8, true, false, [244, 254], [], 228)], 0, E213S99.L44),
([(8, true, false, [244, 254], [], 229)], 0, E213S99.L45),
([(8, true, false, [244, 254], [], 246)], 0, E213S99.L46),
([(8, true, false, [244, 254], [], 254)], 0, E213S99.L47),
([(8, true, false, [244, 254], [], 256)], 0, E213S99.L48),
([(8, true, false, [244, 254], [], 263)], 0, E213S99.L49),
([(8, true, false, [244, 254], [], 264)], 0, E213S99.L50),
([(8, true, false, [244, 254], [], 268)], 0, E213S99.L51),
([(8, true, false, [244, 254], [], 272)], 0, E213S99.L52),
([(8, true, false, [244, 254], [], 273)], 0, E213S99.L53),
([(8, true, false, [244, 254], [], 284)], 0, E213S99.L54),
([(8, true, false, [244, 254], [], 298)], 0, E213S99.L55),
([(8, true, false, [244, 254], [], 303)], 0, E213S99.L56),
([(8, true, false, [244, 254], [], 316)], 0, E213S99.L57),
([(8, true, false, [244, 254], [], 317)], 0, E213S99.L58),
([(8, true, false, [244, 254], [], 352)], 0, E213S99.L59),
([(8, true, false, [244, 254], [], 358)], 0, E213S99.L60),
([(8, true, false, [244, 254], [], 362)], 0, E213S99.L61),
([(8, true, false, [244, 254], [], 364)], 0, E213S99.L62),
([(8, true, false, [244, 254], [], 370)], 0, E213S99.L63),
([(8, true, false, [244, 254], [], 382)], 0, E213S99.L64),
([(8, true, false, [244, 254], [], 390)], 0, E213S99.L65),
([(8, true, false, [244, 254], [], 391)], 0, E213S99.L66),
([(8, true, false, [244, 254], [], 398)], 0, E213S99.L67),
([(8, true, false, [244, 254], [], 399)], 0, E213S99.L68),
([(8, true, false, [244, 254], [], 508)], 0, E213S99.L69),
([(8, true, false, [244, 254], [], 509)], 0, E213S99.L70)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 70
end E213S99
