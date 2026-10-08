module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S134 "data/lean/3b73ecda9ddb72386400eceea3d69ee2/E212S134.bin"
namespace E212S134
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 494, 500], [96], 0)], 0, E212S134.L1),
([(2, true, false, [122, 494, 500], [96], 2)], 0, E212S134.L2),
([(2, true, false, [122, 494, 500], [96], 21)], 0, E212S134.L3),
([(2, true, false, [122, 494, 500], [96], 23)], 0, E212S134.L4),
([(2, true, false, [122, 494, 500], [96], 28)], 0, E212S134.L5),
([(2, true, false, [122, 494, 500], [96], 30)], 0, E212S134.L6),
([(2, true, false, [122, 494, 500], [96], 43)], 0, E212S134.L7),
([(2, true, false, [122, 494, 500], [96], 47)], 0, E212S134.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E212S134
