module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S172 "data/lean/30cd095b19a30cbca0f026b7ec3dc970/E218S172.bin"
namespace E218S172
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 254], [], 0)], 0, E218S172.L1),
([(0, true, false, [106, 142, 254], [], 5)], 0, E218S172.L2),
([(0, true, false, [106, 142, 254], [], 6)], 0, E218S172.L3),
([(0, true, false, [106, 142, 254], [], 7)], 0, E218S172.L4),
([(0, true, false, [106, 142, 254], [], 8)], 0, E218S172.L5),
([(0, true, false, [106, 142, 254], [], 9)], 0, E218S172.L6),
([(0, true, false, [106, 142, 254], [], 15)], 0, E218S172.L7),
([(0, true, false, [106, 142, 254], [], 21)], 0, E218S172.L8),
([(0, true, false, [106, 142, 254], [], 22)], 0, E218S172.L9),
([(0, true, false, [106, 142, 254], [], 28)], 0, E218S172.L10),
([(0, true, false, [106, 142, 254], [], 34)], 0, E218S172.L11),
([(0, true, false, [106, 142, 254], [], 52)], 0, E218S172.L12),
([(0, true, false, [106, 142, 254], [], 53)], 0, E218S172.L13),
([(0, true, false, [106, 142, 254], [], 65)], 0, E218S172.L14),
([(0, true, false, [106, 142, 254], [], 69)], 0, E218S172.L15),
([(0, true, false, [106, 142, 254], [], 70)], 0, E218S172.L16),
([(0, true, false, [106, 142, 254], [], 71)], 0, E218S172.L17),
([(0, true, false, [106, 142, 254], [], 72)], 0, E218S172.L18),
([(0, true, false, [106, 142, 254], [], 73)], 0, E218S172.L19),
([(0, true, false, [106, 142, 254], [], 74)], 0, E218S172.L20),
([(0, true, false, [106, 142, 254], [], 75)], 0, E218S172.L21),
([(0, true, false, [106, 142, 254], [], 76)], 0, E218S172.L22),
([(0, true, false, [106, 142, 254], [], 77)], 0, E218S172.L23),
([(0, true, false, [106, 142, 254], [], 78)], 0, E218S172.L24),
([(0, true, false, [106, 142, 254], [], 79)], 0, E218S172.L25),
([(0, true, false, [106, 142, 254], [], 80)], 0, E218S172.L26),
([(0, true, false, [106, 142, 254], [], 81)], 0, E218S172.L27),
([(0, true, false, [106, 142, 254], [], 85)], 0, E218S172.L28),
([(0, true, false, [106, 142, 254], [], 86)], 0, E218S172.L29),
([(0, true, false, [106, 142, 254], [], 88)], 0, E218S172.L30),
([(0, true, false, [106, 142, 254], [], 91)], 0, E218S172.L31),
([(0, true, false, [106, 142, 254], [], 95)], 0, E218S172.L32),
([(0, true, false, [106, 142, 254], [], 96)], 0, E218S172.L33),
([(0, true, false, [106, 142, 254], [], 109)], 0, E218S172.L34),
([(0, true, false, [106, 142, 254], [], 121)], 0, E218S172.L35),
([(0, true, false, [106, 142, 254], [], 132)], 0, E218S172.L36),
([(0, true, false, [106, 142, 254], [], 141)], 0, E218S172.L37),
([(0, true, false, [106, 142, 254], [], 142)], 0, E218S172.L38),
([(0, true, false, [106, 142, 254], [], 143)], 0, E218S172.L39),
([(0, true, false, [106, 142, 254], [], 146)], 0, E218S172.L40),
([(0, true, false, [106, 142, 254], [], 147)], 0, E218S172.L41),
([(0, true, false, [106, 142, 254], [], 148)], 0, E218S172.L42),
([(0, true, false, [106, 142, 254], [], 149)], 0, E218S172.L43),
([(0, true, false, [106, 142, 254], [], 157)], 0, E218S172.L44),
([(0, true, false, [106, 142, 254], [], 160)], 0, E218S172.L45),
([(0, true, false, [106, 142, 254], [], 162)], 0, E218S172.L46),
([(0, true, false, [106, 142, 254], [], 165)], 0, E218S172.L47),
([(0, true, false, [106, 142, 254], [], 170)], 0, E218S172.L48),
([(0, true, false, [106, 142, 254], [], 201)], 0, E218S172.L49),
([(0, true, false, [106, 142, 254], [], 208)], 0, E218S172.L50),
([(0, true, false, [106, 142, 254], [], 210)], 0, E218S172.L51),
([(0, true, false, [106, 142, 254], [], 217)], 0, E218S172.L52),
([(0, true, false, [106, 142, 254], [], 227)], 0, E218S172.L53),
([(0, true, false, [106, 142, 254], [], 259)], 0, E218S172.L54),
([(0, true, false, [106, 142, 254], [], 264)], 0, E218S172.L55)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 55
end E218S172
