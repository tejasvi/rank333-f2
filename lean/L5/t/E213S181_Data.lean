module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S181 "data/lean/9affd56305b5873477034c354719938e/E213S181.bin"
namespace E213S181
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(6, true, false, [106, 158, 282, 254], [], 16)], 0, E213S181.L1),
([(6, true, false, [106, 158, 282, 254], [], 19)], 0, E213S181.L2),
([(6, true, false, [106, 158, 282, 254], [], 51)], 0, E213S181.L3),
([(6, true, false, [106, 158, 282, 254], [], 52)], 0, E213S181.L4),
([(6, true, false, [106, 158, 282, 254], [], 53)], 0, E213S181.L5),
([(6, true, false, [106, 158, 282, 254], [], 54)], 0, E213S181.L6),
([(6, true, false, [106, 158, 282, 254], [], 55)], 0, E213S181.L7),
([(6, true, false, [106, 158, 282, 254], [], 61)], 0, E213S181.L8),
([(6, true, false, [106, 158, 282, 254], [], 88)], 0, E213S181.L9),
([(6, true, false, [106, 158, 282, 254], [], 90)], 0, E213S181.L10),
([(6, true, false, [106, 158, 282, 254], [], 115)], 0, E213S181.L11),
([(6, true, false, [106, 158, 282, 254], [], 163)], 0, E213S181.L12),
([(6, true, false, [106, 158, 282, 254], [], 165)], 0, E213S181.L13),
([(6, true, false, [106, 158, 282, 254], [], 167)], 0, E213S181.L14),
([(6, true, false, [106, 158, 282, 254], [], 169)], 0, E213S181.L15),
([(6, true, false, [106, 158, 282, 254], [], 177)], 0, E213S181.L16),
([(6, true, false, [106, 158, 282, 254], [], 180)], 0, E213S181.L17),
([(6, true, false, [106, 158, 282, 254], [], 211)], 0, E213S181.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E213S181
