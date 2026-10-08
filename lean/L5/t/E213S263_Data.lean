module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S263 "data/lean/e4124d2e686309d2113e171c4cb4df41/E213S263.bin"
namespace E213S263
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(15, true, false, [106, 244, 282], [388], 2)], 0, E213S263.L1),
([(15, true, false, [106, 244, 282], [388], 3)], 0, E213S263.L2),
([(15, true, false, [106, 244, 282], [388], 45)], 0, E213S263.L3),
([(15, true, false, [106, 244, 282], [388], 49)], 0, E213S263.L4),
([(15, true, false, [106, 244, 282], [388], 76)], 0, E213S263.L5),
([(15, true, false, [106, 244, 282], [388], 79)], 0, E213S263.L6),
([(15, true, false, [106, 244, 282], [388], 82)], 0, E213S263.L7),
([(15, true, false, [106, 244, 282], [388], 115)], 0, E213S263.L8),
([(15, true, false, [106, 244, 282], [388], 130)], 0, E213S263.L9)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 9
end E213S263
