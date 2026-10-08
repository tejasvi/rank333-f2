module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S121 "data/lean/663898a5c6eab4a6e3ac16df4a9f51c7/E218S121.bin"
namespace E218S121
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [142, 254], [272, 352], 3)], 0, E218S121.L1),
([(9, true, false, [142, 254], [272, 352], 17)], 0, E218S121.L2),
([(9, true, false, [142, 254], [272, 352], 20)], 0, E218S121.L3),
([(9, true, false, [142, 254], [272, 352], 26)], 0, E218S121.L4),
([(9, true, false, [142, 254], [272, 352], 27)], 0, E218S121.L5),
([(9, true, false, [142, 254], [272, 352], 29)], 0, E218S121.L6),
([(9, true, false, [142, 254], [272, 352], 30)], 0, E218S121.L7),
([(9, true, false, [142, 254], [272, 352], 35)], 0, E218S121.L8),
([(9, true, false, [142, 254], [272, 352], 37)], 0, E218S121.L9),
([(9, true, false, [142, 254], [272, 352], 38)], 0, E218S121.L10),
([(9, true, false, [142, 254], [272, 352], 69)], 0, E218S121.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E218S121
