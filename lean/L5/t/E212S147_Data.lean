module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S147 "data/lean/255250943844b0aa17f3fbd5f29a5fcd/E212S147.bin"
namespace E212S147
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [122, 158], [96], 0)], 0, E212S147.L1),
([(7, true, false, [122, 158], [96], 2)], 0, E212S147.L2),
([(7, true, false, [122, 158], [96], 10)], 0, E212S147.L3),
([(7, true, false, [122, 158], [96], 21)], 0, E212S147.L4),
([(7, true, false, [122, 158], [96], 37)], 0, E212S147.L5),
([(7, true, false, [122, 158], [96], 47)], 0, E212S147.L6),
([(7, true, false, [122, 158], [96], 49)], 0, E212S147.L7),
([(7, true, false, [122, 158], [96], 92)], 0, E212S147.L8),
([(7, true, false, [122, 158], [96], 100)], 0, E212S147.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S147
