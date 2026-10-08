module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S243 "data/lean/391e9d646aa2db6dcd1a596d04c50593/E213S243.bin"
namespace E213S243
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(5, true, false, [106, 494, 254], [], 10)], 0, E213S243.L1),
([(5, true, false, [106, 494, 254], [], 21)], 0, E213S243.L2),
([(5, true, false, [106, 494, 254], [], 24)], 0, E213S243.L3),
([(5, true, false, [106, 494, 254], [], 74)], 0, E213S243.L4),
([(5, true, false, [106, 494, 254], [], 75)], 0, E213S243.L5),
([(5, true, false, [106, 494, 254], [], 76)], 0, E213S243.L6),
([(5, true, false, [106, 494, 254], [], 77)], 0, E213S243.L7),
([(5, true, false, [106, 494, 254], [], 78)], 0, E213S243.L8),
([(5, true, false, [106, 494, 254], [], 79)], 0, E213S243.L9),
([(5, true, false, [106, 494, 254], [], 80)], 0, E213S243.L10),
([(5, true, false, [106, 494, 254], [], 81)], 0, E213S243.L11),
([(5, true, false, [106, 494, 254], [], 82)], 0, E213S243.L12),
([(5, true, false, [106, 494, 254], [], 83)], 0, E213S243.L13),
([(5, true, false, [106, 494, 254], [], 87)], 0, E213S243.L14),
([(5, true, false, [106, 494, 254], [], 119)], 0, E213S243.L15),
([(5, true, false, [106, 494, 254], [], 163)], 0, E213S243.L16),
([(5, true, false, [106, 494, 254], [], 217)], 0, E213S243.L17),
([(5, true, false, [106, 494, 254], [], 320)], 0, E213S243.L18),
([(5, true, false, [106, 494, 254], [], 321)], 0, E213S243.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E213S243
