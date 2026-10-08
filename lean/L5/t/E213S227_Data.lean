module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S227 "data/lean/acf04de0a44e19c111c3237eed8d5a16/E213S227.bin"
namespace E213S227
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [158, 494, 282], [272], 0)], 0, E213S227.L1),
([(11, true, false, [158, 494, 282], [272], 3)], 0, E213S227.L2),
([(11, true, false, [158, 494, 282], [272], 5)], 0, E213S227.L3),
([(11, true, false, [158, 494, 282], [272], 24)], 0, E213S227.L4),
([(11, true, false, [158, 494, 282], [272], 25)], 0, E213S227.L5),
([(11, true, false, [158, 494, 282], [272], 27)], 0, E213S227.L6),
([(11, true, false, [158, 494, 282], [272], 28)], 0, E213S227.L7),
([(11, true, false, [158, 494, 282], [272], 30)], 0, E213S227.L8),
([(11, true, false, [158, 494, 282], [272], 31)], 0, E213S227.L9),
([(11, true, false, [158, 494, 282], [272], 33)], 0, E213S227.L10),
([(11, true, false, [158, 494, 282], [272], 49)], 0, E213S227.L11),
([(11, true, false, [158, 494, 282], [272], 52)], 0, E213S227.L12),
([(11, true, false, [158, 494, 282], [272], 55)], 0, E213S227.L13),
([(11, true, false, [158, 494, 282], [272], 63)], 0, E213S227.L14),
([(11, true, false, [158, 494, 282], [272], 74)], 0, E213S227.L15),
([(11, true, false, [158, 494, 282], [272], 75)], 0, E213S227.L16),
([(11, true, false, [158, 494, 282], [272], 77)], 0, E213S227.L17),
([(11, true, false, [158, 494, 282], [272], 86)], 0, E213S227.L18),
([(11, true, false, [158, 494, 282], [272], 89)], 0, E213S227.L19),
([(11, true, false, [158, 494, 282], [272], 101)], 0, E213S227.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E213S227
