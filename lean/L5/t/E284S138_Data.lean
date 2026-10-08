module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S138 "data/lean/ad6fc7f13fe14fedd4e0b114e64b5c92/E284S138.bin"
namespace E284S138
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [298, 340, 426], [10, 138], 5)], 0, E284S138.L1),
([(3, true, false, [298, 340, 426], [10, 138], 15)], 0, E284S138.L2),
([(3, true, false, [298, 340, 426], [10, 138], 27)], 0, E284S138.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S138
