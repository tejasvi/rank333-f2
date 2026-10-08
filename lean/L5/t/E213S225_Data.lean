module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S225 "data/lean/08fd9ac22d3be62e7e1645f7c075fd0d/E213S225.bin"
namespace E213S225
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [244, 282, 106], [148], 25)], 0, E213S225.L1),
([(7, true, false, [244, 282, 106], [148], 27)], 0, E213S225.L2),
([(7, true, false, [244, 282, 106], [148], 41)], 0, E213S225.L3),
([(7, true, false, [244, 282, 106], [148], 43)], 0, E213S225.L4),
([(7, true, false, [244, 282, 106], [148], 57)], 0, E213S225.L5),
([(7, true, false, [244, 282, 106], [148], 69)], 0, E213S225.L6),
([(7, true, false, [244, 282, 106], [148], 73)], 0, E213S225.L7)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 7
end E213S225
