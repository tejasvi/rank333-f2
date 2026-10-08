module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S151 "data/lean/11810f8b32e344622e3fd0208a35423a/E218S151.bin"
namespace E218S151
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 142], [112], 0)], 0, E218S151.L1),
([(6, true, false, [106, 142], [112], 2)], 0, E218S151.L2),
([(6, true, false, [106, 142], [112], 8)], 0, E218S151.L3),
([(6, true, false, [106, 142], [112], 10)], 0, E218S151.L4),
([(6, true, false, [106, 142], [112], 20)], 0, E218S151.L5),
([(6, true, false, [106, 142], [112], 21)], 0, E218S151.L6),
([(6, true, false, [106, 142], [112], 48)], 0, E218S151.L7),
([(6, true, false, [106, 142], [112], 59)], 0, E218S151.L8),
([(6, true, false, [106, 142], [112], 79)], 0, E218S151.L9),
([(6, true, false, [106, 142], [112], 81)], 0, E218S151.L10),
([(6, true, false, [106, 142], [112], 84)], 0, E218S151.L11),
([(6, true, false, [106, 142], [112], 91)], 0, E218S151.L12),
([(6, true, false, [106, 142], [112], 114)], 0, E218S151.L13),
([(6, true, false, [106, 142], [112], 214)], 0, E218S151.L14),
([(6, true, false, [106, 142], [112], 216)], 0, E218S151.L15),
([(6, true, false, [106, 142], [112], 217)], 0, E218S151.L16),
([(6, true, false, [106, 142], [112], 258)], 0, E218S151.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E218S151
