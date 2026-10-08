module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S70 "data/lean/646fdf8c18512a295eda67417e705c69/E207S70.bin"
namespace E207S70
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [286, 334, 346, 426], [], 0)], 0, E207S70.L1),
([(0, true, false, [286, 334, 346, 426], [], 2)], 0, E207S70.L2),
([(0, true, false, [286, 334, 346, 426], [], 3)], 0, E207S70.L3),
([(0, true, false, [286, 334, 346, 426], [], 4)], 0, E207S70.L4),
([(0, true, false, [286, 334, 346, 426], [], 5)], 0, E207S70.L5),
([(0, true, false, [286, 334, 346, 426], [], 6)], 0, E207S70.L6),
([(0, true, false, [286, 334, 346, 426], [], 7)], 0, E207S70.L7),
([(0, true, false, [286, 334, 346, 426], [], 8)], 0, E207S70.L8),
([(0, true, false, [286, 334, 346, 426], [], 9)], 0, E207S70.L9),
([(0, true, false, [286, 334, 346, 426], [], 34)], 0, E207S70.L10),
([(0, true, false, [286, 334, 346, 426], [], 35)], 0, E207S70.L11),
([(0, true, false, [286, 334, 346, 426], [], 36)], 0, E207S70.L12),
([(0, true, false, [286, 334, 346, 426], [], 40)], 0, E207S70.L13),
([(0, true, false, [286, 334, 346, 426], [], 42)], 0, E207S70.L14),
([(0, true, false, [286, 334, 346, 426], [], 53)], 0, E207S70.L15),
([(0, true, false, [286, 334, 346, 426], [], 54)], 0, E207S70.L16),
([(0, true, false, [286, 334, 346, 426], [], 55)], 0, E207S70.L17),
([(0, true, false, [286, 334, 346, 426], [], 57)], 0, E207S70.L18),
([(0, true, false, [286, 334, 346, 426], [], 58)], 0, E207S70.L19),
([(0, true, false, [286, 334, 346, 426], [], 59)], 0, E207S70.L20),
([(0, true, false, [286, 334, 346, 426], [], 71)], 0, E207S70.L21),
([(0, true, false, [286, 334, 346, 426], [], 73)], 0, E207S70.L22),
([(0, true, false, [286, 334, 346, 426], [], 84)], 0, E207S70.L23),
([(0, true, false, [286, 334, 346, 426], [], 85)], 0, E207S70.L24),
([(0, true, false, [286, 334, 346, 426], [], 130)], 0, E207S70.L25),
([(0, true, false, [286, 334, 346, 426], [], 146)], 0, E207S70.L26)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 26
end E207S70
