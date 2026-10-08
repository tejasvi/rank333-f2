module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E207S49 "data/lean/eb5651af9feca378ef53e015cfc612a9/E207S49.bin"
namespace E207S49
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(0, true, false, [346, 426, 494], [506], 3)], 0, E207S49.L1),
([(0, true, false, [346, 426, 494], [506], 6)], 0, E207S49.L2),
([(0, true, false, [346, 426, 494], [506], 17)], 0, E207S49.L3),
([(0, true, false, [346, 426, 494], [506], 18)], 0, E207S49.L4),
([(0, true, false, [346, 426, 494], [506], 19)], 0, E207S49.L5),
([(0, true, false, [346, 426, 494], [506], 22)], 0, E207S49.L6),
([(0, true, false, [346, 426, 494], [506], 29)], 0, E207S49.L7),
([(0, true, false, [346, 426, 494], [506], 35)], 0, E207S49.L8),
([(0, true, false, [346, 426, 494], [506], 36)], 0, E207S49.L9),
([(0, true, false, [346, 426, 494], [506], 38)], 0, E207S49.L10),
([(0, true, false, [346, 426, 494], [506], 39)], 0, E207S49.L11),
([(0, true, false, [346, 426, 494], [506], 41)], 0, E207S49.L12),
([(0, true, false, [346, 426, 494], [506], 47)], 0, E207S49.L13),
([(0, true, false, [346, 426, 494], [506], 48)], 0, E207S49.L14),
([(0, true, false, [346, 426, 494], [506], 53)], 0, E207S49.L15),
([(0, true, false, [346, 426, 494], [506], 55)], 0, E207S49.L16),
([(0, true, false, [346, 426, 494], [506], 59)], 0, E207S49.L17),
([(0, true, false, [346, 426, 494], [506], 61)], 0, E207S49.L18),
([(0, true, false, [346, 426, 494], [506], 86)], 0, E207S49.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E207S49
