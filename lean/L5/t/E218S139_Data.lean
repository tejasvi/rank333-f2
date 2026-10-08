module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S139 "data/lean/2f33d7fa42515a2ef3335bc3b9e387ad/E218S139.bin"
namespace E218S139
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [142, 500], [148], 1)], 0, E218S139.L1),
([(4, true, false, [142, 500], [148], 3)], 0, E218S139.L2),
([(4, true, false, [142, 500], [148], 15)], 0, E218S139.L3),
([(4, true, false, [142, 500], [148], 22)], 0, E218S139.L4),
([(4, true, false, [142, 500], [148], 54)], 0, E218S139.L5),
([(4, true, false, [142, 500], [148], 66)], 0, E218S139.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E218S139
