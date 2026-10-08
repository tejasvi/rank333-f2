module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S103 "data/lean/ff945ea57c9c674cbb3a1072f35210b8/E213S103.bin"
namespace E213S103
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [106, 158, 254, 494], [], 0)], 0, E213S103.L1),
([(0, true, false, [106, 158, 254, 494], [], 3)], 0, E213S103.L2),
([(0, true, false, [106, 158, 254, 494], [], 4)], 0, E213S103.L3),
([(0, true, false, [106, 158, 254, 494], [], 7)], 0, E213S103.L4),
([(0, true, false, [106, 158, 254, 494], [], 8)], 0, E213S103.L5),
([(0, true, false, [106, 158, 254, 494], [], 20)], 0, E213S103.L6),
([(0, true, false, [106, 158, 254, 494], [], 23)], 0, E213S103.L7),
([(0, true, false, [106, 158, 254, 494], [], 28)], 0, E213S103.L8),
([(0, true, false, [106, 158, 254, 494], [], 37)], 0, E213S103.L9),
([(0, true, false, [106, 158, 254, 494], [], 40)], 0, E213S103.L10),
([(0, true, false, [106, 158, 254, 494], [], 73)], 0, E213S103.L11),
([(0, true, false, [106, 158, 254, 494], [], 74)], 0, E213S103.L12),
([(0, true, false, [106, 158, 254, 494], [], 95)], 0, E213S103.L13),
([(0, true, false, [106, 158, 254, 494], [], 96)], 0, E213S103.L14),
([(0, true, false, [106, 158, 254, 494], [], 97)], 0, E213S103.L15),
([(0, true, false, [106, 158, 254, 494], [], 103)], 0, E213S103.L16),
([(0, true, false, [106, 158, 254, 494], [], 135)], 0, E213S103.L17),
([(0, true, false, [106, 158, 254, 494], [], 137)], 0, E213S103.L18)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 18
end E213S103
