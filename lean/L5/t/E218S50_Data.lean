module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S50 "data/lean/a3a8ec7b906368e06b7dfaab9360954a/E218S50.bin"
namespace E218S50
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [266, 254], [228], 5)], 0, E218S50.L1),
([(11, true, false, [266, 254], [228], 6)], 0, E218S50.L2),
([(11, true, false, [266, 254], [228], 43)], 0, E218S50.L3),
([(11, true, false, [266, 254], [228], 51)], 0, E218S50.L4),
([(11, true, false, [266, 254], [228], 53)], 0, E218S50.L5),
([(11, true, false, [266, 254], [228], 55)], 0, E218S50.L6),
([(11, true, false, [266, 254], [228], 84)], 0, E218S50.L7),
([(11, true, false, [266, 254], [228], 92)], 0, E218S50.L8),
([(11, true, false, [266, 254], [228], 147)], 0, E218S50.L9),
([(11, true, false, [266, 254], [228], 215)], 0, E218S50.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E218S50
