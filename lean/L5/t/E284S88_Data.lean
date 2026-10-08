module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S88 "data/lean/25f1b1cac918cdfe53e85b0f121d8713/E284S88.bin"
namespace E284S88
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [254, 426], [10, 42], 1)], 0, E284S88.L1),
([(8, true, false, [254, 426], [10, 42], 4)], 0, E284S88.L2),
([(8, true, false, [254, 426], [10, 42], 7)], 0, E284S88.L3),
([(8, true, false, [254, 426], [10, 42], 14)], 0, E284S88.L4),
([(8, true, false, [254, 426], [10, 42], 16)], 0, E284S88.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E284S88
