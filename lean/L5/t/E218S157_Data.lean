module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S157 "data/lean/af71f12473e5a387c9792a45713ab8f1/E218S157.bin"
namespace E218S157
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 266, 500], [], 1)], 0, E218S157.L1),
([(2, true, false, [106, 266, 500], [], 2)], 0, E218S157.L2),
([(2, true, false, [106, 266, 500], [], 4)], 0, E218S157.L3),
([(2, true, false, [106, 266, 500], [], 5)], 0, E218S157.L4),
([(2, true, false, [106, 266, 500], [], 7)], 0, E218S157.L5),
([(2, true, false, [106, 266, 500], [], 8)], 0, E218S157.L6),
([(2, true, false, [106, 266, 500], [], 11)], 0, E218S157.L7),
([(2, true, false, [106, 266, 500], [], 14)], 0, E218S157.L8),
([(2, true, false, [106, 266, 500], [], 24)], 0, E218S157.L9),
([(2, true, false, [106, 266, 500], [], 25)], 0, E218S157.L10),
([(2, true, false, [106, 266, 500], [], 36)], 0, E218S157.L11),
([(2, true, false, [106, 266, 500], [], 49)], 0, E218S157.L12),
([(2, true, false, [106, 266, 500], [], 51)], 0, E218S157.L13),
([(2, true, false, [106, 266, 500], [], 56)], 0, E218S157.L14),
([(2, true, false, [106, 266, 500], [], 58)], 0, E218S157.L15),
([(2, true, false, [106, 266, 500], [], 71)], 0, E218S157.L16),
([(2, true, false, [106, 266, 500], [], 76)], 0, E218S157.L17),
([(2, true, false, [106, 266, 500], [], 80)], 0, E218S157.L18),
([(2, true, false, [106, 266, 500], [], 96)], 0, E218S157.L19),
([(2, true, false, [106, 266, 500], [], 100)], 0, E218S157.L20),
([(2, true, false, [106, 266, 500], [], 112)], 0, E218S157.L21),
([(2, true, false, [106, 266, 500], [], 122)], 0, E218S157.L22),
([(2, true, false, [106, 266, 500], [], 124)], 0, E218S157.L23),
([(2, true, false, [106, 266, 500], [], 134)], 0, E218S157.L24),
([(2, true, false, [106, 266, 500], [], 140)], 0, E218S157.L25),
([(2, true, false, [106, 266, 500], [], 146)], 0, E218S157.L26),
([(2, true, false, [106, 266, 500], [], 156)], 0, E218S157.L27),
([(2, true, false, [106, 266, 500], [], 158)], 0, E218S157.L28),
([(2, true, false, [106, 266, 500], [], 164)], 0, E218S157.L29),
([(2, true, false, [106, 266, 500], [], 168)], 0, E218S157.L30),
([(2, true, false, [106, 266, 500], [], 178)], 0, E218S157.L31),
([(2, true, false, [106, 266, 500], [], 182)], 0, E218S157.L32),
([(2, true, false, [106, 266, 500], [], 194)], 0, E218S157.L33),
([(2, true, false, [106, 266, 500], [], 198)], 0, E218S157.L34),
([(2, true, false, [106, 266, 500], [], 212)], 0, E218S157.L35),
([(2, true, false, [106, 266, 500], [], 216)], 0, E218S157.L36)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 36
end E218S157
