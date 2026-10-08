module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S146 "data/lean/8e4ecbabc6b3a96bb3b07e29d7014200/E212S146.bin"
namespace E212S146
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 266, 494], [], 51)], 0, E212S146.L1),
([(2, true, false, [122, 266, 494], [], 52)], 0, E212S146.L2),
([(2, true, false, [122, 266, 494], [], 53)], 0, E212S146.L3),
([(2, true, false, [122, 266, 494], [], 55)], 0, E212S146.L4),
([(2, true, false, [122, 266, 494], [], 56)], 0, E212S146.L5),
([(2, true, false, [122, 266, 494], [], 57)], 0, E212S146.L6),
([(2, true, false, [122, 266, 494], [], 58)], 0, E212S146.L7),
([(2, true, false, [122, 266, 494], [], 59)], 0, E212S146.L8),
([(2, true, false, [122, 266, 494], [], 66)], 0, E212S146.L9),
([(2, true, false, [122, 266, 494], [], 69)], 0, E212S146.L10),
([(2, true, false, [122, 266, 494], [], 172)], 0, E212S146.L11)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 11
end E212S146
