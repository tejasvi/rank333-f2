module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S160 "data/lean/80d4352faaff6b7d0370a2832e580f49/E218S160.bin"
namespace E218S160
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [106, 254, 266], [272], 12)], 0, E218S160.L1),
([(3, true, false, [106, 254, 266], [272], 25)], 0, E218S160.L2),
([(3, true, false, [106, 254, 266], [272], 31)], 0, E218S160.L3),
([(3, true, false, [106, 254, 266], [272], 64)], 0, E218S160.L4),
([(3, true, false, [106, 254, 266], [272], 76)], 0, E218S160.L5),
([(3, true, false, [106, 254, 266], [272], 82)], 0, E218S160.L6),
([(3, true, false, [106, 254, 266], [272], 100)], 0, E218S160.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E218S160
