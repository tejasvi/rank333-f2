module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S21 "data/lean/11ba3682175cb178ea0ffdff3ec35572/E212S21.bin"
namespace E212S21
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [122, 158], [368, 404], 2)], 0, E212S21.L1),
([(13, true, false, [122, 158], [368, 404], 3)], 0, E212S21.L2),
([(13, true, false, [122, 158], [368, 404], 4)], 0, E212S21.L3),
([(13, true, false, [122, 158], [368, 404], 6)], 0, E212S21.L4),
([(13, true, false, [122, 158], [368, 404], 7)], 0, E212S21.L5),
([(13, true, false, [122, 158], [368, 404], 8)], 0, E212S21.L6),
([(13, true, false, [122, 158], [368, 404], 9)], 0, E212S21.L7),
([(13, true, false, [122, 158], [368, 404], 26)], 0, E212S21.L8),
([(13, true, false, [122, 158], [368, 404], 29)], 0, E212S21.L9),
([(13, true, false, [122, 158], [368, 404], 51)], 0, E212S21.L10),
([(13, true, false, [122, 158], [368, 404], 55)], 0, E212S21.L11),
([(13, true, false, [122, 158], [368, 404], 105)], 0, E212S21.L12),
([(13, true, false, [122, 158], [368, 404], 108)], 0, E212S21.L13),
([(13, true, false, [122, 158], [368, 404], 109)], 0, E212S21.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E212S21
