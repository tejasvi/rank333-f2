module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S232 "data/lean/7642cbee4ac29443f18740339dd665c8/E213S232.bin"
namespace E213S232
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 158, 282, 254], [], 6)], 0, E213S232.L1),
([(6, true, false, [106, 158, 282, 254], [], 12)], 0, E213S232.L2),
([(6, true, false, [106, 158, 282, 254], [], 16)], 0, E213S232.L3),
([(6, true, false, [106, 158, 282, 254], [], 51)], 0, E213S232.L4),
([(6, true, false, [106, 158, 282, 254], [], 52)], 0, E213S232.L5),
([(6, true, false, [106, 158, 282, 254], [], 53)], 0, E213S232.L6),
([(6, true, false, [106, 158, 282, 254], [], 115)], 0, E213S232.L7),
([(6, true, false, [106, 158, 282, 254], [], 122)], 0, E213S232.L8),
([(6, true, false, [106, 158, 282, 254], [], 133)], 0, E213S232.L9),
([(6, true, false, [106, 158, 282, 254], [], 135)], 0, E213S232.L10)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 10
end E213S232
