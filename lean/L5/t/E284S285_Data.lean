module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S285 "data/lean/a8268ffe631ba9acb4ce55296f724d9b/E284S285.bin"
namespace E284S285
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [94, 254, 382, 478], [], 200)], 0, E284S285.L1),
([(7, true, false, [94, 254, 382, 478], [], 206)], 0, E284S285.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E284S285
