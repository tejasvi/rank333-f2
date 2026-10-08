module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S109 "data/lean/17b57cdfb0544f41807b50bb366e5c1b/E213S109.bin"
namespace E213S109
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [254, 106], [388], 4)], 0, E213S109.L1),
([(15, true, false, [254, 106], [388], 5)], 0, E213S109.L2),
([(15, true, false, [254, 106], [388], 6)], 0, E213S109.L3),
([(15, true, false, [254, 106], [388], 12)], 0, E213S109.L4),
([(15, true, false, [254, 106], [388], 17)], 0, E213S109.L5),
([(15, true, false, [254, 106], [388], 42)], 0, E213S109.L6),
([(15, true, false, [254, 106], [388], 112)], 0, E213S109.L7),
([(15, true, false, [254, 106], [388], 120)], 0, E213S109.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S109
