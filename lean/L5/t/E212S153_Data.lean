module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S153 "data/lean/a9acb52ee343cf383aa6802f1ee26f70/E212S153.bin"
namespace E212S153
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [122, 494, 500, 158], [96], 21)], 0, E212S153.L1),
([(4, true, false, [122, 494, 500, 158], [96], 28)], 0, E212S153.L2)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 2
end E212S153
