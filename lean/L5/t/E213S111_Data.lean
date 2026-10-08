module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S111 "data/lean/88b4b0daa59af60cc4a5f92d1f7bbd7d/E213S111.bin"
namespace E213S111
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [254], [368], 0)], 0, E213S111.L1),
([(15, true, false, [254], [368], 2)], 0, E213S111.L2),
([(15, true, false, [254], [368], 3)], 0, E213S111.L3),
([(15, true, false, [254], [368], 4)], 0, E213S111.L4),
([(15, true, false, [254], [368], 5)], 0, E213S111.L5),
([(15, true, false, [254], [368], 6)], 0, E213S111.L6),
([(15, true, false, [254], [368], 7)], 0, E213S111.L7),
([(15, true, false, [254], [368], 8)], 0, E213S111.L8),
([(15, true, false, [254], [368], 10)], 0, E213S111.L9),
([(15, true, false, [254], [368], 16)], 0, E213S111.L10),
([(15, true, false, [254], [368], 29)], 0, E213S111.L11),
([(15, true, false, [254], [368], 30)], 0, E213S111.L12),
([(15, true, false, [254], [368], 33)], 0, E213S111.L13),
([(15, true, false, [254], [368], 42)], 0, E213S111.L14),
([(15, true, false, [254], [368], 44)], 0, E213S111.L15),
([(15, true, false, [254], [368], 45)], 0, E213S111.L16),
([(15, true, false, [254], [368], 48)], 0, E213S111.L17),
([(15, true, false, [254], [368], 68)], 0, E213S111.L18),
([(15, true, false, [254], [368], 80)], 0, E213S111.L19),
([(15, true, false, [254], [368], 81)], 0, E213S111.L20),
([(15, true, false, [254], [368], 82)], 0, E213S111.L21),
([(15, true, false, [254], [368], 84)], 0, E213S111.L22),
([(15, true, false, [254], [368], 87)], 0, E213S111.L23),
([(15, true, false, [254], [368], 100)], 0, E213S111.L24),
([(15, true, false, [254], [368], 104)], 0, E213S111.L25),
([(15, true, false, [254], [368], 105)], 0, E213S111.L26),
([(15, true, false, [254], [368], 116)], 0, E213S111.L27),
([(15, true, false, [254], [368], 118)], 0, E213S111.L28),
([(15, true, false, [254], [368], 119)], 0, E213S111.L29),
([(15, true, false, [254], [368], 120)], 0, E213S111.L30),
([(15, true, false, [254], [368], 121)], 0, E213S111.L31),
([(15, true, false, [254], [368], 122)], 0, E213S111.L32),
([(15, true, false, [254], [368], 124)], 0, E213S111.L33),
([(15, true, false, [254], [368], 125)], 0, E213S111.L34),
([(15, true, false, [254], [368], 127)], 0, E213S111.L35),
([(15, true, false, [254], [368], 131)], 0, E213S111.L36),
([(15, true, false, [254], [368], 132)], 0, E213S111.L37),
([(15, true, false, [254], [368], 144)], 0, E213S111.L38),
([(15, true, false, [254], [368], 146)], 0, E213S111.L39),
([(15, true, false, [254], [368], 158)], 0, E213S111.L40),
([(15, true, false, [254], [368], 172)], 0, E213S111.L41),
([(15, true, false, [254], [368], 248)], 0, E213S111.L42),
([(15, true, false, [254], [368], 252)], 0, E213S111.L43),
([(15, true, false, [254], [368], 254)], 0, E213S111.L44),
([(15, true, false, [254], [368], 264)], 0, E213S111.L45)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 45
end E213S111
