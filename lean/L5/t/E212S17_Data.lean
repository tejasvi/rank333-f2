module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S17 "data/lean/a0a2395ef6b2f76836a55818ada0e7ae/E212S17.bin"
namespace E212S17
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 494], [26], 10)], 0, E212S17.L1),
([(0, true, false, [266, 494], [26], 11)], 0, E212S17.L2),
([(0, true, false, [266, 494], [26], 12)], 0, E212S17.L3),
([(0, true, false, [266, 494], [26], 21)], 0, E212S17.L4),
([(0, true, false, [266, 494], [26], 44)], 0, E212S17.L5),
([(0, true, false, [266, 494], [26], 88)], 0, E212S17.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E212S17
