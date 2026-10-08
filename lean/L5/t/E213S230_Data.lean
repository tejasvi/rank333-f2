module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S230 "data/lean/4f0cb5fa4c2d7604626fc98e9a137d5c/E213S230.bin"
namespace E213S230
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [254, 282], [148], 5)], 0, E213S230.L1),
([(7, true, false, [254, 282], [148], 6)], 0, E213S230.L2),
([(7, true, false, [254, 282], [148], 14)], 0, E213S230.L3),
([(7, true, false, [254, 282], [148], 23)], 0, E213S230.L4),
([(7, true, false, [254, 282], [148], 51)], 0, E213S230.L5),
([(7, true, false, [254, 282], [148], 52)], 0, E213S230.L6),
([(7, true, false, [254, 282], [148], 53)], 0, E213S230.L7),
([(7, true, false, [254, 282], [148], 56)], 0, E213S230.L8),
([(7, true, false, [254, 282], [148], 57)], 0, E213S230.L9),
([(7, true, false, [254, 282], [148], 58)], 0, E213S230.L10),
([(7, true, false, [254, 282], [148], 59)], 0, E213S230.L11),
([(7, true, false, [254, 282], [148], 71)], 0, E213S230.L12),
([(7, true, false, [254, 282], [148], 82)], 0, E213S230.L13),
([(7, true, false, [254, 282], [148], 95)], 0, E213S230.L14),
([(7, true, false, [254, 282], [148], 111)], 0, E213S230.L15),
([(7, true, false, [254, 282], [148], 127)], 0, E213S230.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E213S230
