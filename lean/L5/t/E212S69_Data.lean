module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S69 "data/lean/2a89dce793e1e803289fa7345fcfa900/E212S69.bin"
namespace E212S69
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266], [96], 2)], 0, E212S69.L1),
([(2, true, false, [266], [96], 38)], 0, E212S69.L2),
([(2, true, false, [266], [96], 41)], 0, E212S69.L3),
([(2, true, false, [266], [96], 56)], 0, E212S69.L4),
([(2, true, false, [266], [96], 58)], 0, E212S69.L5),
([(2, true, false, [266], [96], 68)], 0, E212S69.L6),
([(2, true, false, [266], [96], 86)], 0, E212S69.L7),
([(2, true, false, [266], [96], 164)], 0, E212S69.L8),
([(2, true, false, [266], [96], 190)], 0, E212S69.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S69
