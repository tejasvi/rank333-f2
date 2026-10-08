module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S164 "data/lean/a44438782c8816bb31453bd66df6cacd/E212S164.bin"
namespace E212S164
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [158, 266, 494], [272], 6)], 0, E212S164.L1),
([(1, true, false, [158, 266, 494], [272], 7)], 0, E212S164.L2),
([(1, true, false, [158, 266, 494], [272], 13)], 0, E212S164.L3),
([(1, true, false, [158, 266, 494], [272], 15)], 0, E212S164.L4),
([(1, true, false, [158, 266, 494], [272], 39)], 0, E212S164.L5),
([(1, true, false, [158, 266, 494], [272], 52)], 0, E212S164.L6),
([(1, true, false, [158, 266, 494], [272], 67)], 0, E212S164.L7),
([(1, true, false, [158, 266, 494], [272], 69)], 0, E212S164.L8),
([(1, true, false, [158, 266, 494], [272], 70)], 0, E212S164.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S164
