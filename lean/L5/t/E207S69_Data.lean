module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S69 "data/lean/1817b9e329da2a55c6a20cccc895f686/E207S69.bin"
namespace E207S69
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [266, 286, 346, 494], [], 6)], 0, E207S69.L1),
([(2, true, false, [266, 286, 346, 494], [], 10)], 0, E207S69.L2),
([(2, true, false, [266, 286, 346, 494], [], 16)], 0, E207S69.L3),
([(2, true, false, [266, 286, 346, 494], [], 51)], 0, E207S69.L4),
([(2, true, false, [266, 286, 346, 494], [], 52)], 0, E207S69.L5),
([(2, true, false, [266, 286, 346, 494], [], 54)], 0, E207S69.L6),
([(2, true, false, [266, 286, 346, 494], [], 56)], 0, E207S69.L7),
([(2, true, false, [266, 286, 346, 494], [], 57)], 0, E207S69.L8),
([(2, true, false, [266, 286, 346, 494], [], 58)], 0, E207S69.L9),
([(2, true, false, [266, 286, 346, 494], [], 60)], 0, E207S69.L10),
([(2, true, false, [266, 286, 346, 494], [], 90)], 0, E207S69.L11),
([(2, true, false, [266, 286, 346, 494], [], 92)], 0, E207S69.L12),
([(2, true, false, [266, 286, 346, 494], [], 95)], 0, E207S69.L13),
([(2, true, false, [266, 286, 346, 494], [], 122)], 0, E207S69.L14),
([(2, true, false, [266, 286, 346, 494], [], 123)], 0, E207S69.L15),
([(2, true, false, [266, 286, 346, 494], [], 128)], 0, E207S69.L16),
([(2, true, false, [266, 286, 346, 494], [], 129)], 0, E207S69.L17),
([(2, true, false, [266, 286, 346, 494], [], 140)], 0, E207S69.L18),
([(2, true, false, [266, 286, 346, 494], [], 176)], 0, E207S69.L19),
([(2, true, false, [266, 286, 346, 494], [], 178)], 0, E207S69.L20)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 20
end E207S69
