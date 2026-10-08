module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S336 "data/lean/d9e703c129120321f1a5c8c5474f3c0d/E284S336.bin"
namespace E284S336
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 212, 266, 394, 382], [], 0)], 0, E284S336.L1),
([(2, true, false, [84, 212, 266, 394, 382], [], 1)], 0, E284S336.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S336
