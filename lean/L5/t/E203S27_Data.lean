module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S27 "data/lean/72a41ea0e51609973ae98d1093de4622/E203S27.bin"
namespace E203S27
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [382, 410, 478, 468], [], 1)], 0, E203S27.L1),
([(2, true, false, [382, 410, 478, 468], [], 4)], 0, E203S27.L2),
([(2, true, false, [382, 410, 478, 468], [], 5)], 0, E203S27.L3),
([(2, true, false, [382, 410, 478, 468], [], 11)], 0, E203S27.L4),
([(2, true, false, [382, 410, 478, 468], [], 13)], 0, E203S27.L5),
([(2, true, false, [382, 410, 478, 468], [], 26)], 0, E203S27.L6),
([(2, true, false, [382, 410, 478, 468], [], 27)], 0, E203S27.L7),
([(2, true, false, [382, 410, 478, 468], [], 81)], 0, E203S27.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E203S27
