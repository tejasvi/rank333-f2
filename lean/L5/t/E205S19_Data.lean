module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E205S19 "data/lean/cb010b88dbbab92c48b95078d31a5973/E205S19.bin"
namespace E205S19
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [116, 212], [], 0)], 0, E205S19.L1),
([(6, true, false, [116, 212], [], 1)], 0, E205S19.L2),
([(6, true, false, [116, 212], [], 5)], 0, E205S19.L3),
([(6, true, false, [116, 212], [], 10)], 0, E205S19.L4),
([(6, true, false, [116, 212], [], 11)], 0, E205S19.L5),
([(6, true, false, [116, 212], [], 12)], 0, E205S19.L6),
([(6, true, false, [116, 212], [], 13)], 0, E205S19.L7),
([(6, true, false, [116, 212], [], 14)], 0, E205S19.L8),
([(6, true, false, [116, 212], [], 15)], 0, E205S19.L9),
([(6, true, false, [116, 212], [], 16)], 0, E205S19.L10),
([(6, true, false, [116, 212], [], 17)], 0, E205S19.L11),
([(6, true, false, [116, 212], [], 18)], 0, E205S19.L12),
([(6, true, false, [116, 212], [], 19)], 0, E205S19.L13),
([(6, true, false, [116, 212], [], 20)], 0, E205S19.L14),
([(6, true, false, [116, 212], [], 21)], 0, E205S19.L15),
([(6, true, false, [116, 212], [], 25)], 0, E205S19.L16),
([(6, true, false, [116, 212], [], 30)], 0, E205S19.L17),
([(6, true, false, [116, 212], [], 35)], 0, E205S19.L18),
([(6, true, false, [116, 212], [], 38)], 0, E205S19.L19),
([(6, true, false, [116, 212], [], 39)], 0, E205S19.L20),
([(6, true, false, [116, 212], [], 40)], 0, E205S19.L21),
([(6, true, false, [116, 212], [], 45)], 0, E205S19.L22),
([(6, true, false, [116, 212], [], 60)], 0, E205S19.L23),
([(6, true, false, [116, 212], [], 63)], 0, E205S19.L24),
([(6, true, false, [116, 212], [], 73)], 0, E205S19.L25),
([(6, true, false, [116, 212], [], 74)], 0, E205S19.L26),
([(6, true, false, [116, 212], [], 75)], 0, E205S19.L27),
([(6, true, false, [116, 212], [], 76)], 0, E205S19.L28),
([(6, true, false, [116, 212], [], 77)], 0, E205S19.L29),
([(6, true, false, [116, 212], [], 78)], 0, E205S19.L30),
([(6, true, false, [116, 212], [], 81)], 0, E205S19.L31),
([(6, true, false, [116, 212], [], 82)], 0, E205S19.L32),
([(6, true, false, [116, 212], [], 83)], 0, E205S19.L33),
([(6, true, false, [116, 212], [], 94)], 0, E205S19.L34),
([(6, true, false, [116, 212], [], 95)], 0, E205S19.L35),
([(6, true, false, [116, 212], [], 97)], 0, E205S19.L36),
([(6, true, false, [116, 212], [], 152)], 0, E205S19.L37),
([(6, true, false, [116, 212], [], 162)], 0, E205S19.L38),
([(6, true, false, [116, 212], [], 163)], 0, E205S19.L39),
([(6, true, false, [116, 212], [], 164)], 0, E205S19.L40),
([(6, true, false, [116, 212], [], 172)], 0, E205S19.L41),
([(6, true, false, [116, 212], [], 220)], 0, E205S19.L42),
([(6, true, false, [116, 212], [], 221)], 0, E205S19.L43),
([(6, true, false, [116, 212], [], 264)], 0, E205S19.L44),
([(6, true, false, [116, 212], [], 265)], 0, E205S19.L45),
([(6, true, false, [116, 212], [], 268)], 0, E205S19.L46),
([(6, true, false, [116, 212], [], 270)], 0, E205S19.L47),
([(6, true, false, [116, 212], [], 273)], 0, E205S19.L48),
([(6, true, false, [116, 212], [], 281)], 0, E205S19.L49),
([(6, true, false, [116, 212], [], 283)], 0, E205S19.L50),
([(6, true, false, [116, 212], [], 291)], 0, E205S19.L51),
([(6, true, false, [116, 212], [], 360)], 0, E205S19.L52),
([(6, true, false, [116, 212], [], 404)], 0, E205S19.L53),
([(6, true, false, [116, 212], [], 405)], 0, E205S19.L54)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 54
end E205S19
