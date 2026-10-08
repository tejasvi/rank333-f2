module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S182 "data/lean/526175388cb064749b1dee6fc0b4bead/E236S182.bin"
namespace E236S182
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354, 372, 394], [136], 15)], 0, E236S182.L1),
([(0, true, false, [354, 372, 394], [136], 17)], 0, E236S182.L2),
([(0, true, false, [354, 372, 394], [136], 24)], 0, E236S182.L3),
([(0, true, false, [354, 372, 394], [136], 44)], 0, E236S182.L4),
([(0, true, false, [354, 372, 394], [136], 69)], 0, E236S182.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E236S182
