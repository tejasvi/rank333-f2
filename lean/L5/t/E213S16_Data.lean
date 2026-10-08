module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S16 "data/lean/f4da1044acd4ced4fd7c1a9a4f7d73b8/E213S16.bin"
namespace E213S16
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [494, 106], [148], 40)], 0, E213S16.L1),
([(4, true, false, [494, 106], [148], 41)], 0, E213S16.L2),
([(4, true, false, [494, 106], [148], 43)], 0, E213S16.L3),
([(4, true, false, [494, 106], [148], 46)], 0, E213S16.L4),
([(4, true, false, [494, 106], [148], 49)], 0, E213S16.L5),
([(4, true, false, [494, 106], [148], 54)], 0, E213S16.L6),
([(4, true, false, [494, 106], [148], 55)], 0, E213S16.L7),
([(4, true, false, [494, 106], [148], 78)], 0, E213S16.L8),
([(4, true, false, [494, 106], [148], 93)], 0, E213S16.L9),
([(4, true, false, [494, 106], [148], 119)], 0, E213S16.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S16
