module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S176 "data/lean/02c3abf25b160a8c624213df1209cb15/E218S176.bin"
namespace E218S176
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 142, 266], [], 0)], 0, E218S176.L1),
([(0, true, false, [106, 142, 266], [], 10)], 0, E218S176.L2),
([(0, true, false, [106, 142, 266], [], 11)], 0, E218S176.L3),
([(0, true, false, [106, 142, 266], [], 12)], 0, E218S176.L4),
([(0, true, false, [106, 142, 266], [], 13)], 0, E218S176.L5),
([(0, true, false, [106, 142, 266], [], 14)], 0, E218S176.L6),
([(0, true, false, [106, 142, 266], [], 15)], 0, E218S176.L7),
([(0, true, false, [106, 142, 266], [], 17)], 0, E218S176.L8),
([(0, true, false, [106, 142, 266], [], 18)], 0, E218S176.L9),
([(0, true, false, [106, 142, 266], [], 19)], 0, E218S176.L10),
([(0, true, false, [106, 142, 266], [], 20)], 0, E218S176.L11),
([(0, true, false, [106, 142, 266], [], 21)], 0, E218S176.L12),
([(0, true, false, [106, 142, 266], [], 24)], 0, E218S176.L13),
([(0, true, false, [106, 142, 266], [], 27)], 0, E218S176.L14),
([(0, true, false, [106, 142, 266], [], 34)], 0, E218S176.L15),
([(0, true, false, [106, 142, 266], [], 35)], 0, E218S176.L16),
([(0, true, false, [106, 142, 266], [], 49)], 0, E218S176.L17),
([(0, true, false, [106, 142, 266], [], 50)], 0, E218S176.L18),
([(0, true, false, [106, 142, 266], [], 56)], 0, E218S176.L19),
([(0, true, false, [106, 142, 266], [], 78)], 0, E218S176.L20),
([(0, true, false, [106, 142, 266], [], 84)], 0, E218S176.L21),
([(0, true, false, [106, 142, 266], [], 85)], 0, E218S176.L22),
([(0, true, false, [106, 142, 266], [], 89)], 0, E218S176.L23),
([(0, true, false, [106, 142, 266], [], 95)], 0, E218S176.L24),
([(0, true, false, [106, 142, 266], [], 143)], 0, E218S176.L25),
([(0, true, false, [106, 142, 266], [], 145)], 0, E218S176.L26),
([(0, true, false, [106, 142, 266], [], 146)], 0, E218S176.L27),
([(0, true, false, [106, 142, 266], [], 150)], 0, E218S176.L28),
([(0, true, false, [106, 142, 266], [], 151)], 0, E218S176.L29),
([(0, true, false, [106, 142, 266], [], 152)], 0, E218S176.L30),
([(0, true, false, [106, 142, 266], [], 171)], 0, E218S176.L31),
([(0, true, false, [106, 142, 266], [], 227)], 0, E218S176.L32),
([(0, true, false, [106, 142, 266], [], 229)], 0, E218S176.L33)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 33
end E218S176
