module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S109 "data/lean/56c6746cd542f1229fbd52f19a56abc6/E218S109.bin"
namespace E218S109
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [500, 106], [228], 6)], 0, E218S109.L1),
([(13, true, false, [500, 106], [228], 39)], 0, E218S109.L2),
([(13, true, false, [500, 106], [228], 56)], 0, E218S109.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E218S109
