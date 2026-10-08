module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S334 "data/lean/9f6492a0ef87c1512a82cbcd2d59f3ab/E236S334.bin"
namespace E236S334
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 372], [258], 2)], 0, E236S334.L1),
([(2, true, false, [158, 372], [258], 4)], 0, E236S334.L2),
([(2, true, false, [158, 372], [258], 68)], 0, E236S334.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S334
