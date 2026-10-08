module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S294 "data/lean/6fbb6f1b75ac69d5533a010932756a1b/E213S294.bin"
namespace E213S294
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [106, 158, 282, 494, 254], [], 0)], 0, E213S294.L1),
([(5, true, false, [106, 158, 282, 494, 254], [], 1)], 0, E213S294.L2),
([(5, true, false, [106, 158, 282, 494, 254], [], 5)], 0, E213S294.L3),
([(5, true, false, [106, 158, 282, 494, 254], [], 22)], 0, E213S294.L4),
([(5, true, false, [106, 158, 282, 494, 254], [], 23)], 0, E213S294.L5),
([(5, true, false, [106, 158, 282, 494, 254], [], 24)], 0, E213S294.L6),
([(5, true, false, [106, 158, 282, 494, 254], [], 25)], 0, E213S294.L7),
([(5, true, false, [106, 158, 282, 494, 254], [], 26)], 0, E213S294.L8),
([(5, true, false, [106, 158, 282, 494, 254], [], 44)], 0, E213S294.L9),
([(5, true, false, [106, 158, 282, 494, 254], [], 45)], 0, E213S294.L10),
([(5, true, false, [106, 158, 282, 494, 254], [], 46)], 0, E213S294.L11),
([(5, true, false, [106, 158, 282, 494, 254], [], 47)], 0, E213S294.L12),
([(5, true, false, [106, 158, 282, 494, 254], [], 48)], 0, E213S294.L13),
([(5, true, false, [106, 158, 282, 494, 254], [], 59)], 0, E213S294.L14),
([(5, true, false, [106, 158, 282, 494, 254], [], 60)], 0, E213S294.L15),
([(5, true, false, [106, 158, 282, 494, 254], [], 87)], 0, E213S294.L16),
([(5, true, false, [106, 158, 282, 494, 254], [], 99)], 0, E213S294.L17)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 17
end E213S294
