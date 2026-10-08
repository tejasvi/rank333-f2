module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S197 "data/lean/4e3d4ebba2d448189713a64b08aaa36f/E218S197.bin"
namespace E218S197
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [106, 142, 266, 494, 254], [], 0)], 0, E218S197.L1),
([(1, true, false, [106, 142, 266, 494, 254], [], 22)], 0, E218S197.L2),
([(1, true, false, [106, 142, 266, 494, 254], [], 24)], 0, E218S197.L3),
([(1, true, false, [106, 142, 266, 494, 254], [], 27)], 0, E218S197.L4),
([(1, true, false, [106, 142, 266, 494, 254], [], 29)], 0, E218S197.L5),
([(1, true, false, [106, 142, 266, 494, 254], [], 32)], 0, E218S197.L6),
([(1, true, false, [106, 142, 266, 494, 254], [], 33)], 0, E218S197.L7),
([(1, true, false, [106, 142, 266, 494, 254], [], 35)], 0, E218S197.L8),
([(1, true, false, [106, 142, 266, 494, 254], [], 46)], 0, E218S197.L9),
([(1, true, false, [106, 142, 266, 494, 254], [], 54)], 0, E218S197.L10),
([(1, true, false, [106, 142, 266, 494, 254], [], 63)], 0, E218S197.L11),
([(1, true, false, [106, 142, 266, 494, 254], [], 77)], 0, E218S197.L12),
([(1, true, false, [106, 142, 266, 494, 254], [], 99)], 0, E218S197.L13),
([(1, true, false, [106, 142, 266, 494, 254], [], 119)], 0, E218S197.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E218S197
