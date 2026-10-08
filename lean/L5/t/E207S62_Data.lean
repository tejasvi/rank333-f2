module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S62 "data/lean/ff241ee32deacd3889f22faf9258cd34/E207S62.bin"
namespace E207S62
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [286, 334, 346, 426], [], 0)], 0, E207S62.L1),
([(0, true, false, [286, 334, 346, 426], [], 2)], 0, E207S62.L2),
([(0, true, false, [286, 334, 346, 426], [], 5)], 0, E207S62.L3),
([(0, true, false, [286, 334, 346, 426], [], 7)], 0, E207S62.L4),
([(0, true, false, [286, 334, 346, 426], [], 8)], 0, E207S62.L5),
([(0, true, false, [286, 334, 346, 426], [], 34)], 0, E207S62.L6),
([(0, true, false, [286, 334, 346, 426], [], 36)], 0, E207S62.L7),
([(0, true, false, [286, 334, 346, 426], [], 40)], 0, E207S62.L8),
([(0, true, false, [286, 334, 346, 426], [], 42)], 0, E207S62.L9),
([(0, true, false, [286, 334, 346, 426], [], 53)], 0, E207S62.L10),
([(0, true, false, [286, 334, 346, 426], [], 54)], 0, E207S62.L11),
([(0, true, false, [286, 334, 346, 426], [], 55)], 0, E207S62.L12),
([(0, true, false, [286, 334, 346, 426], [], 59)], 0, E207S62.L13),
([(0, true, false, [286, 334, 346, 426], [], 71)], 0, E207S62.L14),
([(0, true, false, [286, 334, 346, 426], [], 73)], 0, E207S62.L15),
([(0, true, false, [286, 334, 346, 426], [], 84)], 0, E207S62.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E207S62
