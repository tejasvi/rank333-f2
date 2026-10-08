module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E218S1 "data/lean/5d28642952a45f35ff0eb26e0df29df1/E218S1.bin"
namespace E218S1
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [500], [112, 352], 2)], 0, E218S1.L1),
([(8, true, false, [500], [112, 352], 8)], 0, E218S1.L2),
([(8, true, false, [500], [112, 352], 43)], 0, E218S1.L3),
([(8, true, false, [500], [112, 352], 62)], 0, E218S1.L4),
([(8, true, false, [500], [112, 352], 64)], 0, E218S1.L5),
([(8, true, false, [500], [112, 352], 70)], 0, E218S1.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E218S1
