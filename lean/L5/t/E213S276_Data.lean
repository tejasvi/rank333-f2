module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S276 "data/lean/66d6d350cc05a9009bff6b25ff43afbf/E213S276.bin"
namespace E213S276
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [158, 254], [398], 0)], 0, E213S276.L1),
([(0, true, false, [158, 254], [398], 5)], 0, E213S276.L2),
([(0, true, false, [158, 254], [398], 7)], 0, E213S276.L3),
([(0, true, false, [158, 254], [398], 10)], 0, E213S276.L4),
([(0, true, false, [158, 254], [398], 29)], 0, E213S276.L5),
([(0, true, false, [158, 254], [398], 48)], 0, E213S276.L6),
([(0, true, false, [158, 254], [398], 50)], 0, E213S276.L7),
([(0, true, false, [158, 254], [398], 62)], 0, E213S276.L8),
([(0, true, false, [158, 254], [398], 63)], 0, E213S276.L9),
([(0, true, false, [158, 254], [398], 113)], 0, E213S276.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S276
