module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E284S311 "data/lean/4db5f408ae2d304f2b0ac578cf2f733b/E284S311.bin"
namespace E284S311
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [84, 116], [10, 42], 0)], 0, E284S311.L1),
([(2, true, false, [84, 116], [10, 42], 1)], 0, E284S311.L2),
([(2, true, false, [84, 116], [10, 42], 4)], 0, E284S311.L3),
([(2, true, false, [84, 116], [10, 42], 6)], 0, E284S311.L4),
([(2, true, false, [84, 116], [10, 42], 10)], 0, E284S311.L5),
([(2, true, false, [84, 116], [10, 42], 11)], 0, E284S311.L6),
([(2, true, false, [84, 116], [10, 42], 14)], 0, E284S311.L7),
([(2, true, false, [84, 116], [10, 42], 15)], 0, E284S311.L8),
([(2, true, false, [84, 116], [10, 42], 17)], 0, E284S311.L9),
([(2, true, false, [84, 116], [10, 42], 18)], 0, E284S311.L10),
([(2, true, false, [84, 116], [10, 42], 19)], 0, E284S311.L11),
([(2, true, false, [84, 116], [10, 42], 27)], 0, E284S311.L12),
([(2, true, false, [84, 116], [10, 42], 40)], 0, E284S311.L13),
([(2, true, false, [84, 116], [10, 42], 41)], 0, E284S311.L14),
([(2, true, false, [84, 116], [10, 42], 48)], 0, E284S311.L15),
([(2, true, false, [84, 116], [10, 42], 49)], 0, E284S311.L16),
([(2, true, false, [84, 116], [10, 42], 59)], 0, E284S311.L17),
([(2, true, false, [84, 116], [10, 42], 60)], 0, E284S311.L18),
([(2, true, false, [84, 116], [10, 42], 62)], 0, E284S311.L19),
([(2, true, false, [84, 116], [10, 42], 65)], 0, E284S311.L20),
([(2, true, false, [84, 116], [10, 42], 81)], 0, E284S311.L21)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 21
end E284S311
