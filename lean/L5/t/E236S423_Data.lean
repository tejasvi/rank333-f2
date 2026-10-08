module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S423 "data/lean/6c61c425afeb4181bf869ecf1710b298/E236S423.bin"
namespace E236S423
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 412], [], 0)], 2, E236S423.L1),
([(0, true, false, [354, 372, 412], [], 1)], 0, E236S423.L2),
([(0, true, false, [354, 372, 412], [], 2)], 0, E236S423.L3),
([(0, true, false, [354, 372, 412], [], 3)], 0, E236S423.L4),
([(0, true, false, [354, 372, 412], [], 4)], 0, E236S423.L5),
([(0, true, false, [354, 372, 412], [], 10)], 0, E236S423.L6),
([(0, true, false, [354, 372, 412], [], 12)], 0, E236S423.L7),
([(0, true, false, [354, 372, 412], [], 17)], 0, E236S423.L8),
([(0, true, false, [354, 372, 412], [], 19)], 0, E236S423.L9),
([(0, true, false, [354, 372, 412], [], 31)], 0, E236S423.L10),
([(0, true, false, [354, 372, 412], [], 34)], 0, E236S423.L11),
([(0, true, false, [354, 372, 412], [], 37)], 0, E236S423.L12),
([(0, true, false, [354, 372, 412], [], 38)], 0, E236S423.L13),
([(0, true, false, [354, 372, 412], [], 47)], 0, E236S423.L14),
([(0, true, false, [354, 372, 412], [], 51)], 0, E236S423.L15),
([(0, true, false, [354, 372, 412], [], 61)], 0, E236S423.L16),
([(0, true, false, [354, 372, 412], [], 62)], 0, E236S423.L17),
([(0, true, false, [354, 372, 412], [], 72)], 0, E236S423.L18),
([(0, true, false, [354, 372, 412], [], 73)], 0, E236S423.L19),
([(0, true, false, [354, 372, 412], [], 83)], 0, E236S423.L20),
([(0, true, false, [354, 372, 412], [], 85)], 0, E236S423.L21),
([(0, true, false, [354, 372, 412], [], 93)], 0, E236S423.L22),
([(0, true, false, [354, 372, 412], [], 97)], 0, E236S423.L23),
([(0, true, false, [354, 372, 412], [], 107)], 0, E236S423.L24),
([(0, true, false, [354, 372, 412], [], 109)], 0, E236S423.L25),
([(0, true, false, [354, 372, 412], [], 119)], 0, E236S423.L26),
([(0, true, false, [354, 372, 412], [], 120)], 0, E236S423.L27),
([(0, true, false, [354, 372, 412], [], 131)], 0, E236S423.L28),
([(0, true, false, [354, 372, 412], [], 139)], 0, E236S423.L29),
([(0, true, false, [354, 372, 412], [], 143)], 0, E236S423.L30),
([(0, true, false, [354, 372, 412], [], 153)], 0, E236S423.L31),
([(0, true, false, [354, 372, 412], [], 167)], 0, E236S423.L32),
([(0, true, false, [354, 372, 412], [], 168)], 0, E236S423.L33),
([(0, true, false, [354, 372, 412], [], 182)], 0, E236S423.L34),
([(0, true, false, [354, 372, 412], [], 187)], 0, E236S423.L35),
([(0, true, false, [354, 372, 412], [], 189)], 0, E236S423.L36),
([(0, true, false, [354, 372, 412], [], 193)], 0, E236S423.L37),
([(0, true, false, [354, 372, 412], [], 201)], 0, E236S423.L38),
([(0, true, false, [354, 372, 412], [], 203)], 0, E236S423.L39),
([(0, true, false, [354, 372, 412], [], 208)], 0, E236S423.L40),
([(0, true, false, [354, 372, 412], [], 215)], 0, E236S423.L41),
([(0, true, false, [354, 372, 412], [], 216)], 0, E236S423.L42),
([(0, true, false, [354, 372, 412], [], 227)], 0, E236S423.L43),
([(0, true, false, [354, 372, 412], [], 228)], 0, E236S423.L44),
([(0, true, false, [354, 372, 412], [], 243)], 0, E236S423.L45),
([(0, true, false, [354, 372, 412], [], 244)], 0, E236S423.L46),
([(0, true, false, [354, 372, 412], [], 264)], 0, E236S423.L47),
([(0, true, false, [354, 372, 412], [], 0), (10, false, false, [], [136], 98)], 0, E236S423.L48),
([(0, true, false, [354, 372, 412], [], 0), (10, false, false, [], [136], 122)], 0, E236S423.L49)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 47
end E236S423
