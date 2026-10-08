module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S107 "data/lean/c647de9ac73fa1c507423c2efc7e54c8/E284S107.bin"
namespace E284S107
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 426], [10, 138], 1)], 0, E284S107.L1),
([(8, true, false, [254, 426], [10, 138], 2)], 0, E284S107.L2),
([(8, true, false, [254, 426], [10, 138], 10)], 0, E284S107.L3),
([(8, true, false, [254, 426], [10, 138], 13)], 0, E284S107.L4),
([(8, true, false, [254, 426], [10, 138], 34)], 0, E284S107.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S107
