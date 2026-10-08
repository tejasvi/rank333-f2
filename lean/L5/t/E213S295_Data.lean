module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S295 "data/lean/76bef192a9384c5d9fa5576568552f30/E213S295.bin"
namespace E213S295
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 282, 106, 254], [398], 0)], 0, E213S295.L1),
([(8, true, false, [158, 282, 106, 254], [398], 14)], 0, E213S295.L2),
([(8, true, false, [158, 282, 106, 254], [398], 51)], 0, E213S295.L3),
([(8, true, false, [158, 282, 106, 254], [398], 65)], 0, E213S295.L4),
([(8, true, false, [158, 282, 106, 254], [398], 66)], 0, E213S295.L5)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 5
end E213S295
