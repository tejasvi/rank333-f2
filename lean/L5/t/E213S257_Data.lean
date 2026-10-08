module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S257 "data/lean/98cd5f09aa4c294a44d283d258cd4ee8/E213S257.bin"
namespace E213S257
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [106, 254], [272, 388], 0)], 0, E213S257.L1),
([(14, true, false, [106, 254], [272, 388], 6)], 0, E213S257.L2),
([(14, true, false, [106, 254], [272, 388], 19)], 0, E213S257.L3),
([(14, true, false, [106, 254], [272, 388], 47)], 0, E213S257.L4),
([(14, true, false, [106, 254], [272, 388], 62)], 0, E213S257.L5),
([(14, true, false, [106, 254], [272, 388], 85)], 0, E213S257.L6)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 6
end E213S257
