module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S414 "data/lean/812472a90604d163f02eb129b6723065/E236S414.bin"
namespace E236S414
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [372, 394], [136], 0)], 0, E236S414.L1),
([(0, true, false, [372, 394], [136], 1)], 0, E236S414.L2),
([(0, true, false, [372, 394], [136], 2)], 0, E236S414.L3),
([(0, true, false, [372, 394], [136], 4)], 0, E236S414.L4),
([(0, true, false, [372, 394], [136], 6)], 0, E236S414.L5),
([(0, true, false, [372, 394], [136], 9)], 0, E236S414.L6),
([(0, true, false, [372, 394], [136], 20)], 0, E236S414.L7),
([(0, true, false, [372, 394], [136], 26)], 0, E236S414.L8),
([(0, true, false, [372, 394], [136], 34)], 0, E236S414.L9),
([(0, true, false, [372, 394], [136], 42)], 0, E236S414.L10),
([(0, true, false, [372, 394], [136], 62)], 0, E236S414.L11),
([(0, true, false, [372, 394], [136], 69)], 0, E236S414.L12),
([(0, true, false, [372, 394], [136], 74)], 0, E236S414.L13),
([(0, true, false, [372, 394], [136], 76)], 0, E236S414.L14),
([(0, true, false, [372, 394], [136], 82)], 0, E236S414.L15),
([(0, true, false, [372, 394], [136], 83)], 0, E236S414.L16),
([(0, true, false, [372, 394], [136], 84)], 0, E236S414.L17),
([(0, true, false, [372, 394], [136], 85)], 0, E236S414.L18),
([(0, true, false, [372, 394], [136], 87)], 0, E236S414.L19),
([(0, true, false, [372, 394], [136], 88)], 0, E236S414.L20),
([(0, true, false, [372, 394], [136], 89)], 0, E236S414.L21),
([(0, true, false, [372, 394], [136], 90)], 0, E236S414.L22),
([(0, true, false, [372, 394], [136], 99)], 0, E236S414.L23),
([(0, true, false, [372, 394], [136], 101)], 0, E236S414.L24),
([(0, true, false, [372, 394], [136], 108)], 0, E236S414.L25),
([(0, true, false, [372, 394], [136], 110)], 0, E236S414.L26),
([(0, true, false, [372, 394], [136], 116)], 0, E236S414.L27),
([(0, true, false, [372, 394], [136], 118)], 0, E236S414.L28),
([(0, true, false, [372, 394], [136], 125)], 0, E236S414.L29),
([(0, true, false, [372, 394], [136], 126)], 0, E236S414.L30),
([(0, true, false, [372, 394], [136], 130)], 0, E236S414.L31)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 31
end E236S414
