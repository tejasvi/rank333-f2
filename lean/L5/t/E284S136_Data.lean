module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S136 "data/lean/a5fad03672f1308d9d48572fa77e6486/E284S136.bin"
namespace E284S136
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [298, 426, 94, 382], [10, 138], 0)], 0, E284S136.L1),
([(3, true, false, [298, 426, 94, 382], [10, 138], 30)], 0, E284S136.L2),
([(3, true, false, [298, 426, 94, 382], [10, 138], 44)], 0, E284S136.L3),
([(3, true, false, [298, 426, 94, 382], [10, 138], 45)], 0, E284S136.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S136
