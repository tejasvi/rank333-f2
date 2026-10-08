module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S338 "data/lean/7788bd671973150315a62de9ab9f0577/E236S338.bin"
namespace E236S338
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 354], [276], 4)], 0, E236S338.L1),
([(2, true, false, [254, 354], [276], 5)], 0, E236S338.L2),
([(2, true, false, [254, 354], [276], 6)], 0, E236S338.L3),
([(2, true, false, [254, 354], [276], 7)], 0, E236S338.L4),
([(2, true, false, [254, 354], [276], 8)], 0, E236S338.L5),
([(2, true, false, [254, 354], [276], 9)], 0, E236S338.L6),
([(2, true, false, [254, 354], [276], 10)], 0, E236S338.L7),
([(2, true, false, [254, 354], [276], 11)], 0, E236S338.L8),
([(2, true, false, [254, 354], [276], 12)], 0, E236S338.L9),
([(2, true, false, [254, 354], [276], 13)], 0, E236S338.L10),
([(2, true, false, [254, 354], [276], 42)], 0, E236S338.L11),
([(2, true, false, [254, 354], [276], 45)], 0, E236S338.L12),
([(2, true, false, [254, 354], [276], 46)], 0, E236S338.L13),
([(2, true, false, [254, 354], [276], 48)], 0, E236S338.L14),
([(2, true, false, [254, 354], [276], 49)], 0, E236S338.L15),
([(2, true, false, [254, 354], [276], 69)], 0, E236S338.L16),
([(2, true, false, [254, 354], [276], 72)], 0, E236S338.L17),
([(2, true, false, [254, 354], [276], 89)], 0, E236S338.L18),
([(2, true, false, [254, 354], [276], 90)], 0, E236S338.L19)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 19
end E236S338
