module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S267 "data/lean/91d2119ae5dbdff0844b82339b9771ae/E284S267.bin"
namespace E284S267
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [372, 94], [10, 42], 4)], 0, E284S267.L1),
([(2, true, false, [372, 94], [10, 42], 11)], 0, E284S267.L2),
([(2, true, false, [372, 94], [10, 42], 31)], 0, E284S267.L3),
([(2, true, false, [372, 94], [10, 42], 62)], 0, E284S267.L4),
([(2, true, false, [372, 94], [10, 42], 95)], 0, E284S267.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S267
