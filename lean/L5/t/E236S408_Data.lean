module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S408 "data/lean/904c45fb545c4b971c94bd83515c2648/E236S408.bin"
namespace E236S408
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [354, 372], [96], 36)], 0, E236S408.L1),
([(11, true, false, [354, 372], [96], 38)], 0, E236S408.L2),
([(11, true, false, [354, 372], [96], 44)], 0, E236S408.L3),
([(11, true, false, [354, 372], [96], 45)], 0, E236S408.L4),
([(11, true, false, [354, 372], [96], 48)], 0, E236S408.L5),
([(11, true, false, [354, 372], [96], 64)], 0, E236S408.L6),
([(11, true, false, [354, 372], [96], 76)], 0, E236S408.L7),
([(11, true, false, [354, 372], [96], 134)], 0, E236S408.L8),
([(11, true, false, [354, 372], [96], 165)], 0, E236S408.L9),
([(11, true, false, [354, 372], [96], 193)], 0, E236S408.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E236S408
