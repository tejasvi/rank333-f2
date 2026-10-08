module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E203S25 "data/lean/14329a0ce3393e96f7c9a72d4e62ee66/E203S25.bin"
namespace E203S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [478, 410], [78], 3)], 0, E203S25.L1),
([(3, true, false, [478, 410], [78], 58)], 0, E203S25.L2),
([(3, true, false, [478, 410], [78], 60)], 0, E203S25.L3),
([(3, true, false, [478, 410], [78], 73)], 0, E203S25.L4),
([(3, true, false, [478, 410], [78], 80)], 0, E203S25.L5),
([(3, true, false, [478, 410], [78], 122)], 0, E203S25.L6),
([(3, true, false, [478, 410], [78], 125)], 0, E203S25.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E203S25
