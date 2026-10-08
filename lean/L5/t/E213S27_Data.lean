module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S27 "data/lean/1d6a732af547240849e34e46da3e585e/E213S27.bin"
namespace E213S27
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [282], [272], 1)], 0, E213S27.L1),
([(9, true, false, [282], [272], 4)], 0, E213S27.L2),
([(9, true, false, [282], [272], 5)], 0, E213S27.L3),
([(9, true, false, [282], [272], 6)], 0, E213S27.L4),
([(9, true, false, [282], [272], 7)], 0, E213S27.L5),
([(9, true, false, [282], [272], 8)], 0, E213S27.L6),
([(9, true, false, [282], [272], 9)], 0, E213S27.L7),
([(9, true, false, [282], [272], 10)], 0, E213S27.L8),
([(9, true, false, [282], [272], 11)], 0, E213S27.L9),
([(9, true, false, [282], [272], 12)], 0, E213S27.L10),
([(9, true, false, [282], [272], 13)], 0, E213S27.L11),
([(9, true, false, [282], [272], 14)], 0, E213S27.L12),
([(9, true, false, [282], [272], 15)], 0, E213S27.L13),
([(9, true, false, [282], [272], 16)], 0, E213S27.L14),
([(9, true, false, [282], [272], 17)], 0, E213S27.L15),
([(9, true, false, [282], [272], 19)], 0, E213S27.L16),
([(9, true, false, [282], [272], 20)], 0, E213S27.L17),
([(9, true, false, [282], [272], 21)], 0, E213S27.L18),
([(9, true, false, [282], [272], 23)], 0, E213S27.L19),
([(9, true, false, [282], [272], 25)], 0, E213S27.L20),
([(9, true, false, [282], [272], 32)], 0, E213S27.L21),
([(9, true, false, [282], [272], 35)], 0, E213S27.L22),
([(9, true, false, [282], [272], 40)], 0, E213S27.L23),
([(9, true, false, [282], [272], 41)], 0, E213S27.L24),
([(9, true, false, [282], [272], 42)], 0, E213S27.L25),
([(9, true, false, [282], [272], 48)], 0, E213S27.L26),
([(9, true, false, [282], [272], 50)], 0, E213S27.L27),
([(9, true, false, [282], [272], 52)], 0, E213S27.L28),
([(9, true, false, [282], [272], 53)], 0, E213S27.L29),
([(9, true, false, [282], [272], 54)], 0, E213S27.L30),
([(9, true, false, [282], [272], 58)], 0, E213S27.L31),
([(9, true, false, [282], [272], 65)], 0, E213S27.L32),
([(9, true, false, [282], [272], 70)], 0, E213S27.L33),
([(9, true, false, [282], [272], 78)], 0, E213S27.L34),
([(9, true, false, [282], [272], 79)], 0, E213S27.L35),
([(9, true, false, [282], [272], 80)], 0, E213S27.L36),
([(9, true, false, [282], [272], 81)], 0, E213S27.L37),
([(9, true, false, [282], [272], 82)], 0, E213S27.L38),
([(9, true, false, [282], [272], 85)], 0, E213S27.L39),
([(9, true, false, [282], [272], 86)], 0, E213S27.L40),
([(9, true, false, [282], [272], 89)], 0, E213S27.L41),
([(9, true, false, [282], [272], 90)], 0, E213S27.L42),
([(9, true, false, [282], [272], 91)], 0, E213S27.L43),
([(9, true, false, [282], [272], 92)], 0, E213S27.L44),
([(9, true, false, [282], [272], 93)], 0, E213S27.L45),
([(9, true, false, [282], [272], 96)], 0, E213S27.L46),
([(9, true, false, [282], [272], 97)], 0, E213S27.L47),
([(9, true, false, [282], [272], 103)], 0, E213S27.L48),
([(9, true, false, [282], [272], 108)], 0, E213S27.L49),
([(9, true, false, [282], [272], 116)], 0, E213S27.L50),
([(9, true, false, [282], [272], 117)], 0, E213S27.L51),
([(9, true, false, [282], [272], 118)], 0, E213S27.L52),
([(9, true, false, [282], [272], 128)], 0, E213S27.L53),
([(9, true, false, [282], [272], 131)], 0, E213S27.L54),
([(9, true, false, [282], [272], 132)], 0, E213S27.L55),
([(9, true, false, [282], [272], 134)], 0, E213S27.L56),
([(9, true, false, [282], [272], 136)], 0, E213S27.L57),
([(9, true, false, [282], [272], 139)], 0, E213S27.L58),
([(9, true, false, [282], [272], 141)], 0, E213S27.L59),
([(9, true, false, [282], [272], 142)], 0, E213S27.L60),
([(9, true, false, [282], [272], 170)], 0, E213S27.L61),
([(9, true, false, [282], [272], 172)], 0, E213S27.L62),
([(9, true, false, [282], [272], 176)], 0, E213S27.L63),
([(9, true, false, [282], [272], 185)], 0, E213S27.L64),
([(9, true, false, [282], [272], 186)], 0, E213S27.L65),
([(9, true, false, [282], [272], 189)], 0, E213S27.L66),
([(9, true, false, [282], [272], 200)], 0, E213S27.L67),
([(9, true, false, [282], [272], 201)], 0, E213S27.L68),
([(9, true, false, [282], [272], 217)], 0, E213S27.L69),
([(9, true, false, [282], [272], 222)], 0, E213S27.L70),
([(9, true, false, [282], [272], 236)], 0, E213S27.L71),
([(9, true, false, [282], [272], 237)], 0, E213S27.L72),
([(9, true, false, [282], [272], 245)], 0, E213S27.L73),
([(9, true, false, [282], [272], 251)], 0, E213S27.L74),
([(9, true, false, [282], [272], 268)], 0, E213S27.L75),
([(9, true, false, [282], [272], 274)], 0, E213S27.L76)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 76
end E213S27
