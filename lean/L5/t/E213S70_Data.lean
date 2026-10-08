module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S70 "data/lean/92213ba0cbd945da1c0c5243da388a3a/E213S70.bin"
namespace E213S70
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(11, true, false, [158, 494], [96, 272], 2)], 0, E213S70.L1),
([(11, true, false, [158, 494], [96, 272], 3)], 0, E213S70.L2),
([(11, true, false, [158, 494], [96, 272], 5)], 0, E213S70.L3),
([(11, true, false, [158, 494], [96, 272], 11)], 0, E213S70.L4),
([(11, true, false, [158, 494], [96, 272], 17)], 0, E213S70.L5),
([(11, true, false, [158, 494], [96, 272], 20)], 0, E213S70.L6),
([(11, true, false, [158, 494], [96, 272], 26)], 0, E213S70.L7),
([(11, true, false, [158, 494], [96, 272], 31)], 0, E213S70.L8),
([(11, true, false, [158, 494], [96, 272], 33)], 0, E213S70.L9),
([(11, true, false, [158, 494], [96, 272], 46)], 0, E213S70.L10),
([(11, true, false, [158, 494], [96, 272], 49)], 0, E213S70.L11),
([(11, true, false, [158, 494], [96, 272], 50)], 0, E213S70.L12),
([(11, true, false, [158, 494], [96, 272], 52)], 0, E213S70.L13),
([(11, true, false, [158, 494], [96, 272], 53)], 0, E213S70.L14),
([(11, true, false, [158, 494], [96, 272], 63)], 0, E213S70.L15),
([(11, true, false, [158, 494], [96, 272], 68)], 0, E213S70.L16),
([(11, true, false, [158, 494], [96, 272], 84)], 0, E213S70.L17),
([(11, true, false, [158, 494], [96, 272], 92)], 0, E213S70.L18),
([(11, true, false, [158, 494], [96, 272], 95)], 0, E213S70.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E213S70
