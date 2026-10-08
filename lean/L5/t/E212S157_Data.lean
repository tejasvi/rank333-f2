module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S157 "data/lean/a56bb13ecdfe474a6ef8255174654c2b/E212S157.bin"
namespace E212S157
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(7, true, false, [122, 266, 500, 158, 494], [], 11)], 0, E212S157.L1),
([(7, true, false, [122, 266, 500, 158, 494], [], 44)], 0, E212S157.L2),
([(7, true, false, [122, 266, 500, 158, 494], [], 45)], 0, E212S157.L3),
([(7, true, false, [122, 266, 500, 158, 494], [], 46)], 0, E212S157.L4),
([(7, true, false, [122, 266, 500, 158, 494], [], 47)], 0, E212S157.L5),
([(7, true, false, [122, 266, 500, 158, 494], [], 48)], 0, E212S157.L6),
([(7, true, false, [122, 266, 500, 158, 494], [], 74)], 0, E212S157.L7),
([(7, true, false, [122, 266, 500, 158, 494], [], 76)], 0, E212S157.L8),
([(7, true, false, [122, 266, 500, 158, 494], [], 84)], 0, E212S157.L9),
([(7, true, false, [122, 266, 500, 158, 494], [], 104)], 0, E212S157.L10),
([(7, true, false, [122, 266, 500, 158, 494], [], 107)], 0, E212S157.L11),
([(7, true, false, [122, 266, 500, 158, 494], [], 108)], 0, E212S157.L12),
([(7, true, false, [122, 266, 500, 158, 494], [], 111)], 0, E212S157.L13),
([(7, true, false, [122, 266, 500, 158, 494], [], 122)], 0, E212S157.L14),
([(7, true, false, [122, 266, 500, 158, 494], [], 125)], 0, E212S157.L15),
([(7, true, false, [122, 266, 500, 158, 494], [], 203)], 0, E212S157.L16)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 16
end E212S157
