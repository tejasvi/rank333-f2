module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S56 "data/lean/5fd12e957e051197cf7f24823c8e78fa/E207S56.bin"
namespace E207S56
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [286, 346, 426, 494], [], 0)], 0, E207S56.L1),
([(0, true, false, [286, 346, 426, 494], [], 1)], 0, E207S56.L2),
([(0, true, false, [286, 346, 426, 494], [], 2)], 0, E207S56.L3),
([(0, true, false, [286, 346, 426, 494], [], 3)], 0, E207S56.L4),
([(0, true, false, [286, 346, 426, 494], [], 4)], 0, E207S56.L5),
([(0, true, false, [286, 346, 426, 494], [], 5)], 0, E207S56.L6),
([(0, true, false, [286, 346, 426, 494], [], 8)], 0, E207S56.L7),
([(0, true, false, [286, 346, 426, 494], [], 10)], 0, E207S56.L8),
([(0, true, false, [286, 346, 426, 494], [], 16)], 0, E207S56.L9),
([(0, true, false, [286, 346, 426, 494], [], 34)], 0, E207S56.L10),
([(0, true, false, [286, 346, 426, 494], [], 37)], 0, E207S56.L11),
([(0, true, false, [286, 346, 426, 494], [], 40)], 0, E207S56.L12),
([(0, true, false, [286, 346, 426, 494], [], 41)], 0, E207S56.L13),
([(0, true, false, [286, 346, 426, 494], [], 53)], 0, E207S56.L14),
([(0, true, false, [286, 346, 426, 494], [], 54)], 0, E207S56.L15),
([(0, true, false, [286, 346, 426, 494], [], 55)], 0, E207S56.L16),
([(0, true, false, [286, 346, 426, 494], [], 56)], 0, E207S56.L17),
([(0, true, false, [286, 346, 426, 494], [], 59)], 0, E207S56.L18),
([(0, true, false, [286, 346, 426, 494], [], 84)], 0, E207S56.L19),
([(0, true, false, [286, 346, 426, 494], [], 108)], 0, E207S56.L20),
([(0, true, false, [286, 346, 426, 494], [], 109)], 0, E207S56.L21),
([(0, true, false, [286, 346, 426, 494], [], 110)], 0, E207S56.L22),
([(0, true, false, [286, 346, 426, 494], [], 126)], 0, E207S56.L23)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 23
end E207S56
