module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S128 "data/lean/fb58795e343bc640e61f88f6aa909cbe/E218S128.bin"
namespace E218S128
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 266], [112], 0)], 0, E218S128.L1),
([(2, true, false, [106, 266], [112], 4)], 0, E218S128.L2),
([(2, true, false, [106, 266], [112], 10)], 0, E218S128.L3),
([(2, true, false, [106, 266], [112], 12)], 0, E218S128.L4),
([(2, true, false, [106, 266], [112], 15)], 0, E218S128.L5),
([(2, true, false, [106, 266], [112], 25)], 0, E218S128.L6),
([(2, true, false, [106, 266], [112], 61)], 0, E218S128.L7),
([(2, true, false, [106, 266], [112], 115)], 0, E218S128.L8),
([(2, true, false, [106, 266], [112], 131)], 0, E218S128.L9),
([(2, true, false, [106, 266], [112], 134)], 0, E218S128.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E218S128
