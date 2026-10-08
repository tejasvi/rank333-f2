module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S44 "data/lean/e1b35c892041b866d63817643c2259e4/E212S44.bin"
namespace E212S44
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [266], [398], 0)], 0, E212S44.L1),
([(10, true, false, [266], [398], 3)], 0, E212S44.L2),
([(10, true, false, [266], [398], 9)], 0, E212S44.L3),
([(10, true, false, [266], [398], 11)], 0, E212S44.L4),
([(10, true, false, [266], [398], 13)], 0, E212S44.L5),
([(10, true, false, [266], [398], 14)], 0, E212S44.L6),
([(10, true, false, [266], [398], 24)], 0, E212S44.L7),
([(10, true, false, [266], [398], 31)], 0, E212S44.L8),
([(10, true, false, [266], [398], 85)], 0, E212S44.L9),
([(10, true, false, [266], [398], 112)], 0, E212S44.L10),
([(10, true, false, [266], [398], 113)], 0, E212S44.L11),
([(10, true, false, [266], [398], 220)], 0, E212S44.L12),
([(10, true, false, [266], [398], 221)], 0, E212S44.L13),
([(10, true, false, [266], [398], 234)], 0, E212S44.L14),
([(10, true, false, [266], [398], 254)], 0, E212S44.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E212S44
