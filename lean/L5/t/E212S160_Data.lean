module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S160 "data/lean/64641ae5809d695691a7f98b81ddc423/E212S160.bin"
namespace E212S160
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 494, 500], [], 5)], 0, E212S160.L1),
([(2, true, false, [266, 494, 500], [], 44)], 0, E212S160.L2),
([(2, true, false, [266, 494, 500], [], 45)], 0, E212S160.L3),
([(2, true, false, [266, 494, 500], [], 46)], 0, E212S160.L4),
([(2, true, false, [266, 494, 500], [], 47)], 0, E212S160.L5),
([(2, true, false, [266, 494, 500], [], 49)], 0, E212S160.L6),
([(2, true, false, [266, 494, 500], [], 55)], 0, E212S160.L7),
([(2, true, false, [266, 494, 500], [], 59)], 0, E212S160.L8),
([(2, true, false, [266, 494, 500], [], 81)], 0, E212S160.L9),
([(2, true, false, [266, 494, 500], [], 95)], 0, E212S160.L10),
([(2, true, false, [266, 494, 500], [], 141)], 0, E212S160.L11),
([(2, true, false, [266, 494, 500], [], 165)], 0, E212S160.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E212S160
