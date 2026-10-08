module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S245 "data/lean/98c3691dc7f0049d824be6bc5a61ee91/E213S245.bin"
namespace E213S245
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [158, 494, 106], [96], 1)], 0, E213S245.L1),
([(11, true, false, [158, 494, 106], [96], 10)], 0, E213S245.L2),
([(11, true, false, [158, 494, 106], [96], 18)], 0, E213S245.L3),
([(11, true, false, [158, 494, 106], [96], 34)], 0, E213S245.L4),
([(11, true, false, [158, 494, 106], [96], 52)], 0, E213S245.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S245
