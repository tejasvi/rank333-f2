module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S123 "data/lean/05421a473373654016243447de666c2b/E218S123.bin"
namespace E218S123
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 266], [148], 58)], 0, E218S123.L1),
([(2, true, false, [106, 266], [148], 61)], 0, E218S123.L2),
([(2, true, false, [106, 266], [148], 64)], 0, E218S123.L3),
([(2, true, false, [106, 266], [148], 65)], 0, E218S123.L4),
([(2, true, false, [106, 266], [148], 81)], 0, E218S123.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E218S123
