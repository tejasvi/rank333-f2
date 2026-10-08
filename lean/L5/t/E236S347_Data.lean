module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S347 "data/lean/2b89bcbb4c445346afabcdd64725839f/E236S347.bin"
namespace E236S347
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [254, 354, 394, 158], [], 5)], 0, E236S347.L1),
([(10, true, false, [254, 354, 394, 158], [], 6)], 0, E236S347.L2),
([(10, true, false, [254, 354, 394, 158], [], 7)], 0, E236S347.L3),
([(10, true, false, [254, 354, 394, 158], [], 9)], 0, E236S347.L4),
([(10, true, false, [254, 354, 394, 158], [], 12)], 0, E236S347.L5),
([(10, true, false, [254, 354, 394, 158], [], 16)], 0, E236S347.L6),
([(10, true, false, [254, 354, 394, 158], [], 37)], 0, E236S347.L7),
([(10, true, false, [254, 354, 394, 158], [], 38)], 0, E236S347.L8),
([(10, true, false, [254, 354, 394, 158], [], 39)], 0, E236S347.L9),
([(10, true, false, [254, 354, 394, 158], [], 40)], 0, E236S347.L10),
([(10, true, false, [254, 354, 394, 158], [], 41)], 0, E236S347.L11),
([(10, true, false, [254, 354, 394, 158], [], 102)], 0, E236S347.L12),
([(10, true, false, [254, 354, 394, 158], [], 108)], 0, E236S347.L13),
([(10, true, false, [254, 354, 394, 158], [], 115)], 0, E236S347.L14),
([(10, true, false, [254, 354, 394, 158], [], 124)], 0, E236S347.L15),
([(10, true, false, [254, 354, 394, 158], [], 132)], 0, E236S347.L16),
([(10, true, false, [254, 354, 394, 158], [], 196)], 0, E236S347.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E236S347
