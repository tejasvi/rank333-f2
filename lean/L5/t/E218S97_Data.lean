module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S97 "data/lean/936b55e496b8f5879c6ab502e7cf36d1/E218S97.bin"
namespace E218S97
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [142, 254], [272, 352], 0)], 0, E218S97.L1),
([(4, true, false, [142, 254], [272, 352], 3)], 0, E218S97.L2),
([(4, true, false, [142, 254], [272, 352], 27)], 0, E218S97.L3),
([(4, true, false, [142, 254], [272, 352], 29)], 0, E218S97.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E218S97
