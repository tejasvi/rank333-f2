module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S179 "data/lean/e0ba063217d49047a9044272e2039882/E213S179.bin"
namespace E213S179
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 282, 254], [], 13)], 0, E213S179.L1),
([(6, true, false, [106, 282, 254], [], 31)], 0, E213S179.L2),
([(6, true, false, [106, 282, 254], [], 34)], 0, E213S179.L3),
([(6, true, false, [106, 282, 254], [], 55)], 0, E213S179.L4),
([(6, true, false, [106, 282, 254], [], 88)], 0, E213S179.L5),
([(6, true, false, [106, 282, 254], [], 89)], 0, E213S179.L6),
([(6, true, false, [106, 282, 254], [], 90)], 0, E213S179.L7),
([(6, true, false, [106, 282, 254], [], 91)], 0, E213S179.L8),
([(6, true, false, [106, 282, 254], [], 92)], 0, E213S179.L9),
([(6, true, false, [106, 282, 254], [], 93)], 0, E213S179.L10),
([(6, true, false, [106, 282, 254], [], 94)], 0, E213S179.L11),
([(6, true, false, [106, 282, 254], [], 95)], 0, E213S179.L12),
([(6, true, false, [106, 282, 254], [], 96)], 0, E213S179.L13),
([(6, true, false, [106, 282, 254], [], 97)], 0, E213S179.L14),
([(6, true, false, [106, 282, 254], [], 153)], 0, E213S179.L15),
([(6, true, false, [106, 282, 254], [], 157)], 0, E213S179.L16),
([(6, true, false, [106, 282, 254], [], 216)], 0, E213S179.L17),
([(6, true, false, [106, 282, 254], [], 224)], 0, E213S179.L18),
([(6, true, false, [106, 282, 254], [], 228)], 0, E213S179.L19),
([(6, true, false, [106, 282, 254], [], 246)], 0, E213S179.L20),
([(6, true, false, [106, 282, 254], [], 324)], 0, E213S179.L21),
([(6, true, false, [106, 282, 254], [], 350)], 0, E213S179.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E213S179
