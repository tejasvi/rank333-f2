module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S159 "data/lean/0208349fa83fb52032fc274c960c05c8/E218S159.bin"
namespace E218S159
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 254, 266], [], 0)], 0, E218S159.L1),
([(0, true, false, [106, 142, 254, 266], [], 1)], 0, E218S159.L2),
([(0, true, false, [106, 142, 254, 266], [], 2)], 0, E218S159.L3),
([(0, true, false, [106, 142, 254, 266], [], 3)], 0, E218S159.L4),
([(0, true, false, [106, 142, 254, 266], [], 4)], 0, E218S159.L5),
([(0, true, false, [106, 142, 254, 266], [], 5)], 0, E218S159.L6),
([(0, true, false, [106, 142, 254, 266], [], 6)], 0, E218S159.L7),
([(0, true, false, [106, 142, 254, 266], [], 7)], 0, E218S159.L8),
([(0, true, false, [106, 142, 254, 266], [], 8)], 0, E218S159.L9),
([(0, true, false, [106, 142, 254, 266], [], 9)], 0, E218S159.L10),
([(0, true, false, [106, 142, 254, 266], [], 10)], 0, E218S159.L11),
([(0, true, false, [106, 142, 254, 266], [], 12)], 0, E218S159.L12),
([(0, true, false, [106, 142, 254, 266], [], 14)], 0, E218S159.L13),
([(0, true, false, [106, 142, 254, 266], [], 15)], 0, E218S159.L14),
([(0, true, false, [106, 142, 254, 266], [], 19)], 0, E218S159.L15),
([(0, true, false, [106, 142, 254, 266], [], 30)], 0, E218S159.L16),
([(0, true, false, [106, 142, 254, 266], [], 39)], 0, E218S159.L17),
([(0, true, false, [106, 142, 254, 266], [], 40)], 0, E218S159.L18),
([(0, true, false, [106, 142, 254, 266], [], 42)], 0, E218S159.L19),
([(0, true, false, [106, 142, 254, 266], [], 44)], 0, E218S159.L20),
([(0, true, false, [106, 142, 254, 266], [], 45)], 0, E218S159.L21),
([(0, true, false, [106, 142, 254, 266], [], 46)], 0, E218S159.L22),
([(0, true, false, [106, 142, 254, 266], [], 47)], 0, E218S159.L23),
([(0, true, false, [106, 142, 254, 266], [], 48)], 0, E218S159.L24),
([(0, true, false, [106, 142, 254, 266], [], 49)], 0, E218S159.L25),
([(0, true, false, [106, 142, 254, 266], [], 50)], 0, E218S159.L26),
([(0, true, false, [106, 142, 254, 266], [], 52)], 0, E218S159.L27),
([(0, true, false, [106, 142, 254, 266], [], 53)], 0, E218S159.L28),
([(0, true, false, [106, 142, 254, 266], [], 64)], 0, E218S159.L29),
([(0, true, false, [106, 142, 254, 266], [], 66)], 0, E218S159.L30),
([(0, true, false, [106, 142, 254, 266], [], 77)], 0, E218S159.L31),
([(0, true, false, [106, 142, 254, 266], [], 78)], 0, E218S159.L32),
([(0, true, false, [106, 142, 254, 266], [], 80)], 0, E218S159.L33),
([(0, true, false, [106, 142, 254, 266], [], 81)], 0, E218S159.L34),
([(0, true, false, [106, 142, 254, 266], [], 90)], 0, E218S159.L35),
([(0, true, false, [106, 142, 254, 266], [], 112)], 0, E218S159.L36),
([(0, true, false, [106, 142, 254, 266], [], 119)], 0, E218S159.L37),
([(0, true, false, [106, 142, 254, 266], [], 135)], 0, E218S159.L38)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 38
end E218S159
