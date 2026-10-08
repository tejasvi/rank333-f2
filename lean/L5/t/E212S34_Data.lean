module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S34 "data/lean/ce2641ad329b7a64834fbc8d4b1ad092/E212S34.bin"
namespace E212S34
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [158, 266], [96, 272], 13)], 0, E212S34.L1),
([(2, true, false, [158, 266], [96, 272], 14)], 0, E212S34.L2),
([(2, true, false, [158, 266], [96, 272], 17)], 0, E212S34.L3),
([(2, true, false, [158, 266], [96, 272], 18)], 0, E212S34.L4),
([(2, true, false, [158, 266], [96, 272], 23)], 0, E212S34.L5),
([(2, true, false, [158, 266], [96, 272], 24)], 0, E212S34.L6),
([(2, true, false, [158, 266], [96, 272], 26)], 0, E212S34.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S34
