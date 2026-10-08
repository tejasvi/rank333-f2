module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S315 "data/lean/4efe1f92892f5db0b92e65c062955861/E236S315.bin"
namespace E236S315
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [158, 254, 354, 372], [], 10)], 0, E236S315.L1),
([(3, true, false, [158, 254, 354, 372], [], 11)], 0, E236S315.L2),
([(3, true, false, [158, 254, 354, 372], [], 13)], 0, E236S315.L3),
([(3, true, false, [158, 254, 354, 372], [], 14)], 0, E236S315.L4),
([(3, true, false, [158, 254, 354, 372], [], 44)], 0, E236S315.L5),
([(3, true, false, [158, 254, 354, 372], [], 79)], 0, E236S315.L6),
([(3, true, false, [158, 254, 354, 372], [], 83)], 0, E236S315.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E236S315
