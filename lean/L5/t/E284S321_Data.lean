module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S321 "data/lean/a08ec5e1be88125d5afa6b02e1ced624/E284S321.bin"
namespace E284S321
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [298, 426], [10, 138], 0)], 0, E284S321.L1),
([(2, true, false, [298, 426], [10, 138], 10)], 0, E284S321.L2),
([(2, true, false, [298, 426], [10, 138], 14)], 0, E284S321.L3),
([(2, true, false, [298, 426], [10, 138], 17)], 0, E284S321.L4),
([(2, true, false, [298, 426], [10, 138], 18)], 0, E284S321.L5),
([(2, true, false, [298, 426], [10, 138], 19)], 0, E284S321.L6),
([(2, true, false, [298, 426], [10, 138], 30)], 0, E284S321.L7),
([(2, true, false, [298, 426], [10, 138], 44)], 0, E284S321.L8),
([(2, true, false, [298, 426], [10, 138], 45)], 0, E284S321.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E284S321
