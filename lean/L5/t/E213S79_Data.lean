module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S79 "data/lean/c66014fe5308d4c9bc7d0b41cfee368e/E213S79.bin"
namespace E213S79
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(13, true, false, [494, 158], [272], 4)], 0, E213S79.L1),
([(13, true, false, [494, 158], [272], 28)], 0, E213S79.L2),
([(13, true, false, [494, 158], [272], 30)], 0, E213S79.L3),
([(13, true, false, [494, 158], [272], 66)], 0, E213S79.L4),
([(13, true, false, [494, 158], [272], 68)], 0, E213S79.L5),
([(13, true, false, [494, 158], [272], 80)], 0, E213S79.L6),
([(13, true, false, [494, 158], [272], 81)], 0, E213S79.L7),
([(13, true, false, [494, 158], [272], 84)], 0, E213S79.L8),
([(13, true, false, [494, 158], [272], 87)], 0, E213S79.L9),
([(13, true, false, [494, 158], [272], 124)], 0, E213S79.L10),
([(13, true, false, [494, 158], [272], 206)], 0, E213S79.L11),
([(13, true, false, [494, 158], [272], 218)], 0, E213S79.L12),
([(13, true, false, [494, 158], [272], 244)], 0, E213S79.L13),
([(13, true, false, [494, 158], [272], 246)], 0, E213S79.L14)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 14
end E213S79
