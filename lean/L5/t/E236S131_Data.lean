module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S131 "data/lean/7f57a570c5056d1650f1ed2a11f55638/E236S131.bin"
namespace E236S131
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 394, 412], [], 5)], 0, E236S131.L1),
([(7, true, false, [254, 394, 412], [], 8)], 0, E236S131.L2),
([(7, true, false, [254, 394, 412], [], 10)], 0, E236S131.L3),
([(7, true, false, [254, 394, 412], [], 13)], 0, E236S131.L4),
([(7, true, false, [254, 394, 412], [], 21)], 0, E236S131.L5),
([(7, true, false, [254, 394, 412], [], 37)], 0, E236S131.L6),
([(7, true, false, [254, 394, 412], [], 40)], 0, E236S131.L7),
([(7, true, false, [254, 394, 412], [], 79)], 0, E236S131.L8),
([(7, true, false, [254, 394, 412], [], 80)], 0, E236S131.L9),
([(7, true, false, [254, 394, 412], [], 81)], 0, E236S131.L10),
([(7, true, false, [254, 394, 412], [], 82)], 0, E236S131.L11),
([(7, true, false, [254, 394, 412], [], 83)], 0, E236S131.L12),
([(7, true, false, [254, 394, 412], [], 133)], 0, E236S131.L13),
([(7, true, false, [254, 394, 412], [], 154)], 0, E236S131.L14),
([(7, true, false, [254, 394, 412], [], 160)], 0, E236S131.L15),
([(7, true, false, [254, 394, 412], [], 171)], 0, E236S131.L16),
([(7, true, false, [254, 394, 412], [], 174)], 0, E236S131.L17),
([(7, true, false, [254, 394, 412], [], 182)], 0, E236S131.L18),
([(7, true, false, [254, 394, 412], [], 254)], 0, E236S131.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E236S131
