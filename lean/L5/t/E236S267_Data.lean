module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S267 "data/lean/12ab2907dbd267951b25ad5302b33d70/E236S267.bin"
namespace E236S267
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [354], [118, 136], 0)], 0, E236S267.L1),
([(0, true, false, [354], [118, 136], 12)], 0, E236S267.L2),
([(0, true, false, [354], [118, 136], 24)], 0, E236S267.L3),
([(0, true, false, [354], [118, 136], 49)], 0, E236S267.L4)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 4
end E236S267
