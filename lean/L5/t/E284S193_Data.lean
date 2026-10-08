module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S193 "data/lean/0f05ef594c027ab4109a41469386c16a/E284S193.bin"
namespace E284S193
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 298, 372], [138], 5)], 0, E284S193.L1),
([(2, true, false, [84, 298, 372], [138], 12)], 0, E284S193.L2),
([(2, true, false, [84, 298, 372], [138], 17)], 0, E284S193.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E284S193
