module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S103 "data/lean/ad92940ff535ae5303f8fe8973ab2154/E284S103.bin"
namespace E284S103
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 266, 394], [42], 0)], 0, E284S103.L1),
([(3, true, false, [84, 266, 394], [42], 2)], 0, E284S103.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S103
