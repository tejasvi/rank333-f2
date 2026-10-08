module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S129 "data/lean/91cf7cbb0a1e62a0e5d76a1a6be76e6d/E284S129.bin"
namespace E284S129
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [138, 298, 94, 266, 426], [], 2)], 0, E284S129.L1),
([(3, true, false, [138, 298, 94, 266, 426], [], 6)], 0, E284S129.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S129
