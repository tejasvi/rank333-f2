module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S98 "data/lean/2c30fe82fa1da30928c972fc1dcd61ab/E218S98.bin"
namespace E218S98
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [106, 254], [272, 352], 13)], 0, E218S98.L1),
([(4, true, false, [106, 254], [272, 352], 15)], 0, E218S98.L2),
([(4, true, false, [106, 254], [272, 352], 21)], 0, E218S98.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E218S98
