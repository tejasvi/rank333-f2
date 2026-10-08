module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S258 "data/lean/c473b8e8c91d665f2cb615a67addf811/E213S258.bin"
namespace E213S258
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [244, 282, 254], [388], 2)], 0, E213S258.L1),
([(10, true, false, [244, 282, 254], [388], 5)], 0, E213S258.L2),
([(10, true, false, [244, 282, 254], [388], 8)], 0, E213S258.L3),
([(10, true, false, [244, 282, 254], [388], 9)], 0, E213S258.L4),
([(10, true, false, [244, 282, 254], [388], 19)], 0, E213S258.L5),
([(10, true, false, [244, 282, 254], [388], 58)], 0, E213S258.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S258
