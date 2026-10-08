module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S311 "data/lean/7869d1bf57a348f64b7dedacf4e50901/E236S311.bin"
namespace E236S311
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 354, 394, 412], [136], 0)], 0, E236S311.L1),
([(0, true, false, [158, 354, 394, 412], [136], 5)], 0, E236S311.L2),
([(0, true, false, [158, 354, 394, 412], [136], 12)], 0, E236S311.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S311
