module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S241 "data/lean/ef0413ce74e599693507b5076cb995b7/E213S241.bin"
namespace E213S241
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [244, 254], [], 0)], 0, E213S241.L1),
([(2, true, false, [244, 254], [], 1)], 0, E213S241.L2),
([(2, true, false, [244, 254], [], 2)], 0, E213S241.L3),
([(2, true, false, [244, 254], [], 3)], 0, E213S241.L4),
([(2, true, false, [244, 254], [], 4)], 0, E213S241.L5),
([(2, true, false, [244, 254], [], 5)], 0, E213S241.L6),
([(2, true, false, [244, 254], [], 6)], 0, E213S241.L7),
([(2, true, false, [244, 254], [], 7)], 0, E213S241.L8),
([(2, true, false, [244, 254], [], 9)], 0, E213S241.L9),
([(2, true, false, [244, 254], [], 11)], 0, E213S241.L10),
([(2, true, false, [244, 254], [], 14)], 0, E213S241.L11),
([(2, true, false, [244, 254], [], 15)], 0, E213S241.L12),
([(2, true, false, [244, 254], [], 16)], 0, E213S241.L13),
([(2, true, false, [244, 254], [], 20)], 0, E213S241.L14),
([(2, true, false, [244, 254], [], 21)], 0, E213S241.L15),
([(2, true, false, [244, 254], [], 41)], 0, E213S241.L16),
([(2, true, false, [244, 254], [], 50)], 0, E213S241.L17),
([(2, true, false, [244, 254], [], 88)], 0, E213S241.L18),
([(2, true, false, [244, 254], [], 89)], 0, E213S241.L19),
([(2, true, false, [244, 254], [], 90)], 0, E213S241.L20),
([(2, true, false, [244, 254], [], 91)], 0, E213S241.L21),
([(2, true, false, [244, 254], [], 92)], 0, E213S241.L22),
([(2, true, false, [244, 254], [], 93)], 0, E213S241.L23),
([(2, true, false, [244, 254], [], 94)], 0, E213S241.L24),
([(2, true, false, [244, 254], [], 95)], 0, E213S241.L25),
([(2, true, false, [244, 254], [], 96)], 0, E213S241.L26),
([(2, true, false, [244, 254], [], 99)], 0, E213S241.L27),
([(2, true, false, [244, 254], [], 109)], 0, E213S241.L28),
([(2, true, false, [244, 254], [], 110)], 0, E213S241.L29),
([(2, true, false, [244, 254], [], 112)], 0, E213S241.L30),
([(2, true, false, [244, 254], [], 117)], 0, E213S241.L31),
([(2, true, false, [244, 254], [], 122)], 0, E213S241.L32),
([(2, true, false, [244, 254], [], 135)], 0, E213S241.L33),
([(2, true, false, [244, 254], [], 145)], 0, E213S241.L34),
([(2, true, false, [244, 254], [], 149)], 0, E213S241.L35),
([(2, true, false, [244, 254], [], 153)], 0, E213S241.L36),
([(2, true, false, [244, 254], [], 154)], 0, E213S241.L37),
([(2, true, false, [244, 254], [], 155)], 0, E213S241.L38),
([(2, true, false, [244, 254], [], 156)], 0, E213S241.L39),
([(2, true, false, [244, 254], [], 157)], 0, E213S241.L40),
([(2, true, false, [244, 254], [], 158)], 0, E213S241.L41),
([(2, true, false, [244, 254], [], 160)], 0, E213S241.L42),
([(2, true, false, [244, 254], [], 161)], 0, E213S241.L43),
([(2, true, false, [244, 254], [], 163)], 0, E213S241.L44),
([(2, true, false, [244, 254], [], 174)], 0, E213S241.L45),
([(2, true, false, [244, 254], [], 175)], 0, E213S241.L46),
([(2, true, false, [244, 254], [], 176)], 0, E213S241.L47),
([(2, true, false, [244, 254], [], 180)], 0, E213S241.L48),
([(2, true, false, [244, 254], [], 181)], 0, E213S241.L49),
([(2, true, false, [244, 254], [], 185)], 0, E213S241.L50),
([(2, true, false, [244, 254], [], 209)], 0, E213S241.L51),
([(2, true, false, [244, 254], [], 217)], 0, E213S241.L52),
([(2, true, false, [244, 254], [], 220)], 0, E213S241.L53),
([(2, true, false, [244, 254], [], 221)], 0, E213S241.L54),
([(2, true, false, [244, 254], [], 226)], 0, E213S241.L55),
([(2, true, false, [244, 254], [], 228)], 0, E213S241.L56),
([(2, true, false, [244, 254], [], 231)], 0, E213S241.L57),
([(2, true, false, [244, 254], [], 243)], 0, E213S241.L58),
([(2, true, false, [244, 254], [], 249)], 0, E213S241.L59),
([(2, true, false, [244, 254], [], 254)], 0, E213S241.L60),
([(2, true, false, [244, 254], [], 257)], 0, E213S241.L61),
([(2, true, false, [244, 254], [], 261)], 0, E213S241.L62),
([(2, true, false, [244, 254], [], 305)], 0, E213S241.L63),
([(2, true, false, [244, 254], [], 314)], 0, E213S241.L64),
([(2, true, false, [244, 254], [], 353)], 0, E213S241.L65),
([(2, true, false, [244, 254], [], 360)], 0, E213S241.L66),
([(2, true, false, [244, 254], [], 401)], 0, E213S241.L67),
([(2, true, false, [244, 254], [], 432)], 0, E213S241.L68),
([(2, true, false, [244, 254], [], 465)], 0, E213S241.L69),
([(2, true, false, [244, 254], [], 472)], 0, E213S241.L70),
([(2, true, false, [244, 254], [], 490)], 0, E213S241.L71)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 71
end E213S241
