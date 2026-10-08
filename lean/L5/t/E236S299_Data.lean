module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S299 "data/lean/390047971c5731d79a84bd9b3a135857/E236S299.bin"
namespace E236S299
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [354, 372, 394], [258], 2)], 0, E236S299.L1),
([(2, true, false, [354, 372, 394], [258], 12)], 0, E236S299.L2),
([(2, true, false, [354, 372, 394], [258], 66)], 0, E236S299.L3)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 3
end E236S299
