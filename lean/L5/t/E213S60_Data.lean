module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S60 "data/lean/efccd201a7d4868aaf62f16c8154b47a/E213S60.bin"
namespace E213S60
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 158], [368], 0)], 0, E213S60.L1),
([(6, true, false, [106, 158], [368], 6)], 0, E213S60.L2),
([(6, true, false, [106, 158], [368], 7)], 0, E213S60.L3),
([(6, true, false, [106, 158], [368], 10)], 0, E213S60.L4),
([(6, true, false, [106, 158], [368], 12)], 0, E213S60.L5),
([(6, true, false, [106, 158], [368], 13)], 0, E213S60.L6),
([(6, true, false, [106, 158], [368], 15)], 0, E213S60.L7),
([(6, true, false, [106, 158], [368], 16)], 0, E213S60.L8),
([(6, true, false, [106, 158], [368], 19)], 0, E213S60.L9),
([(6, true, false, [106, 158], [368], 21)], 0, E213S60.L10),
([(6, true, false, [106, 158], [368], 23)], 0, E213S60.L11),
([(6, true, false, [106, 158], [368], 24)], 0, E213S60.L12),
([(6, true, false, [106, 158], [368], 26)], 0, E213S60.L13),
([(6, true, false, [106, 158], [368], 31)], 0, E213S60.L14),
([(6, true, false, [106, 158], [368], 39)], 0, E213S60.L15),
([(6, true, false, [106, 158], [368], 41)], 0, E213S60.L16),
([(6, true, false, [106, 158], [368], 42)], 0, E213S60.L17),
([(6, true, false, [106, 158], [368], 43)], 0, E213S60.L18),
([(6, true, false, [106, 158], [368], 48)], 0, E213S60.L19),
([(6, true, false, [106, 158], [368], 51)], 0, E213S60.L20),
([(6, true, false, [106, 158], [368], 53)], 0, E213S60.L21),
([(6, true, false, [106, 158], [368], 64)], 0, E213S60.L22),
([(6, true, false, [106, 158], [368], 66)], 0, E213S60.L23),
([(6, true, false, [106, 158], [368], 67)], 0, E213S60.L24),
([(6, true, false, [106, 158], [368], 75)], 0, E213S60.L25),
([(6, true, false, [106, 158], [368], 77)], 0, E213S60.L26),
([(6, true, false, [106, 158], [368], 85)], 0, E213S60.L27),
([(6, true, false, [106, 158], [368], 87)], 0, E213S60.L28),
([(6, true, false, [106, 158], [368], 95)], 0, E213S60.L29),
([(6, true, false, [106, 158], [368], 96)], 0, E213S60.L30),
([(6, true, false, [106, 158], [368], 102)], 0, E213S60.L31),
([(6, true, false, [106, 158], [368], 104)], 0, E213S60.L32),
([(6, true, false, [106, 158], [368], 105)], 0, E213S60.L33),
([(6, true, false, [106, 158], [368], 125)], 0, E213S60.L34),
([(6, true, false, [106, 158], [368], 131)], 0, E213S60.L35),
([(6, true, false, [106, 158], [368], 136)], 0, E213S60.L36),
([(6, true, false, [106, 158], [368], 140)], 0, E213S60.L37),
([(6, true, false, [106, 158], [368], 142)], 0, E213S60.L38),
([(6, true, false, [106, 158], [368], 143)], 0, E213S60.L39),
([(6, true, false, [106, 158], [368], 144)], 0, E213S60.L40),
([(6, true, false, [106, 158], [368], 146)], 0, E213S60.L41),
([(6, true, false, [106, 158], [368], 147)], 0, E213S60.L42),
([(6, true, false, [106, 158], [368], 148)], 0, E213S60.L43),
([(6, true, false, [106, 158], [368], 151)], 0, E213S60.L44),
([(6, true, false, [106, 158], [368], 152)], 0, E213S60.L45),
([(6, true, false, [106, 158], [368], 158)], 0, E213S60.L46),
([(6, true, false, [106, 158], [368], 166)], 0, E213S60.L47),
([(6, true, false, [106, 158], [368], 176)], 0, E213S60.L48),
([(6, true, false, [106, 158], [368], 181)], 0, E213S60.L49),
([(6, true, false, [106, 158], [368], 204)], 0, E213S60.L50),
([(6, true, false, [106, 158], [368], 210)], 0, E213S60.L51),
([(6, true, false, [106, 158], [368], 228)], 0, E213S60.L52),
([(6, true, false, [106, 158], [368], 254)], 0, E213S60.L53),
([(6, true, false, [106, 158], [368], 258)], 0, E213S60.L54),
([(6, true, false, [106, 158], [368], 262)], 0, E213S60.L55),
([(6, true, false, [106, 158], [368], 263)], 0, E213S60.L56),
([(6, true, false, [106, 158], [368], 268)], 0, E213S60.L57),
([(6, true, false, [106, 158], [368], 269)], 0, E213S60.L58)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 58
end E213S60
