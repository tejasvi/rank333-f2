module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S100 "data/lean/cdbfdae928256bb2648ba0602332216d/E218S100.bin"
namespace E218S100
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254], [112], 0)], 0, E218S100.L1),
([(8, true, false, [254], [112], 1)], 0, E218S100.L2),
([(8, true, false, [254], [112], 3)], 0, E218S100.L3),
([(8, true, false, [254], [112], 7)], 0, E218S100.L4),
([(8, true, false, [254], [112], 9)], 0, E218S100.L5),
([(8, true, false, [254], [112], 12)], 0, E218S100.L6),
([(8, true, false, [254], [112], 13)], 0, E218S100.L7),
([(8, true, false, [254], [112], 15)], 0, E218S100.L8),
([(8, true, false, [254], [112], 19)], 0, E218S100.L9),
([(8, true, false, [254], [112], 20)], 0, E218S100.L10),
([(8, true, false, [254], [112], 21)], 0, E218S100.L11),
([(8, true, false, [254], [112], 22)], 0, E218S100.L12),
([(8, true, false, [254], [112], 23)], 0, E218S100.L13),
([(8, true, false, [254], [112], 24)], 0, E218S100.L14),
([(8, true, false, [254], [112], 25)], 0, E218S100.L15),
([(8, true, false, [254], [112], 27)], 0, E218S100.L16),
([(8, true, false, [254], [112], 28)], 0, E218S100.L17),
([(8, true, false, [254], [112], 29)], 0, E218S100.L18),
([(8, true, false, [254], [112], 32)], 0, E218S100.L19),
([(8, true, false, [254], [112], 33)], 0, E218S100.L20),
([(8, true, false, [254], [112], 35)], 0, E218S100.L21),
([(8, true, false, [254], [112], 39)], 0, E218S100.L22),
([(8, true, false, [254], [112], 40)], 0, E218S100.L23),
([(8, true, false, [254], [112], 42)], 0, E218S100.L24),
([(8, true, false, [254], [112], 43)], 0, E218S100.L25),
([(8, true, false, [254], [112], 44)], 0, E218S100.L26),
([(8, true, false, [254], [112], 45)], 0, E218S100.L27),
([(8, true, false, [254], [112], 46)], 0, E218S100.L28),
([(8, true, false, [254], [112], 47)], 0, E218S100.L29),
([(8, true, false, [254], [112], 48)], 0, E218S100.L30),
([(8, true, false, [254], [112], 49)], 0, E218S100.L31),
([(8, true, false, [254], [112], 50)], 0, E218S100.L32),
([(8, true, false, [254], [112], 51)], 0, E218S100.L33),
([(8, true, false, [254], [112], 52)], 0, E218S100.L34),
([(8, true, false, [254], [112], 55)], 0, E218S100.L35),
([(8, true, false, [254], [112], 59)], 0, E218S100.L36),
([(8, true, false, [254], [112], 62)], 0, E218S100.L37),
([(8, true, false, [254], [112], 63)], 0, E218S100.L38),
([(8, true, false, [254], [112], 84)], 0, E218S100.L39),
([(8, true, false, [254], [112], 113)], 0, E218S100.L40),
([(8, true, false, [254], [112], 168)], 0, E218S100.L41),
([(8, true, false, [254], [112], 183)], 0, E218S100.L42),
([(8, true, false, [254], [112], 192)], 0, E218S100.L43),
([(8, true, false, [254], [112], 193)], 0, E218S100.L44),
([(8, true, false, [254], [112], 194)], 0, E218S100.L45),
([(8, true, false, [254], [112], 195)], 0, E218S100.L46),
([(8, true, false, [254], [112], 196)], 0, E218S100.L47),
([(8, true, false, [254], [112], 197)], 0, E218S100.L48),
([(8, true, false, [254], [112], 198)], 0, E218S100.L49),
([(8, true, false, [254], [112], 199)], 0, E218S100.L50),
([(8, true, false, [254], [112], 200)], 0, E218S100.L51),
([(8, true, false, [254], [112], 201)], 0, E218S100.L52),
([(8, true, false, [254], [112], 202)], 0, E218S100.L53),
([(8, true, false, [254], [112], 203)], 0, E218S100.L54),
([(8, true, false, [254], [112], 204)], 0, E218S100.L55),
([(8, true, false, [254], [112], 206)], 0, E218S100.L56),
([(8, true, false, [254], [112], 208)], 0, E218S100.L57),
([(8, true, false, [254], [112], 218)], 0, E218S100.L58),
([(8, true, false, [254], [112], 219)], 0, E218S100.L59),
([(8, true, false, [254], [112], 222)], 0, E218S100.L60),
([(8, true, false, [254], [112], 232)], 0, E218S100.L61),
([(8, true, false, [254], [112], 236)], 0, E218S100.L62),
([(8, true, false, [254], [112], 244)], 0, E218S100.L63),
([(8, true, false, [254], [112], 245)], 0, E218S100.L64),
([(8, true, false, [254], [112], 246)], 0, E218S100.L65),
([(8, true, false, [254], [112], 248)], 0, E218S100.L66),
([(8, true, false, [254], [112], 261)], 0, E218S100.L67),
([(8, true, false, [254], [112], 264)], 0, E218S100.L68)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 68
end E218S100
