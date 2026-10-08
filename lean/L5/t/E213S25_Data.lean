module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S25 "data/lean/564f01fc9f09c380bab0083b492b8b8e/E213S25.bin"
namespace E213S25
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [106, 282], [272, 388], 0)], 0, E213S25.L1),
([(2, true, false, [106, 282], [272, 388], 12)], 0, E213S25.L2),
([(2, true, false, [106, 282], [272, 388], 20)], 0, E213S25.L3),
([(2, true, false, [106, 282], [272, 388], 21)], 0, E213S25.L4),
([(2, true, false, [106, 282], [272, 388], 23)], 0, E213S25.L5),
([(2, true, false, [106, 282], [272, 388], 32)], 7, E213S25.L6),
([(2, true, false, [106, 282], [272, 388], 33)], 0, E213S25.L7),
([(2, true, false, [106, 282], [272, 388], 35)], 0, E213S25.L8),
([(2, true, false, [106, 282], [272, 388], 42)], 0, E213S25.L9),
([(2, true, false, [106, 282], [272, 388], 43)], 0, E213S25.L10),
([(2, true, false, [106, 282], [272, 388], 44)], 0, E213S25.L11),
([(2, true, false, [106, 282], [272, 388], 50)], 0, E213S25.L12),
([(2, true, false, [106, 282], [272, 388], 59)], 0, E213S25.L13),
([(2, true, false, [106, 282], [272, 388], 63)], 0, E213S25.L14),
([(2, true, false, [106, 282], [272, 388], 83)], 0, E213S25.L15),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 262)], 0, E213S25.L16),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 320)], 0, E213S25.L17),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 350)], 0, E213S25.L18),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 456)], 0, E213S25.L19),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 540)], 0, E213S25.L20),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 614)], 0, E213S25.L21),
([(2, true, false, [106, 282], [272, 388], 32), (3, false, false, [], [272, 388], 672)], 0, E213S25.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 15
end E213S25
