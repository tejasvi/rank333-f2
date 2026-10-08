module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S54 "data/lean/756c7526eae7086b796ac3cffb080414/E284S54.bin"
namespace E284S54
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266, 298], [10, 138], 1)], 0, E284S54.L1),
([(3, true, false, [84, 266, 298], [10, 138], 10)], 0, E284S54.L2),
([(3, true, false, [84, 266, 298], [10, 138], 19)], 0, E284S54.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S54
