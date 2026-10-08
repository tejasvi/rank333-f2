module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S196 "data/lean/39dadd9218cd1c4ba72054b9f047f4c6/E213S196.bin"
namespace E213S196
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [244, 254, 282], [388], 2)], 0, E213S196.L1),
([(3, true, false, [244, 254, 282], [388], 6)], 0, E213S196.L2),
([(3, true, false, [244, 254, 282], [388], 25)], 0, E213S196.L3),
([(3, true, false, [244, 254, 282], [388], 27)], 0, E213S196.L4),
([(3, true, false, [244, 254, 282], [388], 43)], 0, E213S196.L5),
([(3, true, false, [244, 254, 282], [388], 44)], 0, E213S196.L6),
([(3, true, false, [244, 254, 282], [388], 47)], 0, E213S196.L7),
([(3, true, false, [244, 254, 282], [388], 59)], 0, E213S196.L8),
([(3, true, false, [244, 254, 282], [388], 60)], 0, E213S196.L9),
([(3, true, false, [244, 254, 282], [388], 75)], 0, E213S196.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S196
