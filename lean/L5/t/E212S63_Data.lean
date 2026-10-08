module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S63 "data/lean/150f20c3c19d47e86f15b14230aaaa11/E212S63.bin"
namespace E212S63
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494], [404], 12)], 0, E212S63.L1),
([(4, true, false, [254, 494], [404], 13)], 0, E212S63.L2),
([(4, true, false, [254, 494], [404], 14)], 0, E212S63.L3),
([(4, true, false, [254, 494], [404], 15)], 0, E212S63.L4),
([(4, true, false, [254, 494], [404], 45)], 0, E212S63.L5),
([(4, true, false, [254, 494], [404], 46)], 0, E212S63.L6),
([(4, true, false, [254, 494], [404], 47)], 0, E212S63.L7),
([(4, true, false, [254, 494], [404], 54)], 0, E212S63.L8),
([(4, true, false, [254, 494], [404], 55)], 0, E212S63.L9),
([(4, true, false, [254, 494], [404], 84)], 0, E212S63.L10),
([(4, true, false, [254, 494], [404], 85)], 0, E212S63.L11),
([(4, true, false, [254, 494], [404], 112)], 0, E212S63.L12),
([(4, true, false, [254, 494], [404], 129)], 0, E212S63.L13),
([(4, true, false, [254, 494], [404], 132)], 0, E212S63.L14),
([(4, true, false, [254, 494], [404], 136)], 0, E212S63.L15),
([(4, true, false, [254, 494], [404], 138)], 0, E212S63.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E212S63
