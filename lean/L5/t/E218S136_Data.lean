module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S136 "data/lean/903372ad348c9bd6ace292025cd620a6/E218S136.bin"
namespace E218S136
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494, 500], [], 5)], 0, E218S136.L1),
([(2, true, false, [266, 494, 500], [], 6)], 0, E218S136.L2),
([(2, true, false, [266, 494, 500], [], 7)], 0, E218S136.L3),
([(2, true, false, [266, 494, 500], [], 8)], 0, E218S136.L4),
([(2, true, false, [266, 494, 500], [], 9)], 0, E218S136.L5),
([(2, true, false, [266, 494, 500], [], 11)], 0, E218S136.L6),
([(2, true, false, [266, 494, 500], [], 26)], 0, E218S136.L7),
([(2, true, false, [266, 494, 500], [], 49)], 0, E218S136.L8),
([(2, true, false, [266, 494, 500], [], 76)], 0, E218S136.L9),
([(2, true, false, [266, 494, 500], [], 77)], 0, E218S136.L10),
([(2, true, false, [266, 494, 500], [], 78)], 0, E218S136.L11),
([(2, true, false, [266, 494, 500], [], 79)], 0, E218S136.L12),
([(2, true, false, [266, 494, 500], [], 80)], 0, E218S136.L13),
([(2, true, false, [266, 494, 500], [], 82)], 0, E218S136.L14),
([(2, true, false, [266, 494, 500], [], 84)], 0, E218S136.L15),
([(2, true, false, [266, 494, 500], [], 92)], 0, E218S136.L16),
([(2, true, false, [266, 494, 500], [], 98)], 0, E218S136.L17),
([(2, true, false, [266, 494, 500], [], 104)], 0, E218S136.L18),
([(2, true, false, [266, 494, 500], [], 117)], 0, E218S136.L19),
([(2, true, false, [266, 494, 500], [], 121)], 0, E218S136.L20),
([(2, true, false, [266, 494, 500], [], 137)], 0, E218S136.L21),
([(2, true, false, [266, 494, 500], [], 167)], 0, E218S136.L22),
([(2, true, false, [266, 494, 500], [], 187)], 0, E218S136.L23),
([(2, true, false, [266, 494, 500], [], 193)], 0, E218S136.L24),
([(2, true, false, [266, 494, 500], [], 227)], 0, E218S136.L25),
([(2, true, false, [266, 494, 500], [], 265)], 0, E218S136.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E218S136
