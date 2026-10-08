module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S274 "data/lean/f8fe8e5e19e28ff1b3592f8b005a643a/E284S274.bin"
namespace E284S274
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [394, 84, 372], [126], 20)], 0, E284S274.L1),
([(7, true, false, [394, 84, 372], [126], 78)], 0, E284S274.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S274
