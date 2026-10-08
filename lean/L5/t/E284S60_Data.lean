module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S60 "data/lean/954ab5ce96f3edf9ebb2231e2969b61b/E284S60.bin"
namespace E284S60
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [266, 298, 468], [10, 138], 0)], 0, E284S60.L1),
([(3, true, false, [266, 298, 468], [10, 138], 6)], 0, E284S60.L2),
([(3, true, false, [266, 298, 468], [10, 138], 21)], 0, E284S60.L3),
([(3, true, false, [266, 298, 468], [10, 138], 24)], 0, E284S60.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S60
