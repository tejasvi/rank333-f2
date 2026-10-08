module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E213S212 "data/lean/c5c0db3f1e47b619c2830be14cebac33/E213S212.bin"
namespace E213S212
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(3, true, false, [494, 282], [388], 1)], 0, E213S212.L1),
([(3, true, false, [494, 282], [388], 6)], 0, E213S212.L2),
([(3, true, false, [494, 282], [388], 42)], 0, E213S212.L3),
([(3, true, false, [494, 282], [388], 45)], 0, E213S212.L4),
([(3, true, false, [494, 282], [388], 49)], 0, E213S212.L5),
([(3, true, false, [494, 282], [388], 51)], 0, E213S212.L6),
([(3, true, false, [494, 282], [388], 54)], 0, E213S212.L7),
([(3, true, false, [494, 282], [388], 56)], 0, E213S212.L8),
([(3, true, false, [494, 282], [388], 76)], 0, E213S212.L9),
([(3, true, false, [494, 282], [388], 77)], 0, E213S212.L10),
([(3, true, false, [494, 282], [388], 78)], 0, E213S212.L11),
([(3, true, false, [494, 282], [388], 79)], 0, E213S212.L12),
([(3, true, false, [494, 282], [388], 85)], 0, E213S212.L13),
([(3, true, false, [494, 282], [388], 87)], 0, E213S212.L14),
([(3, true, false, [494, 282], [388], 88)], 0, E213S212.L15),
([(3, true, false, [494, 282], [388], 90)], 0, E213S212.L16),
([(3, true, false, [494, 282], [388], 91)], 0, E213S212.L17),
([(3, true, false, [494, 282], [388], 92)], 0, E213S212.L18),
([(3, true, false, [494, 282], [388], 93)], 0, E213S212.L19),
([(3, true, false, [494, 282], [388], 112)], 0, E213S212.L20),
([(3, true, false, [494, 282], [388], 115)], 0, E213S212.L21),
([(3, true, false, [494, 282], [388], 118)], 0, E213S212.L22),
([(3, true, false, [494, 282], [388], 128)], 0, E213S212.L23),
([(3, true, false, [494, 282], [388], 134)], 0, E213S212.L24),
([(3, true, false, [494, 282], [388], 143)], 0, E213S212.L25),
([(3, true, false, [494, 282], [388], 159)], 0, E213S212.L26),
([(3, true, false, [494, 282], [388], 186)], 0, E213S212.L27),
([(3, true, false, [494, 282], [388], 212)], 0, E213S212.L28),
([(3, true, false, [494, 282], [388], 219)], 0, E213S212.L29)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 29
end E213S212
