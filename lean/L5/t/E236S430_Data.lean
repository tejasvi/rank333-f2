module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S430 "data/lean/141d6a19f9c55cc1020f68f9adf31c6a/E236S430.bin"
namespace E236S430
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 394], [136], 0)], 0, E236S430.L1),
([(0, true, false, [158, 394], [136], 2)], 0, E236S430.L2),
([(0, true, false, [158, 394], [136], 4)], 0, E236S430.L3),
([(0, true, false, [158, 394], [136], 8)], 0, E236S430.L4),
([(0, true, false, [158, 394], [136], 20)], 0, E236S430.L5),
([(0, true, false, [158, 394], [136], 34)], 0, E236S430.L6),
([(0, true, false, [158, 394], [136], 35)], 0, E236S430.L7),
([(0, true, false, [158, 394], [136], 92)], 0, E236S430.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S430
