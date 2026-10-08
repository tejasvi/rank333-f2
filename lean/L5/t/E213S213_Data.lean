module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S213 "data/lean/75811559905f5a6d16573466a3583434/E213S213.bin"
namespace E213S213
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(10, true, false, [282, 494], [388], 4)], 0, E213S213.L1),
([(10, true, false, [282, 494], [388], 7)], 0, E213S213.L2),
([(10, true, false, [282, 494], [388], 11)], 0, E213S213.L3),
([(10, true, false, [282, 494], [388], 15)], 0, E213S213.L4),
([(10, true, false, [282, 494], [388], 16)], 0, E213S213.L5),
([(10, true, false, [282, 494], [388], 17)], 0, E213S213.L6),
([(10, true, false, [282, 494], [388], 19)], 0, E213S213.L7),
([(10, true, false, [282, 494], [388], 23)], 0, E213S213.L8),
([(10, true, false, [282, 494], [388], 24)], 0, E213S213.L9),
([(10, true, false, [282, 494], [388], 37)], 0, E213S213.L10),
([(10, true, false, [282, 494], [388], 41)], 0, E213S213.L11),
([(10, true, false, [282, 494], [388], 49)], 0, E213S213.L12),
([(10, true, false, [282, 494], [388], 76)], 0, E213S213.L13),
([(10, true, false, [282, 494], [388], 79)], 0, E213S213.L14),
([(10, true, false, [282, 494], [388], 113)], 0, E213S213.L15),
([(10, true, false, [282, 494], [388], 116)], 0, E213S213.L16),
([(10, true, false, [282, 494], [388], 128)], 0, E213S213.L17),
([(10, true, false, [282, 494], [388], 133)], 0, E213S213.L18),
([(10, true, false, [282, 494], [388], 145)], 0, E213S213.L19),
([(10, true, false, [282, 494], [388], 154)], 0, E213S213.L20),
([(10, true, false, [282, 494], [388], 188)], 0, E213S213.L21),
([(10, true, false, [282, 494], [388], 202)], 0, E213S213.L22),
([(10, true, false, [282, 494], [388], 240)], 0, E213S213.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E213S213
