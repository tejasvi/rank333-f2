module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S290 "data/lean/552929fdc009a039ab88b41ad145d1ef/E213S290.bin"
namespace E213S290
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(1, true, false, [244, 254, 282, 158], [], 0)], 0, E213S290.L1),
([(1, true, false, [244, 254, 282, 158], [], 51)], 0, E213S290.L2),
([(1, true, false, [244, 254, 282, 158], [], 52)], 0, E213S290.L3),
([(1, true, false, [244, 254, 282, 158], [], 53)], 0, E213S290.L4),
([(1, true, false, [244, 254, 282, 158], [], 61)], 0, E213S290.L5),
([(1, true, false, [244, 254, 282, 158], [], 85)], 0, E213S290.L6),
([(1, true, false, [244, 254, 282, 158], [], 87)], 0, E213S290.L7),
([(1, true, false, [244, 254, 282, 158], [], 96)], 0, E213S290.L8),
([(1, true, false, [244, 254, 282, 158], [], 119)], 0, E213S290.L9),
([(1, true, false, [244, 254, 282, 158], [], 133)], 0, E213S290.L10),
([(1, true, false, [244, 254, 282, 158], [], 163)], 0, E213S290.L11),
([(1, true, false, [244, 254, 282, 158], [], 211)], 0, E213S290.L12)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 12
end E213S290
