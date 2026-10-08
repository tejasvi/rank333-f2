module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S177 "data/lean/35e52e22876e2653a66bfe8b0ec5f14d/E218S177.bin"
namespace E218S177
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 266], [26], 10)], 0, E218S177.L1),
([(0, true, false, [106, 266], [26], 11)], 0, E218S177.L2),
([(0, true, false, [106, 266], [26], 12)], 0, E218S177.L3),
([(0, true, false, [106, 266], [26], 13)], 0, E218S177.L4),
([(0, true, false, [106, 266], [26], 14)], 0, E218S177.L5),
([(0, true, false, [106, 266], [26], 17)], 0, E218S177.L6),
([(0, true, false, [106, 266], [26], 18)], 0, E218S177.L7),
([(0, true, false, [106, 266], [26], 19)], 0, E218S177.L8),
([(0, true, false, [106, 266], [26], 40)], 0, E218S177.L9),
([(0, true, false, [106, 266], [26], 88)], 0, E218S177.L10),
([(0, true, false, [106, 266], [26], 98)], 0, E218S177.L11),
([(0, true, false, [106, 266], [26], 99)], 0, E218S177.L12),
([(0, true, false, [106, 266], [26], 101)], 0, E218S177.L13),
([(0, true, false, [106, 266], [26], 106)], 0, E218S177.L14),
([(0, true, false, [106, 266], [26], 118)], 0, E218S177.L15),
([(0, true, false, [106, 266], [26], 122)], 0, E218S177.L16),
([(0, true, false, [106, 266], [26], 134)], 0, E218S177.L17),
([(0, true, false, [106, 266], [26], 139)], 0, E218S177.L18),
([(0, true, false, [106, 266], [26], 142)], 0, E218S177.L19),
([(0, true, false, [106, 266], [26], 155)], 0, E218S177.L20),
([(0, true, false, [106, 266], [26], 157)], 0, E218S177.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E218S177
