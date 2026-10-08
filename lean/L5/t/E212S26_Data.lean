module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S26 "data/lean/86e9ecd81e8b8386e53a8911e762b919/E212S26.bin"
namespace E212S26
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266], [96], 38)], 0, E212S26.L1),
([(2, true, false, [266], [96], 46)], 0, E212S26.L2),
([(2, true, false, [266], [96], 58)], 0, E212S26.L3),
([(2, true, false, [266], [96], 68)], 0, E212S26.L4),
([(2, true, false, [266], [96], 92)], 0, E212S26.L5),
([(2, true, false, [266], [96], 164)], 0, E212S26.L6),
([(2, true, false, [266], [96], 190)], 0, E212S26.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E212S26
