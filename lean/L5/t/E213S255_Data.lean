module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S255 "data/lean/d331eb74b9877ae2be2cc3f790a5e8bf/E213S255.bin"
namespace E213S255
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [254, 494], [148, 388], 2)], 0, E213S255.L1),
([(14, true, false, [254, 494], [148, 388], 4)], 0, E213S255.L2),
([(14, true, false, [254, 494], [148, 388], 12)], 0, E213S255.L3),
([(14, true, false, [254, 494], [148, 388], 28)], 0, E213S255.L4),
([(14, true, false, [254, 494], [148, 388], 47)], 0, E213S255.L5),
([(14, true, false, [254, 494], [148, 388], 53)], 0, E213S255.L6),
([(14, true, false, [254, 494], [148, 388], 67)], 0, E213S255.L7),
([(14, true, false, [254, 494], [148, 388], 70)], 0, E213S255.L8)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 8
end E213S255
