module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S175 "data/lean/fd863ae68b164be154822b46895122fa/E212S175.bin"
namespace E212S175
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [122, 266, 494], [], 0)], 0, E212S175.L1),
([(0, true, false, [122, 266, 494], [], 1)], 0, E212S175.L2),
([(0, true, false, [122, 266, 494], [], 6)], 0, E212S175.L3),
([(0, true, false, [122, 266, 494], [], 9)], 0, E212S175.L4),
([(0, true, false, [122, 266, 494], [], 61)], 0, E212S175.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E212S175
