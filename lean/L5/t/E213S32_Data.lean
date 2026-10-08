module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S32 "data/lean/74a34f42066283d1d01b6c7b3d630102/E213S32.bin"
namespace E213S32
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(14, true, false, [106, 494], [148, 272], 0)], 0, E213S32.L1),
([(14, true, false, [106, 494], [148, 272], 1)], 0, E213S32.L2),
([(14, true, false, [106, 494], [148, 272], 3)], 0, E213S32.L3),
([(14, true, false, [106, 494], [148, 272], 12)], 0, E213S32.L4),
([(14, true, false, [106, 494], [148, 272], 13)], 0, E213S32.L5),
([(14, true, false, [106, 494], [148, 272], 14)], 0, E213S32.L6),
([(14, true, false, [106, 494], [148, 272], 18)], 0, E213S32.L7),
([(14, true, false, [106, 494], [148, 272], 27)], 0, E213S32.L8),
([(14, true, false, [106, 494], [148, 272], 34)], 0, E213S32.L9),
([(14, true, false, [106, 494], [148, 272], 40)], 0, E213S32.L10),
([(14, true, false, [106, 494], [148, 272], 41)], 0, E213S32.L11),
([(14, true, false, [106, 494], [148, 272], 42)], 0, E213S32.L12),
([(14, true, false, [106, 494], [148, 272], 52)], 0, E213S32.L13),
([(14, true, false, [106, 494], [148, 272], 67)], 0, E213S32.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S32
