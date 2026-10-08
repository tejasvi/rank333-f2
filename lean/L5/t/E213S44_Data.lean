module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S44 "data/lean/ce43751e9d56c074723bc6bc138612d3/E213S44.bin"
namespace E213S44
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [254, 494], [148], 42)], 0, E213S44.L1),
([(4, true, false, [254, 494], [148], 45)], 0, E213S44.L2),
([(4, true, false, [254, 494], [148], 55)], 0, E213S44.L3),
([(4, true, false, [254, 494], [148], 57)], 0, E213S44.L4),
([(4, true, false, [254, 494], [148], 62)], 0, E213S44.L5),
([(4, true, false, [254, 494], [148], 63)], 0, E213S44.L6),
([(4, true, false, [254, 494], [148], 64)], 0, E213S44.L7),
([(4, true, false, [254, 494], [148], 65)], 0, E213S44.L8),
([(4, true, false, [254, 494], [148], 67)], 0, E213S44.L9),
([(4, true, false, [254, 494], [148], 73)], 0, E213S44.L10),
([(4, true, false, [254, 494], [148], 82)], 0, E213S44.L11),
([(4, true, false, [254, 494], [148], 83)], 0, E213S44.L12),
([(4, true, false, [254, 494], [148], 127)], 0, E213S44.L13),
([(4, true, false, [254, 494], [148], 135)], 0, E213S44.L14),
([(4, true, false, [254, 494], [148], 139)], 0, E213S44.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E213S44
