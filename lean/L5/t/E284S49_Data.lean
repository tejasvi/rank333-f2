module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S49 "data/lean/ad29a28c081699f027cc45c4b24913d8/E284S49.bin"
namespace E284S49
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [94, 426], [10], 10)], 0, E284S49.L1),
([(9, true, false, [94, 426], [10], 12)], 0, E284S49.L2),
([(9, true, false, [94, 426], [10], 15)], 0, E284S49.L3),
([(9, true, false, [94, 426], [10], 17)], 0, E284S49.L4),
([(9, true, false, [94, 426], [10], 30)], 0, E284S49.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S49
