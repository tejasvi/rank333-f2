module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E212S144 "data/lean/c53fa4f0c62fe0f79cbd6333feaba2fd/E212S144.bin"
namespace E212S144
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [122, 158, 266, 494], [], 5)], 0, E212S144.L1),
([(2, true, false, [122, 158, 266, 494], [], 7)], 0, E212S144.L2),
([(2, true, false, [122, 158, 266, 494], [], 12)], 0, E212S144.L3),
([(2, true, false, [122, 158, 266, 494], [], 22)], 0, E212S144.L4),
([(2, true, false, [122, 158, 266, 494], [], 23)], 0, E212S144.L5),
([(2, true, false, [122, 158, 266, 494], [], 24)], 0, E212S144.L6),
([(2, true, false, [122, 158, 266, 494], [], 25)], 0, E212S144.L7),
([(2, true, false, [122, 158, 266, 494], [], 26)], 0, E212S144.L8),
([(2, true, false, [122, 158, 266, 494], [], 27)], 0, E212S144.L9),
([(2, true, false, [122, 158, 266, 494], [], 29)], 0, E212S144.L10),
([(2, true, false, [122, 158, 266, 494], [], 32)], 0, E212S144.L11),
([(2, true, false, [122, 158, 266, 494], [], 33)], 0, E212S144.L12),
([(2, true, false, [122, 158, 266, 494], [], 66)], 0, E212S144.L13),
([(2, true, false, [122, 158, 266, 494], [], 80)], 0, E212S144.L14),
([(2, true, false, [122, 158, 266, 494], [], 94)], 0, E212S144.L15),
([(2, true, false, [122, 158, 266, 494], [], 96)], 0, E212S144.L16),
([(2, true, false, [122, 158, 266, 494], [], 108)], 0, E212S144.L17),
([(2, true, false, [122, 158, 266, 494], [], 111)], 0, E212S144.L18),
([(2, true, false, [122, 158, 266, 494], [], 122)], 0, E212S144.L19),
([(2, true, false, [122, 158, 266, 494], [], 130)], 0, E212S144.L20),
([(2, true, false, [122, 158, 266, 494], [], 149)], 0, E212S144.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E212S144
