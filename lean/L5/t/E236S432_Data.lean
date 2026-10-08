module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S432 "data/lean/753c9ec990d7aebe508af0d97b634a76/E236S432.bin"
namespace E236S432
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394], [], 0)], 0, E236S432.L1),
([(0, true, false, [354, 372, 394], [], 1)], 0, E236S432.L2),
([(0, true, false, [354, 372, 394], [], 2)], 0, E236S432.L3),
([(0, true, false, [354, 372, 394], [], 3)], 0, E236S432.L4),
([(0, true, false, [354, 372, 394], [], 4)], 0, E236S432.L5),
([(0, true, false, [354, 372, 394], [], 15)], 0, E236S432.L6),
([(0, true, false, [354, 372, 394], [], 17)], 0, E236S432.L7),
([(0, true, false, [354, 372, 394], [], 24)], 0, E236S432.L8),
([(0, true, false, [354, 372, 394], [], 26)], 0, E236S432.L9),
([(0, true, false, [354, 372, 394], [], 39)], 0, E236S432.L10),
([(0, true, false, [354, 372, 394], [], 44)], 0, E236S432.L11),
([(0, true, false, [354, 372, 394], [], 49)], 0, E236S432.L12),
([(0, true, false, [354, 372, 394], [], 50)], 0, E236S432.L13),
([(0, true, false, [354, 372, 394], [], 53)], 0, E236S432.L14),
([(0, true, false, [354, 372, 394], [], 55)], 0, E236S432.L15),
([(0, true, false, [354, 372, 394], [], 56)], 0, E236S432.L16),
([(0, true, false, [354, 372, 394], [], 59)], 0, E236S432.L17),
([(0, true, false, [354, 372, 394], [], 62)], 0, E236S432.L18),
([(0, true, false, [354, 372, 394], [], 63)], 0, E236S432.L19),
([(0, true, false, [354, 372, 394], [], 74)], 0, E236S432.L20),
([(0, true, false, [354, 372, 394], [], 83)], 0, E236S432.L21),
([(0, true, false, [354, 372, 394], [], 85)], 0, E236S432.L22),
([(0, true, false, [354, 372, 394], [], 88)], 0, E236S432.L23),
([(0, true, false, [354, 372, 394], [], 90)], 0, E236S432.L24),
([(0, true, false, [354, 372, 394], [], 93)], 0, E236S432.L25),
([(0, true, false, [354, 372, 394], [], 97)], 0, E236S432.L26),
([(0, true, false, [354, 372, 394], [], 106)], 0, E236S432.L27),
([(0, true, false, [354, 372, 394], [], 108)], 0, E236S432.L28),
([(0, true, false, [354, 372, 394], [], 117)], 0, E236S432.L29),
([(0, true, false, [354, 372, 394], [], 139)], 0, E236S432.L30),
([(0, true, false, [354, 372, 394], [], 143)], 0, E236S432.L31),
([(0, true, false, [354, 372, 394], [], 153)], 0, E236S432.L32),
([(0, true, false, [354, 372, 394], [], 156)], 0, E236S432.L33),
([(0, true, false, [354, 372, 394], [], 167)], 0, E236S432.L34),
([(0, true, false, [354, 372, 394], [], 169)], 0, E236S432.L35),
([(0, true, false, [354, 372, 394], [], 179)], 0, E236S432.L36),
([(0, true, false, [354, 372, 394], [], 184)], 0, E236S432.L37),
([(0, true, false, [354, 372, 394], [], 187)], 0, E236S432.L38),
([(0, true, false, [354, 372, 394], [], 189)], 0, E236S432.L39),
([(0, true, false, [354, 372, 394], [], 192)], 0, E236S432.L40),
([(0, true, false, [354, 372, 394], [], 208)], 0, E236S432.L41),
([(0, true, false, [354, 372, 394], [], 213)], 0, E236S432.L42),
([(0, true, false, [354, 372, 394], [], 229)], 0, E236S432.L43),
([(0, true, false, [354, 372, 394], [], 243)], 0, E236S432.L44),
([(0, true, false, [354, 372, 394], [], 247)], 0, E236S432.L45),
([(0, true, false, [354, 372, 394], [], 263)], 0, E236S432.L46)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 46
end E236S432
