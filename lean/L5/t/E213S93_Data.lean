module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S93 "data/lean/b4f83afa39a44684295fb0829ae307ea/E213S93.bin"
namespace E213S93
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [158, 282, 494], [], 5)], 0, E213S93.L1),
([(7, true, false, [158, 282, 494], [], 6)], 0, E213S93.L2),
([(7, true, false, [158, 282, 494], [], 8)], 0, E213S93.L3),
([(7, true, false, [158, 282, 494], [], 37)], 0, E213S93.L4),
([(7, true, false, [158, 282, 494], [], 38)], 0, E213S93.L5),
([(7, true, false, [158, 282, 494], [], 39)], 0, E213S93.L6),
([(7, true, false, [158, 282, 494], [], 40)], 0, E213S93.L7),
([(7, true, false, [158, 282, 494], [], 41)], 0, E213S93.L8),
([(7, true, false, [158, 282, 494], [], 67)], 0, E213S93.L9),
([(7, true, false, [158, 282, 494], [], 68)], 0, E213S93.L10),
([(7, true, false, [158, 282, 494], [], 69)], 0, E213S93.L11),
([(7, true, false, [158, 282, 494], [], 71)], 0, E213S93.L12),
([(7, true, false, [158, 282, 494], [], 72)], 0, E213S93.L13),
([(7, true, false, [158, 282, 494], [], 74)], 0, E213S93.L14),
([(7, true, false, [158, 282, 494], [], 104)], 0, E213S93.L15),
([(7, true, false, [158, 282, 494], [], 105)], 0, E213S93.L16),
([(7, true, false, [158, 282, 494], [], 107)], 0, E213S93.L17),
([(7, true, false, [158, 282, 494], [], 122)], 0, E213S93.L18),
([(7, true, false, [158, 282, 494], [], 125)], 0, E213S93.L19),
([(7, true, false, [158, 282, 494], [], 127)], 0, E213S93.L20),
([(7, true, false, [158, 282, 494], [], 151)], 0, E213S93.L21),
([(7, true, false, [158, 282, 494], [], 154)], 0, E213S93.L22),
([(7, true, false, [158, 282, 494], [], 156)], 0, E213S93.L23),
([(7, true, false, [158, 282, 494], [], 162)], 0, E213S93.L24),
([(7, true, false, [158, 282, 494], [], 236)], 0, E213S93.L25)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 25
end E213S93
