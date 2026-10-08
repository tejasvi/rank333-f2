module
public import R22Port.U_d41d8cd98f00
public import S7.NestT
public import E1.E1Load
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
#e1lits E236S339 "data/lean/717b93eb2379301bb89b6a8555c71a24/E236S339.bin"
namespace E236S339
open BC7x
/-- records `(path, sub-record count, certificate)`, BFS order of the record tree (sub-record ranges consecutive) -/
noncomputable def recs : List (List Step × Nat × Nat) := [
([(2, true, false, [254, 372], [258], 2)], 0, E236S339.L1),
([(2, true, false, [254, 372], [258], 3)], 0, E236S339.L2),
([(2, true, false, [254, 372], [258], 4)], 0, E236S339.L3),
([(2, true, false, [254, 372], [258], 5)], 0, E236S339.L4),
([(2, true, false, [254, 372], [258], 6)], 0, E236S339.L5),
([(2, true, false, [254, 372], [258], 7)], 0, E236S339.L6),
([(2, true, false, [254, 372], [258], 8)], 0, E236S339.L7),
([(2, true, false, [254, 372], [258], 9)], 0, E236S339.L8),
([(2, true, false, [254, 372], [258], 10)], 0, E236S339.L9),
([(2, true, false, [254, 372], [258], 11)], 0, E236S339.L10),
([(2, true, false, [254, 372], [258], 13)], 0, E236S339.L11),
([(2, true, false, [254, 372], [258], 19)], 0, E236S339.L12),
([(2, true, false, [254, 372], [258], 24)], 0, E236S339.L13),
([(2, true, false, [254, 372], [258], 25)], 0, E236S339.L14),
([(2, true, false, [254, 372], [258], 26)], 0, E236S339.L15),
([(2, true, false, [254, 372], [258], 27)], 0, E236S339.L16),
([(2, true, false, [254, 372], [258], 58)], 0, E236S339.L17),
([(2, true, false, [254, 372], [258], 59)], 0, E236S339.L18),
([(2, true, false, [254, 372], [258], 60)], 0, E236S339.L19),
([(2, true, false, [254, 372], [258], 63)], 0, E236S339.L20),
([(2, true, false, [254, 372], [258], 75)], 0, E236S339.L21),
([(2, true, false, [254, 372], [258], 95)], 0, E236S339.L22)
]
noncomputable def paths : List (List Step) := recs.map Prod.fst
/-- the main record's external subtrees are records `0 .. m0-1` -/
def m0 : Nat := 22
end E236S339
