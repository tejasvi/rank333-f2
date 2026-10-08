module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S296 "data/lean/da8f280a6f1c5434dfd70dfdea6a4739/E236S296.bin"
namespace E236S296
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [394, 372], [258], 3)], 0, E236S296.L1),
([(3, true, false, [394, 372], [258], 38)], 0, E236S296.L2),
([(3, true, false, [394, 372], [258], 57)], 0, E236S296.L3),
([(3, true, false, [394, 372], [258], 87)], 0, E236S296.L4),
([(3, true, false, [394, 372], [258], 92)], 0, E236S296.L5),
([(3, true, false, [394, 372], [258], 110)], 0, E236S296.L6),
([(3, true, false, [394, 372], [258], 126)], 0, E236S296.L7),
([(3, true, false, [394, 372], [258], 197)], 0, E236S296.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E236S296
