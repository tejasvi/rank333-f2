module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S53 "data/lean/f13c4fd864a2f75d01f2877a7f667d84/E207S53.bin"
namespace E207S53
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(4, true, false, [286, 494], [80], 0)], 0, E207S53.L1),
([(4, true, false, [286, 494], [80], 1)], 0, E207S53.L2),
([(4, true, false, [286, 494], [80], 3)], 0, E207S53.L3),
([(4, true, false, [286, 494], [80], 4)], 0, E207S53.L4),
([(4, true, false, [286, 494], [80], 10)], 0, E207S53.L5),
([(4, true, false, [286, 494], [80], 12)], 0, E207S53.L6),
([(4, true, false, [286, 494], [80], 20)], 0, E207S53.L7),
([(4, true, false, [286, 494], [80], 22)], 0, E207S53.L8),
([(4, true, false, [286, 494], [80], 26)], 0, E207S53.L9),
([(4, true, false, [286, 494], [80], 32)], 0, E207S53.L10),
([(4, true, false, [286, 494], [80], 34)], 0, E207S53.L11),
([(4, true, false, [286, 494], [80], 38)], 0, E207S53.L12),
([(4, true, false, [286, 494], [80], 60)], 0, E207S53.L13),
([(4, true, false, [286, 494], [80], 69)], 0, E207S53.L14),
([(4, true, false, [286, 494], [80], 74)], 0, E207S53.L15),
([(4, true, false, [286, 494], [80], 76)], 0, E207S53.L16),
([(4, true, false, [286, 494], [80], 81)], 0, E207S53.L17),
([(4, true, false, [286, 494], [80], 96)], 0, E207S53.L18),
([(4, true, false, [286, 494], [80], 102)], 0, E207S53.L19),
([(4, true, false, [286, 494], [80], 111)], 0, E207S53.L20),
([(4, true, false, [286, 494], [80], 118)], 0, E207S53.L21),
([(4, true, false, [286, 494], [80], 120)], 0, E207S53.L22),
([(4, true, false, [286, 494], [80], 134)], 0, E207S53.L23),
([(4, true, false, [286, 494], [80], 135)], 0, E207S53.L24)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 24
end E207S53
