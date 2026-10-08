module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S90 "data/lean/f332c5be28aac571559f9e2baf9a7756/E212S90.bin"
namespace E212S90
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 500], [96], 18)], 0, E212S90.L1),
([(2, true, false, [266, 500], [96], 20)], 0, E212S90.L2),
([(2, true, false, [266, 500], [96], 28)], 0, E212S90.L3),
([(2, true, false, [266, 500], [96], 29)], 0, E212S90.L4),
([(2, true, false, [266, 500], [96], 31)], 0, E212S90.L5),
([(2, true, false, [266, 500], [96], 32)], 0, E212S90.L6),
([(2, true, false, [266, 500], [96], 34)], 0, E212S90.L7),
([(2, true, false, [266, 500], [96], 38)], 0, E212S90.L8),
([(2, true, false, [266, 500], [96], 43)], 0, E212S90.L9),
([(2, true, false, [266, 500], [96], 46)], 0, E212S90.L10),
([(2, true, false, [266, 500], [96], 54)], 0, E212S90.L11),
([(2, true, false, [266, 500], [96], 68)], 0, E212S90.L12),
([(2, true, false, [266, 500], [96], 76)], 0, E212S90.L13),
([(2, true, false, [266, 500], [96], 82)], 0, E212S90.L14),
([(2, true, false, [266, 500], [96], 84)], 0, E212S90.L15),
([(2, true, false, [266, 500], [96], 96)], 0, E212S90.L16),
([(2, true, false, [266, 500], [96], 101)], 0, E212S90.L17),
([(2, true, false, [266, 500], [96], 112)], 0, E212S90.L18),
([(2, true, false, [266, 500], [96], 127)], 0, E212S90.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E212S90
