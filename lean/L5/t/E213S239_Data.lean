module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S239 "data/lean/4a40f701402d71ae2cf04615186246ad/E213S239.bin"
namespace E213S239
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 282, 494], [], 0)], 0, E213S239.L1),
([(0, true, false, [106, 158, 282, 494], [], 1)], 0, E213S239.L2),
([(0, true, false, [106, 158, 282, 494], [], 2)], 0, E213S239.L3),
([(0, true, false, [106, 158, 282, 494], [], 3)], 0, E213S239.L4),
([(0, true, false, [106, 158, 282, 494], [], 4)], 0, E213S239.L5),
([(0, true, false, [106, 158, 282, 494], [], 5)], 0, E213S239.L6),
([(0, true, false, [106, 158, 282, 494], [], 8)], 0, E213S239.L7),
([(0, true, false, [106, 158, 282, 494], [], 10)], 0, E213S239.L8),
([(0, true, false, [106, 158, 282, 494], [], 12)], 0, E213S239.L9),
([(0, true, false, [106, 158, 282, 494], [], 13)], 0, E213S239.L10),
([(0, true, false, [106, 158, 282, 494], [], 14)], 0, E213S239.L11),
([(0, true, false, [106, 158, 282, 494], [], 17)], 0, E213S239.L12),
([(0, true, false, [106, 158, 282, 494], [], 27)], 0, E213S239.L13),
([(0, true, false, [106, 158, 282, 494], [], 28)], 0, E213S239.L14),
([(0, true, false, [106, 158, 282, 494], [], 30)], 0, E213S239.L15),
([(0, true, false, [106, 158, 282, 494], [], 34)], 0, E213S239.L16),
([(0, true, false, [106, 158, 282, 494], [], 43)], 0, E213S239.L17),
([(0, true, false, [106, 158, 282, 494], [], 44)], 0, E213S239.L18),
([(0, true, false, [106, 158, 282, 494], [], 45)], 0, E213S239.L19),
([(0, true, false, [106, 158, 282, 494], [], 46)], 0, E213S239.L20),
([(0, true, false, [106, 158, 282, 494], [], 47)], 0, E213S239.L21),
([(0, true, false, [106, 158, 282, 494], [], 48)], 0, E213S239.L22),
([(0, true, false, [106, 158, 282, 494], [], 49)], 0, E213S239.L23),
([(0, true, false, [106, 158, 282, 494], [], 56)], 0, E213S239.L24),
([(0, true, false, [106, 158, 282, 494], [], 60)], 0, E213S239.L25),
([(0, true, false, [106, 158, 282, 494], [], 62)], 0, E213S239.L26),
([(0, true, false, [106, 158, 282, 494], [], 66)], 0, E213S239.L27),
([(0, true, false, [106, 158, 282, 494], [], 68)], 0, E213S239.L28),
([(0, true, false, [106, 158, 282, 494], [], 73)], 0, E213S239.L29),
([(0, true, false, [106, 158, 282, 494], [], 75)], 0, E213S239.L30),
([(0, true, false, [106, 158, 282, 494], [], 77)], 0, E213S239.L31),
([(0, true, false, [106, 158, 282, 494], [], 97)], 0, E213S239.L32),
([(0, true, false, [106, 158, 282, 494], [], 98)], 0, E213S239.L33),
([(0, true, false, [106, 158, 282, 494], [], 109)], 0, E213S239.L34),
([(0, true, false, [106, 158, 282, 494], [], 112)], 0, E213S239.L35),
([(0, true, false, [106, 158, 282, 494], [], 114)], 0, E213S239.L36),
([(0, true, false, [106, 158, 282, 494], [], 119)], 0, E213S239.L37)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 37
end E213S239
