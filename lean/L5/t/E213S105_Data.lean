module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S105 "data/lean/5403ed26f64dd8467bed5f4d8248f0ce/E213S105.bin"
namespace E213S105
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [158, 244, 494], [], 10)], 0, E213S105.L1),
([(4, true, false, [158, 244, 494], [], 11)], 0, E213S105.L2),
([(4, true, false, [158, 244, 494], [], 37)], 0, E213S105.L3),
([(4, true, false, [158, 244, 494], [], 38)], 0, E213S105.L4),
([(4, true, false, [158, 244, 494], [], 39)], 0, E213S105.L5),
([(4, true, false, [158, 244, 494], [], 40)], 0, E213S105.L6),
([(4, true, false, [158, 244, 494], [], 41)], 0, E213S105.L7),
([(4, true, false, [158, 244, 494], [], 69)], 0, E213S105.L8),
([(4, true, false, [158, 244, 494], [], 70)], 0, E213S105.L9),
([(4, true, false, [158, 244, 494], [], 72)], 0, E213S105.L10),
([(4, true, false, [158, 244, 494], [], 74)], 0, E213S105.L11),
([(4, true, false, [158, 244, 494], [], 75)], 0, E213S105.L12),
([(4, true, false, [158, 244, 494], [], 77)], 0, E213S105.L13),
([(4, true, false, [158, 244, 494], [], 78)], 0, E213S105.L14),
([(4, true, false, [158, 244, 494], [], 85)], 0, E213S105.L15),
([(4, true, false, [158, 244, 494], [], 90)], 0, E213S105.L16),
([(4, true, false, [158, 244, 494], [], 93)], 0, E213S105.L17),
([(4, true, false, [158, 244, 494], [], 111)], 0, E213S105.L18),
([(4, true, false, [158, 244, 494], [], 115)], 0, E213S105.L19),
([(4, true, false, [158, 244, 494], [], 127)], 0, E213S105.L20),
([(4, true, false, [158, 244, 494], [], 129)], 0, E213S105.L21),
([(4, true, false, [158, 244, 494], [], 131)], 0, E213S105.L22),
([(4, true, false, [158, 244, 494], [], 154)], 0, E213S105.L23),
([(4, true, false, [158, 244, 494], [], 160)], 0, E213S105.L24),
([(4, true, false, [158, 244, 494], [], 166)], 0, E213S105.L25),
([(4, true, false, [158, 244, 494], [], 168)], 0, E213S105.L26),
([(4, true, false, [158, 244, 494], [], 175)], 0, E213S105.L27),
([(4, true, false, [158, 244, 494], [], 179)], 0, E213S105.L28),
([(4, true, false, [158, 244, 494], [], 183)], 0, E213S105.L29),
([(4, true, false, [158, 244, 494], [], 207)], 0, E213S105.L30)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 30
end E213S105
