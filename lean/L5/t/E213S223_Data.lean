module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S223 "data/lean/b5fe02c6be81f23f13d90ff9be883dc6/E213S223.bin"
namespace E213S223
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [494, 282], [272, 388], 7)], 0, E213S223.L1),
([(11, true, false, [494, 282], [272, 388], 13)], 0, E213S223.L2),
([(11, true, false, [494, 282], [272, 388], 23)], 0, E213S223.L3),
([(11, true, false, [494, 282], [272, 388], 25)], 0, E213S223.L4),
([(11, true, false, [494, 282], [272, 388], 31)], 0, E213S223.L5),
([(11, true, false, [494, 282], [272, 388], 49)], 0, E213S223.L6),
([(11, true, false, [494, 282], [272, 388], 50)], 0, E213S223.L7),
([(11, true, false, [494, 282], [272, 388], 68)], 0, E213S223.L8),
([(11, true, false, [494, 282], [272, 388], 70)], 0, E213S223.L9),
([(11, true, false, [494, 282], [272, 388], 74)], 0, E213S223.L10),
([(11, true, false, [494, 282], [272, 388], 87)], 0, E213S223.L11),
([(11, true, false, [494, 282], [272, 388], 93)], 0, E213S223.L12),
([(11, true, false, [494, 282], [272, 388], 110)], 0, E213S223.L13),
([(11, true, false, [494, 282], [272, 388], 115)], 0, E213S223.L14),
([(11, true, false, [494, 282], [272, 388], 123)], 0, E213S223.L15),
([(11, true, false, [494, 282], [272, 388], 142)], 0, E213S223.L16),
([(11, true, false, [494, 282], [272, 388], 146)], 0, E213S223.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E213S223
