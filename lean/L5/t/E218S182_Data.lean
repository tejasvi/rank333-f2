module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S182 "data/lean/6167c96d6ed39925a9e36c706429d1d1/E218S182.bin"
namespace E218S182
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494, 500], [414], 11)], 0, E218S182.L1),
([(4, true, false, [254, 494, 500], [414], 14)], 0, E218S182.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E218S182
