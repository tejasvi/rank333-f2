module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S112 "data/lean/889aa84a1c6faf2af49e7a9169add50f/E212S112.bin"
namespace E212S112
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [254, 494], [368], 29)], 0, E212S112.L1),
([(5, true, false, [254, 494], [368], 47)], 0, E212S112.L2),
([(5, true, false, [254, 494], [368], 66)], 0, E212S112.L3),
([(5, true, false, [254, 494], [368], 96)], 0, E212S112.L4),
([(5, true, false, [254, 494], [368], 97)], 0, E212S112.L5),
([(5, true, false, [254, 494], [368], 100)], 0, E212S112.L6),
([(5, true, false, [254, 494], [368], 103)], 0, E212S112.L7),
([(5, true, false, [254, 494], [368], 110)], 0, E212S112.L8),
([(5, true, false, [254, 494], [368], 131)], 0, E212S112.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E212S112
