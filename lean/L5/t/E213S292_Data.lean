module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S292 "data/lean/86a1dfc2aa54491a8025cdbe74dd6242/E213S292.bin"
namespace E213S292
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(8, true, false, [158, 282, 254], [], 0)], 0, E213S292.L1),
([(8, true, false, [158, 282, 254], [], 6)], 0, E213S292.L2),
([(8, true, false, [158, 282, 254], [], 11)], 0, E213S292.L3),
([(8, true, false, [158, 282, 254], [], 20)], 0, E213S292.L4),
([(8, true, false, [158, 282, 254], [], 22)], 0, E213S292.L5),
([(8, true, false, [158, 282, 254], [], 23)], 0, E213S292.L6),
([(8, true, false, [158, 282, 254], [], 28)], 0, E213S292.L7),
([(8, true, false, [158, 282, 254], [], 29)], 0, E213S292.L8),
([(8, true, false, [158, 282, 254], [], 32)], 0, E213S292.L9),
([(8, true, false, [158, 282, 254], [], 34)], 0, E213S292.L10),
([(8, true, false, [158, 282, 254], [], 41)], 0, E213S292.L11),
([(8, true, false, [158, 282, 254], [], 44)], 0, E213S292.L12),
([(8, true, false, [158, 282, 254], [], 45)], 0, E213S292.L13),
([(8, true, false, [158, 282, 254], [], 89)], 0, E213S292.L14),
([(8, true, false, [158, 282, 254], [], 99)], 0, E213S292.L15),
([(8, true, false, [158, 282, 254], [], 112)], 0, E213S292.L16),
([(8, true, false, [158, 282, 254], [], 113)], 0, E213S292.L17),
([(8, true, false, [158, 282, 254], [], 153)], 0, E213S292.L18),
([(8, true, false, [158, 282, 254], [], 162)], 0, E213S292.L19),
([(8, true, false, [158, 282, 254], [], 163)], 0, E213S292.L20),
([(8, true, false, [158, 282, 254], [], 166)], 0, E213S292.L21),
([(8, true, false, [158, 282, 254], [], 168)], 0, E213S292.L22),
([(8, true, false, [158, 282, 254], [], 173)], 0, E213S292.L23),
([(8, true, false, [158, 282, 254], [], 176)], 0, E213S292.L24),
([(8, true, false, [158, 282, 254], [], 177)], 0, E213S292.L25),
([(8, true, false, [158, 282, 254], [], 180)], 0, E213S292.L26),
([(8, true, false, [158, 282, 254], [], 261)], 0, E213S292.L27),
([(8, true, false, [158, 282, 254], [], 265)], 0, E213S292.L28),
([(8, true, false, [158, 282, 254], [], 308)], 0, E213S292.L29),
([(8, true, false, [158, 282, 254], [], 309)], 0, E213S292.L30),
([(8, true, false, [158, 282, 254], [], 312)], 0, E213S292.L31),
([(8, true, false, [158, 282, 254], [], 353)], 0, E213S292.L32),
([(8, true, false, [158, 282, 254], [], 356)], 0, E213S292.L33),
([(8, true, false, [158, 282, 254], [], 432)], 0, E213S292.L34),
([(8, true, false, [158, 282, 254], [], 433)], 0, E213S292.L35),
([(8, true, false, [158, 282, 254], [], 436)], 0, E213S292.L36),
([(8, true, false, [158, 282, 254], [], 437)], 0, E213S292.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E213S292
