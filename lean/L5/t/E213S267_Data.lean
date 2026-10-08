module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S267 "data/lean/a651a868327fc771a1aba88d04b05fb4/E213S267.bin"
namespace E213S267
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(9, true, false, [106, 282, 254], [], 11)], 0, E213S267.L1),
([(9, true, false, [106, 282, 254], [], 13)], 0, E213S267.L2),
([(9, true, false, [106, 282, 254], [], 16)], 0, E213S267.L3),
([(9, true, false, [106, 282, 254], [], 21)], 0, E213S267.L4),
([(9, true, false, [106, 282, 254], [], 23)], 0, E213S267.L5),
([(9, true, false, [106, 282, 254], [], 24)], 0, E213S267.L6),
([(9, true, false, [106, 282, 254], [], 27)], 0, E213S267.L7),
([(9, true, false, [106, 282, 254], [], 28)], 0, E213S267.L8),
([(9, true, false, [106, 282, 254], [], 30)], 0, E213S267.L9),
([(9, true, false, [106, 282, 254], [], 31)], 0, E213S267.L10),
([(9, true, false, [106, 282, 254], [], 222)], 0, E213S267.L11),
([(9, true, false, [106, 282, 254], [], 270)], 0, E213S267.L12),
([(9, true, false, [106, 282, 254], [], 318)], 0, E213S267.L13)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 13
end E213S267
