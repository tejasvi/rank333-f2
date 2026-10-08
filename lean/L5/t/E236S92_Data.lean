module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S92 "data/lean/61db8128facecedacf3b4750252e9df7/E236S92.bin"
namespace E236S92
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 394, 412], [136], 0)], 0, E236S92.L1),
([(0, true, false, [158, 394, 412], [136], 2)], 0, E236S92.L2),
([(0, true, false, [158, 394, 412], [136], 43)], 0, E236S92.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S92
