module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S191 "data/lean/4b0a0c0a38ceba1f2ed2a11bf58aca7a/E218S191.bin"
namespace E218S191
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 142, 254, 500], [], 0)], 0, E218S191.L1),
([(2, true, false, [106, 142, 254, 500], [], 2)], 0, E218S191.L2),
([(2, true, false, [106, 142, 254, 500], [], 3)], 0, E218S191.L3),
([(2, true, false, [106, 142, 254, 500], [], 15)], 0, E218S191.L4),
([(2, true, false, [106, 142, 254, 500], [], 52)], 0, E218S191.L5),
([(2, true, false, [106, 142, 254, 500], [], 74)], 0, E218S191.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E218S191
