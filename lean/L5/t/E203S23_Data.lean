module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S23 "data/lean/22afb1c6ca7b6f9f9fc057a1a864f78b/E203S23.bin"
namespace E203S23
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [314, 372, 410, 468], [], 0)], 0, E203S23.L1),
([(0, true, false, [314, 372, 410, 468], [], 5)], 0, E203S23.L2),
([(0, true, false, [314, 372, 410, 468], [], 39)], 0, E203S23.L3),
([(0, true, false, [314, 372, 410, 468], [], 40)], 0, E203S23.L4),
([(0, true, false, [314, 372, 410, 468], [], 42)], 0, E203S23.L5),
([(0, true, false, [314, 372, 410, 468], [], 43)], 0, E203S23.L6),
([(0, true, false, [314, 372, 410, 468], [], 49)], 0, E203S23.L7),
([(0, true, false, [314, 372, 410, 468], [], 100)], 0, E203S23.L8),
([(0, true, false, [314, 372, 410, 468], [], 114)], 0, E203S23.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E203S23
