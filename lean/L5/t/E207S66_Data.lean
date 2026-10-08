module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S66 "data/lean/5a794be5974aa9ebcf68afa06ac30db7/E207S66.bin"
namespace E207S66
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [266, 286, 346, 426], [], 0)], 0, E207S66.L1),
([(0, true, false, [266, 286, 346, 426], [], 1)], 0, E207S66.L2),
([(0, true, false, [266, 286, 346, 426], [], 5)], 0, E207S66.L3),
([(0, true, false, [266, 286, 346, 426], [], 6)], 0, E207S66.L4),
([(0, true, false, [266, 286, 346, 426], [], 7)], 0, E207S66.L5),
([(0, true, false, [266, 286, 346, 426], [], 8)], 0, E207S66.L6),
([(0, true, false, [266, 286, 346, 426], [], 10)], 0, E207S66.L7),
([(0, true, false, [266, 286, 346, 426], [], 11)], 0, E207S66.L8),
([(0, true, false, [266, 286, 346, 426], [], 12)], 0, E207S66.L9),
([(0, true, false, [266, 286, 346, 426], [], 13)], 0, E207S66.L10),
([(0, true, false, [266, 286, 346, 426], [], 14)], 0, E207S66.L11),
([(0, true, false, [266, 286, 346, 426], [], 15)], 0, E207S66.L12),
([(0, true, false, [266, 286, 346, 426], [], 20)], 0, E207S66.L13),
([(0, true, false, [266, 286, 346, 426], [], 22)], 0, E207S66.L14),
([(0, true, false, [266, 286, 346, 426], [], 23)], 0, E207S66.L15),
([(0, true, false, [266, 286, 346, 426], [], 35)], 0, E207S66.L16),
([(0, true, false, [266, 286, 346, 426], [], 53)], 0, E207S66.L17),
([(0, true, false, [266, 286, 346, 426], [], 90)], 0, E207S66.L18),
([(0, true, false, [266, 286, 346, 426], [], 102)], 0, E207S66.L19),
([(0, true, false, [266, 286, 346, 426], [], 119)], 0, E207S66.L20),
([(0, true, false, [266, 286, 346, 426], [], 121)], 0, E207S66.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E207S66
