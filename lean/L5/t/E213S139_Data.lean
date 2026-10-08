module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S139 "data/lean/99659d0be201586666182329f5bcf9f8/E213S139.bin"
namespace E213S139
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [106, 158], [272, 388], 13)], 0, E213S139.L1),
([(13, true, false, [106, 158], [272, 388], 16)], 0, E213S139.L2),
([(13, true, false, [106, 158], [272, 388], 36)], 0, E213S139.L3),
([(13, true, false, [106, 158], [272, 388], 47)], 0, E213S139.L4),
([(13, true, false, [106, 158], [272, 388], 62)], 0, E213S139.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S139
