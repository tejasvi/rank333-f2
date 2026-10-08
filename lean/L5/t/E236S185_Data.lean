module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S185 "data/lean/d3d2c4c0ae2bc5415b180a81969f5415/E236S185.bin"
namespace E236S185
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [254, 354, 372], [], 36)], 0, E236S185.L1),
([(11, true, false, [254, 354, 372], [], 38)], 0, E236S185.L2),
([(11, true, false, [254, 354, 372], [], 51)], 0, E236S185.L3),
([(11, true, false, [254, 354, 372], [], 88)], 0, E236S185.L4),
([(11, true, false, [254, 354, 372], [], 130)], 0, E236S185.L5),
([(11, true, false, [254, 354, 372], [], 199)], 0, E236S185.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E236S185
