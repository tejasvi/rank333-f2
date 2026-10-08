module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S148 "data/lean/275eefd34545434e231fa65539b9e64b/E213S148.bin"
namespace E213S148
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [106, 158, 282], [272], 15)], 2, E213S148.L1),
([(7, true, false, [106, 158, 282], [272], 16)], 0, E213S148.L2),
([(7, true, false, [106, 158, 282], [272], 17)], 0, E213S148.L3),
([(7, true, false, [106, 158, 282], [272], 19)], 0, E213S148.L4),
([(7, true, false, [106, 158, 282], [272], 22)], 0, E213S148.L5),
([(7, true, false, [106, 158, 282], [272], 26)], 0, E213S148.L6),
([(7, true, false, [106, 158, 282], [272], 27)], 0, E213S148.L7),
([(7, true, false, [106, 158, 282], [272], 28)], 0, E213S148.L8),
([(7, true, false, [106, 158, 282], [272], 29)], 0, E213S148.L9),
([(7, true, false, [106, 158, 282], [272], 30)], 0, E213S148.L10),
([(7, true, false, [106, 158, 282], [272], 36)], 0, E213S148.L11),
([(7, true, false, [106, 158, 282], [272], 49)], 0, E213S148.L12),
([(7, true, false, [106, 158, 282], [272], 64)], 0, E213S148.L13),
([(7, true, false, [106, 158, 282], [272], 15), (0, false, false, [], [], 24)], 0, E213S148.L14),
([(7, true, false, [106, 158, 282], [272], 15), (0, false, false, [], [], 34)], 0, E213S148.L15)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E213S148
