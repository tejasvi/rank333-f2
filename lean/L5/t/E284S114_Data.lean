module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S114 "data/lean/68488b98516ee31b9fd52b8f78455bfa/E284S114.bin"
namespace E284S114
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [84, 298, 94], [138], 11)], 0, E284S114.L1),
([(3, true, false, [84, 298, 94], [138], 14)], 0, E284S114.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S114
