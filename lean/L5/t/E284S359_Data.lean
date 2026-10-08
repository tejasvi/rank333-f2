module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S359 "data/lean/9eab754a43f5e3524c85bfdc33121437/E284S359.bin"
namespace E284S359
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [116, 468, 478, 84, 94, 500], [], 30)], 0, E284S359.L1),
([(13, true, false, [116, 468, 478, 84, 94, 500], [], 40)], 0, E284S359.L2),
([(13, true, false, [116, 468, 478, 84, 94, 500], [], 62)], 0, E284S359.L3),
([(13, true, false, [116, 468, 478, 84, 94, 500], [], 94)], 0, E284S359.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E284S359
