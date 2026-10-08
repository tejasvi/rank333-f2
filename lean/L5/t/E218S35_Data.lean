module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S35 "data/lean/3cb021aaa5e3a226f01fa9310f74a7fb/E218S35.bin"
namespace E218S35
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254], [272, 352], 0)], 0, E218S35.L1),
([(4, true, false, [254], [272, 352], 3)], 0, E218S35.L2),
([(4, true, false, [254], [272, 352], 4)], 0, E218S35.L3),
([(4, true, false, [254], [272, 352], 7)], 0, E218S35.L4),
([(4, true, false, [254], [272, 352], 47)], 0, E218S35.L5),
([(4, true, false, [254], [272, 352], 48)], 0, E218S35.L6),
([(4, true, false, [254], [272, 352], 50)], 0, E218S35.L7),
([(4, true, false, [254], [272, 352], 52)], 0, E218S35.L8),
([(4, true, false, [254], [272, 352], 59)], 0, E218S35.L9),
([(4, true, false, [254], [272, 352], 82)], 0, E218S35.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E218S35
