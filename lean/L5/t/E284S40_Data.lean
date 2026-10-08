module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S40 "data/lean/c72b30e93d7cb6ea03273a6b706a00d3/E284S40.bin"
namespace E284S40
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [212, 254, 426, 94, 266], [], 5)], 0, E284S40.L1),
([(10, true, false, [212, 254, 426, 94, 266], [], 6)], 0, E284S40.L2),
([(10, true, false, [212, 254, 426, 94, 266], [], 69)], 0, E284S40.L3),
([(10, true, false, [212, 254, 426, 94, 266], [], 71)], 0, E284S40.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S40
