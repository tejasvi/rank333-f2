module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S59 "data/lean/5e2fc3565df989ce9042e5b8e21b6bd3/E218S59.bin"
namespace E218S59
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [142, 254], [148], 0)], 0, E218S59.L1),
([(2, true, false, [142, 254], [148], 6)], 0, E218S59.L2),
([(2, true, false, [142, 254], [148], 10)], 0, E218S59.L3),
([(2, true, false, [142, 254], [148], 11)], 0, E218S59.L4),
([(2, true, false, [142, 254], [148], 74)], 0, E218S59.L5),
([(2, true, false, [142, 254], [148], 89)], 0, E218S59.L6),
([(2, true, false, [142, 254], [148], 102)], 0, E218S59.L7),
([(2, true, false, [142, 254], [148], 116)], 0, E218S59.L8),
([(2, true, false, [142, 254], [148], 136)], 0, E218S59.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E218S59
